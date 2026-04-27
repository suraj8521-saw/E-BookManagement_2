<%-- 
    Document   : Login
    Created on : 4 Jun 2025, 11:24:45 pm
    Author     : suraj
--%>

<%@page import="com.ebook.Entity.UserOrderedBook"%>
<%@page import="com.ebook.DataOperation.UserOredredSaveDataOperation"%>
<%@page import="com.ebook.Helper.ConnectionProvider"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.ebook.Entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.Entity.UserRegistration"%>
<%@page import="com.ebook.Helper.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ebook.DataOperation.DisplayAllBookAtUserHomePageDataOperation"%>
<%@page import="com.ebook.Entity.BookDetails"%>
<%@page import="java.util.ArrayList"%>
<%
UserRegistration user=(UserRegistration)session.getAttribute("loginStudent");
if(user==null){
response.sendRedirect("../Login.jsp");
    }else{
%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        
    
      <style>
        .bg-custom {
            background-color: #303f9f;
        }

        .order-img {
            width: 100px;
            height: 120px;
            object-fit: cover;
            border-radius: 5px;
        }

        .table th, .table td {
            vertical-align: middle;
            text-align: center;
        }
    </style>
    </head>
    <body style=" background-color:#f0f1f2" >
                 <div class="table-responsive">
<table  class="table table-bordered table-hover shadow-sm bg-white">
  <thead class="table-primary">
    <tr>
      <th >Book Detail</th>
      <th >Book Image</th>
      
      <th >Total Quantity</th>
      <th >Total Price</th>
      <th>Payment Type</th>
      <th >Order Date</th>
    
    </tr>
  </thead>
       <tbody>
    <tr>
       <%
           String userEmail=request.getParameter("userEmail");
           String searchKey = request.getParameter("searchKey");
           UserOredredSaveDataOperation searchData=new UserOredredSaveDataOperation(ConnectionProvider.getConnection());
           
            List<UserOrderedBook> searchlist = searchData.getAllBooksBySearchKey(searchKey, userEmail);
          
            if (searchlist != null && !searchlist.isEmpty()) {
            
           
                for (UserOrderedBook book5 : searchlist) {
                    
                  
        %>
      <td>
          <p><span style="font-weight: bold">Name:</span> <%=book5.getBookName()%></p>
          <p><span style="font-weight: bold">Author: </span> <%=book5.getBookAuthor()%></p>
      </td>
      <td><img src="../Books/<%= book5.getOrderedBookPhotoName()%>" alt="alt" class="order-img"/>
                          </td>
     
      <td><%=book5.getOrderedBookQuantity()%></td>
      <td><%=book5.getOrderedBookTotalPrice()%></td>
      <td><%=book5.getPaymentMethod()%></td>
      <td><%=book5.getOrderedDate()%></td>
       </tr>
       <%
                          
}
            } else {
        %>
        <tr>
            <td colspan="8">No books found.</td>
        </tr>
        <%
            }
        %>
       
  </tbody>
                 </div>
    </body>
</html>
<%
}
%>