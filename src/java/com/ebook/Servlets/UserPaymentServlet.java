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
import com.ebook.DataOperation.AddToCardBookDetailsDataOperation;
import com.ebook.Helper.ConnectionProvider;
import com.ebook.Entity.AddToCardBookDetails;
import com.ebook.Helper.Message;
import java.util.List;
import javax.servlet.http.HttpSession;
import com.ebook.Entity.UserAddressSave;
import com.ebook.DataOperation.UserAddressSaveDataOperation;

/**
 *
 * @author suraj
 */
public class UserPaymentServlet extends HttpServlet {

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
           int bookAddToCardId =(Integer.parseInt(request.getParameter("bookAddToCardId")));
           int userAddressId=(Integer.parseInt(request.getParameter("userAddressId")));
            AddToCardBookDetailsDataOperation bookData=new AddToCardBookDetailsDataOperation(ConnectionProvider.getConnection());
           List<AddToCardBookDetails>book=bookData.getAllBooksByBookAddToCardId(bookAddToCardId);
             String content;
            String color;
            String icon;
            Message mymessage;
             HttpSession session=request.getSession();
            HttpSession session9=request.getSession();
            HttpSession session10=request.getSession();
            HttpSession session13=request.getSession();
            if(book!=null )
            {
//                Login Success
                UserAddressSaveDataOperation userAddress=new  UserAddressSaveDataOperation(ConnectionProvider.getConnection());
                List<UserAddressSave> addressList2=userAddress.getUserAddressById(userAddressId);
                session13.setAttribute("addressList2", addressList2);
                content="Books Details";
                color="green";
                icon="fa fa-check";
                mymessage=new Message(content, color, icon);
                session.setAttribute("mymessage", mymessage);
//                session1.setAttribute("bookData", book);
                //List<BookDetails> bookData = bookDao.getAllBooks(); // Assume this returns multiple books
               List<AddToCardBookDetails> bookList7 = bookData.getAllBooksByBookAddToCardId(bookAddToCardId);
session9.setAttribute("bookList7", bookList7);
session10.setAttribute("bookAddToCardId", bookAddToCardId);


                response.sendRedirect("User/PaymentPage.jsp");
            }
           else{
                    content="Something went wrong please try again!! ";
                color="red";
                icon="fa fa-times";
                mymessage=new Message(content, color, icon);
                session.setAttribute("mymessage", mymessage);
                response.sendRedirect("User/UserSavedAddressDisplay.jsp");
                }
        }
        
        catch(Exception e){
            e.printStackTrace();
            
            System.out.print("exception run");
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
