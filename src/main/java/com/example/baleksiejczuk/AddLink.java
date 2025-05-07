package com.example.baleksiejczuk;

import java.io.*;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "addLink", value = "/add-link")
public class AddLink extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String url = request.getParameter("url");
        String linkName = request.getParameter("link_name");
        String privateLink = request.getParameter("private_link");
        boolean isPrivate = privateLink != null;
        String category = request.getParameter("category");


//        System.out.println("Adres URL: " + url);
//        System.out.println("Nazwa Linku: " + linkName);
//        System.out.println("Czy link jest prywatny: " + isPrivate);
//        System.out.println("Kategoria: " + category);


        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String userLogin = (user != null) ? user.getLogin() : "error";


        if ("error".equals(userLogin)) {
            System.out.println("[ERROR] Dodanie linku przez niezalogowanego użytkownika. Przekierowanie na index.jsp ");
            response.sendRedirect("index.jsp");
            return;
        }


        Date now = new Date();
        String addedAt = new SimpleDateFormat("yyyy-MM-dd").format(now);
        String addedTime = new SimpleDateFormat("HH:mm").format(now);

        String folderPath = getServletContext().getRealPath("/WEB-INF/links/") + (isPrivate ? "private" : "public");
        File folder = new File(folderPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        int maxNumber = 0;
        for (File file : Objects.requireNonNull(folder.listFiles())) {
            String name = file.getName();
            if (name.endsWith(".json")) {
                try {
                    int number = Integer.parseInt(name.replace(".json", ""));
                    if (number > maxNumber) {
                        maxNumber = number;
                    }
                } catch (NumberFormatException ignored) {}
            }
        }

        int newNumber = maxNumber + 1;
        File newFile = new File(folder, newNumber + ".json");


        String json = "{\n" +
                "  \"url\": \"" + escapeJson(url) + "\",\n" +
                "  \"name\": \"" + escapeJson(linkName) + "\",\n" +
                "  \"isPrivate\": " + isPrivate + ",\n" +
                "  \"user\": \"" + escapeJson(userLogin) + "\",\n" +
                "  \"addedAt\": \"" + escapeJson(addedAt) + "\",\n" +
                "  \"addedTime\": \"" + escapeJson(addedTime) + "\",\n" +
                "  \"category\": \"" + escapeJson(category) + "\",\n" +
                "  \"likes\": 0\n" +
                "}";

        try (FileWriter writer = new FileWriter(newFile)) {
            writer.write(json);
        }


        String message = "Link \"" + linkName + "\" dodany pomyślnie!";
        request.setAttribute("success", "Link o nazwie: "+ linkName +" został dodany pomyślnie.");
        request.getRequestDispatcher("add_link.jsp").forward(request, response);
    }

    private String escapeJson(String value) {
        if (value == null) return "";
        return value.replace("\\", "\\\\").replace("\"", "\\\"");
    }
}
