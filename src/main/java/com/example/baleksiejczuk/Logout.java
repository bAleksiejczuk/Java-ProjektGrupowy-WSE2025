package com.example.baleksiejczuk;

import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequestEvent;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


@WebServlet(name = "logout", value = "/logout")
public  class Logout extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        session.invalidate();

        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);


    }
}
