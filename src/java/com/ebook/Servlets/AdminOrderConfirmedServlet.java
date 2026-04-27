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
import java.sql.Timestamp;
import com.ebook.Entity.AdminOrderConfirm;
import com.ebook.DataOperation.AdminOrderConfirmedDataOperation;
import com.ebook.Helper.ConnectionProvider;
import com.ebook.Helper.Message;
import javax.servlet.http.HttpSession;
import com.ebook.DataOperation.UpdateUserOrderBookStatusDataOperation;
import com.ebook.Entity.UserOrderedBook;
/**
 *
 * @author suraj
 */
public class AdminOrderConfirmedServlet extends HttpServlet {

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
             int bookOrderedId =(Integer.parseInt(request.getParameter("bookOrderedId")));
     int bookId =(Integer.parseInt(request.getParameter("bookId")));//BookOrderedId
     String bookName=request.getParameter("bookName");
     String bookAuthor=request.getParameter("bookAuthor");
     String bookPhotoName=request.getParameter("bookPhotoName");
     int bookQuantity=(Integer.parseInt(request.getParameter("bookQuantity")));
     double totalPrice=(Double.parseDouble(request.getParameter("totalPrice")));
     String paymentMethod=request.getParameter("paymentMethod");
     String userName=request.getParameter("userName");
     String userMobile=request.getParameter("userMobile");
     String userEmail=request.getParameter("userEmail");
     String userVillage=request.getParameter("userVillage");
     String userLandmark=request.getParameter("userLandmark");
     String userDistrict=request.getParameter("userDistrict");
     String userPincode=request.getParameter("userPincode");
     String userState=request.getParameter("userState");
     Timestamp orderedDate=(Timestamp.valueOf((request.getParameter("orderedDate"))));
      String orderStatus="Confirm";
      String receipt=request.getParameter("receipt");
//      out.print(bookOrderedId);
//      out.print(bookId);
//      out.print(bookName);
//      out.print(bookAuthor);
//      out.print(bookPhotoName);
//      out.print(bookQuantity);
//      out.print(totalPrice);
//      out.print(paymentMethod);
//      out.print(userName);
//      out.print(userMobile);
//      out.print(userEmail);
//      out.print(userVillage);
//      out.print(userLandmark);
//      out.print(userDistrict);
//      out.print(userPincode);
//      out.print(userState);
//      out.print(orderedDate);
//      out.print(orderStatus);
AdminOrderConfirm order=new AdminOrderConfirm(bookId, bookName, bookAuthor, bookPhotoName, bookQuantity, totalPrice, paymentMethod, userName, userMobile, userEmail, userVillage, userLandmark, userDistrict, userPincode, userState, orderedDate, orderStatus,receipt);
AdminOrderConfirmedDataOperation orderData=new AdminOrderConfirmedDataOperation(ConnectionProvider.getConnection());

          String content;
            String color;
            String icon;
            HttpSession Sesssion = request.getSession();
              boolean insert = orderData.orderConfirmed(order);
               if (insert) {
                   
                    UserOrderedBook delete=new UserOrderedBook(bookOrderedId);
                 UpdateUserOrderBookStatusDataOperation deleteData=new UpdateUserOrderBookStatusDataOperation(ConnectionProvider.getConnection());
                 boolean delete2=deleteData.deleteBookByBookOrderedId(bookOrderedId);
             
             
//                Registration Successfull
                    content = "The Order has been Confirmed!";
                    color = "green";
                    icon = "fa-check";

                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
                    response.sendRedirect("DisplayOrderdProductAdminServlet");
                } else {

//                Something went wrong
                    content = "Something went Wrong!! Please Try Again";
                    color = "red";
                    icon = "fa-times";
                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
                    response.sendRedirect("Admin/orders.jsp");
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
