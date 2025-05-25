package com.example.baleksiejczuk;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.util.*;
import org.json.JSONObject;

@WebServlet("/search")
public class Search extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String query = request.getParameter("query");
        String category = request.getParameter("category");

        if (query == null || query.trim().isEmpty()) {
            response.getWriter().println("Brak frazy do wyszukania.");
            return;
        }

        query = query.toLowerCase();  // ignoruj wielkość liter

        List<JSONObject> foundLinks = new ArrayList<>();

        // Ścieżka do folderu JSON-ów w WEB-INF
        String folderPath = getServletContext().getRealPath("/WEB-INF/links/public");
        File folder = new File(folderPath);

        if (folder.exists() && folder.isDirectory()) {
            File[] files = folder.listFiles((dir, name) -> name.toLowerCase().endsWith(".json"));

            if (files != null) {
                for (File file : files) {
                    try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                        StringBuilder jsonBuilder = new StringBuilder();
                        String line;
                        while ((line = reader.readLine()) != null) {
                            jsonBuilder.append(line);
                        }

                        JSONObject json = new JSONObject(jsonBuilder.toString());

                        String url = json.optString("url", "").toLowerCase();
                        String name = json.optString("name", "").toLowerCase();
                        String fileCategory = json.optString("category", "");

                        boolean matchText = url.contains(query) || name.contains(query);
                        boolean matchCategory = (category == null || category.isEmpty()) || fileCategory.equalsIgnoreCase(category);

                        if (matchText && matchCategory) {
                            foundLinks.add(json);
                        }
                    } catch (Exception e) {
                        System.err.println("Błąd odczytu pliku " + file.getName() + ": " + e.getMessage());
                    }
                }
            }
        }

        // Wyświetl znalezione wyniki
        System.out.println("🔎 Znaleziono " + foundLinks.size() + " dopasowań dla frazy: " + query);
        for (JSONObject json : foundLinks) {
            System.out.println(json.toString(2));  // pretty-print
        }

        response.getWriter().println("Znaleziono " + foundLinks.size() + " dopasowań (szczegóły w logach serwera).");
    }
}
