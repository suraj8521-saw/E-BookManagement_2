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
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Details</title>
    
    <script src="../AllComponent/messageautodelete.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <%@include file="../AllComponent/AllCSS.jsp" %>
    <link href="Homepagecss.css" rel="stylesheet" type="text/css"/>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            initAutoCloseAlert("autoCloseAlert", "alertProgress", 4000);
        });
    </script>
</head>

<body style="background-color:#f0f1f2;">
    <%@include file="Navbar.jsp" %>

    <% Message mymessage = (Message) session.getAttribute("mymessage");
    if (mymessage != null) { %>
        <div class="row mt-3">
            <div class="col-md-4 offset-md-4">
                <div id="autoCloseAlert" class="alert alert-dismissible fade show text-white position-relative p-0" role="alert" style="background-color: <%= mymessage.getColor() %>">
                    <div class="progress" style="height: 5px;">
                        <div class="progress-bar bg-warning" id="alertProgress" role="progressbar" style="width: 100%;"></div>
                    </div>
                    <div class="p-3">
                        <strong><i class="fa <%= mymessage.getIcon() %>"></i> <%= mymessage.getContent() %></strong>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
            </div>
        </div>
    <% } session.removeAttribute("mymessage"); %>

    <div class="container my-5">
        <h3 class="text-center mb-4">Book Details</h3>
        <div class="row">
            <%
                List<BookDetails> bookList5 = (List<BookDetails>) session.getAttribute("bookList5");
                if (bookList5 != null && !bookList5.isEmpty()) {
                    for (BookDetails book : bookList5) {
                        String encodedPhoto = URLEncoder.encode(book.getBookPhotoName(), "UTF-8");
            %>
          <div class="col-md-6 offset-md-3 mb-5">
    <div class="card shadow p-4" style="max-width: 700px; margin: auto;">
        <div class="row g-4 align-items-center">
                        <div class="col-md-4 text-center">
                            <img src="../Books/<%= book.getBookPhotoName() %>" class="img-fluid rounded" style="height: 220px;" alt="Book Image">
                        </div>
                        <div class="col-md-8">
                            <h4 class="fw-bold"><%= book.getBookName() %></h4>
                            <p class="mb-2">Author: <strong><%= book.getBookAuthor() %></strong></p>
                            <p class="mb-2">Category: <strong><%= book.getBookCategory() %></strong></p>
                            <p class="mb-3 text-success fs-5">Price: ₹ <%= book.getBookPrice() %></p>

                            <div class="d-flex flex-wrap gap-2">
                                <a href="../AddToCardDetailsServlet?userEmail=<%= user.getUserEmail() %>&bookId=<%= book.getBookId() %>&bookName=<%= book.getBookName() %>&bookAuthor=<%= book.getBookAuthor() %>&bookCategory=<%= book.getBookCategory() %>&bookPhotoName=<%= book.getBookPhotoName() %>&bookPrice=<%= book.getBookPrice() %>" 
                                   class="btn btn-danger btn-sm">
                                    <i class="fa-solid fa-cart-plus"></i> Add to Cart
                                </a>
                                <a href="#" class="btn btn-success btn-sm">Buy Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <div class="text-center">
                <h5 class="text-danger">No book details found.</h5>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <%@include file="../AllComponent/Footer.jsp" %>
</body>
</html>
<% } %>
