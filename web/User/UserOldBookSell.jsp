
<%-- 
    Document   : Login
    Created on : 4 Jun 2025, 11:24:45 pm
    Author     : suraj
--%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <script src="../AllComponent/messageautodelete.js" type="text/javascript"></script>
        <script>
            // Call the function after page loads
            document.addEventListener('DOMContentLoaded', function () {
                initAutoCloseAlert("autoCloseAlert", "alertProgress", 4000);
            });
        </script>
        <style>
            .bg-custom {
               background: linear-gradient(to right, #4facfe, #43e97b);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }

            .navbar .nav-item:hover .nav-link {
                background-color: white;
                color: #303f9f;
                border-radius: 15px;
            }
        </style>
        <%@include file="../AllComponent/AllCSS.jsp" %>       
    </head>
    <body style=" background-color:#f0f1f2" >
        <section>
            <!-- Top strip -->
            <div class="container-fluid" style="height: 10px; background-color: #303f9f;"></div>

            <!-- Branding + Search + Logout (Responsive Grid) -->
            <div class="container-fluid bg-light py-3">
                <div class="row align-items-center">
                    <div class="col-lg-2 col-md-12 text-success text-center text-lg-left mb-2 mb-lg-0">
                        <h3 class="m-0"><a href="Home.jsp" style="text-decoration: none " class="text-success"><i class="fas fa-book"></i> Ebooks</a></h3>
                    </div>
                    <div class="col-lg-5 col-md-12 mb-2 mb-lg-0">
                        <form class="d-flex justify-content-center justify-content-lg-start">
                            <input class="form-control mr-2" type="search" placeholder="Search" aria-label="Search" hidden>
                            <button class="btn btn-outline-primary" type="submit" hidden>Search</button>
                        </form>
                    </div>
                    <div class="col-lg-5 col-md-12 text-center text-lg-right " >
                        <a href="UserProfileHome.jsp" class="btn btn-primary"  style="text-decoration: none"><i class="fa fa-user" aria-hidden="true"></i> <%=user.getUserName()%> </a>
                        <a href="../UserLogoutServlet" class="btn btn-success ">
                            <i class="fa-solid fa-right-to-bracket"></i> Logout
                        </a>
                    </div>
                </div>
            </div>
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-dark bg-custom">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#"><i class="fa-solid fa-house-chimney"></i></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse mt-2 mt-lg-0" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item active">
                                <a class="nav-link active" href="Home.jsp">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="UserHomePageAllRecentBooks.jsp" hidden><i class="fa-solid fa-book-open"></i> Recent Book</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="UserHomePageAllNewtBooks.jsp" hidden><i class="fa-solid fa-book"></i> New Book</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="UserHomePageAllOldBooks.jsp"hidden><i class="fa-solid fa-book"></i> Old Book</a>
                            </li>
                        </ul>
                        <div class="d-flex flex-wrap gap-2">
                            <a class="btn btn-outline-light" href="UserProfileHome.jsp"><i class="fa-solid fa-gear"></i> Setting</a>
                            <a class="btn btn-outline-light" href="ContactUs.jsp"><i class="fa-solid fa-headset"></i> Contact Us</a>

                            <a class="btn btn-success" href="../CartSectionBookServletS?userEmail=<%=user.getUserEmail()%>" hidden><i class="fa fa-cart-plus" aria-hidden="true"></i> Cart</a>
                            <a class="btn btn-success" href="../UserOrderHistryServlet?userEmail=<%=user.getUserEmail()%>" hidden><i class="fa fa-history" aria-hidden="true"></i> Orderes</a>             
                        </div>
                    </div>
                </div>
            </nav>
        </section>      
        <%
            Message mymessage = (Message) session.getAttribute("mymessage");
            if (mymessage != null) {
        %>

        <%
            }
            session.removeAttribute("mymessage");
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-2">
                        <div class="card-body">
                            <h4 class="text-center">Add Books</h4>
                            <form action="../BookAddDetailsServlets" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="exampleInputEmail">Book Name</label>
                                    <input name="bookName" type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail">Author Name</label>
                                    <input name="bookAuthor" type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp">                                        
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail">Price</label>
                                    <input name="bookPrice" type="number" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp">                            
                                </div>
                                <div class="form-group">
                                    <label for="inputState">Book Category</label>
                                    <select id="inputState" name="bookCategory" class="form-control">
                                        <option selected>--select--</option>
                                        <option value="Old">Old Book</option>
                                    </select>                           
                                </div>
                                <div class="form-group">
                                    <label for="inputState">Book Status</label>
                                    <select id="inputState" name="bookStatus" class="form-control">
                                        <option selected>--select--</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>                                        
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Upload Photo</label>
                                    <input name="bookPhotoName" type="file" class="form-control-file" id="exampleFormControlFile1">
                                </div>
                                <input type="hidden" name="findRequest" value="userPage" />
                                <input type="hidden" name="userEmail" value="<%=user.getUserEmail()%>" />
                                <div class="text-center mt-4"> <button type="submit " class="btn btn-primary ">Add</button></div>
                            </form>
                        </div>
                    </div>
                </div>  
            </div>
        </div>
        <%@include file="../AllComponent/Footer.jsp" %>
    </body>
</html>
<%
    }
%>