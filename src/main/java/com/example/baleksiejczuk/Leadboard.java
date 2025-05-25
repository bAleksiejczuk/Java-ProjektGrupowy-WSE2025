package com.example.baleksiejczuk;

import java.io.*;
import java.util.*;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "leadboard", value = "/leadboard")
public class Leadboard extends HttpServlet {
    private final ObjectMapper mapper = new ObjectMapper();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String publicPath = getServletContext().getRealPath("/WEB-INF/links/public");

        System.out.println("Public path (ranking): " + publicPath);

        List<Map<String, Object>> allLinks = new ArrayList<>();

        loadAllJsonLinks(publicPath, allLinks);

        // 🔽 Sortujemy po liczbie "likes" malejąco
        allLinks.sort((link1, link2) -> {
            Integer likes1 = getLikesValue(link1);
            Integer likes2 = getLikesValue(link2);
            return likes2.compareTo(likes1); // sortowanie malejące
        });

        request.setAttribute("links", allLinks);

        RequestDispatcher dispatcher = request.getRequestDispatcher("leadboard.jsp");
        dispatcher.forward(request, response);
    }

    private void loadAllJsonLinks(String folderPath, List<Map<String, Object>> allLinks) {
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
                allLinks.add(jsonData);
                System.out.println("Dodano link z pliku: " + file.getName());
            } catch (IOException e) {
                System.err.println("Błąd odczytu pliku " + file.getName() + ": " + e.getMessage());
            }
        }
    }

    // 🔽 Pomocnicza metoda do pobierania wartości "likes" jako Integer
    private Integer getLikesValue(Map<String, Object> link) {
        Object likesObj = link.get("likes");
        if (likesObj instanceof Number) {
            return ((Number) likesObj).intValue();
        } else if (likesObj instanceof String) {
            try {
                return Integer.parseInt((String) likesObj);
            } catch (NumberFormatException e) {
                return 0;
            }
        }
        return 0;
    }

    public void destroy() {
    }
}
