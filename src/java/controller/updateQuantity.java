package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateQuantity")
public class updateQuantity extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        // Get the new quantity from the request parameter
        String quantityStr = request.getParameter("quantity");
        if (quantityStr != null) {
            try {
                int newQuantity = Integer.parseInt(quantityStr);
                // Here you can update the session or database with the new quantity
                // For demonstration purposes, I'm just returning the new quantity as response
                out.print(newQuantity);
            } catch (NumberFormatException e) {
                out.print("Invalid quantity format");
            }
        } else {
            out.print("Quantity parameter not found");
        }
    }
}
