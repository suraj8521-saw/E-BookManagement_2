<%-- 
    Document   : AddToCard
    Created on : 4 Jun 2025, 11:24:45 pm
    Author     : suraj
--%>
<%@page import="com.ebook.Entity.AddToCardBookDetails"%>
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
                background-color: #303f9f;
            }

            .navbar .nav-item:hover .nav-link {
                background-color: white;
                color: #303f9f;
                border-radius: 15px;
            }
        </style>
        <script>
            function calcprice(inputElement, price) {
                price = parseFloat(price); // ensure it's number
                let quantity = parseInt(inputElement.value);
                if (isNaN(quantity) || quantity < 1)
                    quantity = 1;

                const row = inputElement.closest("tr");
                const priceCell = row.querySelector(".totalprice");

                if (priceCell) {
                    priceCell.innerText = (price * quantity).toFixed(2) + "₹ ";
                }
            }
        </script>
        <script>
            function sendQuantityUpdate(bookId, bookQuantity, bookTotalPrice, userEmail) {

                const xhr = new XMLHttpRequest();
                xhr.open("POST", "../AddToCardDetailsUpdateServlet", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                const params = new URLSearchParams();
                params.append("bookId", bookId);
                params.append("bookQuantity", bookQuantity);
                params.append("bookTotalPrice", bookTotalPrice);
                params.append("userEmail", userEmail);

                xhr.onreadystatechange = () => {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        console.log("Server Response:", xhr.responseText);
                    }
                };

                xhr.send(params.toString());
            }

            function quantityinc(buttonElement, bookId, userEmail) {
                const row = buttonElement.closest("tr");
                const quantityInput = row.querySelector(".quantityhandle");
                let quantity = parseInt(quantityInput.value);
                quantityInput.value = quantity + 1;

                //alert(bookId);
                //alert(userEmail);
                // Optional: update total price after increment
                const price = parseFloat(row.querySelector("td:nth-child(6)").innerText);
                calcprice(quantityInput, price);
                const price2 = parseFloat(row.querySelector("td:nth-child(7)").innerText);

                sendQuantityUpdate(bookId, quantityInput.value, price2, userEmail);
            }

            function quantitydec(buttonElement, bookId, userEmail) {
                const row = buttonElement.closest("tr");
                const quantityInput = row.querySelector(".quantityhandle");
                let quantity = parseInt(quantityInput.value);

                if (quantity <= 1) {
                    alert("Quantity can't be less than 1");
                    quantityInput.value = 1;

                } else {
                    quantityInput.value = quantity - 1;
                    const price = parseFloat(row.querySelector("td:nth-child(6)").innerText);
                    calcprice(quantityInput, price);
                    const price2 = parseFloat(row.querySelector("td:nth-child(7)").innerText);
                    sendQuantityUpdate(bookId, quantityInput.value, price2, userEmail);
                }

                // Optional: update total price after decrement

            }

        </script>
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
        <%@include file="../AllComponent/AllCSS.jsp" %>
    </head>
    <body style=" background-color:#f0f1f2" >
        <%@include file="Navbar.jsp" %>

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
        <div class="table-responsive">
            <table class="table table-bordered table-hover shadow-sm bg-white">
                <thead  class="table-primary" >
                    <tr>
                        <th >Order Id</th>
                        <th >Book Image</th>
                        <th >Book Name</th>
                        <th >Author</th>
                        <th>Quantity</th>
                        <th >Price</th>
                        <th >Total Price</th>
                        <th >Added Date</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<AddToCardBookDetails> bookList6 = (List<AddToCardBookDetails>) session.getAttribute("bookList6");

                        if (bookList6 != null && !bookList6.isEmpty()) {
                            int n = 0;
                            for (AddToCardBookDetails book : bookList6) {
                                String encodedPhoto = URLEncoder.encode(book.getBookPhotoName(), "UTF-8");
                                n++;
                    %>
                    <tr>
                        <td class="text-center"><%=n%></td>
                        <td class="text-center"><img src="../Books/<%= book.getBookPhotoName()%>" style="height:60px; width:60px;" /></td>
                        <td class="text-center"><%=book.getBookName()%></td>
                        <td class="text-center"><%=book.getBookAuthor()%></td>
                        <td class="text-center">
                            <button class=" btn btn-success" onclick="quantitydec(this,<%=book.getBookAddToCardId()%>, '<%=book.getUserEmail()%>')"><i class="fa fa-minus " aria-hidden="true"></i></button>
                            <input  class="quantityhandle text-center"  type="number" value="<%=book.getBookQuantity()%>" min="1" onchange="calcprice(this, <%= book.getBookPrice()%>)" oninput="calcprice(this, <%= book.getBookPrice()%>)" disabled style="width: 30%"/>

                            <button class=" btn btn-success " onclick="quantityinc(this,<%=book.getBookAddToCardId()%>, '<%=book.getUserEmail()%>')"><i class="fa fa-plus" aria-hidden="true"></i></button>
                        </td>
                        <td  class="text-center"> <%= book.getBookPrice() + "₹ "%> </td>
                        <td class="totalprice text-center"> <%=book.getBookTotalPrice() + "₹ "%></td>
                        <td class="text-center"><%=book.getAddToCardDate()%></td>
                        <td class="text-center"> <a class="btn btn-success" href="UserAddressFill.jsp?bookAddToCardId=<%=book.getBookAddToCardId()%>"><i class="fa fa-shopping-cart" aria-hidden="true"></i>Order This</a>
                            <a class="btn btn-danger" href="../RemoveBookByAddToCardAervlet?bookAddToCardId=<%=book.getBookAddToCardId()%>"><i class="fa fa-trash" aria-hidden="true"></i> Remove</a></td>
                    </tr>
                    <%
                        }
                    } else {
                        response.sendRedirect("Home.jsp");
                        String content = "No Book Found Please Add to cart Before Order ";
                        String color = "green";
                        String icon = "fa-check";
                        HttpSession Sesssion = request.getSession();

                        Message mymessage2 = new Message(content, color, icon);
                        Sesssion.setAttribute("mymessage", mymessage2);
                    %>
                    <tr>
                        <td colspan="8">No books found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <div>
            <div class="text-center">
                <a class="btn btn-success" href="UserAddressFill.jsp"><i class="fa fa-shopping-cart" aria-hidden="true" ></i>Order All Books</a>
            </div>
        </div>    
        <div style="margin-top: 350px"> <%@include file="../AllComponent/Footer.jsp" %></div>
    </body>
</html>
<%
    }
%>