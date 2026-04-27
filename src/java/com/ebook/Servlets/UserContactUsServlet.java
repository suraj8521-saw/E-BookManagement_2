/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebook.Servlets;

import com.ebook.Helper.EmailSendForUserContactUsPage;
import com.ebook.Helper.Message;
import static java.awt.SystemColor.text;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author suraj
 */
public class UserContactUsServlet extends HttpServlet {

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
            String userMobile=request.getParameter("userMobile");
            String userEmail=request.getParameter("userEmail");
            String subject=request.getParameter("subject");
            String userMessage =request.getParameter("content");
            String recipientAddress="suraj71442@gmail.com";
            String userName=request.getParameter("userName");
//            String userPhotoName=request.getParameter("userPhotoName");
//            if(userPhotoName.equals("noPhoto")){
//                userPhotoName="userDefaultPhoto.jpg";
//            }
            String content="<html>" +
                "<head><title>Welcome</title></head>" +
                "<body>" +
                "<h1>User Email:- " + userEmail + "</h1>" +"<br>"+
                    "<h1>User Mobile:- " + userMobile + "</h1>" +"<br>"+
                "<h4>Query:-"+userMessage+"</h4>" +"<br>"+
                "</body>" +
              "</html>";
             String content3="<html>" +
                "<head><title>Welcome</title></head>" +
                "<body>" +
                     
                     "<div style=\"text-align:center;\"> " +"<img src='https://thumbs2.imgbox.com/8f/1d/NkSZH33n_t.png' alt='User Image' style='width:150px; height:auto; border-radius:10px;'>"+
                     " </div>"+
                                    "<h1>Hello:- " + userName + "</h1>" +"<br>"+
                    "<h1>Thanks for Contacting Us</h1>" +"<br>"+
                     "<h3>Our Team Will Respond To Your Message As Soon As Possible</h3>" +"<br>"+
                     "<h3>Thanks For Shoping With Us Wish You A Happy Day</h3>" +"<br>"+
                "<h4>Query:-"+userMessage+"</h4>" +"<br>"+
                "</body>" +
              "</html>";
           // String recipientAddress=request.getParameter("recipientAddress");
          
           // response.sendRedirect(User/ContactUs.jsp);
            String content2;
            String color;
            String icon;
            HttpSession Sesssion = request.getSession();
            
            EmailSendForUserContactUsPage emailSender = new EmailSendForUserContactUsPage();

boolean result = emailSender.sendEmail(content, subject, recipientAddress);
if(result){
    
    boolean result2 = emailSender.sendEmail(content3, subject, userEmail);
    content2 = "Thanks for Contacting Us We Will Respond You Shortly !!";
                    color = "green";
                            icon = "fa-check";
                    Message mymessage = new Message(content2, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
                    response.sendRedirect("User/ContactUs.jsp");
}else{
     content2 = "Something Went Wrong Please Try Again!!";
                    color = "red";
                    icon = "fa-times";
                    Message mymessage = new Message(content2, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
                    response.sendRedirect("User/ContactUs.jsp");
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
