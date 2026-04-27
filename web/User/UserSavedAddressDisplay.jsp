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
     

        <%@include file="../AllComponent/AllCSS.jsp" %>
        
    </head>
    <body style=" background-color:#f0f1f2" >
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

<table class="table table-hover">
  <thead >
    <tr>
      <th class="bg-primary text-white text-center" scope="col">Full Name</th>
      <th class="bg-primary text-white text-center" scope="col">Mobile No</th>
      <th class="bg-primary text-white text-center" scope="col">Village</th>
      <th class="bg-primary text-white text-center" scope="col">Landmark</th>
      <th class="bg-primary text-white text-center" scope="col">District</th>
      <th class="bg-primary text-white text-center" scope="col">Pin code</th>
      <th class="bg-primary text-white text-center" scope="col">State</th>
      <th class="bg-primary text-white text-center" scope="col"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
        <%
            List<UserAddressSave> addressList = (List<UserAddressSave>) session.getAttribute("addressList");
            if (addressList != null && !addressList.isEmpty()) {
                for (UserAddressSave address : addressList) {
                    
        %>
     
      
         <%
    Integer bookAddToCardId = (Integer) session.getAttribute("bookAddToCardId");
    if (bookAddToCardId != null) {
%><td class="text-center"><%= address.getUserName()%></td>
      <td class="text-center"><%= address.getUserMobile()%></td>
      <td class="text-center"><%= address.getUserVilage()%></td>
      <td class="text-center"><%= address.getUserLandmark()%></td>
      <td class="text-center"><%= address.getUserDistrict()%></td>
      <td class="text-center"><%= address.getUserPincode()%></td>
      <td class="text-center"><%= address.getUserState()%></td>
      <td class="text-center">
      <a class="btn btn-success" href="../UserPaymentServlet?bookAddToCardId=<%=bookAddToCardId%>&userAddressId=<%= address.getUserAddressId()%>"> Select</a>
      </td>
    </tr>
<%
    }else if(bookAddToCardId==null){
session.removeAttribute("bookAddToCardId");
%>
<td class="text-center"><%= address.getUserName()%></td>
      <td class="text-center"><%= address.getUserMobile()%></td>
      <td class="text-center"><%= address.getUserVilage()%></td>
      <td class="text-center"><%= address.getUserLandmark()%></td>
      <td class="text-center"><%= address.getUserDistrict()%></td>
      <td class="text-center"><%= address.getUserPincode()%></td>
      <td class="text-center"><%= address.getUserState()%></td>
      <td class="text-center">
         
          
         
          <a id="userProfileHandle" class="btn btn-success" href="../UserPaymentServletForAllBook?userEmail=<%=user.getUserEmail()%>&userAddressId=<%= address.getUserAddressId()%>"> Select</a>
     
         
       </td>
    </tr>
    
  <%

}else{


response.sendRedirect("UserAddressFill.jsp");

}
%>

    <%
                }
            } else {
        %>
        <tr>
            <td colspan="8">No Saved Address Found Please Add A new Address</td>
        </tr>
        <%
            }
        %>
  </tbody>
</table>

        
        <%@include file="../AllComponent/Footer.jsp" %>
    </body>
</html>
<%
}
%>