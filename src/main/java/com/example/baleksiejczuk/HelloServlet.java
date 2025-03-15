package com.example.baleksiejczuk;

import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequestEvent;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;
    private  User user;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String name = request.getParameter("email");
        String surname = request.getParameter("surname");
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        user = new User(name,surname,login,password);
        response.setContentType("text/html");

        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request,response);


//        // Hello
//        PrintWriter out = response.getWriter();
//        out.println("<html><body>");
//        out.println("<h1>" + message + name + surname + login + password + "</h1>");
//        out.println("<h1>" + message + user.getName() + user.getSurname() + user.getLogin() + user.getPassword() + "</h1>");
//        out.println("</body></html>");


    }


    public void destroy() {
    }
}