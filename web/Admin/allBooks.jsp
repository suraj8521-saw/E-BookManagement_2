<%-- 
    Document   : allBooks
    Created on : 11 Jun 2025, 11:24:08 pm
    Author     : suraj
--%>

<%@page import="com.ebook.Entity.AdminRegistration"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.Entity.BookDetails"%>
<%@page import="com.ebook.Helper.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>

<%
AdminRegistration admin=(AdminRegistration)session.getAttribute("loginAdmin");
if(admin==null){
response.sendRedirect("../AdminLogin.jsp");
    }else{
%>
<%
    List<BookDetails> bookList2 = (List<BookDetails>) session.getAttribute("bookList");
    if(bookList2 == null ){
        response.sendRedirect("Home.jsp");
    } else {
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin All Books</title>
     <script src="../AllComponent/messageautodelete.js" type="text/javascript"></script>
<script>
    // Call the function after page loads
    document.addEventListener('DOMContentLoaded', function () {
        initAutoCloseAlert("autoCloseAlert", "alertProgress", 4000);
    });
</script>
    <%@include file="../AllComponent/AllCSS.jsp" %>
    
</head>
<body>

<%@include file="Navbar.jsp" %>

 <%
    Message mymessage = (Message)session.getAttribute("mymessage");
    if (mymessage != null) {
%>
<div class="row mt-3">
    <div class="col-md-4 offset-md-4">
         <div id="autoCloseAlert" class="alert alert-dismissible fade show text-white position-relative p-0" role="alert" style="background-color: <%= mymessage.getColor() %>">
    
    <!-- Progress Bar -->
    <div class="progress" style="height: 5px;">
        <div class="progress-bar bg-warning" id="alertProgress" role="progressbar" style="width: 100%;" aria-valuemin="0" aria-valuemax="100"></div>
    </div>

    <!-- Alert Content -->
    <div class="p-3">
        <strong>
            <i class="fa <%= mymessage.getIcon() %>"></i>
            <%= mymessage.getContent() %>
        </strong>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>

</div>
    </div>
</div>
<%
    }
session.removeAttribute("mymessage");
%>

<h3 class="text-center">Hello Admin</h3>

<table class="table table-hover">
    <thead>
        <tr>
            <th class="bg-primary text-white">Book Id</th>
            <th class="bg-primary text-white">Book Name</th>
            <th class="bg-primary text-white">Author</th>
            <th class="bg-primary text-white">Price</th>
            <th class="bg-primary text-white">Category</th>
            <th class="bg-primary text-white">Status</th>
            <th class="bg-primary text-white">Book Image</th>
            <th class="bg-primary text-white">Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            List<BookDetails> bookList = (List<BookDetails>) session.getAttribute("bookList");
            String findPage="adminPage";
            if (bookList != null && !bookList.isEmpty()) {
                for (BookDetails book : bookList) {
                    String encodedPhoto = URLEncoder.encode(book.getBookPhotoName(), "UTF-8");
        %>
        <tr>
            <td><%= book.getBookId() %></td>
            <td><%= book.getBookName() %></td>
            <td><%= book.getBookAuthor() %></td>
            <td><%= book.getBookPrice() %></td>
            <td><%= book.getBookCategory() %></td>
            <td><%= book.getBookStatus() %></td>
            <td><img src="../Books/<%= book.getBookPhotoName() %>" style="height:60px; width:60px;" /></td>
            <td>
                <a href="EditBooks.jsp?bookId=<%= book.getBookId() %>" class="btn btn-sm btn-primary">Edit</a>
                <a href="../DeleteBookServlet?bookId=<%= book.getBookId() %>&photo=<%= encodedPhoto %>&findPage=<%=findPage%>"
                   onclick="return confirm('Are you sure you want to delete this book?');"
                   class="btn btn-danger btn-sm">Delete</a>
            </td>
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
</table>
        <div style="margin-top: 370px">
<%@include file="../AllComponent/Footer.jsp" %>
</div>
</body>
</html>
<%
    }
%>
<%
}
%>