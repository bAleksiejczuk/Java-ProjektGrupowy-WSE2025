package com.example.baleksiejczuk;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "login", value = "/login")
public class Login extends HttpServlet {

    private static class UserData {
        String name;
        String surname;
        String email;
        String login;
        String password;
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        response.setContentType("text/html");

        // Wczytaj dane użytkownika z JSON
        String filePath = "/WEB-INF/users/" + login + ".json";
        InputStream is = getServletContext().getResourceAsStream(filePath);

        if (is == null) {
            request.setAttribute("error", "Login lub hasło jest niepoprawne.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        Reader reader = new InputStreamReader(is);
        Gson gson = new Gson();
        UserData userData = gson.fromJson(reader, UserData.class);

        if (!userData.password.equals(password)) {
            request.setAttribute("error", "Login lub hasło jest niepoprawne.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Tworzenie sesji
        HttpSession session = request.getSession();
        session.setAttribute("user", new User(userData.login, userData.password));

        // Lista linków użytkownika
        List<LinkData> userLinks = new ArrayList<>();

        // Szukanie linków PUBLICZNYCH
        String publicLinksPath = getServletContext().getRealPath("/WEB-INF/links/public/");
        readUserLinksFromFolder(publicLinksPath, userData.login, userLinks, gson);

        // Szukanie linków PRYWATNYCH
        String privateLinksPath = getServletContext().getRealPath("/WEB-INF/links/private/");
        readUserLinksFromFolder(privateLinksPath, userData.login, userLinks, gson);

        // Zapisanie linków do sesji
        session.setAttribute("links", userLinks);

        // Przekierowanie do strony głównej
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void readUserLinksFromFolder(String folderPath, String login, List<LinkData> userLinks, Gson gson) {
        File folder = new File(folderPath);

        if (folder.exists() && folder.isDirectory()) {
            File[] files = folder.listFiles((dir, name) -> name.endsWith(".json"));

            if (files != null) {
                for (File file : files) {
                    try (Reader linkReader = new FileReader(file)) {
                        LinkData link = gson.fromJson(linkReader, LinkData.class);

                        if (login.equals(link.getUser())) {
                            userLinks.add(link);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
}
