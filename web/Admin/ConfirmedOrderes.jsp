<%-- 
    Document   : Login
    Created on : 4 Jun 2025, 11:24:45 pm
    Author     : suraj
--%>

<%@page import="com.ebook.Entity.AdminOrderConfirm"%>
<%@page import="com.ebook.Entity.UserOrderedBook"%>
<%@page import="java.util.List"%>
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
    </head>
    <body style=" background-color:#f0f1f2" >


        <!-- Top Blue Strip -->
        <div class="container-fluid" style="height: 10px; background-color: #303f9f"></div>

        <!-- Upper Section -->
        <div class="container-fluid p-3 bg-light">
            <div class="row align-items-center">
                <div class="col-md-3 text-success">
                    <h3><i class="fas fa-book"></i> Ebooks</h3>
                </div>
                <div class="col-md-6">
                    <form class="d-flex" role="search">
                        <input type="hidden"class="form-control me-2" id="searchBox" type="text" placeholder="Search by Name, Email, Book..." autofocus>

                    </form>
                </div>

                <div class="col-md-3 text-end">
                    <a href="../AdminLogoutServlet" class="btn btn-success">
                        <i class="fa-solid fa-right-to-bracket"></i> Logout
                    </a>
                </div>
            </div>
        </div>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-custom">
            <div class="container-fluid">
                <a class="navbar-brand" href="Home.jsp">
                    <i class="fa-solid fa-house-chimney"></i>
                </a>
                <button class="navbar-toggler" type="button" 
                        data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" 
                        aria-controls="navbarSupportedContent" aria-expanded="false" 
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="Home.jsp">Home</a>
                        </li>
                        <li class="nav-item">  <a class="nav-link active" href="../DisplayOrderdProductAdminServlet" style="text-decoration: none"> Pending Orders</a></li>
                        <!-- Add more nav items here if needed -->
                    </ul>
                </div>
            </div>
        </nav>


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


        <div class="container mt-4">
            <h3 class="text-center mb-4 text-primary">📚 Order Confirmed Orders</h3>

            <div class="mb-3 px-5">
                <input id="search" class="form-control" type="text" placeholder="🔍 Search Order ........." oninput="handleSearch(this.value)">
            </div>

            <section id="homepagedata">

                <table class="table table-hover">
                    <thead >
                        <tr>
                            <th class="bg-primary text-white text-center" scope="col">Confirm Id</th>
                            <th class="bg-primary text-white text-center" scope="col">Book Details</th>
                            <th class="bg-primary text-white text-center" scope="col">Order Details</th>
                            <th class="bg-primary text-white text-center" scope="col">User Information</th>

                            <th class="bg-primary text-white text-center" scope="col">User Address</th>

                            <th class="bg-primary text-white text-center" scope="col">Ordered Date</th>
                            <th class="bg-primary text-white text-center" scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            List<AdminOrderConfirm> bookList10 = (List<AdminOrderConfirm>) session.getAttribute("bookList10");

                            if (bookList10 != null && !bookList10.isEmpty()) {

                                for (AdminOrderConfirm book7 : bookList10) {


                        %>
                        <tr style="border: 5px solid skyblue; ">
                            <td class="text-start"><%=book7.getConfirmedId()%></td>
                            <td class="text-start">
                                <p>Book Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book7.getBookId()%></p>
                                <p>Book Name&nbsp;&nbsp;:-&nbsp;<%=book7.getBookName()%></p>
                                <p>Book Author:-&nbsp;<%=book7.getBookAuthor()%></p>
                                <p>Book Photo&nbsp;:-&nbsp;<img src="../Books/<%= book7.getBookPhotoName()%>" alt="alt" style="width: 120px;height: 150px" class="img-thumblin"/></p>
                            </td>
                            <td class="text-start">
                                <p>Total Quantity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book7.getBookQuantity()%></p>
                                <p>Total Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book7.getTotalPrice()%></p>
                                <p>Payment Method:-&nbsp;<%=book7.getPaymentMethod()%></p>
                                <p>Receipt:-&nbsp;<%=book7.getReceipt()%></p>

                            </td>
                            <td class="text-start">
                                <p>Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book7.getUserName()%></p>
                                <p>Mobile No:-&nbsp;<%=book7.getUserMobile()%></p> 
                                <p>Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book7.getUserEmail()%></p>
                            </td>
                            <td class="text-start">
                                <p>Village&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book7.getUserVillage()%></p>
                                <p>Landmark:-&nbsp;<%=book7.getUserLandmark()%></p>
                                <p>District&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book7.getUserDistrict()%></p>
                                <p>Pin Code&nbsp;&nbsp;:-&nbsp;<%=book7.getUserPincode()%></p>
                                <p>State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book7.getUserState()%></p>
                            </td>
                            <td class="text-start">

                                <p> User Ordered&nbsp;&nbsp;:-&nbsp;<%=book7.getOrderedDate()%></p>
                                <p> Order Confirm&nbsp;&nbsp;:-&nbsp;<%=book7.getOrderConfirmedDate()%></p>
                            </td>

                            <td class="text-start">Status&nbsp;&nbsp;:-&nbsp;<%=book7.getOrderStatus()%></td>

                        </tr>
                        <%

                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="8">No Confirmed Order</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </section>
            <section id="result" style="display: none;">


            </section>

        </div>

        <%@include file="../AllComponent/Footer.jsp" %>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
            function handleSearch(searchKey) {
                if (searchKey.trim() !== "") {
                    document.getElementById("homepagedata").style.display = "none";
                    document.getElementById("result").style.display = "block";
                    $.ajax({
                        data: {
                            'searchKey': searchKey

                        },
                        type: 'POST',
                        url: "SearchingConfirmedOrders.jsp",
                        success: function (data) {
                            $('#result').html(data);
                        },
                        error: function () {
                            $('#result').html('<p class="text-danger">Something went wrong.</p>');
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