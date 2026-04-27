<%@page import="com.ebook.Entity.UserOrderedBook"%>
<%@page import="com.ebook.Entity.UserRegistration"%>
<%@page import="com.ebook.Helper.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%
    UserRegistration user = (UserRegistration) session.getAttribute("loginStudent");
    if (user == null) {
        response.sendRedirect("../Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>User Order History</title>
        <%@include file="../AllComponent/AllCSS.jsp" %>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            .bg-custom {
                background-color: #303f9f;
            }

            .order-img {
                width: 100px;
                height: 120px;
                object-fit: cover;
                border-radius: 5px;
            }

            .table th, .table td {
                vertical-align: middle;
                text-align: center;
            }
        </style>
        <script src="../AllComponent/messageautodelete.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                initAutoCloseAlert("autoCloseAlert", "alertProgress", 4000);
            });
        </script>
    </head>
    <body style="background-color:#f0f1f2;">
        <%@include file="Navbar.jsp" %>
        <%    Message mymessage = (Message) session.getAttribute("mymessage");
            if (mymessage != null) {
        %>
        <div class="container mt-3">
            <div id="autoCloseAlert" class="alert alert-dismissible fade show text-white" role="alert" style="background-color: <%= mymessage.getColor()%>;">
                <div class="progress" style="height: 4px;">
                    <div class="progress-bar bg-warning" id="alertProgress" style="width: 100%;"></div>
                </div>
                <div class="d-flex justify-content-between align-items-center px-3 py-2">
                    <strong><i class="fa <%= mymessage.getIcon()%>"></i> <%= mymessage.getContent()%></strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </div>
        <%
                session.removeAttribute("mymessage");
            }
        %>
        <div class="container mt-4">
            <h3 class="text-center mb-4 text-primary">📚 My Order History</h3>
            <div class="mb-3">
                <input id="search" class="form-control" type="text" placeholder="🔍 Search by Book or Author" oninput="handleSearch(this.value)">
            </div>
            <section id="homepagedata">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover shadow-sm bg-white">
                        <thead class="table-primary">
                            <tr>
                                <th>Book Detail</th>
                                <th>Image</th>

                                <th>Quantity</th>
                                <th>Total Price</th>
                                <th>Payment</th>
                                <th>Ordered On</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<UserOrderedBook> bookList8 = (List<UserOrderedBook>) session.getAttribute("bookList8");
                                if (bookList8 != null && !bookList8.isEmpty()) {
                                    for (UserOrderedBook book : bookList8) {
                            %>
                            <tr>
                                <td>
                                    <p ><span style="font-weight: bold">Name: </span><%= book.getBookName()%></p>
                                    <p><span style="font-weight: bold">Author: </span><%= book.getBookAuthor()%></p>
                                </td>
                                <td><img src="../Books/<%= book.getOrderedBookPhotoName()%>" class="order-img" alt="book"></td>

                                <td><%= book.getOrderedBookQuantity()%></td>
                                <td>₹ <%= book.getOrderedBookTotalPrice()%></td>
                                <td><p><%= book.getPaymentMethod()%></p>
                                    <p><span style="font-weight: bold">Receipt: </span><%=book.getReceipt()%></p></td>
                                <td><%= book.getOrderedDate()%></td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="7" class="text-center text-danger">No orders found.</td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </section>
            <section id="result" style="display: none;"></section>
        </div>
        <%@include file="../AllComponent/Footer.jsp" %>
        <script>
            function handleSearch(searchKey) {
                if (searchKey.trim() !== "") {
                    document.getElementById("homepagedata").style.display = "none";
                    document.getElementById("result").style.display = "block";
                    $.ajax({
                        data: {
                            'searchKey': searchKey,
                            'userEmail': "<%= user.getUserEmail()%>"
                        },
                        type: 'POST',
                        url: "SearchOrderHistry.jsp",
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
