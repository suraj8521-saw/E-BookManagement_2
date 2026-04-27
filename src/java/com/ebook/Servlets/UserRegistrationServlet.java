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
import com.ebook.Entity.UserRegistration;
import com.ebook.DataOperation.UserRegistrationDataOperation;
import com.ebook.Helper.ConnectionProvider;
import com.ebook.Helper.EmailSendForUserContactUsPage;
import com.ebook.Helper.Message;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author suraj
 */
public class UserRegistrationServlet extends HttpServlet {

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
            //fetching all registration details
         //     JOptionPane.showMessageDialog(null, "kk");
         //     System.out.println("bhai servlet call ho gaya");
            String userName = request.getParameter("userName");
            String userMobile = request.getParameter("userMobile");
            String userEmail = request.getParameter("userEmail");
            String userPassword = request.getParameter("userPassword");
            String check = request.getParameter("check");
//          Put all details in object
           
            
            UserRegistrationDataOperation userData = new UserRegistrationDataOperation(ConnectionProvider.getConnection());
            //out.println("Registration sucessfull");
            String content;
            String color;
            String icon;
            HttpSession Sesssion = request.getSession();
            HttpSession SessionforLoginDetails=request.getSession();
            HttpSession sendregisteralert=request.getSession();
            if (check != null) {
                UserRegistration email = userData.getUserDetailsByUserEmail(userEmail);
                if (email != null) {
//                    JOptionPane.showMessageDialog(null, "kk");
//                Something went wrong
                    content = "This Email Has Been Registered Please USer Another!!";
                    color = "red";
                    icon = "fa-times";
                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
                    response.sendRedirect("Register.jsp");
                    
                    System.out.println("dono databse me present hai ");
                } else {
//                    JOptionPane.showMessageDialog(null, "hh");
                    UserRegistration number = userData.getUserDetailsByUserMobile(userMobile);
                    if (number != null) {
                        content = "This Mobile No Has Been Registered Please Use Another Number!!";
                        color = "red";
                        icon = "fa-times";
                        Message mymessage = new Message(content, color, icon);
                        Sesssion.setAttribute("mymessage", mymessage);
                        response.sendRedirect("Register.jsp");
                        
                    } else {
                         UserRegistration user = new UserRegistration(userName, userMobile, userEmail, userPassword);
                        boolean register = userData.registerUser(user);
                        
                        if (register) {
                            
                        
                            
                             UserRegistration userLoginDetails = userData.getUserDetailsByUserEmail(userEmail);
                             SessionforLoginDetails.setAttribute("userLoginDetails", userLoginDetails);
//                Registration Successfull
                            content = "Reegistration Completed Please Login!!";
                            color = "green";
                            icon = "fa-check";
                            
                            Message mymessage = new Message(content, color, icon);
                            Sesssion.setAttribute("mymessage", mymessage);
                            
                            response.sendRedirect("Login.jsp");
                             
                        } else {
                            content = "Something Went Wrong Please Try Again!!";
                            color = "red";
                            icon = "fa-times";
                            
                            Message mymessage = new Message(content, color, icon);
                            Sesssion.setAttribute("mymessage", mymessage);
                            response.sendRedirect("Register.jsp");
                        }
                    }
                }
            } else {
                content = "Please accept the Term & Condition before registration";
                color = "red";
                icon = "fa-times";
                Message mymessage = new Message(content, color, icon);
                Sesssion.setAttribute("mymessage", mymessage);
                response.sendRedirect("Register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
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
