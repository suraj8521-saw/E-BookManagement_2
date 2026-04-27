/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebook.Servlets;

import com.ebook.Helper.Message;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.ebook.Entity.UserRegistration;
import com.ebook.DataOperation.UserRegistrationDataOperation;
import com.ebook.Helper.ConnectionProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
/**
 *
 * @author suraj
 */
@MultipartConfig
public class UserProfileUpdateServlet extends HttpServlet {

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
            String userName = request.getParameter("userName");
            String userMobile = request.getParameter("userMobile");
            String userEmail = request.getParameter("userEmail");
            String userOldPassward=request.getParameter("userOldPassward");
            String userPassword = request.getParameter("userPassword");
            int registerId=(Integer.parseInt(request.getParameter("registerId")));
                Part part = request.getPart("userPhotoName");
             String oldUserPhotoName = request.getParameter("oldUserPhotoName");
             Part filePart = request.getPart("userPhotoName");
String userPhotoName = "";
if (filePart != null && filePart.getSize() > 0) {
    // New file uploaded
    String submittedFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
    userPhotoName = submittedFileName;

   

} else {
    // No new file uploaded, use old file name
    userPhotoName = oldUserPhotoName;
}
 String content;
            String color;
            String icon;
            HttpSession Sesssion = request.getSession();//session1
             HttpSession session1 = request.getSession();
            if (userOldPassward == null ? userPassword == null : userOldPassward.equals(userPassword)) {
//                Registration Successfull
                    
//                    out.print(userName);
//                    out.print(userMobile);
//                    out.print(userEmail);
//                    out.print(userPassword);
//                    out.print(userPhotoName);
//                    out.print(registerId);
                     UserRegistration userupdate=new UserRegistration(registerId, userName, userMobile, userEmail, userPhotoName);
                     
                   UserRegistrationDataOperation userData=new UserRegistrationDataOperation(ConnectionProvider.getConnection());
                   boolean update=userData.UpdateUserProfile(userupdate);
                   if(update){
                       if (filePart != null && filePart.getSize() > 0) {
        // only save new file if a new file was uploaded
        String savePath = getServletContext().getRealPath("/") + "Books" + File.separator + userPhotoName;
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
    }
                       Sesssion.removeAttribute("loginStudent");
                       UserRegistration user=userData.getUserDetailsByUserEmailandUserPasward(userEmail, userOldPassward);
                        session1.setAttribute("loginStudent", user);
                        content = "Profile Update SuccesssFully";
                    color = "green";
                    icon = "fa-check";
                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
                    
                    response.sendRedirect("User/UserProfileHome.jsp");
                       
                   }else{
                       content = "Something Went Wrong Please Try Again!!";
                    color = "red";
                    icon = "fa-times";
                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
                    response.sendRedirect("User/UserProfileEdit.jsp");
                   }
                    
                } else {

//                Something went wrong
                    content = "Entered Pasward is Incorrect!! Please Enter Correct Pasward";
                    color = "red";
                    icon = "fa-times";
                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
                    response.sendRedirect("User/UserProfileEdit.jsp");
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
