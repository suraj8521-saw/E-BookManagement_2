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
    //session.removeAttribute("bookList2");
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
    .profile-pic {
      width: 150px;
      height: 150px;
      object-fit: cover;
      border-radius: 50%;
      border: 2px solid #ccc;
    }
    .file-input {
      display: none;
    }
    .upload-btn {
      cursor: pointer;
      color: #0d6efd;
      text-decoration: underline;
    }
  </style>
 <style>
        .bg-custom {
           background: linear-gradient(to right, #4facfe, #43e97b);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar .nav-item:hover .nav-link {
           color: #212121 !important;
            background-color: white;
            border-radius: 15px;
        }
    </style>
        <%@include file="../AllComponent/AllCSS.jsp" %>
        
    </head>
    <body style=" background-color:#f0f1f2" >  
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
            <form class="d-flex justify-content-center justify-content-lg-start" hidden>
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
                                <a class="nav-link" href="UserHomePageAllOldBooks.jsp" hidden><i class="fa-solid fa-book"></i> Old Book</a>
                            </li>
                        </ul>

            <div class="d-flex flex-wrap gap-2">
                <a class="btn btn-outline-light" href="UserProfileHome.jsp"><i class="fa-solid fa-gear"></i> Setting</a>
                <a class="btn btn-outline-light" href="ContactUs.jsp" hidden><i class="fa-solid fa-headset"></i> Contact Us</a>
             
                <a class="btn btn-success" href="../CartSectionBookServletS?userEmail=<%=user.getUserEmail()%>"><i class="fa fa-cart-plus" aria-hidden="true"></i> Cart</a>
                <a class="btn btn-success" href="../UserOrderHistryServlet?userEmail=<%=user.getUserEmail()%>" hidden><i class="fa fa-history" aria-hidden="true"></i> Orderes</a>
                
                
               
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
       
      

         
             <div class="container mt-5">
  <h3 class="text-center mb-4">Edit Profile</h3>
  <div class="row justify-content-center">
    <div class="col-md-4 card">
      <form action="../UserProfileUpdateServlet" method="post" enctype="multipart/form-data">
        <div class="text-center mb-3">
          <img src="../Books/<%=user.getUserPhotoName()%>" id="profilePreview" class="profile-pic mb-2" alt="No Photo">
          
          <input type="hidden"  name="oldUserPhotoName" value="<%=user.getUserPhotoName()%>">
          <br>
          <label for="profilePic" class="upload-btn">Change Profile Photo</label>
          <input type="file" id="profilePic" class="file-input" name="userPhotoName" accept="image/*">
          
          
        </div>

        <div class="mb-3">
          <label for="name" class="form-label">Full Name</label>
          <input type="text" class="form-control" name="userName" id="userName" placeholder="Enter full name"value="<%=user.getUserName()%>" required>
        </div>

        <div class="mb-3">
          <label for="email" class="form-label">Email Address</label>
          <input type="email" class="form-control" name="userEmail" id="userEmail" placeholder="Enter email" value="<%=user.getUserEmail()%>" readonly>
        </div>

        <div class="mb-3">
          <label for="phone" class="form-label">Phone Number</label>
          <input type="tel" class="form-control" name="userMobile" id="userMobile" placeholder="Enter phone number" value="<%=user.getUserMobile()%>" required  minlength="10" maxlength="10"
       pattern="[0-9]{10}" title="Phone number must be 10 digits only">
        </div>

        <div class="mb-3">
          <label for="password" class="form-label">Enter Password </label>
          <input type="password" class="form-control"  name="userPassword"id="userPassword" placeholder="Enter new password" required>
        </div>
 <input type="hidden"  name="userOldPassward" value="<%=user.getUserPassword()%>">
 <input type="hidden"  name="registerId" value="<%=user.getRegisterId()%>">
        <div class="d-grid col-md-6 offset-3">
          <button type="submit" class="btn btn-primary">Update Profile</button>
        </div>
      </form>
    </div>
  </div>
</div>

             
             
        <!<!-- end new book -->
        <%@include file="../AllComponent/Footer.jsp" %>
        <script>
  const profileInput = document.getElementById('profilePic');
  const previewImage = document.getElementById('profilePreview');

  profileInput.addEventListener('change', function () {
    const file = this.files[0];
    if (file) {
      previewImage.src = URL.createObjectURL(file);
    }
  });
</script>
    </body>
</html>
<%
}
%>