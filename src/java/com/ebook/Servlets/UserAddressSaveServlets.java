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
import com.ebook.Entity.UserAddressSave;
import com.ebook.DataOperation.UserAddressSaveDataOperation;
import com.ebook.Helper.ConnectionProvider;
import com.ebook.Helper.Message;
import javax.servlet.http.HttpSession;

/**
 *
 * @author suraj
 */
public class UserAddressSaveServlets extends HttpServlet {

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
             String userName=request.getParameter("userName");
    String  userMobile=request.getParameter("userMobile") ;
   String userVilage=request.getParameter("userVilage");
   String userLandmark=request.getParameter("userLandmark");
     String userDistrict=request.getParameter("userDistrict");
    String userPincode=request.getParameter("userPincode") ;
     String userState=request.getParameter("userState");
     String userEmail=request.getParameter("userEmail");
//     out.print(userName);
//     out.print(userMobile);
//     out.print(userVilage);
//     out.print(userLandmark);
//     out.print(userDistrict);
//     out.print(userPincode);
//     out.print(userState);
//     out.print(userEmail);
     UserAddressSave user=new UserAddressSave(userName, userMobile, userVilage, userLandmark, userDistrict, userPincode, userState, userEmail);
     UserAddressSaveDataOperation userData=new UserAddressSaveDataOperation(ConnectionProvider.getConnection());
     String content;
            String color;
            String icon;
            HttpSession Sesssion = request.getSession();
     boolean addresssave=userData.userAddressSave(user);
     if (addresssave) {
//                Registration Successfull
                    content = "Address Save successful";
                    color = "green";
                    icon = "fa-check";

                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
                    response.sendRedirect("User/UserAddressFill.jsp");
                }else {

//                Something went wrong
                    content = "Something went Wrong!! Please Add Address Again";
                    color = "red";
                    icon = "fa-times";
                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
                    response.sendRedirect("User/UserAddressFill.jsp");
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
