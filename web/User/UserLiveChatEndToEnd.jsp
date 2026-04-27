<%-- 
    Document   : LiveChat
    Created on : 30 Jun 2025, 6:32:37 pm
    Author     : suraj
--%>

<%@page import="com.ebook.DataOperation.LiveChatDataOperation"%>
<%@page import="com.ebook.Helper.ConnectionProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.Entity.LiveChat"%>
<%@page import="com.ebook.Helper.Message"%>
<%@page import="com.ebook.Entity.UserRegistration"%>
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
        <title>JSP Page</title>
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
        <style>
            * {
                box-sizing: border-box;
            }

            body {
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(to right, #4facfe, #00f2fe);
                min-height: 100vh;
            }

            .admin-chat-container {
                display: flex;
                max-width: 1000px;
                margin: 3rem auto;
                height: 80vh;
                border-radius: 12px;
                box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
                overflow: hidden;
                background: linear-gradient(to right, #4facfe, #00f2fe);
            }

            /* Right chat section */
            .chat-section {
                width: 80%;
                display: flex;
                flex-direction: column;
                margin-left: 10%;
            }

            .chat-header {
                background-color: #303f9f;
                color: white;
                padding: 1rem;
                text-align: center;
                font-weight: bold;
                font-size: 1.2rem;
            }

            .chat-messages {
                flex: 1;
                padding: 1rem;
                overflow-y: auto;
                background-color: #f9f9f9;
            }

            .message {
                margin-bottom: 10px;
                padding: 10px 15px;
                border-radius: 8px;
                max-width: 70%;
                clear: both;
            }

            .admin-msg {
                background-color: #c8e6c9;
                margin-left: auto;
                text-align: right;
            }

            .user-msg {
                background-color: #e3f2fd;
                margin-right: auto;
                text-align: left;
            }

            .chat-input {
                display: flex;
                padding: 0.8rem;
                border-top: 1px solid #ccc;
                background-color: white;
            }

            .chat-input input[type="text"] {
                flex: 1;
                padding: 10px;
                font-size: 1rem;
                border: 1px solid #aaa;
                border-radius: 6px;
            }

            .chat-input button {
                margin-left: 0.5rem;
                padding: 10px 16px;
                border: none;
                background-color: #4facfe;
                color: white;
                border-radius: 6px;
                cursor: pointer;
                font-weight: bold;
                transition: background 0.3s ease;
            }

            .chat-input button:hover {
                background-color: #00c6ff;
            }

            /* Mobile Responsive */
            @media (max-width: 768px) {
                .admin-chat-container {
                    flex-direction: column;
                    height: auto;
                }


                .chat-section {
                    width: 80%;
                    height: auto;
                }

                .chat-messages {
                    max-height: 300px;
                }
            }
        </style>

        <script>
            // Call the function after page loads
            document.addEventListener('DOMContentLoaded', function () {
                initAutoCloseAlert("autoCloseAlert", "alertProgress", 4000);
            });
        </script>

        <script src="../AllComponent/messageautodelete.js" type="text/javascript"></script>
        <%@include file="../AllComponent/AllCSS.jsp" %>
    </head>
    <body style=" background-color:#f0f1f2">
        <section>
            <!-- Top strip -->
            <div class="container-fluid" style="height: 10px; background-color: #303f9f;"></div>

            <!-- Branding + Search + Logout (Responsive Grid) -->
            <div class="container-fluid bg-light py-3">
                <div class="row align-items-center">
                    <div class="col-lg-2 col-md-12 text-success text-center text-lg-left mb-2 mb-lg-0">
                        <h3 class="m-0"><a href="Home.jsp" style="text-decoration: none " class="text-success"><i class="fas fa-book"></i> Ebooks</a></h3>
                    </div>
                    <div class="col-lg-5 col-md-12 mb-2 mb-lg-0">
                        <form class="d-flex justify-content-center justify-content-lg-start">
                            <input class="form-control mr-2" type="search" placeholder="Search" aria-label="Search" hidden>
                            <button class="btn btn-outline-primary" type="submit" hidden>Search</button>
                        </form>
                    </div>
                    <div class="col-lg-5 col-md-12 text-center text-lg-right " >
                        <a href="UserProfileHome.jsp" class="btn btn-primary"  style="text-decoration: none"><i class="fa fa-user" aria-hidden="true"></i> <%=user.getUserName()%> </a>
                        <a href="../UserLogoutServlet" class="btn btn-success ">
                            <i class="fa-solid fa-right-to-bracket"></i> Logout
                        </a>
                    </div>
                </div>
            </div>

            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-dark bg-custom">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#"><i class="fa-solid fa-house-chimney"></i></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse mt-2 mt-lg-0" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item active">
                                <a class="nav-link active" href="Home.jsp">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="UserHomePageAllRecentBooks.jsp" hidden><i class="fa-solid fa-book-open"></i> Recent Book</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="UserHomePageAllNewtBooks.jsp" hidden><i class="fa-solid fa-book"></i> New Book</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="UserHomePageAllOldBooks.jsp"hidden><i class="fa-solid fa-book"></i> Old Book</a>
                            </li>
                        </ul>

                        <div class="d-flex flex-wrap gap-2">
                            <a class="btn btn-outline-light" href="UserProfileHome.jsp"><i class="fa-solid fa-gear"></i> Setting</a>
                            <a class="btn btn-outline-light" href="ContactUs.jsp"><i class="fa-solid fa-headset"></i> Contact Us</a>

                            <a class="btn btn-success" href="../CartSectionBookServletS?userEmail=<%=user.getUserEmail()%>" hidden><i class="fa fa-cart-plus" aria-hidden="true"></i> Cart</a>
                            <a class="btn btn-success" href="../UserOrderHistryServlet?userEmail=<%=user.getUserEmail()%>" hidden><i class="fa fa-history" aria-hidden="true"></i> Orderes</a>
                        </div>
                    </div>
                </div>
            </nav>
        </section>
        <section>
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
        </section>
        <div class="admin-chat-container ">
            <div class="chat-section">
                <div class="chat-header">Ask Your Query <span id="chatWithUser"></span></div>

                <div class="chat-messages" id="chatMessages">
                    <section id="homepagedata">
                        <%
                            int registerId = user.getRegisterId();
                            LiveChatDataOperation chatData = new LiveChatDataOperation(ConnectionProvider.getConnection());
                            List<LiveChat> chatlist = chatData.chatListByRegisterId(registerId);
                            if (chatlist != null && !chatlist.isEmpty()) {

                                for (LiveChat book5 : chatlist) {

                                    if (book5.getSenderRole().equals("ADMIN")) {

                        %>

                        <div class="message user-msg" id="userMessage"><%=book5.getMessage()%></div>
                        <%
                        } else {
                        %>
                        <div class="message admin-msg" id="adminMessage"  ><%=book5.getMessage()%> </div>

                        <%
                                    }
                                }
                            }%>
                    </section >
                    <section id="result">
                    </section>
                </div>
                <div class="chat-input">
                    <input type="text" id="adminMsgInput" placeholder="Type your message...">
                    <button onclick="sendAdminMessage()">Send</button>
                </div>
            </div>
        </div>
        <script>
            function sendAdminMessage() {
                const msg = document.getElementById('adminMsgInput').value.trim();
                const registerId =<%=user.getRegisterId()%>;
                const sender = "USER";
                if (msg.length === 0)
                    return;

                fetch('../LiveChatWebSocketServlets', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: 'message=' + encodeURIComponent(msg) +
                            '&senderRole=' + encodeURIComponent(sender) +
                            '&registerId=' + encodeURIComponent(registerId)
                })
                        .then(response => response.text())
                        .then(data => {
                            if (data.trim() === 'success') {
//     const div=document.createElement('div');
//     div.textContent= +msg;
//     document.getElementById('messages').appendChild(div);
//     document.getElementById('msgInput').value="";
                                document.getElementById('adminMsgInput').value = "";
//     loadMessages(registerId);

                            } else if (data.trim() === 'error') {
                                alert("nahi gaya ");
                            }
                        });
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <%-- code start to rec values from websocket and pushing them in div at real time--%>
        <script>

                            const uid = "<%= user.getRegisterId()%>";  // user ya admin ka reg ID
                            const socket = new WebSocket("ws://localhost:8080/E-BookManagement/wsreceiver?registerId=" + uid);

                            socket.onmessage = function (event) {
                                const msg = JSON.parse(event.data);

                                // Check role and display in correct section
                                const msgBox = document.createElement("div");
                                msgBox.textContent = msg.message;
                                if (msg.senderRole === "ADMIN") {
                                    msgBox.className = "message user-msg";
                                } else {
                                    msgBox.className = "message admin-msg";
                                }
                                document.getElementById("chatMessages").appendChild(msgBox);
                            };

        </script>
    </body>
</html>

<%}%>