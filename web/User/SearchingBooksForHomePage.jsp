<%@page import="com.ebook.Helper.ConnectionProvider"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.ebook.Entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.Entity.UserRegistration"%>
<%@page import="com.ebook.Helper.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ebook.DataOperation.DisplayAllBookAtUserHomePageDataOperation"%>
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
    <title>Searched Books</title>
    <link href="Homepagecss.css" rel="stylesheet" type="text/css"/>
    <%@include file="../AllComponent/AllCSS.jsp" %>
</head>
<body style="background: linear-gradient(to right, #e0eafc, #cfdef3);">

<div class="container my-4">
    <h3 class="text-center mb-4">Searched Books</h3>
    <div class="row">
        <%
            String searchKey = request.getParameter("searchKey");
            DisplayAllBookAtUserHomePageDataOperation bookdata = new DisplayAllBookAtUserHomePageDataOperation(ConnectionProvider.getConnection());
            List<BookDetails> Searchlist = bookdata.getAllSuggestedBook(searchKey);

            if (Searchlist != null && !Searchlist.isEmpty()) {
                for (BookDetails book : Searchlist) {
                    String encodedPhoto = URLEncoder.encode(book.getBookPhotoName(), "UTF-8");
        %>
        <div class="col-md-6 col-lg-3 mb-4">
            <div class="book-card">
                <img src="../Books/<%= book.getBookPhotoName() %>" class="book-img" alt="Book Image">
                <div class="p-3 text-center">
                    <h5 class="fw-bold mb-2"><%= book.getBookName().toUpperCase() %></h5>
                    <p class="mb-1 text-muted">Author: <strong><%= book.getBookAuthor() %></strong></p>
                    <p class="mb-1">Category: <strong><%= book.getBookCategory() %></strong></p>
                    <div class="d-flex justify-content-between align-items-center mt-3 px-3">
                        <span class="fw-bold text-success">₹ <%= book.getBookPrice() %></span>
                        <a href="#" class="btn btn-buy btn-sm disabled">Price</a>
                    </div>
<!--                    <a href="../ViewBookDetailServlet?bookId=<%=book.getBookId()%>&bookCategory=<%= book.getBookCategory()%>" class="btn btn-outline-primary btn-sm mt-2 me-1">Contact Seller</a>-->
                    <a href="../ViewBookDetailServlet?bookId=<%=book.getBookId()%>&bookCategory=<%= book.getBookCategory()%>" class="btn btn-outline-success btn-sm mt-2">View Details</a>
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
</body>
</html>
<%
}
%>
