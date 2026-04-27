/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebook.Servlets;

import com.ebook.DataOperation.DisplayAllBookAtUserHomePageDataOperation;



import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ebook.Entity.BookDetails;
import com.ebook.Helper.ConnectionProvider;
import com.ebook.Helper.Message;
import com.mysql.jdbc.Connection;
import java.util.List;
import javax.servlet.http.HttpSession;
/**
 *
 * @author suraj
 */
public class ViewAllBookHomeServlet extends HttpServlet {

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
            String bookCategory="New";
            String bookStatus="Active";
           String bookCategory2="Old";
         DisplayAllBookAtUserHomePageDataOperation bookData= new DisplayAllBookAtUserHomePageDataOperation( ConnectionProvider.getConnection());
              out.print(bookData);
          //  List<BookDetails>book=bookData.getAllBooksByNewCategoryAndActive(bookStatus, bookCategory);
            List<BookDetails>book2=bookData.getAllBookByActive(bookStatus);
            String content;
            String color;
            String icon;
            Message mymessage;
            HttpSession session=request.getSession();
            HttpSession session1=request.getSession();
            HttpSession sesssion2=request.getSession();
            HttpSession session3=request.getSession();
          // out.print(book);
            
           
           if(book2!=null )
            {
//                Login Success
                content="List of all Books";
                color="green";
                icon="fa fa-check";
                mymessage=new Message(content, color, icon);
                session.setAttribute("mymessage", mymessage);
//                session1.setAttribute("bookData", book);
                //List<BookDetails> bookData = bookDao.getAllBooks(); // Assume this returns multiple books
               List<BookDetails> bookList = bookData.getAllBooksByNewCategoryAndActive(bookStatus, bookCategory);
session1.setAttribute("bookListnewCategory", bookList);
List<BookDetails> bookList2=bookData.getAllBookByActive(bookStatus);
sesssion2.setAttribute("bookList2", bookList2);
List<BookDetails> bookList3=bookData.getAllBookByCategory(bookStatus,bookCategory2);
session3.setAttribute("bookList3", bookList3);

                response.sendRedirect("User/Home.jsp");
            }
           else{
                    content="No Book found Please Add New Books ";
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
