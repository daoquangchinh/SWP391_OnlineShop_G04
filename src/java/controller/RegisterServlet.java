package controller;

import DAO.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modal.MaHoa;
import modal.User;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String fullname = request.getParameter("fullname").trim();
        String email = request.getParameter("email").trim();
        String phone = request.getParameter("phone").trim();
        String img = request.getParameter("img").trim();
        String password = request.getParameter("password").trim();
        String confPassword = request.getParameter("confPassword").trim();
        String gender = request.getParameter("gender").trim();
        boolean check = false;
        User u = new User(0, email, password, fullname, gender, phone, email, img, 2, 0);
        DAO dao = new DAO();
        MaHoa ma = new MaHoa();
         if (fullname.isEmpty()) {
            request.setAttribute("messName", " Full name cannot be empty!!");
            check = true;
        }

        if (dao.checkUserbyEmail(email)) {
            request.setAttribute("messEmail", "This email already exists!!");
            check = true;
        }
        if (!dao.isValidEmail(email)) {
            request.setAttribute("messEmail", "Email must be in correct form!!");
            check = true;
        }
        if (dao.getUserbyPhone(phone)) {
            request.setAttribute("messPhone", "Phone number already exists!!");
            check = true;
        }
        if (!dao.isValidPhoneNumber(phone)) {
            request.setAttribute("messPhone", "Invalid phone number format.");
            check = true;
        }
        if (!password.matches("^(?=.*[!@#$%^&*])[A-Za-z\\d!@#$%^&*]{8,}$")) {
            request.setAttribute("messpass", "Password must be at least 8 characters long and contain at least one special character.");
            check = true;
        }

        if (!password.equals(confPassword)) {
            request.setAttribute("messconfPassword", "Passwords do not match.");
            check = true;
        }
        if (check) {
            request.setAttribute("confPassword", confPassword);
            request.setAttribute("u", u);
            request.getRequestDispatcher("view/registerPage.jsp").forward(request, response);
            return;
        }
        password = ma.toSHA1(password);
        u.setPassword(password);
        dao.setUser(u);
        response.sendRedirect("view/loginPage.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/registerPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    public static void main(String[] args) {
        DAO dao = new DAO();
        User u = new User(0,"quan", "123456", "quannv", "male", "012345789", "viquan", "ertyu", 1, 0);
        if(dao.setUser(u)){
            System.out.println("quan");
        }
    }
}
