package controller;

import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import modal.User;

/**
 * OTPServlet processes OTP verification requests.
 */
public class OTPServlet extends HttpServlet {

    /**
     * Handles the HTTP GET method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to OTP page
        request.getRequestDispatcher("view/OTP.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP POST method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String otpEntered = request.getParameter("otp").trim();
        HttpSession session = request.getSession();
        String otpSession = (String) session.getAttribute("otp");
        String email = (String) session.getAttribute("email");

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        if (otpSession != null && otpSession.equals(otpEntered) && email != null) {
            UserDAO dao = new UserDAO();
            User u = dao.getUserByEmail(email);
            session.setAttribute("acc", u);

            out.println("{\"success\":true, \"message\":\"OTP verified successfully.\"}");
        } else {
            out.println("{\"success\":false, \"error\":\"Invalid OTP. Please try again.\"}");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet for handling OTP verification";
    }

  
}
