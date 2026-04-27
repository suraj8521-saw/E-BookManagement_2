<%-- 
    Document   : Login
    Created on : 4 Jun 2025, 11:24:45 pm
    Author     : suraj
--%>

<%@page import="com.ebook.Helper.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <script src="AllComponent/messageautodelete.js" type="text/javascript"></script>
<script>
    // Call the function after page loads
    document.addEventListener('DOMContentLoaded', function () {
        initAutoCloseAlert("autoCloseAlert", "alertProgress", 4000);
    });
</script>
        <%@include file="AllComponent/AllCSS.jsp" %>
        
    </head>
    <body style=" background-color:#f0f1f2" >
        <%@include file="AllComponent/Navbar.jsp" %>
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
        <div class="container " style="height: 530px">
            <div class="row  ">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-3" >
                        <div class="card-body  ">
                            <h3 class="text-center">Login</h3>
                            <form action="AdminLoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="required" name="adminEmail">
                                       </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required="required" name="adminPassword">
                                </div>
                                <div class="text-center">
                                    <br>
                                     <button type="submit" class="btn btn-primary text-white"><i class="fa fa-user-circle" aria-hidden="true"></i> Admin Login</button> 
                                </div>
                                <div class="text-center">   
                                    
                                    <br>
<!--                                  <a href="adminRegister.jsp" class="btn btn-primary text-white"><i class="fa-solid fa-user-plus"></i> Register admin</a>
                                  -->
                                </div>
                            </form>
                        </div>
                    </div>   
                </div>
            </div>
        </div>
        <%@include file="AllComponent/Footer.jsp" %>
    </body>
</html>
