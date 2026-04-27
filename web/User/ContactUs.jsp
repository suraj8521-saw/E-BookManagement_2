<%-- 
    Document   : Login
    Created on : 4 Jun 2025, 11:24:45 pm
    Author     : suraj
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="com.ebook.Entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.Entity.UserRegistration"%>
<%@page import="com.ebook.Helper.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
UserRegistration user=(UserRegistration)session.getAttribute("loginStudent");
if(user==null){
response.sendRedirect("../Login.jsp");
    }else{
  //  session.removeAttribute("bookList");
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
             .navbar-custom {
            background: linear-gradient(to right, #4facfe, #43e97b);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

            .contact-form {
      background: #fff;
      max-width: 500px;
      margin: auto;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0,0,0,0.1);
    }

    .contact-form h2 {
      text-align: center;
      color: #333;
      margin-bottom: 20px;
    }

    .contact-form input,
    .contact-form textarea {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 16px;
    }

    .contact-form button {
      background-color: #28a745;
      color: white;
      padding: 12px;
      border: none;
      width: 100%;
      font-size: 18px;
      border-radius: 5px;
      cursor: pointer;
    }

    .contact-form button:hover {
      background-color: #218838;
    }
        </style>

        <%@include file="../AllComponent/AllCSS.jsp" %>
        
    </head>
    <body class="" style=" background-color:#f0f1f2" >
         <section>
            <!-- Top strip -->
            <div class="container-fluid " style="height: 10px; background-color: #303f9f;"></div>

            <!-- Branding + Search + Logout (Responsive Grid) -->
            <div class="container-fluid bg-light py-3">
                <div class="row align-items-center">
                    <div class="col-lg-2 col-md-12 text-success text-center text-lg-left mb-2 mb-lg-0">
                        <h3 class="m-0"><a href="Home.jsp" style="text-decoration: none " class="text-success"><i class="fas fa-book"></i> Ebooks</a></h3>
                    </div>
                    <div class="col-lg-5 col-md-12 mb-2 mb-lg-0">
                        <input id="search" class="form-control mr-2" type="search" placeholder="Search" aria-label="Search" hidden  oninput="handleSearch(this.value)">

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
                    <a class="navbar-brand" href="Home.jsp"><i class="fa-solid fa-house-chimney"></i></a>
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
                                <a class="nav-link" href="UserHomePageAllOldBooks.jsp" hidden><i class="fa-solid fa-book"></i> Old Book</a>
                            </li>
                        </ul>

                        <div class="d-flex flex-wrap gap-2">
                            <a class="btn btn-outline-light" href="LiveChat.jsp" ><i class="fa-solid fa-comments"></i> Live Chat</a>
                           <a class="btn btn-outline-light" href="UserProfileHome.jsp"><i class="fa-solid fa-gear"></i> Setting</a>
                            <a class="btn btn-outline-light" href="#" hidden><i class="fa-solid fa-headset"></i> Contact Us</a>

                            <a hidden class="btn btn-success" href="../CartSectionBookServletS?userEmail=<%=user.getUserEmail()%>"><i class="fa fa-cart-plus" aria-hidden="true"></i> Cart</a>
                            <a hidden class="btn btn-success" href="../UserOrderHistryServlet?userEmail=<%=user.getUserEmail()%>"><i class="fa fa-history" aria-hidden="true"></i> Orderes</a>



                        </div>
                    </div>
                </div>
            </nav>

        </section>

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


  <div class="container "  >
      <br>
            <h3 class="text-center">Contact Us</h3>
            <br>
            <div class=" row" >
               <div class="col-md-6 " >
                    <div class="card crd-ho" >
                        <div class="card-body text-center">
                            <h3> Hello <%=user.getUserName()%> </h3>
                            <strong><p>Thanks for Visiting Us</p>
                            <p>We are here to serve you 24*7 <i class="fa-solid fa-face-smile-beam"></i></p></strong> 
                            <div class="container text-center">
                                <div class=" col ">
                                     <br>
                                    <div  class="col-md-6 offset-3">
                                        <div class="card crd-ho">
                                            <div class="card-body text-center">
                                                
                                                <a href="https://mail.google.com/mail/?view=cm&fs=1&to=suraj71442@gmail.com&su=Feedback&body=Hello" target="_blank" style="text-decoration:none;"><img src="https://upload.wikimedia.org/wikipedia/commons/4/4e/Gmail_Icon.png" 
       alt="Gmail" 
       width="40" 
       style="background-color: white; border-radius: 8px; padding: 5px;">  write us Mail</a>

                                            </div>
                                        </div>
                                    </div>
                                     <br>
                                    <div  class="col-md-6 offset-3">
                                        <div class="card crd-ho">
                                            <div class="card-body text-center">
                                                <a href="https://wa.me/+916203697618/?text=Hello_I_need_some_help_please_hlp_me" target="_blank"style="text-decoration:none;"><i class="fab fa-whatsapp" style="font-size: 30px; color: white; background-color: #25D366; padding: 10px; border-radius: 50%;"></i> Contact on WhatsApp</a>
                                            </div>
                                        </div>
                                    </div>
                                     <br>
                                    <div  class="col-md-6 offset-3">
                                        <div class="card crd-ho">
                                            <div class="card-body text-center">
                                                <a href="tel:+919876543210" style="text-decoration:none;" > <i class="fa-solid fa-phone" style="font-size: 24px; color: white; background-color: #28a745; padding: 10px; border-radius: 50%;"></i> Call Us</a>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <strong ><p>Please leave us Message </p>
                                    <p>Our Staff will resolve </p>
                                    <p>Your Problem very Quickly <i class="fa-solid fa-child-reaching"></i></p></strong>  
                                    
                                </div>
                                
                            </div>
                        </div>
                        </div>
                    </div>
                <div class="col-md-6 " >
                    <div class="card crd-ho" >
                        <div class="card-body ">
                           <form class="contact-form" action="../UserContactUsServlet" method="post">
                               <strong class="text-center"> <h2>Contact Us</h2>
    
    <p>Or Fill Out This Form</p></strong>
<!--    <label for="email">Email</label>
    <input type="email" id="email" name="email" required placeholder="Enter your email">

    <label for="phone">Mobile Number</label>
    <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" maxlength="10" required placeholder="Enter 10-digit number">-->

    <label for="subject">Subject</label>
    <input type="text" id="subject" name="subject" required placeholder="Subject of your query">

    <label for="message">Your Query</label>
    <textarea id="message" name="content" rows="5" required placeholder="Type your message here..."></textarea>
    <input type="text" hidden value="<%=user.getUserEmail()%>" name="userEmail"></input>
    <input type="text" hidden value="<%=user.getUserMobile()%>" name="userMobile"></input>
    <input type="text" hidden value="<%=user.getUserName()%>" name="userName"></input>
    
    <input hidden type="text" value="<%=user.getUserPhotoName()%>" name="userPhotoName"></input>
    
    
    
    <button type="submit">Submit</button>
  </form>
                        </div>
                        </div>
                    </div>
                 </div>
            </div>
        </div>

        <%@include file="../AllComponent/Footer.jsp" %>
  
    </body>
</html>
<%
}
%>