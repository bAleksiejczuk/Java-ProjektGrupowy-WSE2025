package com.example.baleksiejczuk;

import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequestEvent;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "addLink", value = "/add-link")
public class AddLink extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String url = request.getParameter("url");
        String linkName = request.getParameter("link_name");


        System.out.println("Adres URL: " + url);
        System.out.println("Nazwa Linku: " + linkName);

        response.sendRedirect("add_link.jsp");
    }
}