<%-- 
    Document   : addBooks
    Created on : 11 Jun 2025, 11:22:54 pm
    Author     : suraj
--%>

<%@page import="com.ebook.Entity.BookDetails"%>
<%@page import="com.ebook.Helper.Message"%>
<%@page import="com.ebook.Entity.AdminRegistration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AdminRegistration admin6 = (AdminRegistration) session.getAttribute("loginAdmin");
    if (admin6 == null) {
        response.sendRedirect("../AdminLogin.jsp");
    } else {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../AllComponent/messageautodelete.js" type="text/javascript"></script>
        <script>
            // Call the function after page loads
            document.addEventListener('DOMContentLoaded', function () {
                initAutoCloseAlert("autoCloseAlert", "alertProgress", 4000);
            });
        </script>
        <%@include file="../AllComponent/AllCSS.jsp" %>
    </head>
    <body style="background-color: #f0f2f2">

        <%@include file="Navbar.jsp" %>

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
                                        <option value="New">New Book</option>
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
                                <%
                                    AdminRegistration admin = (AdminRegistration) session.getAttribute("loginAdmin");

                                    if (admin != null) {
                                        String userEmail = admin.getAdminEmail(); // yaha se specific email mil jayega
%>
                                <input type="hidden" name="userEmail" value="<%= userEmail%>" />
                                <%}

                                %> <input type="hidden" name="findRequest" value="adminPage" />

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

<%    }
%>