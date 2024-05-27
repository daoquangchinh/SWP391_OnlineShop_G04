/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.PagingDAO;
import dal.RolesDAO;
import dal.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import modal.Users;

/**
 *
 * @author dell
 */
@WebServlet(name = "AccountController", urlPatterns = {"/account"})
public class AccountController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AccountController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        // thong tin ve cac roles trong combobox
        RolesDAO rolesdao = new RolesDAO();
        UsersDAO usersdao = new UsersDAO();
        List<String> list_roles = rolesdao.getAllRoles();
        String accountId_active = request.getParameter("accountId_active");
        // set session cho list_roles
        session.setAttribute("list_roles", list_roles);
        if (accountId_active != null) {
            // Lấy id của tài khoản cần thay đổi trạng thái
            int id_active = Integer.parseInt(request.getParameter("accountId_active"));
            usersdao.ChangeStatusUser(id_active);

// Sau khi thay đổi trạng thái, lấy lại thông tin user
            Users user = usersdao.getUserByIDUser(id_active);
            StringBuilder html = new StringBuilder();

// Tạo hàng HTML mới
            html.append("<tr id=\"").append(user.getId()).append("\">\n")
                    .append("<td>").append(user.getUsername()).append("</td>\n")
                    .append("<td>").append(user.getFullname()).append("</td>\n")
                    .append("<td>").append(user.getEmail()).append("</td>\n")
                    .append("<td>").append(user.getPhone()).append("</td>\n")
                    .append("<td>").append(user.getRolename()).append("</td>\n");

            if (user.getStatus() == 1) {
                html.append("<td>Đang hoạt động</td>\n");
            } else {
                html.append("<td>Không hoạt động</td>\n");
            }

            html.append("<td><a class=\"room-detail\" href=\"accountdetail?id=").append(user.getId()).append("\">Xem thông tin</a></td>\n")
                    .append("<td><button style=\"border: 1px solid #ccc\" onclick=\"lockAccount(").append(user.getId()).append(", '").append(user.getStatus()).append("')\">")
                    .append(user.getStatus() == 1 ? "khoa tai khoan" : "kich hoat tai khoan")
                    .append("</button></td>\n")
                    .append("</tr>\n");

// Trả kết quả về client
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print(html.toString());

        } else {
            // tra ve danh sach cac account 

            List<Users> list_users = usersdao.GetUserByOptional(null, null, null, null, null, -1, 1, 5);

            // ser sesission cho list_users
            request.setAttribute("list_users", list_users);

            // tra ve so luong page 
            // dau tien phai lay so luong tat ca cac acocunt co trong danh sach.
            List<Users> list1 = usersdao.GetUserByOptional(null, null, null, null, null, -1, 1, Integer.MAX_VALUE);
            int numberPage = PagingDAO.getNumberPage(list1, 5);

            //set session cho numberpage
            session.setAttribute("numberPage", numberPage);

            // tro ve trang danh sahsc account
            request.getRequestDispatcher("danhsachphong.jsp").forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        // lay thong tin ve so trang : index paging
        String index = request.getParameter("index");

        //lay thong tin ve id_account khi kich hoat hoachuy kich hoat
        // lay thong tin name , email , phone , status
        String role = request.getParameter("role");
        String status = request.getParameter("status");
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        if (role.equals("default")) {
            role = null;
        }
        int status_convert;
        if (status.equals("default")) {
            status_convert = -1;
        } else {
            status_convert = Integer.parseInt(status);
        }
        UsersDAO userdao = new UsersDAO();
        RolesDAO roledao = new RolesDAO();
        if (index == null) {

            List<Users> list_users = userdao.GetUserByOptional(username, fullname, email, mobile, role, status_convert, 1, 5);
            // tim so luong cac ban ghi 
            List<Users> list1 = userdao.GetUserByOptional(username, fullname, email, mobile, role, status_convert, 1, Integer.MAX_VALUE);

            int numberPage = PagingDAO.getNumberPage(list1, 5);

            // danh dau lai su lua chon
            String tagRole = role;
            String tagStatus = status;

            String roleName = roledao.getRoleNameByID(numberPage);
            //set session cho cac bien
            session.setAttribute("numberPage", numberPage);
            request.setAttribute("list_users", list_users);
            request.setAttribute("username", username);
            request.setAttribute("fullname", fullname);
            request.setAttribute("email", email);
            request.setAttribute("mobile", mobile);
            request.setAttribute("tagRole", tagRole);
            request.setAttribute("tagStatus", tagStatus);
            request.getRequestDispatcher("view/danhsachphong.jsp").forward(request, response);
        }
        if (index != null) {
            int index_paging = Integer.parseInt(index) ; 
            StringBuilder html = new StringBuilder();
            List<Users> list_users = userdao.GetUserByOptional(username, fullname, email, mobile, role, status_convert, index_paging, 5);
            for (Users user: list_users) {
                html.append("<tr id=\"").append(user.getId()).append("\">\n")
                        .append("<td>").append(user.getUsername()).append("</td>\n")
                        .append("<td>").append(user.getFullname()).append("</td>\n")
                        .append("<td>").append(user.getEmail()).append("</td>\n")
                        .append("<td>").append(user.getPhone()).append("</td>\n")
                        .append("<td>").append(user.getRolename()).append("</td>\n");

                if (user.getStatus() == 1) {
                    html.append("<td>Đang hoạt động</td>\n");
                } else {
                    html.append("<td>Không hoạt động</td>\n");
                }

                html.append("<td><a class=\"room-detail\" href=\"accountdetail?id=").append(user.getId()).append("\">Xem thông tin</a></td>\n")
                        .append("<td><button style=\"border: 1px solid #ccc\" onclick=\"lockAccount(").append(user.getId()).append(", '").append(user.getStatus()).append("')\">")
                        .append(user.getStatus() == 1 ? "khoa tai khoan" : "kich hoat tai khoan")
                        .append("</button></td>\n")
                        .append("</tr>\n");
            }
            response.getWriter().print(html.toString());
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
