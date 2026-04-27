<%-- 
    Document   : Login
    Created on : 4 Jun 2025, 11:24:45 pm
    Author     : suraj
--%>

<%@page import="com.ebook.Entity.AdminRegistration"%>
<%@page import="com.ebook.Helper.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AdminRegistration admin = (AdminRegistration) session.getAttribute("loginAdmin");
    if (admin == null) {
        response.sendRedirect("../AdminLogin.jsp");
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
            .card-hover:hover{
                transform: scale(1.1);
            }
        </style>

        <%@include file="../AllComponent/AllCSS.jsp" %>
        <style type="text/css">
            a{
                text-decoration: none;
                color: black;
            }
            a:hover{
                text-decoration: none;
                color: black;
            }

        </style>
    </head>
    <body style=" background-color:#f0f1f2" >
        <section >
            <%@include file="Navbar.jsp" %>
            <div class="container body">
                <div class="row p-5">
                    <div class="col-md-2 card-hover">
                        <a href="addBooks.jsp" style="text-decoration: none"><div class="card">
                                <div class="card-body text-center">
                                    <i class="fas fa-plus-square fa-3x text-primary" ></i>
                                    <h4>Add Books</h4>
                                    ----------
                                    <br>
                                </div>
                            </div> </a>   
                    </div>
                    <div class="col-md-2 card-hover">

                        <%
                            AdminRegistration admin2 = (AdminRegistration) session.getAttribute("loginAdmin");

                            if (admin != null) {
                                String userEmail = admin2.getAdminEmail(); // yaha se specific email mil jayega
%>

                        <a href="../AllBookDisplayServlet?userEmail=<%= userEmail%>&findRequest=adminPage" style="text-decoration: none"> 
                            <%}

                            %><div class="card">
                                <div class="card-body text-center">
                                    <i class="fas fa-book-open fa-3x text-danger"></i>
                                    <h4>All Books</h4>
                                    ----------
                                    <br>
                                </div>
                            </div></a>    
                    </div>
                    <div class="col-md-3 card-hover">
                        <a href="../DisplayOrderdProductAdminServlet" style="text-decoration: none"><div class="card">
                                <div class="card-body text-center">
                                    <i class="fas fa-box-open fa-3x text-warning"></i>
                                    <h4>Pending Orders</h4>
                                    ----------
                                    <br>
                                </div>
                            </div>  </a>  
                    </div>
                    <div class="col-md-3 card-hover">
                        <a href="../DisplayAdminConfirmedOrderServlet" style="text-decoration: none"><div class="card">
                                <div class="card-body text-center">
                                    <i class="fas fa-box-open fa-3x text-warning"></i>
                                    <h4>Confirmed Orders</h4>
                                    ----------
                                    <br>
                                </div>
                            </div>  </a>  
                    </div>
                    <div class="col-md-2 card-hover">
                        <a href="../AdminLogoutServlet" style="text-decoration: none"><div class="card">
                                <div class="card-body text-center">
                                    <i class="fas fa-sign-out-alt fa-3x text-primary"></i>
                                    <h4>Logout</h4>
                                    ----------
                                    <br>
                                </div>
                            </div> </a>   
                    </div>
                </div>

            </div>

            <%           Message mymessage = (Message) session.getAttribute("mymessage");
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

            <div style="margin-top: 280px" >
                <%@include file="../AllComponent/Footer.jsp" %>
            </div> 
        </section>
    </body>
</html>
<%
    }
%>