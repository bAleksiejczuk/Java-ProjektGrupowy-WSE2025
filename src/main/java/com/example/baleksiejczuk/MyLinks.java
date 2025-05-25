package com.example.baleksiejczuk;

import java.io.*;
import java.util.*;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "myLinks", value = "/myLinks")
public class MyLinks extends HttpServlet {
    private final ObjectMapper mapper = new ObjectMapper();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String userLogin = (user != null) ? user.getLogin() : "error";

        if ("error".equals(userLogin)) {
            System.out.println("[ERROR] Wyświetlenie linków przez niezalogowanego użytkownika. Przekierowanie na index.jsp ");
            response.sendRedirect("index.jsp");
            return;
        }

        String publicPath = getServletContext().getRealPath("/WEB-INF/links/public");
        String privatePath = getServletContext().getRealPath("/WEB-INF/links/private");

        System.out.println("Public path: " + publicPath);
        System.out.println("Private path: " + privatePath);
        System.out.println("Użytkownik: " + userLogin);

        List<Map<String, Object>> allLinks = new ArrayList<>();

        loadJsonFilesFromFolder(publicPath, allLinks, userLogin);
        loadJsonFilesFromFolder(privatePath, allLinks, userLogin);

        request.setAttribute("links", allLinks);

        RequestDispatcher dispatcher = request.getRequestDispatcher("my_links.jsp");
        dispatcher.forward(request, response);
    }

    private void loadJsonFilesFromFolder(String folderPath, List<Map<String, Object>> allLinks, String userLogin) {
        File folder = new File(folderPath);

        if (!folder.exists()) {
            System.out.println("Folder nie istnieje: " + folderPath);
            return;
        }

        File[] files = folder.listFiles((dir, name) -> name.endsWith(".json"));
        if (files == null) return;

        for (File file : files) {
            try {
                Map<String, Object> jsonData = mapper.readValue(file, Map.class);

                if (jsonData.containsKey("user") && userLogin.equals(jsonData.get("user"))) {
                    allLinks.add(jsonData);
                    System.out.println("Wczytano plik należący do użytkownika " + userLogin + ": " + file.getName());
                }
            } catch (IOException e) {
                System.err.println("Błąd odczytu pliku " + file.getName() + ": " + e.getMessage());
            }
        }
    }

    public void destroy() {
    }
}