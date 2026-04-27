<%-- 
    Document   : ShowChatOfUser
    Created on : 1 Jul 2025, 12:22:50 am
    Author     : suraj
--%>

<%@page import="com.ebook.Entity.LiveChat"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.Helper.ConnectionProvider"%>
<%@page import="com.ebook.DataOperation.LiveChatDataOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

         <%
        int registerId=(Integer.valueOf(request.getParameter("registerId")));
        LiveChatDataOperation chatData=new LiveChatDataOperation(ConnectionProvider.getConnection());
        List<LiveChat> chatlist=chatData.chatListByRegisterId(registerId);
         if (chatlist != null && !chatlist.isEmpty()) {
            
           
                for (LiveChat book5 : chatlist) {
           
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
}%>
    
          

