<%-- 
    Document   : LiveChat
    Created on : 30 Jun 2025, 8:54:25 pm
    Author     : suraj
--%>

<%@page import="com.ebook.Entity.LiveChat"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.Helper.ConnectionProvider"%>
<%@page import="com.ebook.DataOperation.LiveChatDataOperation"%>
<%@page import="com.ebook.Helper.Message"%>
<%@page import="com.ebook.Entity.AdminRegistration"%>
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
        <title>JSP Page</title>
        <script src="../AllComponent/messageautodelete.js" type="text/javascript"></script>
        <script>
            // Call the function after page loads
            document.addEventListener('DOMContentLoaded', function () {
                initAutoCloseAlert("autoCloseAlert", "alertProgress", 4000);
            });
        </script>
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
                background-color: white;
            }

            /* Left user list */
            .user-list {
                width: 30%;
                background-color: #f1f1f1;
                overflow-y: auto;
                border-right: 1px solid #ccc;
                padding: 1rem;
            }

            .user-list h3 {
                margin-bottom: 1rem;
                text-align: center;
                color: #333;
            }

            .user-item {
                padding: 10px 15px;
                margin-bottom: 8px;
                background-color: #fff;
                border-radius: 8px;
                cursor: pointer;
                transition: background 0.3s;
                border: 1px solid #ddd;
            }

            .user-item:hover,
            .user-item.active {
                background-color: #d2e3fc;
            }

            /* Right chat section */
            .chat-section {
                width: 70%;
                display: flex;
                flex-direction: column;
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

                .user-list,
                .chat-section {
                    width: 100%;
                    height: auto;
                }

                .chat-messages {
                    max-height: 300px;
                }
            }
        </style>

        <style>
            .card-hover:hover{
                transform: scale(1.1);
            }
        </style>
        <%@include file="../AllComponent/AllCSS.jsp" %>
    </head>
    <body>
        <%@include file="Navbar.jsp" %>
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

        <div class="admin-chat-container">
            <div class="user-list">
                <h3>Users</h3>
                <%
                    LiveChatDataOperation userData = new LiveChatDataOperation(ConnectionProvider.getConnection());
                    List<LiveChat> userList = userData.GetAllUserList();

                    if (userList != null && !userList.isEmpty()) {

                        for (LiveChat user : userList) {
                %>

                <div class="user-item" onclick="loadMessages(<%=user.getRegisterId()%>)">User ID:- <%=user.getRegisterId()%></div>
                <%

                    }
                } else {
                %>
                <div class="user-item" >No user Found</div>
                <%
                    }
                %>
            </div>


            <div class="chat-section">
                <%--
                <%
                List<LiveChat> bookList11 = (List<LiveChat>) session.getAttribute("chatlist2");
              
                   if (bookList11 != null && !bookList11.isEmpty()) {
                      
                     int i=0;
                          for (LiveChat book5 : bookList11) {
                          if(i==1){
                          break;
                    }
                    
                          i++;
                    
                %>
              <div class="chat-header">Chat with <span id="chatWithUser"><%=book5.getRegisterId()%></span></div>
              <%
                  }
          }

    %>
                --%>
                <div class="chat-header">Chat with <span id="chatWithUser"></span></div>
                <div class="chat-messages" id="chatMessages">
                    <!--        <section id="homepagedata">
                          <div class="message user-ms"></div>
                          
                         
                          <div class="message admin-ms" id="adminMessag"  >
                              
                          </div>
                           </section>-->
                    <section id="result">
                        <%--
                     <%
                         List<LiveChat> bookList10 = (List<LiveChat>) session.getAttribute("chatlist2");
                 
                      if (bookList10 != null && !bookList10.isEmpty()) {
                         
                        
                             for (LiveChat book5 : bookList10) {
                        
                     if(book5.getSenderRole().equals("USER")){
                      
                      %>
                     <div class="message user-msg" id="userMessage"><%=book5.getMessage()%></div>
                     <%
                         }else{
             %>
                     <div class="message admin-msg" id="adminMessage"  ><%=book5.getMessage()%> </div>
                     <%
             }
                     }
             }%>--%>
                        <div class="message user-msg" id="userMessage"></div>
                        <div class="message admin-msg" id="adminMessage"  > </div>
                    </section>
                </div>
                <div class="chat-input">
                    <input type="text" id="adminMsgInput" placeholder="Type your message...">
                    <button onclick="sendAdminMessage()">Send</button>
                </div>
            </div>


        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
               function sendAdminMessage() {

                   const msg = document.getElementById('adminMsgInput').value.trim();
                   const sender = "ADMIN";
                   const registerId = document.getElementById('chatWithUser').innerHTML;
     //  console.log(registerId);
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

                                   document.getElementById('adminMsgInput').value = "";
                               } else if (data.trim() === 'error') {
                                   alert("nahi gaya ");
                               }
                           });
               }
        </script>
        <script>
            let socket; // globally declare so we can reuse or close if needed

            function loadMessages(registerId2) {
                if (!registerId2)
                    return;
                {
                    document.getElementById('chatWithUser').innerText = registerId2;

                    $.ajax({
                        data: {'registerId': registerId2},
                        type: 'POST',
                        url: "../AdminShowUserChatServlet",
                        success: function (data) {
                            // Safely parse if it's a string
                            let messages = (typeof data === "string") ? JSON.parse(data) : data;

                            const chatBox = document.getElementById("chatMessages");
                            chatBox.innerHTML = "";
                            setupWebSocket(registerId2);
                            messages.forEach(m => {
                                const div = document.createElement("div");
                                div.className = "message " + (m.role === "ADMIN" ? "admin-msg" : "user-msg");
                                div.textContent = m.text;
                                chatBox.appendChild(div);
                            });
                        }
                        ,

                        error: function () {
                            alert("Failed to load chat.");
                        }
                    });
                }
            }

            function setupWebSocket(uid) {
                if (socket)
                    socket.close(); // close previous if any

                socket = new WebSocket("ws://localhost:8080/E-BookManagement/wsreceiver?registerId=" + uid);

                socket.onmessage = function (event) {
                    const msg = JSON.parse(event.data);
                    const msgBox = document.createElement("div");
                    msgBox.textContent = msg.message;
                    msgBox.className = "message " + (msg.senderRole === "USER" ? "user-msg" : "admin-msg");
                    document.getElementById("chatMessages").appendChild(msgBox);
                };

                socket.onerror = function (e) {
                    console.error("WebSocket error", e);
                };
            }

        </script>
    </body>
</html>
<%}%>