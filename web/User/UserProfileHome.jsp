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
        <title>User Dashboard</title>
        <script src="../AllComponent/messageautodelete.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                initAutoCloseAlert("autoCloseAlert", "alertProgress", 4000);
            });
        </script>
        <style>
            .bg-custom {
              background: linear-gradient(to right, #4facfe, #43e97b);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }



            .card {
                transition: 0.3s ease-in-out;
            }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            }

            .profile-pic {
                border-radius: 50%;
                height: 100px;
                width: 100px;
                object-fit: cover;
                border: 3px solid #303f9f;
            }
        </style>
        <%@include file="../AllComponent/AllCSS.jsp" %>
    </head>
    <body style="background-color: #f0f1f2">




        <%@include file="Navbar.jsp" %>
        <!-- Flash message -->
        <%        Message mymessage = (Message) session.getAttribute("mymessage");
            if (mymessage != null) {
        %>
        <div class="row mt-3">
            <div class="col-md-4 offset-md-4">
                <div id="autoCloseAlert" class="alert alert-dismissible fade show text-white p-0" role="alert" style="background-color: <%= mymessage.getColor()%>">
                    <div class="progress" style="height: 5px;">
                        <div class="progress-bar bg-warning" id="alertProgress" style="width: 100%;"></div>
                    </div>
                    <div class="p-3">
                        <strong><i class="fa <%= mymessage.getIcon()%>"></i> <%= mymessage.getContent()%></strong>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </div>
            </div>
        </div>
        <%
                session.removeAttribute("mymessage");
            }
        %>

        <!-- User greeting -->
        <div class="text-center my-4">
            <% if ("noPhoto".equals(user.getUserPhotoName())) { %>
            <i class="fa-solid fa-user-circle fa-4x text-primary"></i>
            <% } else {%>
            <img src="../Books/<%= user.getUserPhotoName()%>" class="profile-pic mb-2" alt="User Photo">
            <% }%>
            <h4 class="mt-3">Hello, <%= user.getUserName().toUpperCase()%></h4>
        </div>

        <!-- Dashboard cards -->
        <div class="container pb-5">
            <div class="row g-4">
                <div class="col-md-4">
                    <a href="UserOldBookSell.jsp" class="text-decoration-none">
                        <div class="card shadow-sm border-0">
                            <div class="card-body text-center">
                                <i class="fas fa-plus-square fa-3x text-primary mb-2"></i>
                                <h5>Sell Old Book</h5>
                                <p class="text-muted small">Add your books to marketplace</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="../AllBookDisplayServlet?userEmail=<%= user.getUserEmail()%>&findRequest=userPage" class="text-decoration-none">
                        <div class="card shadow-sm border-0">
                            <div class="card-body text-center">
                                <i class="fa fa-book fa-3x text-primary mb-2"></i>
                                <h5>Listed Old Books</h5>
                                <p class="text-muted small">View your active listings</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="UserProfileEdit.jsp" class="text-decoration-none">
                        <div class="card shadow-sm border-0">
                            <div class="card-body text-center">
                                <i class="fa fa-edit fa-3x text-primary mb-2"></i>
                                <h5>Edit Profile</h5>
                                <p class="text-muted small">Update personal information</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="../UserOrderHistryServlet?userEmail=<%= user.getUserEmail()%>" class="text-decoration-none">
                        <div class="card shadow-sm border-0">
                            <div class="card-body text-center">
                                <i class="fas fa-box-open fa-3x text-warning mb-2"></i>
                                <h5>Order History</h5>
                                <p class="text-muted small">Track your previous orders</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="ContactUs.jsp" class="text-decoration-none">
                        <div class="card shadow-sm border-0">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-phone-volume fa-3x text-primary mb-2"></i>
                                <h5>Help Center</h5>
                                <p class="text-muted small">24/7 Support available</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="../UserLogoutServlet" class="text-decoration-none">
                        <div class="card shadow-sm border-0">
                            <div class="card-body text-center">
                                <i class="fas fa-sign-out-alt fa-3x text-primary mb-2"></i>
                                <h5>Logout</h5>
                                <p class="text-muted small">See you soon, <%= user.getUserName()%>!</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <%@include file="../AllComponent/Footer.jsp" %>
    </body>
</html>
<% }%>
