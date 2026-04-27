<%-- 
    Document   : SearchingPendingOrders
    Created on : 30 Jun 2025, 12:25:32 pm
    Author     : suraj
--%>

<%@page import="com.ebook.Entity.UserOrderedBook"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.DataOperation.UserOredredSaveDataOperation"%>
<%@page import="com.ebook.Helper.ConnectionProvider"%>
<%@page import="com.ebook.Entity.AdminRegistration"%>
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
      <th class="bg-primary text-white text-center" scope="col">Book Details</th>
      <th class="bg-primary text-white text-center" scope="col">Order Details</th>
      <th class="bg-primary text-white text-center" scope="col">User Information</th>
   
      <th class="bg-primary text-white text-center" scope="col">User Address</th>
      
          <th class="bg-primary text-white text-center" scope="col">Ordered Date</th>
            <th class="bg-primary text-white text-center" scope="col">Order Status</th>
    </tr>
  </thead>
  <tbody>
      
         <%
               String searchKey = request.getParameter("searchKey");
               
          UserOredredSaveDataOperation dataData=new UserOredredSaveDataOperation(ConnectionProvider.getConnection());
          
            List<UserOrderedBook> bookListforAdminpendin = dataData.getAllBooksBySearchKey(searchKey);
            
            
           
          
            if (bookListforAdminpendin != null && !bookListforAdminpendin.isEmpty()) {
            
           
                for (UserOrderedBook book6 : bookListforAdminpendin) {
                    
                  
        %>
        <tr style="border: 5px solid skyblue; ">
        <td class="text-start">
            <p>Book Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book6.getBookId()%></p>
            <p>Book Name&nbsp;&nbsp;:-&nbsp;<%=book6.getBookName()%></p>
            <p>Book Author:-&nbsp;<%=book6.getBookAuthor()%></p>
            <p>Book Photo&nbsp;:-&nbsp;<img src="../Books/<%= book6.getOrderedBookPhotoName()%>" alt="alt" style="width: 120px;height: 150px" class="img-thumblin"/></p>
        </td>
        <td class="text-start">
            <p>Total Quantity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book6.getOrderedBookQuantity()%></p>
            <p>Total Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book6.getOrderedBookTotalPrice()%></p>
            <p>Payment Method:-&nbsp;<%=book6.getPaymentMethod()%></p>
            <p>Receipt:-&nbsp;<%=book6.getReceipt()%></p>
        </td>
      <td class="text-start">
          <p>Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book6.getOrderedUserName()%></p>
          <p>Mobile No:-&nbsp;<%=book6.getOrderedUserMobileNo()%></p> 
          <p>Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book6.getOrderedUserEmail()%></p>
      </td>
      <td class="text-start">
          <p>Village&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book6.getOrderedUserVilage()%></p>
          <p>Landmark:-&nbsp;<%=book6.getOrderedUserLandmark()%></p>
          <p>District&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book6.getOrderedUserDistrict()%></p>
          <p>Pin Code&nbsp;&nbsp;:-&nbsp;<%=book6.getOrderedUserPincode()%></p>
          <p>State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:-&nbsp;<%=book6.getOrderedUserState()%></p>
      </td>
      <td class="text-start">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=book6.getOrderedDate()%></td>
     
      
    
      <td class="text-center">
          
          <form action="../AdminOrderConfirmedServlet" method="post">
              
              <input type="hidden" name="bookId" value="<%=book6.getBookId()%>"></input>
              <input type="hidden" name="bookName" value="<%=book6.getBookName()%>"></input>
              <input type="hidden" name="bookAuthor" value="<%=book6.getBookAuthor()%>"></input>
              <input type="hidden" name="bookPhotoName" value="<%= book6.getOrderedBookPhotoName()%>"></input>
              <input type="hidden" name="bookQuantity" value="<%=book6.getOrderedBookQuantity()%>"></input>
              <input type="hidden" name="totalPrice" value="<%=book6.getOrderedBookTotalPrice()%>"></input>
              <input type="hidden" name="paymentMethod" value="<%=book6.getPaymentMethod()%>"></input>
              <input type="hidden" name="userName" value="<%=book6.getOrderedUserName()%>"></input>
              <input type="hidden"  name="userMobile" value="<%=book6.getOrderedUserMobileNo()%>"></input>
              <input type="hidden" name="userEmail" value="<%=book6.getOrderedUserEmail()%>"></input>
              <input type="hidden" name="userVillage" value="<%=book6.getOrderedUserVilage()%>"></input>
              <input type="hidden" name="userLandmark" value="<%=book6.getOrderedUserLandmark()%>"></input>
              <input type="hidden" name="userDistrict" value="<%=book6.getOrderedUserDistrict()%>"></input>
              <input type="hidden" name="userPincode" value="<%=book6.getOrderedUserPincode()%>"></input>
              <input type="hidden" name="userState" value="<%=book6.getOrderedUserState()%>"></input>
              <input type="hidden" name="orderedDate" value="<%=book6.getOrderedDate()%>"></input>
              <input type="hidden" name="bookOrderedId" value="<%=book6.getBookOrderedId()%>"></input>
               <input type="hidden" name="receipt" value="<%=book6.getReceipt()%>"></input>
              <button class="btn btn-success" type="submit"><i class="fa fa-check-square" aria-hidden="true"></i> Confirm Order</button></td>
 
          </form>
          
          
         
    </tr>
    <%
                          
}
            } else {
        %>
        <tr>
            <td colspan="8">No books found.</td>
        </tr>
        <%
            }
        %>
   </tbody>
</table>
    </body>
</html>
<%}%>