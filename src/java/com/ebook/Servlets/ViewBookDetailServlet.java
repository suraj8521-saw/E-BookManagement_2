/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebook.Servlets;

import com.ebook.DataOperation.DisplayAllBookAtUserHomePageDataOperation;
import com.ebook.Entity.BookDetails;
import com.ebook.Helper.ConnectionProvider;
import com.ebook.Helper.Message;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author suraj
 */
public class ViewBookDetailServlet extends HttpServlet {

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
           int bookId=(Integer.parseInt(request.getParameter("bookId")));
           String bookCategory=request.getParameter("bookCategory");
           out.print(bookId);
            DisplayAllBookAtUserHomePageDataOperation bookData= new DisplayAllBookAtUserHomePageDataOperation( ConnectionProvider.getConnection());
         List<BookDetails>book3=bookData.getAllBookByBookId(bookId);
            String content;
            String color;
            String icon;
            Message mymessage;
             HttpSession session=request.getSession();
            HttpSession session4=request.getSession();
            
          // out.print(book);
           if(book3!=null )
            {
//                Login Success
                content="Books Details";
                color="green";
                icon="fa fa-check";
                mymessage=new Message(content, color, icon);
                session.setAttribute("mymessage", mymessage);
//                session1.setAttribute("bookData", book);
                //List<BookDetails> bookData = bookDao.getAllBooks(); // Assume this returns multiple books "adminPage".equals(findRequest)
               List<BookDetails> bookList5 = bookData.getAllBookByBookId(bookId);
session4.setAttribute("bookList5", bookList5);

if("Old".equals(bookCategory)){
    response.sendRedirect("User/OldBookDetailsDisplay.jsp");
}else{
                response.sendRedirect("User/UserViewDetailsBook.jsp");
}
            }
           else{
                    content="Something went wrong please try again!! ";
                color="red";
                icon="fa fa-times";
                mymessage=new Message(content, color, icon);
                session.setAttribute("mymessage", mymessage);
                response.sendRedirect("User/Home.jsp");
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
