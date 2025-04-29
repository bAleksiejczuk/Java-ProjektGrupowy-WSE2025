package com.example.baleksiejczuk;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "addLink", value = "/add-link")
public class AddLink extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String url = request.getParameter("url");
        String linkName = request.getParameter("link_name");


        String privateLink = request.getParameter("private_link");


        boolean isPrivate = privateLink != null;


        System.out.println("Adres URL: " + url);
        System.out.println("Nazwa Linku: " + linkName);
        System.out.println("Czy link jest prywatny: " + isPrivate);


        response.sendRedirect("add_link.jsp");
    }
}
