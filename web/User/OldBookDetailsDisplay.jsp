<%@page import="java.net.URLEncoder"%>
<%@page import="com.ebook.Entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.Entity.UserRegistration"%>
<%@page import="com.ebook.Helper.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
UserRegistration user = (UserRegistration) session.getAttribute("loginStudent");
if (user == null) {
    response.sendRedirect("../Login.jsp");
} else {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <script src="../AllComponent/messageautodelete.js" type="text/javascript"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            initAutoCloseAlert("autoCloseAlert", "alertProgress", 4000);
        });
    </script>
    
    <%@include file="../AllComponent/AllCSS.jsp" %>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #e0eafc, #cfdef3);
            margin: 0;
            padding: 0;
        }
        .book-card {
            max-width: 450px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            background-color: #ffffff;
            overflow: hidden;
            transition: transform 0.3s ease;
            margin: 30px auto;
        }
        .book-card:hover {
            transform: scale(1.02);
        }
        .book-img {
            width: 100%;
            height: 300px;
            object-fit: contain;
            background-color: #f8f9fa;
            border-bottom: 1px solid #ddd;
        }
        .btn-buy {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            color: white;
            border: none;
        }
        .btn-buy:hover {
            background: linear-gradient(to right, #43e97b, #38f9d7);
        }
        .section-header {
            margin-top: 30px;
            text-align: center;
        }
    </style>
</head>
<body>
    <%@include file="Navbar.jsp" %>

    <div class="container py-5">
        <% Message mymessage = (Message) session.getAttribute("mymessage");
           if (mymessage != null) { %>
            <div class="row mt-3">
                <div class="col-md-6 offset-md-3">
                    <div id="autoCloseAlert" class="alert alert-dismissible fade show text-white position-relative p-0" role="alert" style="background-color: <%= mymessage.getColor() %>">
                        <div class="progress" style="height: 5px;">
                            <div class="progress-bar bg-warning" id="alertProgress" role="progressbar" style="width: 100%;"></div>
                        </div>
                        <div class="p-3">
                            <strong>
                                <i class="fa <%= mymessage.getIcon() %>"></i>
                                <%= mymessage.getContent() %>
                            </strong>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </div>
                </div>
            </div>
        <% } session.removeAttribute("mymessage"); %>

        <h2 class="section-header">Book Details</h2>
        <p class="text-center text-muted">Please contact seller to buy this product</p>

        <div class="row justify-content-center">
        <% 
            List<BookDetails> bookList5 = (List<BookDetails>) session.getAttribute("bookList5");
            if (bookList5 != null && !bookList5.isEmpty()) {
                for (BookDetails book : bookList5) {
                    String encodedPhoto = URLEncoder.encode(book.getBookPhotoName(), "UTF-8");
        %>
            <div class="col-md-6 col-lg-4">
                <div class="book-card">
                    <img src="../Books/<%= book.getBookPhotoName() %>" class="book-img" alt="Book Image">
                    <div class="p-4 text-center">
                        <h4 class="fw-bold mb-1">Book Name: <strong><%= book.getBookName() %> <strong></h4>
                        <p class="text-muted mb-2">Author: <strong><%= book.getBookAuthor() %></strong></p>
                        <p>Category: <strong><%= book.getBookCategory() %></strong></p>
                        <p class="text-secondary" style="font-size: 14px;">Seller: <strong><%= book.getUserEmail() %></strong></p>
                        <div class="d-flex justify-content-between align-items-center mt-3 px-4">
                            <span class="fw-bold text-success">₹ <%= book.getBookPrice() %></span>
                            <a href="#" class="btn btn-buy btn-sm px-4">Buy</a>
                        </div>
                    </div>
                </div>
            </div>
        <%   } 
           } else { %>
            <div class="text-center mt-5">
                <h5 class="text-danger">No books found.</h5>
            </div>
        <% } %>
        </div>
    </div>

    <%@include file="../AllComponent/Footer.jsp" %>
</body>
</html>
<% } %>