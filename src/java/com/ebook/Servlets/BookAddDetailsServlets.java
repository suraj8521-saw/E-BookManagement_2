/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebook.Servlets;
import com.ebook.Entity.BookDetails;
import java.io.*;
import javax.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;
import com.ebook.DataOperation.BookAddDetailsDataOperation;
import com.ebook.DataOperation.DisplayAllBookAtUserHomePageDataOperation;
import com.ebook.Helper.ConnectionProvider;
import com.ebook.Helper.Message;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author suraj
 */
@MultipartConfig 
public class BookAddDetailsServlets extends HttpServlet {

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
    String bookName=request.getParameter("bookName");
    String bookAuthor=request.getParameter("bookAuthor");
    Double bookPrice=(Double.valueOf(request.getParameter("bookPrice")));
    String bookCategory=request.getParameter("bookCategory");
    String bookStatus=request.getParameter("bookStatus");
    String findRequest=request.getParameter("findRequest");
    Part part = request.getPart("bookPhotoName");
            String bookPhotoName = part.getSubmittedFileName();
    
    String userEmail=request.getParameter("userEmail");
//    out.print(bookName);
//    out.print(bookAuthor);
//    out.print(bookPrice);
//    out.print(bookCategory);
//    out.print(bookStatus);
//    out.print(bookPhotoName);
//    out.print(userEmail);
//System.out.println(bookName);
//System.out.println(bookAuthor);
//System.out.println(bookPrice);
//System.out.println(bookCategory);
//System.out.println(bookStatus);
//System.out.println(findRequest);
//System.out.println(bookPhotoName);
//System.out.println(userEmail);

            BookDetails book=new BookDetails(bookName, bookAuthor, bookPrice, bookCategory, bookStatus, bookPhotoName, userEmail);
            
//System.out.println(book);
           BookAddDetailsDataOperation bookData=new BookAddDetailsDataOperation(ConnectionProvider.getConnection());
           
//System.out.println(bookData);
            
             

            boolean insert=bookData.BookAddDeatils(book);
            String content;
            String color;
            String icon;
            HttpSession Sesssion = request.getSession();
System.out.println(insert);
            if (insert) {
//                book insert successfully
//book image save to local folder start
String savePath = getServletContext().getRealPath("/") + "Books" + File.separator + bookPhotoName;
    try (InputStream is = part.getInputStream();
         FileOutputStream fos = new FileOutputStream(savePath)) {

        byte[] buffer = new byte[1024];
        int bytesRead;
        while ((bytesRead = is.read(buffer)) != -1) {
            fos.write(buffer, 0, bytesRead);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    //
//book image save to local folder end
                    content = "Book insertion Successfully completed";
                    color = "green";
                    icon = "fa-check";

                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage); // for example userPage
if("adminPage".equals(findRequest)){
                    response.sendRedirect("Admin/Home.jsp");
                    
}else {
    HttpSession session = request.getSession();
            HttpSession session1 = request.getSession();
              HttpSession sesssion2 = request.getSession();
               HttpSession session3 = request.getSession();
      String bookCategorya="New";
            String bookStatusa="Active";
           String bookCategory2="Old";
           session.removeAttribute("bookListnewCategory");
           
           session.removeAttribute("bookList2");
           session.removeAttribute("bookList3");
           DisplayAllBookAtUserHomePageDataOperation bookData2= new DisplayAllBookAtUserHomePageDataOperation( ConnectionProvider.getConnection());
         
            List<BookDetails> bookList = bookData2.getAllBooksByNewCategoryAndActive(bookStatusa, bookCategorya);
session1.setAttribute("bookListnewCategory", bookList);
List<BookDetails> bookList2=bookData2.getAllBookByActive(bookStatusa);
sesssion2.setAttribute("bookList2", bookList2);
List<BookDetails> bookList3=bookData2.getAllBookByCategory(bookStatusa,bookCategory2);
session3.setAttribute("bookList3", bookList3);
    response.sendRedirect("User/Home.jsp");
}
            }      else {

//                Something went wrong
                    content = "Something went Wrong!! Please Add  Again";
                    color = "red";
                    icon = "fa-times";
                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
                    
                    if("adminPage".equals(findRequest)){
                    response.sendRedirect("Admin/addBooks.jsp");
                    }else if("userPage".equals(findRequest)){
                        response.sendRedirect("User/UserOldBookSell.jsp");
                    }
                }
        }catch(Exception e){
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
