package com.example.baleksiejczuk;

import jakarta.servlet.RequestDispatcher;
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

        List<JSONObject> foundLinks = new ArrayList<>();
        String errorMessage = null;

        if (query == null || query.trim().isEmpty()) {
            errorMessage = "Brak frazy do wyszukania.";
        } else {
            query = query.toLowerCase();  // ignoruj wielkość liter

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

//            System.out.println("🔎 Znaleziono " + foundLinks.size() + " dopasowań dla frazy: " + query);
//            for (JSONObject json : foundLinks) {
//                System.out.println(json.toString(2));
//            }
        }

        // Przekaż dane do JSP
        request.setAttribute("foundLinks", foundLinks);
        request.setAttribute("searchQuery", request.getParameter("query"));
        request.setAttribute("searchCategory", category);
        request.setAttribute("errorMessage", errorMessage);

        // Przekieruj z powrotem do index.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
}
