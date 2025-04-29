package com.example.baleksiejczuk;

import com.google.gson.Gson;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;

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

        if (userData.password.equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", new User(userData.login, userData.password));
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Login lub hasło jest niepoprawne.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
