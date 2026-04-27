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
import com.ebook.Entity.BookDetails;
import com.ebook.DataOperation.BookAddDetailsDataOperation;
import com.ebook.Helper.ConnectionProvider;
import com.ebook.Helper.Message;
import java.util.List;
import javax.servlet.http.HttpSession;
/**
 *
 * @author suraj
 */
public class AllBookDisplayServlet extends HttpServlet {

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
            String userEmail = request.getParameter("userEmail");
             String findRequest=request.getParameter("findRequest");
out.print("Admin Email: " + userEmail);
BookAddDetailsDataOperation bookData=new BookAddDetailsDataOperation(ConnectionProvider.getConnection());
List<BookDetails> book = bookData.getAllBooksByUserEmail(userEmail);

            String content;
            String color;
            String icon;
            Message mymessage;
            HttpSession session=request.getSession();
            HttpSession session1=request.getSession();
            HttpSession sesssion2=request.getSession();
           out.print(book);
           if(book!=null)
            {
//                Login Success
                content="List of all Books";
                color="green";
                icon="fa fa-check";
                mymessage=new Message(content, color, icon);
                session.setAttribute("mymessage", mymessage);
//                session1.setAttribute("bookData", book);
                //List<BookDetails> bookData = bookDao.getAllBooks(); // Assume this returns multiple books
               List<BookDetails> bookList = bookData.getAllBooksByUserEmail(userEmail);
session1.setAttribute("bookList", bookList);
//session1.setAttribute("bookData", bookData);
if("adminPage".equals(findRequest)){
                response.sendRedirect("Admin/allBooks.jsp");
}else if("userPage".equals(findRequest)){
    response.sendRedirect("User/UserDisplayAllListedBook.jsp");
}
            }
           else{
                    content="No Book found Please Add New Books ";
                color="red";
                icon="fa fa-times";
                mymessage=new Message(content, color, icon);
                session.setAttribute("mymessage", mymessage);
                if("adminPage".equals(findRequest)){
                response.sendRedirect("Admin/addBooks.jsp");
                }else if("userPage".equals(findRequest)){
    response.sendRedirect("User/UserOldBookSell.jsp");
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
