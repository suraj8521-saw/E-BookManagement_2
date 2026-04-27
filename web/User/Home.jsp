<%-- 
    Document   : Login
    Created on : 4 Jun 2025, 11:24:45 pm
    Author     : suraj
--%>

<%@page import="javax.swing.text.Document"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.ebook.Entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.Entity.UserRegistration"%>
<%@page import="com.ebook.Helper.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.ebook.DataOperation.BookAddDetailsDataOperation"%>
<%@page import="com.ebook.Entity.BookDetails"%>
<%
    UserRegistration user = (UserRegistration) session.getAttribute("loginStudent");
    if (user == null) {
        response.sendRedirect("../Login.jsp");
    } else {

%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <script src="../AllComponent/messageautodelete.js" type="text/javascript"></script>
        <script>
            // Call the function after page loads
            document.addEventListener('DOMContentLoaded', function () {
                initAutoCloseAlert("autoCloseAlert", "alertProgress", 4000);
            });
        </script>
       
<link href="Homepagecss.css" rel="stylesheet" type="text/css"/>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

     <%@include file="../AllComponent/AllCSS.jsp" %>

    </head>
    <body  >
      <section>
    <!-- Top strip -->
    <div class="container-fluid top-strip"></div>

    <!-- Branding + Search + User -->
    <div class="container-fluid bg-light py-3">
        <div class="row align-items-center">
            <div class="col-lg-2 col-md-12 text-success text-center text-lg-left mb-2 mb-lg-0">
                <a href="Home.jsp" class="brand-header text-success"><i class="fas fa-book"></i> Ebooks</a>
            </div>

            <div class="col-lg-5 col-md-12 mb-2 mb-lg-0">
                <input id="search" class="form-control" type="search" placeholder="Search books..." aria-label="Search" oninput="handleSearch(this.value)">
            </div>

            <div class="col-lg-5 col-md-12 text-center text-lg-end">
                <a href="UserProfileHome.jsp" class="btn btn-primary me-2">
                    <i class="fa fa-user"></i> <%= user.getUserName() %>
                </a>
                <a href="../UserLogoutServlet" class="btn btn-success">
                    <i class="fa-solid fa-right-to-bracket"></i> Logout
                </a>
            </div>
        </div>
    </div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand text-white" href="Home.jsp"><i class="fa-solid fa-house-chimney"></i></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon bg-light rounded"></span>
            </button>

            <div class="collapse navbar-collapse mt-2 mt-lg-0" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" href="Home.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="UserHomePageAllRecentBooks.jsp"><i class="fa-solid fa-book-open"></i> Recent Book</a></li>
                    <li class="nav-item"><a class="nav-link" href="UserHomePageAllNewtBooks.jsp"><i class="fa-solid fa-book"></i> New Book</a></li>
                    <li class="nav-item"><a class="nav-link" href="UserHomePageAllOldBooks.jsp"><i class="fa-solid fa-book"></i> Old Book</a></li>
                </ul>

                <div class="d-flex flex-wrap gap-2">
                    <a class="btn btn-outline-light" href="UserLiveChatEndToEnd.jsp" ><i class="fa-solid fa-comments"></i> Live Chat</a>
                          
                    <a class="btn btn-outline-light" href="UserProfileHome.jsp"><i class="fa-solid fa-gear"></i> Setting</a>
                    <a class="btn btn-outline-light" href="ContactUs.jsp"><i class="fa-solid fa-headset"></i> Contact Us</a>
                    <a class="btn btn-light text-primary" href="../CartSectionBookServletS?userEmail=<%= user.getUserEmail() %>">
                        <i class="fa fa-cart-plus"></i> Cart
                    </a>
                    <a class="btn btn-light text-primary" href="../UserOrderHistryServlet?userEmail=<%= user.getUserEmail() %>">
                        <i class="fa fa-history"></i> Orders
                    </a>
                </div>
            </div>
        </div>
    </nav>
</section>

        <%
            Message mymessage = (Message) session.getAttribute("mymessage");
            if (mymessage != null) {
        %>
        <div class="row mt-3">
            <div class="col-md-4 offset-md-4">
                <div id="autoCloseAlert" class="alert alert-dismissible fade show text-white position-relative p-0" role="alert" style="background-color: <%= mymessage.getColor()%>">

                    <!-- Progress Bar -->
                    <div class="progress" style="height: 5px;">
                        <div class="progress-bar bg-warning" id="alertProgress" role="progressbar" style="width: 100%;" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>

                    <!-- Alert Content -->
                    <div class="p-3">
                        <strong>
                            <i class="fa <%= mymessage.getIcon()%>"></i>
                            <%= mymessage.getContent()%>
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
            
       <div class="container mt-5">
    <h3 class="text-center mb-4 text-primary">Recent Books</h3>

    <div class="row justify-content-center">
        <%
           
            List<BookDetails> bookList2 = (List<BookDetails>) session.getAttribute("bookList2");
            int limit1 = 4, count1 = 0;
            if (bookList2 != null && !bookList2.isEmpty()) {
                for (BookDetails book : bookList2) {
                    if (count1 >= limit1) break;
                    count1++;
                    String encodedPhoto = URLEncoder.encode(book.getBookPhotoName(), "UTF-8");
                    String Bookname = book.getBookName().toUpperCase();
                     String bookcat= book.getBookCategory().toUpperCase();
        %>

        <div class="col-md-6 col-lg-3 mb-4">
            <div class="book-card">
                 <div class="text-center "> <img src="../Books/<%= book.getBookPhotoName() %>" class="book-img  m-4 text-center w-auto bg-white shadow-sm" alt="Book Image"></div>
              <div class="p-4 text-center">
                    <h5 class="fw-bold mb-1 "><%= Bookname.length() > 12 ? Bookname.substring(0, 12) + "..." : Bookname %></h5>
                    <p class="text-muted mb-1 ">Author: <strong><%= book.getBookAuthor().length() > 12 ? book.getBookAuthor().substring(0, 12) + "..." : book.getBookAuthor() %></strong></p>
                    <p class="text-muted mb-2">Category: <strong><%= book.getBookCategory() %></strong></p>

                    <div class="d-flex flex-column gap-2 mt-3">
                      <%
                      
                        if(bookcat.equals("NEW")){
                          
                      %>
                       <a href="../AddToCardDetailsServlet?userEmail=<%=user.getUserEmail()%>&bookId=<%=book.getBookId()%>&bookName=<%= book.getBookName()%>&bookAuthor=<%=book.getBookAuthor()%>&bookCategory=<%= book.getBookCategory()%>&bookPhotoName=<%= book.getBookPhotoName()%>&bookPrice=<%=book.getBookPrice()%>" 
                           class="btn btn-buy btn-sm px-4">
                            <i class="fa-solid fa-cart-plus"></i> Add to Cart
                        </a>
                        <%
                          }
                      %>

                        <a href="../ViewBookDetailServlet?bookId=<%= book.getBookId() %>&bookCategory=<%= book.getBookCategory() %>" 
                           class="btn btn-success btn-sm px-4">
                            View Details
                        </a>

                        <span class="btn btn-secondary btn-sm disabled">
                            ₹ <%= book.getBookPrice() %>
                        </span>
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

    <div class="text-center mt-4">
        <a href="UserHomePageAllRecentBooks.jsp" class="btn btn-danger btn-sm text-white px-4 rounded-pill">
            View All
        </a>
    </div>
</div>


        <!<!-- end recent book -->
        <br>
        <hr>

       <div class="container mt-5">
    <h3 class="text-center mb-4 text-primary">New Books</h3>
    <div class="row justify-content-center">
        <%
            List<BookDetails> bookList = (List<BookDetails>) session.getAttribute("bookListnewCategory");
            int limit = 4, count = 0;
            if (bookList != null && !bookList.isEmpty()) {
                for (BookDetails book : bookList) {
                    if (count >= limit) break;
                    count++;
                    String encodedPhoto = URLEncoder.encode(book.getBookPhotoName(), "UTF-8");
                    String Bookname = book.getBookName().toUpperCase();
        %>

        <!-- 🆕 Stylish Single Book Card -->
        <div class="col-md-6 col-lg-3">
            <div class="book-card">
                <div class="text-center "> <img src="../Books/<%= book.getBookPhotoName() %>" class="book-img  m-4 text-center w-auto bg-white shadow-sm" alt="Book Image"></div>
             
                <div class="p-4 text-center">
                    <h5 class="fw-bold mb-1 "><%= Bookname.length() > 12 ? Bookname.substring(0, 12) + "..." : Bookname %></h5>
                    <p class="text-muted mb-1">Author: <strong><%= book.getBookAuthor().length() > 12 ? book.getBookAuthor().substring(0, 12) + "..." : book.getBookAuthor() %></strong></p>
                    <p class="text-muted mb-2">Category: <strong><%= book.getBookCategory() %></strong></p>
                    
                    <!-- 📦 Button Row -->
                    <div class="d-flex flex-column gap-2 mt-3">
                        <a href="../AddToCardDetailsServlet?userEmail=<%= user.getUserEmail() %>&bookId=<%= book.getBookId() %>&bookName=<%= book.getBookName() %>&bookAuthor=<%= book.getBookAuthor() %>&bookCategory=<%= book.getBookCategory() %>&bookPhotoName=<%= book.getBookPhotoName() %>&bookPrice=<%= book.getBookPrice() %>"
                           class="btn btn-buy btn-sm px-4 w-100">
                            <i class="fa-solid fa-cart-plus"></i> Add to Cart
                        </a>

                        <a href="../ViewBookDetailServlet?bookId=<%= book.getBookId() %>&bookCategory=<%= book.getBookCategory() %>"
                           class="btn btn-success btn-sm px-4 w-100">
                            View Details
                        </a>

                        <span class="btn btn-secondary btn-sm disabled w-100">
                            ₹ <%= book.getBookPrice() %>
                        </span>
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

    <!-- View All -->
    <div class="text-center mt-4">
        <a href="UserHomePageAllNewtBooks.jsp" class="btn btn-danger btn-sm text-white px-4 rounded-pill">View All</a>
    </div>
</div>

           
        <!<!-- end New book -->
      <div class="container mt-5">
    <h3 class="text-center mb-4 text-primary">Old Books</h3>

    <div class="row justify-content-center">
        <%
            List<BookDetails> bookList3 = (List<BookDetails>) session.getAttribute("bookList3");
            int limit2 = 4, count2 = 0;
            if (bookList3 != null && !bookList3.isEmpty()) {
                for (BookDetails book : bookList3) {
                    if (count2 >= limit2) break;
                    count2++;
                    String encodedPhoto = URLEncoder.encode(book.getBookPhotoName(), "UTF-8");
                    String Bookname = book.getBookName().toUpperCase();
        %>

        <div class="col-md-6 col-lg-3 mb-4">
            <div class="book-card">
                <div class="text-center "> <img src="../Books/<%= book.getBookPhotoName() %>" class="book-img  m-4 text-center w-auto bg-white shadow-sm" alt="Book Image"></div>
              <div class="p-4 text-center">
                    <h5 class="fw-bold mb-1"><%= Bookname.length() > 12 ? Bookname.substring(0, 12) + "..." : Bookname %></h5>
                    <p class="text-muted mb-1">Author: <strong><%= book.getBookAuthor().length() > 12 ? book.getBookAuthor().substring(0, 12) + "..." : book.getBookAuthor() %></strong></p>
                    <p class="text-muted mb-2">Category: <strong><%= book.getBookCategory() %></strong></p>

                    <div class="d-flex flex-column gap-2 mt-3">
                        <a href="../ViewBookDetailServlet?bookId=<%= book.getBookId() %>&bookCategory=<%= book.getBookCategory() %>" 
                           class="btn btn-buy btn-sm px-4">
                            <i class="fa-solid fa-cart-plus"></i> Buy
                        </a>

                        <a href="../ViewBookDetailServlet?bookId=<%= book.getBookId() %>&bookCategory=<%= book.getBookCategory() %>" 
                           class="btn btn-success btn-sm px-4">
                            View Details
                        </a>

                        <span class="btn btn-secondary btn-sm disabled">
                            ₹ <%= book.getBookPrice() %>
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <% } } else { %>
        <div class="text-center mt-5">
            <h5 class="text-danger">No books found.</h5>
        </div>
        <% } %>
    </div>

    <div class="text-center mt-4">
        <a href="UserHomePageAllOldBooks.jsp" class="btn btn-danger btn-sm text-white px-4 rounded-pill">
            View All
        </a>
    </div>
</div>

        <!<!-- end old book -->
        </section>
        <section id="result">
            
        </section>
        <%@include file="../AllComponent/Footer.jsp" %>
    
    <script>
      function handleSearch(searchKey){
            if (searchKey.trim() !== "") {
                
      document.getElementById("homepagedata").style.display = "none";
       document.getElementById("result").style.display = "block";
          $.ajax({

                        data: {
                            
                            'searchKey': searchKey
                            
                        },
                        type: 'POST',
                        url: "SearchingBooksForHomePage.jsp",
                        success: function (data) {
                            $('#result').html(data);
                        },
                        error: function (jqXHR) {

                        }
                    });
      
    } else {
      // agar field blank ho to dobara show kar do
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