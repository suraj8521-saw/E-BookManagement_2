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
import com.ebook.Entity.UserOrderedBook;
import com.ebook.DataOperation.UserOredredSaveDataOperation;
import com.ebook.Helper.ConnectionProvider;
import com.ebook.Helper.Message;
import javax.servlet.http.HttpSession;
import com.ebook.Entity.AddToCardBookDetails;
import com.ebook.DataOperation.AddToCardBookDetailsDataOperation;
import com.ebook.DataOperation.razorpayonlinepaymentDataOperation;
import com.ebook.Entity.razorpayonlinepayment;
import com.ebook.Helper.EmailSendForUserContactUsPage;
import java.util.Date;
/**
 *
 * @author suraj
 */
public class OrderConfirmSingleBookServlet extends HttpServlet {

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
           System.out.println("just aaya servlet me  ");
String orderedUserName = request.getParameter("userName");
String orderedUserMobileNo = request.getParameter("userMobile");
String orderedUserEmail = request.getParameter("userEmail");
String orderedUserVilage = request.getParameter("userVilage");
String orderedUserLandmark = request.getParameter("userLandmark");
String orderedUserDistrict = request.getParameter("userDistrict");
String orderedUserPincode = request.getParameter("userPincode");
String orderedUserState = request.getParameter("userState");
int userAddressId=(Integer.parseInt(request.getParameter("userAddressId")));
String paymentMethod = request.getParameter("paymentMethod");
String bookName = request.getParameter("bookName");
String bookAuthor = request.getParameter("bookAuthor");
int orderedBookQuantity = (Integer.parseInt(request.getParameter("bookQuantity")));
double orderedBookTotalPrice = (Double.parseDouble(request.getParameter("bookTotalPrice")));
int bookId = (Integer.parseInt(request.getParameter("bookId")));
String orderedBookPhotoName=request.getParameter("bookPhotoName");
int bookAddToCardId=(Integer.parseInt(request.getParameter("bookAddToCardId")));
           
//out.print(userName);//
//out.print(userMobile);//
//out.print(userEmail);//
//out.print(userVilage);//
//out.print(userLandmark);//
//out.print(userDistrict);//
//out.print(userPincode);//
//out.print(userState);//
//out.print(userAddressId);
//out.print(paymentMethod);//
//out.print(bookName);//
//out.print(bookAuthor);//
//out.print(bookQuantity);//
//out.print(bookTotalPrice);//
//out.print(bookId);//
//out.print(bookPhotoName);//
 String content;
            String color;
            String icon;
            HttpSession Sesssion = request.getSession();
             System.out.println("checking form and ajex ");
boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
System.out.println("checking complete ");
if(!isAjax){
    String registerId=request.getParameter("registerId");
    String receipt = "UID" + registerId +  "_TS" + System.currentTimeMillis();
    System.out.println("form se aaya hu ");
UserOrderedBook order=new UserOrderedBook(bookId, bookName, bookAuthor, orderedBookQuantity, orderedBookTotalPrice, orderedBookPhotoName, orderedUserName, orderedUserMobileNo, orderedUserEmail, orderedUserVilage, orderedUserLandmark, orderedUserDistrict, orderedUserPincode, orderedUserState, paymentMethod, userAddressId,receipt);
       UserOredredSaveDataOperation orderData=new UserOredredSaveDataOperation(ConnectionProvider.getConnection());
       
            boolean orderconfirm=orderData.orderBook(order);
            System.out.println("checking order ");
             if (orderconfirm) {
                 
                  System.out.println("confirm order ");
                 
                 AddToCardBookDetails delete=new AddToCardBookDetails(bookAddToCardId);
                 AddToCardBookDetailsDataOperation deleteData=new AddToCardBookDetailsDataOperation(ConnectionProvider.getConnection());
                 System.out.println("checking delete add to card book ");
                 
                 boolean delete2=deleteData.DeleteRowByBookAddToCardId(delete);
                 
                 System.out.println("deleted add to card book ");
               // Registration Successfull
                    content = "Your Order Has been Successfully Completed";
                    color = "green";
                    icon = "fa-check";

                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
                    String sendtomail=request.getParameter("sendtomail");
                    String personname=request.getParameter("personname");
                    String subject="Books Order Details";
                   Date pdate=new Date();
String content6 =
    "<html>" +
        "<head><title>Purchase Invoice</title></head>" +
        "<body>" +
            "<div style='text-align:center;'>" +
                "<img src='https://thumbs2.imgbox.com/8f/1d/NkSZH33n_t.png' alt='User Image' style='width:150px; height:auto; border-radius:10px;'>" +
            "</div>" +

            "<h1>Hello " + personname + "</h1><br>" +
            "<h2>Thanks for buying books.</h2><br>" +
            "<h3>Your Purchase Details</h3><br>" +
            "<p>Purchase Date:-"+pdate+"</p><br>"+
            // Table Start
            "<table border='1' style='border-collapse:collapse; width:60%; margin:auto; font-family:sans-serif;'>" +
                "<tr style='background-color:#4facfe; color:white;'>" +
                    "<th>Book Name</th>" +
                    "<th>Author</th>" +
                    "<th>Quantity</th>" +
                    "<th>Total Price</th>" +
                    "<th>Receipt No.</th>" +
                "</tr>" +
                "<tr style='text-align:center;'>" +
                    "<td>" + bookName + "</td>" +
                    "<td>" + bookAuthor + "</td>" +
                    "<td>" + orderedBookQuantity + "</td>" +
                    "<td>" + orderedBookTotalPrice + "</td>" +
                    "<td>" + receipt + "</td>" +
                "</tr>" +
            "</table><br>" +

            "<p style='text-align:center;'>Thanks For Ordering Books</p>" +
            "<p style='text-align:center;'>Your ordered books will be delivered within 3-4 working days.</p>" +
            "<h3 style='text-align:center;'>@Team E-Book</h3>" +
        "</body>" +
    "</html>";

 EmailSendForUserContactUsPage emailSender = new EmailSendForUserContactUsPage();
                             emailSender.sendEmail(content6, subject,sendtomail );
                    response.sendRedirect("User/Home.jsp");
                  
             } else {

//                Something went wrong
                    content = "Something went Wrong!! Please Order Again";
                    color = "red";
                    icon = "fa-times";
                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
                     
                    response.sendRedirect("User/AddToCardBook.jsp");
                    
                }
        
        }else{
    String razorpaySignature=request.getParameter("razorpaySignature");
           String razorpayPaymentId=request.getParameter("razorpayPaymentId");
           String razorpayOrderId=request.getParameter("razorpayOrderId");
           String status="PAID";
           String receipt=request.getParameter("receipt");
           
int registerId=(Integer.parseInt(request.getParameter("registerId")));
    //ajex data handling start
    razorpayonlinepaymentDataOperation resultdata=new razorpayonlinepaymentDataOperation(ConnectionProvider.getConnection());
    razorpayonlinepayment result=resultdata.getOrderDetailsByUserRegisteredIdAndOrderId(razorpayOrderId, registerId);
    System.out.println(" checking payment details found ");
    if(result!=null)
            {
                System.out.println("payment details found ");
                razorpayonlinepayment payment=new razorpayonlinepayment(razorpayOrderId, status, razorpaySignature, razorpayPaymentId, registerId);
                razorpayonlinepaymentDataOperation paymentData=new razorpayonlinepaymentDataOperation(ConnectionProvider.getConnection());
                
                boolean update=paymentData.UpdatePaymentDetails(payment);
                 System.out.println(" checking payment update ");
         if(update) {      
              System.out.println("payment update done ");
    UserOrderedBook order=new UserOrderedBook(bookId, bookName, bookAuthor, orderedBookQuantity, orderedBookTotalPrice, orderedBookPhotoName, orderedUserName, orderedUserMobileNo, orderedUserEmail, orderedUserVilage, orderedUserLandmark, orderedUserDistrict, orderedUserPincode, orderedUserState, paymentMethod, userAddressId,receipt);
       UserOredredSaveDataOperation orderData=new UserOredredSaveDataOperation(ConnectionProvider.getConnection());
        
            boolean orderconfirm=orderData.orderBook(order);
             System.out.println(" checking redr confirmation ");
             if (orderconfirm) {
                 
                 System.out.println("order confirmation dome ");
                 
                 AddToCardBookDetails delete=new AddToCardBookDetails(bookAddToCardId);
                 AddToCardBookDetailsDataOperation deleteData=new AddToCardBookDetailsDataOperation(ConnectionProvider.getConnection());
                 boolean delete2=deleteData.DeleteRowByBookAddToCardId(delete);
               // Registration Successfull
                    content = "Your Order Has been Successfully Completed";
                    color = "green";
                    icon = "fa-check";

                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
                   
                    //sending message alert to customer start
                             String sendtomail=request.getParameter("sendtomail");
                    String personname=request.getParameter("personname");
                    String subject="Books Order Details";
                   Date pdate=new Date();
String content6 =
    "<html>" +
        "<head><title>Purchase Invoice</title></head>" +
        "<body>" +
            "<div style='text-align:center;'>" +
                "<img src='https://thumbs2.imgbox.com/8f/1d/NkSZH33n_t.png' alt='User Image' style='width:150px; height:auto; border-radius:10px;'>" +
            "</div>" +

            "<h1>Hello " + personname + "</h1><br>" +
            "<h2>Thanks for buying books.</h2><br>" +
            "<h3>Your Purchase Details</h3><br>" +
            "<p>Purchase Date:-"+pdate+"</p><br>"+
            // Table Start
            "<table border='1' style='border-collapse:collapse; width:60%; margin:auto; font-family:sans-serif;'>" +
                "<tr style='background-color:#4facfe; color:white;'>" +
                    "<th>Book Name</th>" +
                    "<th>Author</th>" +
                    "<th>Quantity</th>" +
                    "<th>Total Price</th>" +
                    "<th>Receipt No.</th>" +
                "</tr>" +
                "<tr style='text-align:center;'>" +
                    "<td>" + bookName + "</td>" +
                    "<td>" + bookAuthor + "</td>" +
                    "<td>" + orderedBookQuantity + "</td>" +
                    "<td>" + orderedBookTotalPrice + "</td>" +
                    "<td>" + receipt + "</td>" +
                "</tr>" +
            "</table><br>" +

            "<p style='text-align:center;'>Thanks For Ordering Books</p>" +
            "<p style='text-align:center;'>Your ordered books will be delivered within 3-4 working days.</p>" +
            "<h3 style='text-align:center;'>@Team E-Book</h3>" +
        "</body>" +
    "</html>";

 EmailSendForUserContactUsPage emailSender = new EmailSendForUserContactUsPage();
                             emailSender.sendEmail(content6, subject,sendtomail );
                    //message send section end
                    
                        response.getWriter().write("success");
                   
                } else {

//                Something went wrong
                    content = "Something went Wrong!! Contact Customer Service  With Payment Receipt";
                    color = "red";
                    icon = "fa-times";
                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
                    
                        response.getWriter().write("error");
                   
                }
         }else{
              content = "Order Confirmation Fail Please Contact THe Custome Or Ree Order The BOOK!!";
                    color = "red";
                    icon = "fa-times";
                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
         response.getWriter().write("paymentupdatefail");
         }
            }else{
        content = "Payment Verification Failed!! Please Contact Customer Service If Amount Has debited from Acount";
                    color = "red";
                    icon = "fa-times";
                    Message mymessage = new Message(content, color, icon);
                    Sesssion.setAttribute("mymessage", mymessage);
         response.getWriter().write("paymentVerificationFailed");
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
