<%--  PaymentPage.jsp  --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.ebook.Entity.*"%>
<%@page import="com.ebook.Helper.Message"%>

<%@page import="com.ebook.config.RazorpayConfig"%>
<%
    UserRegistration user = (UserRegistration) session.getAttribute("loginStudent");
    if (user == null) {
        response.sendRedirect("../Login.jsp");
        return;
    }

    List<AddToCardBookDetails> bookList7 = (List<AddToCardBookDetails>) session.getAttribute("bookList7");
    if (bookList7 == null || bookList7.isEmpty()) {
        session.setAttribute("mymessage", new Message("No Book Found – please add to cart first", "green", "fa-check"));
        response.sendRedirect("Home.jsp");
        return;
    }

    List<UserAddressSave> addressList2 = (List<UserAddressSave>) session.getAttribute("addressList2");
    if (addressList2 == null || addressList2.isEmpty()) {
        response.sendRedirect("UserAddressFill.jsp");
        return;
    }

    boolean isSingle = session.getAttribute("bookAddToCardId") != null;
    UserAddressSave address = addressList2.get(0);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Payment Page</title>
        <%@include file="../AllComponent/AllCSS.jsp" %>
        <script src="../AllComponent/messageautodelete.js" defer></script>
    </head>
    <body class="bg-light">

        <%@include file="Navbar.jsp" %>

        <% Message mymessage = (Message) session.getAttribute("mymessage");
        if (mymessage != null) {%>
        <div class="container mt-3">
            <div id="autoCloseAlert" class="alert text-white position-relative p-0 fade show" style="background-color:<%=mymessage.getColor()%>" role="alert">
                <div class="progress" style="height:4px;"><div id="alertProgress" class="progress-bar bg-warning" style="width:100%"></div></div>
                <div class="p-3"><i class="fa <%=mymessage.getIcon()%>"></i> <strong><%=mymessage.getContent()%></strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </div>
        <% }
        session.removeAttribute("mymessage"); %>

        <h3 class="text-center mt-4">Payment Page</h3>

        <div class="container mt-3">
            <div class="table-responsive">
                <table class="table table-hover align-middle text-center">
                    <thead class="table-primary text-white">
                        <tr>
                            <th>Book Photo</th>
                            <th>Book Name</th>
                            <th>Book Author</th>
                            <th>Total Quantity</th>
                            <th>Total Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            double totalamount = 0;
                            for (AddToCardBookDetails books : bookList7) {
                                totalamount = (totalamount + books.getBookTotalPrice());

                        %>
                        <tr>
                            <td><img src="../Books/<%= books.getBookPhotoName()%>" style="width:120px;height:140px" class="img-thumbnail"></td>
                            <td><%= books.getBookName()%></td>
                            <td><%= books.getBookAuthor()%></td>
                            <td><%= books.getBookQuantity()%></td>
                            <td><%= books.getBookTotalPrice()%></td>
                        </tr>

                        <% }%>
                        <tr  class="text-center" >
                            <td class="text-center" colspan="5">
                                <div>Payable Amount: <input type="number" readonly id="totalamount" value="<%=totalamount%>"></div>

                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="container mt-5">
            <h4 class="text-center text-primary">
                <%= isSingle ? "Please select payment method " : "Please select payment method "%>
            </h4>

            <form id="singlePayForm" action="<%= isSingle ? "../OrderConfirmSingleBookServlet" : "../OrderConfirmAllBooksServlet"%>" method="post" class="text-center mt-4">
                <div class="form-group mb-4">
                    <select id="paymentMethodforsinglebook" name="paymentMethod" class="form-control w-50 mx-auto" required>
                        <option value="" disabled selected>** Please select Payment Method **</option>
                        <option value="COD">Cash on Delivery</option>
                        <% if (isSingle) { %><option value="Online">Online</option><%
                        } else {
                        %>
                        <option value="Online">Online</option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <input type="hidden" name="userName" value="<%=address.getUserName()%>">
                <input type="hidden" name="userMobile" value="<%=address.getUserMobile()%>">
                <input type="hidden" name="userEmail" value="<%=address.getUserEmail()%>">
                <input type="hidden" name="userVilage" value="<%=address.getUserVilage()%>">
                <input type="hidden" name="userLandmark" value="<%=address.getUserLandmark()%>">
                <input type="hidden" name="userDistrict" value="<%=address.getUserDistrict()%>">
                <input type="hidden" name="userPincode" value="<%=address.getUserPincode()%>">
                <input type="hidden" name="userState" value="<%=address.getUserState()%>">
                <input type="hidden" name="userAddressId" value="<%=address.getUserAddressId()%>">
                <input type="hidden" name="personname" value="<%=user.getUserName()%>">
                <input type="hidden" name="sendtomail" value="<%=user.getUserEmail()%>">
                <% if (isSingle) {
                    AddToCardBookDetails books = bookList7.get(0);%>
                <input type="hidden" name="bookName" value="<%= books.getBookName()%>">
                <input type="hidden" name="bookAuthor" value="<%= books.getBookAuthor()%>">
                <input type="hidden" name="bookQuantity" value="<%= books.getBookQuantity()%>">
                <input type="hidden" name="bookTotalPrice" value="<%= books.getBookTotalPrice()%>">
                <input type="hidden" name="bookId" value="<%= books.getBookId()%>">
                <input type="hidden" name="bookPhotoName" value="<%= books.getBookPhotoName()%>">
                <input type="hidden" name="bookAddToCardId" value="<%= books.getBookAddToCardId()%>">
                <input type="hidden" name="registerId" value="<%=user.getRegisterId()%>"


                       <% } else {%>
                       <input type="hidden" name="loginedUserEmail" value="<%= user.getUserEmail()%>">

                <input type="hidden" name="registerId" value="<%=user.getRegisterId()%>"
                       <% } %>

                       <div class="d-flex justify-content-center gap-3 mt-3">
                    <button id="codforsinglebook" type="submit" class="btn btn-success d-none">Place Order</button>
                    <% if (isSingle) { %>
                    <button id="onlineforallbook" type="button" class="btn btn-success d-none" onclick="payNowSingleBook(event)">Pay Online</button>
                    <% } else {
                    %>
                    <button id="onlineforallbook" type="button" class="btn btn-success d-none" onclick="payNowAllBook(event)">Pay  Online</button>

                    <%
                        }
                    %>
                </div>
            </form>
        </div>
        <%@include file="../AllComponent/Footer.jsp" %>

        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script>
        $('#paymentMethodforsinglebook').on('change', function () {
            const val = $(this).val();
            $('#codforsinglebook').toggleClass('d-none', val !== 'COD');
            $('#onlineforallbook').toggleClass('d-none', val !== 'Online');
        });
        document.addEventListener('DOMContentLoaded', () => {
            if (typeof initAutoCloseAlert === 'function') {
                initAutoCloseAlert('autoCloseAlert', 'alertProgress', 4000);
            }
        });
        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

        <!--script for single book payment start-->
        <script>

        function payNowSingleBook(e) {
            e.preventDefault();

            const form = $('#singlePayForm')[0];
            const fd = new FormData(form);
            const payload = Object.fromEntries(fd.entries());
            const userName = payload.userName;
            const userEmail = payload.userEmail;
            const userMobile = payload.userMobile;
            const userVilage = payload.userVilage;
            const userLandmark = payload.userLandmark;
            const userDistrict = payload.userDistrict;
            const userPincode = payload.userPincode;
            const userState = payload.userState;
            const userAddressId = payload.userAddressId;
            const bookName = payload.bookName;
            const bookAuthor = payload.bookAuthor;
            const bookQuantity = payload.bookQuantity;
            const bookTotalPrice = parseInt(payload.bookTotalPrice.trim());
            ;
            const bookId = payload.bookId;
            const bookPhotoName = payload.bookPhotoName;
            const bookAddToCardId = payload.bookAddToCardId;
            const paymentMethod = payload.paymentMethod;
            const personname = "<%=user.getUserName()%>";
            const userEmail2 = "<%=user.getUserEmail()%>";
            const registerId =<%=user.getRegisterId()%>;
            const amount = parseInt(payload.bookTotalPrice.trim());

    //console.log(amount);
            if (!amount || isNaN(amount) || amount <= 0) {
                alert("❌ Please enter a valid amount");
                return;
            }

            $.ajax({
                url: "../CreateRazorpayOrderIdServlet",
                type: "POST",
                data: {
                    'amount': amount,

                    'userEmail2': userEmail2,
                    'registerId': registerId
                },
                success: function (data) {
                    // console.log("✅ Success block hit");
                    // console.log("📦 Order data:", data);
                    //console.log(typeof (data));
                    const obj = JSON.parse(data);
                    //  console.log(typeof (obj));
                    //  console.log(obj.id);
                    // console.log(obj.receipt);
                    // Razorpay Payment Popup Options
                    var options = {
                        "key": "rzp_test_aCjAfCTtmUPFNn", // ✔️ Replace with your Razorpay Key ID
                        "amount": obj.amount, // Amount in paise (e.g., 50000 = ₹500.00)
                        "currency": "INR",
                        "name": "eBook Store",
                        "order_id": obj.id, // ✅ Razorpay Order ID from backend
                        "description": "Test Transaction",
                        "image": "https://yourcdn.com/logo.png", // optional

                        "handler": function (response) {
                            // ✅ Payment Successful
                            //alert("✅ Payment Successful\nPayment ID: " + response.razorpay_payment_id);
                            //  console.log("Payment ID: ", response.razorpay_payment_id);
                            // console.log("Order ID: ", response.razorpay_order_id);      // ✅ will be present
                            // console.log("Signature: ", response.razorpay_signature);    // ✅ will be present
                            $.ajax({
                                url: "../OrderConfirmSingleBookServlet",
                                type: "POST",
                                data: {
                                    'userName': userName,
                                    'userEmail': userEmail,
                                    'userMobile': userMobile,
                                    'userVilage': userVilage,
                                    'userLandmark': userLandmark,
                                    'userDistrict': userDistrict,
                                    'userPincode': userPincode,
                                    'userState': userState,
                                    'userAddressId': userAddressId,
                                    'bookName': bookName,
                                    'bookAuthor': bookAuthor,
                                    'bookQuantity': bookQuantity,
                                    'bookTotalPrice': bookTotalPrice,
                                    'bookId': bookId,
                                    'bookPhotoName': bookPhotoName,
                                    'bookAddToCardId': bookAddToCardId,
                                    'paymentMethod': paymentMethod,
                                    'razorpaySignature': response.razorpay_signature,
                                    'razorpayPaymentId': response.razorpay_payment_id,
                                    'razorpayOrderId': response.razorpay_order_id,
                                    'registerId':<%=user.getRegisterId()%>,
                                    'receipt': obj.receipt,
                                    'personname': personname,
                                    'sendtomail': userEmail2
                                },
                                success: function (data) {
                                    // console.log(data);
                                    if (data === "success") {
                                        window.location.href = "Home.jsp";
                                    } else if (data === "error") {
                                        window.location.href = "Home.jsp";
                                    } else if (data === "paymentVerificationFailed") {
                                        window.location.href = "PaymentPage.jsp";
                                    } else if (data === "paymentupdatefail") {
                                        window.location.href = "PaymentPage.jsp";
                                    } else {
                                        alert("Hello user Something Went Wrong Please try Again");
                                    }
                                }
                            });
                        },
                        "prefill": {
                            "name": "Suraj Kumar",
                            "email": "suraj@example.com",
                            "contact": "9999999999"
                        },
                        "theme": {
                            "color": "#3399cc"
                        }
                    };

                    var rzp1 = new Razorpay(options);
                    rzp1.open();
                },
                error: function (xhr, status, error) {
                    // console.error("something went wrong",xhr.responseTest||error);

                    alert("Something went wrong please try again");
                }
            });
        }
        </script>

        <!--script for single book payment end-->
        <!--script for all book payment start-->
        <script>

            function payNowAllBook(e) {
                e.preventDefault();

                const form = $('#singlePayForm')[0];
                const fd = new FormData(form);
                const payload = Object.fromEntries(fd.entries());
                const userName = payload.userName;
                const userEmail = payload.userEmail;
                const userMobile = payload.userMobile;
                const userVilage = payload.userVilage;
                const userLandmark = payload.userLandmark;
                const userDistrict = payload.userDistrict;
                const userPincode = payload.userPincode;
                const userState = payload.userState;
                const userAddressId = payload.userAddressId;
                const paymentMethod = payload.paymentMethod;
                const personname = "<%=user.getUserName()%>";
                const userEmail2 = "<%=user.getUserEmail()%>";
                const registerId =<%=user.getRegisterId()%>;
                const amount = parseInt(document.getElementById("totalamount").value);

   //console.log(amount);
                if (!amount || isNaN(amount) || amount <= 0) {
                    alert("❌ Please enter a valid amount");
                    return;
                }

                $.ajax({
                    url: "../CreateRazorpayOrderIdServlet",
                    type: "POST",
                    data: {
                        'amount': amount,

                        'userEmail2': userEmail2,
                        'registerId': registerId
                    },
                    success: function (data) {
                        // console.log("✅ Success block hit");
                        // console.log("📦 Order data:", data);
                        //console.log(typeof (data));
                        const obj = JSON.parse(data);
                        //  console.log(typeof (obj));
                        // console.log(obj.id);
                        // console.log(obj.receipt);
                        // Razorpay Payment Popup Options
                        var options = {
                            "key": "rzp_test_aCjAfCTtmUPFNn", // ✔️ Replace with your Razorpay Key ID
                            "amount": obj.amount, // Amount in paise (e.g., 50000 = ₹500.00)
                            "currency": "INR",
                            "name": "eBook Store",
                            "order_id": obj.id, // ✅ Razorpay Order ID from backend
                            "description": "Test Transaction",
                            "image": "https://yourcdn.com/logo.png", // optional

                            "handler": function (response) {
                                // ✅ Payment Successful
                                // alert("✅ Payment Successful\nPayment ID: " + response.razorpay_payment_id);
                                // console.log("Payment ID: ", response.razorpay_payment_id);
                                // console.log("Order ID: ", response.razorpay_order_id);      // ✅ will be present
                                // console.log("Signature: ", response.razorpay_signature);    // ✅ will be present
                                $.ajax({
                                    url: "../OrderConfirmAllBooksServlet",
                                    type: "POST",
                                    data: {
                                        'userName': userName,
                                        'userEmail': userEmail,
                                        'userMobile': userMobile,
                                        'userVilage': userVilage,
                                        'userLandmark': userLandmark,
                                        'userDistrict': userDistrict,
                                        'userPincode': userPincode,
                                        'userState': userState,
                                        'userAddressId': userAddressId,
                                        'paymentMethod': paymentMethod,
                                        'razorpaySignature': response.razorpay_signature,
                                        'razorpayPaymentId': response.razorpay_payment_id,
                                        'razorpayOrderId': response.razorpay_order_id,
                                        'registerId':<%=user.getRegisterId()%>,
                                        'receipt': obj.receipt,
                                        'personname': personname,
                                        'sendtomail': userEmail2
                                    },
                                    success: function (data) {
                                        // console.log(data);
                                        if (data === "success") {
                                            window.location.href = "Home.jsp";
                                        } else if (data === "error") {
                                            window.location.href = "Home.jsp";
                                        } else if (data === "paymentVerificationFailed") {
                                            window.location.href = "PaymentPage.jsp";
                                        } else if (data === "paymentupdatefail") {
                                            window.location.href = "PaymentPage.jsp";
                                        } else {
                                            alert("Hello user Something Went Wrong Please try Again");
                                        }
                                    }
                                });
                            },
                            "prefill": {
                                "name": "Suraj Kumar",
                                "email": "suraj@example.com",
                                "contact": "9999999999"
                            },
                            "theme": {
                                "color": "#3399cc"
                            }
                        };

                        var rzp1 = new Razorpay(options);
                        rzp1.open();
                    },
                    error: function (xhr, status, error) {
                        //console.error("something went wrong",xhr.responseTest||error);

                        alert("Something went wrong please try again");
                    }
                });
            }
        </script>
        <!--script for all book payment end-->
    </body>
</html>
