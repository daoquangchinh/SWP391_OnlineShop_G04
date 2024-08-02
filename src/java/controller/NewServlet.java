package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class NewServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set content type to JSON
        response.setContentType("application/json");

        // Simulate getting quantityCartItem from session (replace with your logic)
        Integer quantityCartItem = 9;

        PrintWriter out = response.getWriter();
        out.println("{ \"quantityCartItem\": " + quantityCartItem + " }");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("quantityCartItem",    11);
        request.getRequestDispatcher("newjsp.jsp").forward(request, response);
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to fetch quantityCartItem";
    }
}
