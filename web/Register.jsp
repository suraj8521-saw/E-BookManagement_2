<%-- 
    Document   : Register
    Created on : 4 Jun 2025, 11:12:16 pm
    Author     : suraj
--%>
<%@page import="com.ebook.Helper.Message"%>
<%@page import="com.ebook.Helper.ConnectionProvider" %> 
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ebook.Servlets.UserRegistrationServlet" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <script src="AllComponent/messageautodelete.js" type="text/javascript"></script>
   
<script>
    // Call the function after page loads
    document.addEventListener('DOMContentLoaded', function () {
        initAutoCloseAlert("autoCloseAlert", "alertProgress", 4000);
    });
</script>

        <%@include file="AllComponent/AllCSS.jsp" %>
    </head>
    <body style="background-color: #f0f1f2">
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
        <div class="container p-2">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Registration Page</h4>
                            <form action="UserRegistrationServlet" method="post">
                                <div class="form-group">
                                    <label for="name">Enter Full Name</label>
                                    <input type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Full Name"  required name="userName">
                                     </div>
                                 <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"  required name="userEmail">
                                     </div>
                                 <div class="form-group">
                                    <label for="number">Phone Number</label>
                                    <input type="tel" class="form-control" id="number" aria-describedby="emailHelp" placeholder="Enter Phone Number"  required name="userMobile"   minlength="10" maxlength="10"
       pattern="[0-9]{10}" title="Phone number must be 10 digits only">
                                     </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password"   name="userPassword" required>
                                </div>
                                <div class="form-check">
                                    <br>
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check" style="background-color: #e6e600">
                                    <label class="form-check-label" for="exampleCheck1"> <strong> <a href="AllComponent/termandcondition.jsp" style="text-decoration: none">Agree terms & Condition</a></strong></label>
                                   
                                </div>
                                <div style="text-align: center">
                                    <button type="submit" class="btn btn-primary"  > <i class="fa-solid fa-user-plus"></i> Register</button>
                                </div>
                                
                               
                   
                            </form>
                             <br>
                                <div  style=" text-align: center">
                                    <a href="Login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                                </div>
                        </div>
                    </div>   
                </div>
            </div>
        </div>
        <%@include file="AllComponent/Footer.jsp" %>
        
    </body>
</html>
