<%-- 
    Document   : SearchingConfirmedOrders
    Created on : 30 Jun 2025, 12:26:02 pm
    Author     : suraj
--%>

<%@page import="com.ebook.DataOperation.AdminOrderConfirmedDataOperation"%>
<%@page import="com.ebook.Helper.ConnectionProvider"%>
<%@page import="com.ebook.Entity.AdminRegistration"%>
<%@page import="com.ebook.Entity.AdminOrderConfirm"%>
<%@page import="com.ebook.Entity.UserOrderedBook"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
AdminRegistration admin=(AdminRegistration)session.getAttribute("loginAdmin");
if(admin==null){
response.sendRedirect("../AdminLogin.jsp");
    }else{
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
<table class="table table-hover">
  <thead >
    <tr>
        <th class="bg-primary text-white text-center" scope="col">Confirm Id</th>
      <th class="bg-primary text-white text-center" scope="col">Book Details</th>
      <th class="bg-primary text-white text-center" scope="col">Order Details</th>
      <th class="bg-primary text-white text-center" scope="col">User Information</th>
   
      <th class="bg-primary text-white text-center" scope="col">User Address</th>
      
          <th class="bg-primary text-white text-center" scope="col">Ordered Date</th>
          <th class="bg-primary text-white text-center" scope="col">Status</th>
            </tr>
  </thead>
  <tbody>
      
         <%
              
           String searchKey = request.getParameter("searchKey");
           AdminOrderConfirmedDataOperation confirmData=new AdminOrderConfirmedDataOperation(ConnectionProvider.getConnection());
 
          
            List<AdminOrderConfirm> bookList11 = confirmData.getAllConfirmedOrderBySearchKeyAndEmail(searchKey);
          
            if (bookList11 != null && !bookList11.isEmpty()) {
            
           
                for (AdminOrderConfirm book8 : bookList11) {
                    
                  
        %>
        <tr style="border: 5px solid skyblue; ">
            <td class="text-start"><%=book8.getConfirmedId()%></td>
        <td class="text-start">
            <p>Book Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book8.getBookId()%></p>
            <p>Book Name&nbsp;&nbsp;:-&nbsp;<%=book8.getBookName()%></p>
            <p>Book Author:-&nbsp;<%=book8.getBookAuthor()%></p>
            <p>Book Photo&nbsp;:-&nbsp;<img src="../Books/<%= book8.getBookPhotoName()%>" alt="alt" style="width: 120px;height: 150px" class="img-thumblin"/></p>
        </td>
        <td class="text-start">
            <p>Total Quantity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book8.getBookQuantity()%></p>
            <p>Total Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book8.getTotalPrice()%></p>
            <p>Payment Method:-&nbsp;<%=book8.getPaymentMethod()%></p>
            <p>Receipt:-&nbsp;<%=book8.getReceipt()%></p>
            
        </td>
      <td class="text-start">
          <p>Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book8.getUserName()%></p>
          <p>Mobile No:-&nbsp;<%=book8.getUserMobile()%></p> 
          <p>Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book8.getUserEmail()%></p>
      </td>
      <td class="text-start">
          <p>Village&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book8.getUserVillage()%></p>
          <p>Landmark:-&nbsp;<%=book8.getUserLandmark()%></p>
          <p>District&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book8.getUserDistrict()%></p>
          <p>Pin Code&nbsp;&nbsp;:-&nbsp;<%=book8.getUserPincode()%></p>
          <p>State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book8.getUserState()%></p>
      </td>
      <td class="text-start">
          
          <p> User Ordered&nbsp;&nbsp;:-&nbsp;<%=book8.getOrderedDate()%></p>
     <p> Order Confirm&nbsp;&nbsp;:-&nbsp;<%=book8.getOrderConfirmedDate()%></p>
      </td>
      
      <td class="text-start">Status&nbsp;&nbsp;:-&nbsp;<%=book8.getOrderStatus()%></td>
      
        </tr>
    <%
                          
}
            } else {
        %>
        <tr>
            <td colspan="8">No Confirmed Order</td>
        </tr>
        <%
            }
        %>
   </tbody>
</table>
    </body>
</html>
<%}%>