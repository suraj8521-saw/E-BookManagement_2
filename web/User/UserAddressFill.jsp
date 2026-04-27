<%-- 
    Document   : Login
    Created on : 4 Jun 2025, 11:24:45 pm
    Author     : suraj
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="com.ebook.Entity.BookDetails"%>
<%@page import="com.ebook.Entity.UserAddressSave"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.Entity.UserRegistration"%>
<%@page import="com.ebook.Helper.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
UserRegistration user=(UserRegistration)session.getAttribute("loginStudent");
if(user==null){
response.sendRedirect("../Login.jsp");
    }else{
    
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

        <%@include file="../AllComponent/AllCSS.jsp" %>
        
    </head>
    
        <%@include file="Navbar.jsp" %>
        
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
<br>

<%
    String bookAddToCardId = request.getParameter("bookAddToCardId");
    if (bookAddToCardId != null) {
        int bookAddToCardId2 = Integer.parseInt(bookAddToCardId);  // Agar int me chahiye to
%>
       <div class="text-center">
    <a class="btn btn-success" href="../DisplayUserSavedAddressServlet?userEmail=<%=user.getUserEmail()%>&bookAddToCardId=<%=bookAddToCardId2%>">
        Select Saved Address
    </a>
</div>
    <br>
<div class="text-center">OR</div>
 <div class="container mt-5">
    <div class="card shadow-lg rounded">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Add a New Address</h4>
        </div>
        <div class="card-body">
            <form action="../UserAddressSaveServlets" method="post" >
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="userName" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="userName" name="userName" required />
                    </div>
                    <div class="col-md-6">
                        <label for="userMobile" class="form-label">Mobile No</label>
                        <input type="tel" class="form-control" id="userMobile" name="userMobile" pattern="[0-9]{10}" required />
                    </div>
                </div>
                <div class="mb-3">
                    <label for="userVilage" class="form-label">Village</label>
                    <input type="text" class="form-control" id="userVilage" name="userVilage" required />
                </div>
                <div class="mb-3">
                    <label for="userLandmark" class="form-label">Landmark</label>
                    <input type="text" class="form-control" id="userLandmark" name="userLandmark" required />
                </div>
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label for="userDistrict" class="form-label">District</label>
                        <input type="text" class="form-control" id="userDistrict" name="userDistrict" required />
                    </div>
                    <div class="col-md-4">
                        <label for="userPincode" class="form-label">Pincode</label>
                        <input type="text" class="form-control" id="userPincode" name="userPincode" pattern="[0-9]{6}" required />
                    </div>
                    <div class="col-md-4">
                        <label for="userState" class="form-label">State</label>
                        <input type="text" class="form-control" id="userState" name="userState" required />
                    </div>
                    
                </div>
                <div>
                    <input type="hidden" value="<%=user.getUserEmail()%>" name="userEmail"></input>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-success px-4">Submit</button>
                    <button type="reset" class="btn btn-secondary ms-2">Clear</button>
                </div>
            </form>
        </div>
    </div>
</div>
        
        
        <%@include file="../AllComponent/Footer.jsp" %>
<%
    } else if(bookAddToCardId == null) {
session.removeAttribute("bookAddToCardId");
%>
<div class="text-center">
    <a class="btn btn-success" href="../DisplayUserSavedAddressServlet?userEmail=<%=user.getUserEmail()%>">
        Select Saved Address
    </a>
</div>
    <br>
<div class="text-center">OR</div>
 <div class="container mt-5">
    <div class="card shadow-lg rounded">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Add a New Address</h4>
        </div>
        <div class="card-body">
            <form action="../UserAddressSaveServlets" method="post" >
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="userName" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="userName" name="userName" required />
                    </div>
                    <div class="col-md-6">
                        <label for="userMobile" class="form-label">Mobile No</label>
                        <input type="tel" class="form-control" id="userMobile" name="userMobile" pattern="[0-9]{10}" required />
                    </div>
                </div>
                <div class="mb-3">
                    <label for="userVilage" class="form-label">Village</label>
                    <input type="text" class="form-control" id="userVilage" name="userVilage" required />
                </div>
                <div class="mb-3">
                    <label for="userLandmark" class="form-label">Landmark</label>
                    <input type="text" class="form-control" id="userLandmark" name="userLandmark" required />
                </div>
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label for="userDistrict" class="form-label">District</label>
                        <input type="text" class="form-control" id="userDistrict" name="userDistrict" required />
                    </div>
                    <div class="col-md-4">
                        <label for="userPincode" class="form-label">Pincode</label>
                        <input type="text" class="form-control" id="userPincode" name="userPincode" pattern="[0-9]{6}" required />
                    </div>
                    <div class="col-md-4">
                        <label for="userState" class="form-label">State</label>
                        <input type="text" class="form-control" id="userState" name="userState" required />
                    </div>
                    
                </div>
                <div>
                    <input type="hidden" value="<%=user.getUserEmail()%>" name="userEmail"></input>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-success px-4">Submit</button>
                    <button type="reset" class="btn btn-secondary ms-2">Clear</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%
    }
else{
response.sendRedirect("AddToCardBook.jsp");
}
%>





    
    
</html>
<%
}
%>