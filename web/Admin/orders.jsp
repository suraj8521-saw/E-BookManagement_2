<%-- 
    Document   : Orders
    Created on : 4 Jun 2025, 11:24:45 pm
    Author     : suraj
--%>

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
                        <input type="hidden" class="form-control me-2" id="searchBox" type="text" placeholder="Search by Name, Email, Book..." autofocus>

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
                        <li class="nav-item"><a  class="nav-link active" href="../DisplayAdminConfirmedOrderServlet" style="text-decoration: none">Confirmed Orders</a></li>
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
            <h3 class="text-center mb-4 text-primary">📚 Order Pending Orders</h3>

            <div class="mb-3 px-5">
                <input id="search" class="form-control" type="text" placeholder="🔍 Search Order ........." oninput="handleSearch(this.value)">
            </div>
            <section id="homepagedata">

                <table class="table table-hover">
                    <thead >
                        <tr>
                            <th class="bg-primary text-white text-center" scope="col">Book Details</th>
                            <th class="bg-primary text-white text-center" scope="col">Order Details</th>
                            <th class="bg-primary text-white text-center" scope="col">User Information</th>

                            <th class="bg-primary text-white text-center" scope="col">User Address</th>

                            <th class="bg-primary text-white text-center" scope="col">Ordered Date</th>
                            <th class="bg-primary text-white text-center" scope="col">Order Status</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            List<UserOrderedBook> bookList9 = (List<UserOrderedBook>) session.getAttribute("bookList9");

                            if (bookList9 != null && !bookList9.isEmpty()) {

                                for (UserOrderedBook book6 : bookList9) {


                        %>
                        <tr style="border: 5px solid skyblue; ">
                            <td class="text-start">
                                <p>Book Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book6.getBookId()%></p>
                                <p>Book Name&nbsp;&nbsp;:-&nbsp;<%=book6.getBookName()%></p>
                                <p>Book Author:-&nbsp;<%=book6.getBookAuthor()%></p>
                                <p>Book Photo&nbsp;:-&nbsp;<img src="../Books/<%= book6.getOrderedBookPhotoName()%>" alt="alt" style="width: 120px;height: 150px" class="img-thumblin"/></p>
                            </td>
                            <td class="text-start">
                                <p>Total Quantity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book6.getOrderedBookQuantity()%></p>
                                <p>Total Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book6.getOrderedBookTotalPrice()%></p>
                                <p>Payment Method:-&nbsp;<%=book6.getPaymentMethod()%></p>
                                <p>Receipt:-&nbsp;<%=book6.getReceipt()%></p>
                            </td>
                            <td class="text-start">
                                <p>Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book6.getOrderedUserName()%></p>
                                <p>Mobile No:-&nbsp;<%=book6.getOrderedUserMobileNo()%></p> 
                                <p>Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book6.getOrderedUserEmail()%></p>
                            </td>
                            <td class="text-start">
                                <p>Village&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book6.getOrderedUserVilage()%></p>
                                <p>Landmark:-&nbsp;<%=book6.getOrderedUserLandmark()%></p>
                                <p>District&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book6.getOrderedUserDistrict()%></p>
                                <p>Pin Code&nbsp;&nbsp;:-&nbsp;<%=book6.getOrderedUserPincode()%></p>
                                <p>State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book6.getOrderedUserState()%></p>
                            </td>
                            <td class="text-start">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=book6.getOrderedDate()%></td>



                            <td class="text-center">

                                <form action="../AdminOrderConfirmedServlet" method="post">

                                    <input type="hidden" name="bookId" value="<%=book6.getBookId()%>"></input>
                                    <input type="hidden" name="bookName" value="<%=book6.getBookName()%>"></input>
                                    <input type="hidden" name="bookAuthor" value="<%=book6.getBookAuthor()%>"></input>
                                    <input type="hidden" name="bookPhotoName" value="<%= book6.getOrderedBookPhotoName()%>"></input>
                                    <input type="hidden" name="bookQuantity" value="<%=book6.getOrderedBookQuantity()%>"></input>
                                    <input type="hidden" name="totalPrice" value="<%=book6.getOrderedBookTotalPrice()%>"></input>
                                    <input type="hidden" name="paymentMethod" value="<%=book6.getPaymentMethod()%>"></input>
                                    <input type="hidden" name="userName" value="<%=book6.getOrderedUserName()%>"></input>
                                    <input type="hidden"  name="userMobile" value="<%=book6.getOrderedUserMobileNo()%>"></input>
                                    <input type="hidden" name="userEmail" value="<%=book6.getOrderedUserEmail()%>"></input>
                                    <input type="hidden" name="userVillage" value="<%=book6.getOrderedUserVilage()%>"></input>
                                    <input type="hidden" name="userLandmark" value="<%=book6.getOrderedUserLandmark()%>"></input>
                                    <input type="hidden" name="userDistrict" value="<%=book6.getOrderedUserDistrict()%>"></input>
                                    <input type="hidden" name="userPincode" value="<%=book6.getOrderedUserPincode()%>"></input>
                                    <input type="hidden" name="userState" value="<%=book6.getOrderedUserState()%>"></input>
                                    <input type="hidden" name="orderedDate" value="<%=book6.getOrderedDate()%>"></input>
                                    <input type="hidden" name="bookOrderedId" value="<%=book6.getBookOrderedId()%>"></input>
                                    <input type="hidden" name="receipt" value="<%=book6.getReceipt()%>"></input>
                                    <button class="btn btn-success" type="submit"><i class="fa fa-check-square" aria-hidden="true"></i> Confirm Order</button></td>

                            </form>



                        </tr>
                        <%

                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="8">No books found.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>

            </section>
            <section id="result" style="display: none;"></section>
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
                        url: "SearchingPendingOrders.jsp",
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