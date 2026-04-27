<%@page import="java.net.URLEncoder"%>
<%@page import="com.ebook.Entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.Entity.UserRegistration"%>
<%@page import="com.ebook.Helper.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <title>New Books</title>
    <script src="../AllComponent/messageautodelete.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            initAutoCloseAlert("autoCloseAlert", "alertProgress", 4000);
        });
    </script>
    <link href="Homepagecss.css" rel="stylesheet" type="text/css"/>
    <%@include file="../AllComponent/AllCSS.jsp" %>
</head>
<body>
<section>
    <!-- Top Strip -->
    <div class="top-strip"></div>

    <!-- Branding + Search + User Info -->
    <div class="navbar-top bg-light py-3">
        <div class="row align-items-center">
            <div class="col-lg-2 col-md-12 text-success text-center text-lg-start mb-2 mb-lg-0">
                <h3 class="m-0 site-title">
                    <a href="Home.jsp" class="text-success text-decoration-none">
                        <i class="fas fa-book"></i> Ebooks
                    </a>
                </h3>
            </div>
            <div class="col-lg-5 col-md-12 mb-2 mb-lg-0">
                <input id="search" class="form-control search-input" type="search" placeholder="Search" aria-label="Search" oninput="handleSearch(this.value)">
            </div>
            <div class="col-lg-5 col-md-12 text-center text-lg-end">
                <a href="UserProfileHome.jsp" class="btn btn-primary me-2">
                    <i class="fa fa-user" aria-hidden="true"></i> <%=user.getUserName()%>
                </a>
                <a href="../UserLogoutServlet" class="btn btn-success">
                    <i class="fa-solid fa-right-to-bracket"></i> Logout
                </a>
            </div>
        </div>
    </div>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand text-white" href="Home.jsp">
                <i class="fa-solid fa-house-chimney"></i>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse mt-2 mt-lg-0" id="navbarMenu">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link active" href="Home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="UserHomePageAllRecentBooks.jsp">
                            <i class="fa-solid fa-book-open"></i> Recent Book
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="UserHomePageAllNewtBooks.jsp">
                            <i class="fa-solid fa-book"></i> New Book
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="UserHomePageAllOldBooks.jsp">
                            <i class="fa-solid fa-book"></i> Old Book
                        </a>
                    </li>
                </ul>
                <div class="d-flex flex-wrap gap-2">
                    <a class="btn btn-outline-light btn-settings" href="UserProfileHome.jsp">
                        <i class="fa-solid fa-gear"></i> Setting
                    </a>
                    <a class="btn btn-outline-light btn-contact" href="ContactUs.jsp">
                        <i class="fa-solid fa-headset"></i> Contact Us
                    </a>
                    <a class="btn btn-light text-primary" href="../CartSectionBookServletS?userEmail=<%=user.getUserEmail()%>">
                        <i class="fa fa-cart-plus" aria-hidden="true"></i> Cart
                    </a>
                    <a class="btn btn-light text-primary" href="../UserOrderHistryServlet?userEmail=<%=user.getUserEmail()%>">
                        <i class="fa fa-history" aria-hidden="true"></i> Orders
                    </a>
                </div>
            </div>
        </div>
    </nav>
</section>

<%
Message mymessage = (Message)session.getAttribute("mymessage");
if (mymessage != null) {
%>
<div class="row mt-3">
    <div class="col-md-4 offset-md-4">
        <div id="autoCloseAlert" class="alert alert-dismissible fade show text-white position-relative p-0" role="alert" style="background-color: <%= mymessage.getColor() %>">
            <div class="progress" style="height: 5px;">
                <div class="progress-bar bg-warning" id="alertProgress" role="progressbar" style="width: 100%;" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
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

<section id="homepagedata">
    <div class="container my-4">
        <h3 class="text-center mb-4">New Books</h3>
        <div class="row">
            <%
                List<BookDetails> bookList = (List<BookDetails>) session.getAttribute("bookListnewCategory");
                if (bookList != null && !bookList.isEmpty()) {
                    for (BookDetails book : bookList) {
                        String encodedPhoto = URLEncoder.encode(book.getBookPhotoName(), "UTF-8");
            %>
            <div class="col-md-6 col-lg-3 mb-4">
                <div class="book-card">
                  <div class="text-center "> <img src="../Books/<%= book.getBookPhotoName() %>" class="book-img  m-4 text-center w-auto bg-white shadow-sm" alt="Book Image"></div>
               <div class="p-3 text-center">
                        <h5 class="fw-bold mb-2"><%= book.getBookName().length() > 12 ? book.getBookName().substring(0, 12) + "..." : book.getBookName() %></h5>
                        <p class="mb-1 text-muted">Author: <strong><%= book.getBookAuthor().length() > 12 ? book.getBookAuthor().substring(0, 12) + "..." : book.getBookAuthor() %></strong></p>
                        <p class="mb-1">Category: <strong><%= book.getBookCategory() %></strong></p>
                        <div class="d-flex justify-content-between align-items-center mt-3 px-3">
                            <span class="fw-bold text-success">₹ <%= book.getBookPrice() %></span>
                            <a href="../AddToCardDetailsServlet?userEmail=<%=user.getUserEmail()%>&bookId=<%=book.getBookId()%>&bookName=<%= book.getBookName() %>&bookAuthor=<%=book.getBookAuthor()%>&bookCategory=<%= book.getBookCategory()%>&bookPhotoName=<%= book.getBookPhotoName()%>&bookPrice=<%=book.getBookPrice()%>" class="btn btn-buy btn-sm">Add</a>
                        </div>
                        <a href="../ViewBookDetailServlet?bookId=<%=book.getBookId()%>&bookCategory=<%= book.getBookCategory()%>" class="btn btn-outline-primary btn-sm mt-2">View Details</a>
                    </div>
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <div class="text-center">
                <h5 class="text-danger">No books found.</h5>
            </div>
            <%
                }
            %>
        </div>
    </div>
</section>

<section id="result"></section>
<%@include file="../AllComponent/Footer.jsp" %>

<script>
    function handleSearch(searchKey) {
        if (searchKey.trim() !== "") {
            document.getElementById("homepagedata").style.display = "none";
            document.getElementById("result").style.display = "block";
            $.ajax({
                data: {
                    'searchKey': searchKey,
                    'bookCategory': "New"
                },
                type: 'POST',
                url: "SearchingbookforCategoryWise.jsp",
                success: function (data) {
                    $('#result').html(data);
                },
                error: function (jqXHR) {
                }
            });
        } else {
            document.getElementById("homepagedata").style.display = "block";
            document.getElementById("result").style.display = "none";
        }
    }
</script>
</body>
</html>
<%
}
%>