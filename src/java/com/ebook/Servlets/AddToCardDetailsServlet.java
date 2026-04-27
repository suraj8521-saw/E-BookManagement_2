/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebook.Servlets;

import com.ebook.Entity.AddToCardBookDetails;
import com.ebook.DataOperation.AddToCardBookDetailsDataOperation;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;
import com.ebook.Helper.ConnectionProvider;
import com.ebook.Helper.Message;
import javax.servlet.http.HttpSession;

/**
 *
 * @author suraj
 */
public class AddToCardDetailsServlet extends HttpServlet {

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
            int bookId = (Integer.parseInt(request.getParameter("bookId")));
            // out.print(bookId);
            String userEmail = request.getParameter("userEmail");
            //   out.print(userEmail);
            String bookName = request.getParameter("bookName");
            String bookAuthor = request.getParameter("bookAuthor");
            int bookQuantity = 1;
            Double bookPrice = (Double.valueOf(request.getParameter("bookPrice")));
            Double bookTotalPrice = (Double.valueOf(request.getParameter("bookPrice")));

            String bookCategory = request.getParameter("bookCategory");
            String bookPhotoName = request.getParameter("bookPhotoName");
//    out.print(bookName);
//     out.print(bookAuthor);
//      out.print(bookPrice);
//       out.print(bookCategory);
//         out.print(bookPhotoName);
            AddToCardBookDetailsDataOperation bookData = new AddToCardBookDetailsDataOperation(ConnectionProvider.getConnection());
            AddToCardBookDetails getbookList = bookData.getAllBooksByBookAddToCardIdAndUserEmail(bookId, userEmail);
            // out.print(add);
            String content;
            String color;
            String icon;
            HttpSession Sesssion = request.getSession();
            if (getbookList != null) {
                content = "This Book Already Added Please Continue to Place Order OR Buy New Books";
                color = "red";
                icon = "fa-times";

                Message mymessage = new Message(content, color, icon);
                Sesssion.setAttribute("mymessage", mymessage);
                response.sendRedirect("User/Home.jsp");
            } else {
                AddToCardBookDetails book = new AddToCardBookDetails(bookId, bookName, bookAuthor, bookQuantity, bookPrice, bookTotalPrice, bookCategory, bookPhotoName, userEmail);
                //  AddToCardBookDetails book = new AddToCardBookDetails(bookId, bookName, bookAuthor, bookPrice, bookCategory, bookPhotoName, userEmail);
                //out.print(book);
                //  AddToCardBookDetailsDataOperation bookData = new AddToCardBookDetailsDataOperation(ConnectionProvider.getConnection());
                out.print(bookData);
                boolean add = bookData.AddToCardDetails(book);

                if (add) {
                    content = "Book Added to Cart";
                    color = "green";
                    icon = "fa-check";

                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
                    response.sendRedirect("User/Home.jsp");
                } else {
                    content = "Something went Wrong!! Please Register Again";
                    color = "red";
                    icon = "fa-times";
                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
                    response.sendRedirect("User/Home.jsp");
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
