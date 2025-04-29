package com.example.baleksiejczuk;

import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "register", value = "/register")
public class Register extends HttpServlet {
    private String message;
    private User user;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("email");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String login = request.getParameter("login");
        String password = request.getParameter("password");


        String folderPath = getServletContext().getRealPath("/WEB-INF/users");
        File dir = new File(folderPath);
        if (!dir.exists()) dir.mkdirs();

        File jsonFile = new File(dir, login + ".json");


        if (jsonFile.exists()) {
            request.setAttribute("errorMessage", "Konto z takim loginem już istnieje.");
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
            rd.forward(request, response);
            return;
        }

        user = new User(login, password);
        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        String json = "{\n" +
                "  \"name\": \"" + name + "\",\n" +
                "  \"surname\": \"" + surname + "\",\n" +
                "  \"email\": \"" + email + "\",\n" +
                "  \"login\": \"" + login + "\",\n" +
                "  \"password\": \"" + password + "\"\n" +
                "}";

        try (FileWriter writer = new FileWriter(jsonFile)) {
            writer.write(json);
        } catch (IOException e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }


    public void destroy() {
    }
}
