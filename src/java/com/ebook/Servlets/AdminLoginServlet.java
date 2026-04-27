/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebook.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ebook.DataOperation.AdminRegistrationDataOperation;
import com.ebook.Helper.ConnectionProvider;
import com.ebook.Entity.AdminRegistration;
import com.ebook.Entity.UserRegistration;
import com.ebook.Helper.Message;
import javax.servlet.http.HttpSession;

/**
 *
 * @author suraj
 */
public class AdminLoginServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String adminEmail = request.getParameter("adminEmail");
            String adminPassword = request.getParameter("adminPassword");
            AdminRegistrationDataOperation adminData = new AdminRegistrationDataOperation(ConnectionProvider.getConnection());
            AdminRegistration admin = adminData.getAdminDetailsByAdminEmailandAdminPasward(adminEmail, adminPassword);
            String content;
            String color;
            String icon;
            Message mymessage;
            HttpSession session = request.getSession();
            HttpSession session1 = request.getSession();
            out.print(admin);
            if (admin != null) {
//                Login Success
                content = "Login Success";
                color = "green";
                icon = "fa fa-check";
                mymessage = new Message(content, color, icon);
                session.setAttribute("mymessage", mymessage);
                session1.setAttribute("loginAdmin", admin);
                response.sendRedirect("Admin/Home.jsp");
            } else {
                AdminRegistration user3 = adminData.getAdminDetailsByAdminEmail(adminEmail);
                if (user3 != null) {

//                Login Failed
                    out.print("Loging Failled");
                    content = "Login Failed!! Entered Pasward is Wrong";
                    color = "red";
                    icon = "fa fa-times";
                    mymessage = new Message(content, color, icon);
                    session.setAttribute("mymessage", mymessage);
                    response.sendRedirect("AdminLogin.jsp");
                } else {
                    content = "This Email is not Registered Please Enter correct Email";
                    color = "red";
                    icon = "fa fa-times";
                    mymessage = new Message(content, color, icon);
                    session.setAttribute("mymessage", mymessage);
                    response.sendRedirect("AdminLogin.jsp");
                }
            }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
