<%-- 
    Document   : addBooks
    Created on : 11 Jun 2025, 11:22:54 pm
    Author     : suraj
--%>

<%@page import="java.util.List"%>
<%@page import="com.ebook.Entity.BookDetails"%>
<%@page import="com.ebook.Helper.Message"%>
<%@page import="com.ebook.Entity.AdminRegistration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   UserRegistration user = (UserRegistration) session.getAttribute("loginStudent");
    if (user == null) {
        response.sendRedirect("../Login.jsp");
    } else {
%>
<%
    String id = request.getParameter("bookId");
    if (id == null) {
        response.sendRedirect("UserDisplayAllListedBook.jsp");
    } else {
        int bookId = Integer.parseInt(id);
        List<BookDetails> list = (List<BookDetails>) session.getAttribute("bookList");
        for (BookDetails b : list) {
            if (b.getBookId() == bookId) {
                session.setAttribute("editBook", b);
                break;
            }
        }

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
        <%@include file="../AllComponent/AllCSS.jsp" %>
    </head>
    <body style="background-color: #f0f2f2">

        <%@include file="Navbar.jsp" %>

        <%            Message mymessage = (Message) session.getAttribute("mymessage");
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


        <%
            BookDetails book = (BookDetails) session.getAttribute("editBook");


        %>

        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-2">
                        <div class="card-body">
                            <h4 class="text-center">Add Books</h4>
                            <form action="../EditBooksServlet" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <input type="hidden" name="bookId" value="<%=book.getBookId()%>" />
                                    <label for="exampleInputEmail">Book Name</label>
                                    <input name="bookName" type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" value="<%= book.getBookName()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail">Author Name</label>
                                    <input name="bookAuthor" type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" value="<%= book.getBookAuthor()%>">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail">Price</label>
                                    <input name="bookPrice" type="number" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" value="<%= book.getBookPrice()%>">

                                </div>
                                <div class="form-group">
                                    <label>Book Category</label>
                                    <select name="bookCategory" class="form-control">
                                        <option <%= "New".equals(book.getBookCategory()) ? "selected" : ""%> value="New">New Book</option>
                                        <option <%= "Old".equals(book.getBookCategory()) ? "selected" : ""%> value="Old">Old Book</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Book Status</label>
                                    <select name="bookStatus" class="form-control">
                                        <option value="">--select--</option>
                                        <option <%= "Active".equals(book.getBookStatus()) ? "selected" : ""%> value="Active">Active</option>
                                        <option <%= "Inactive".equals(book.getBookStatus()) ? "selected" : ""%> value="Inactive">Inactive</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Upload New Photo (optional)</label>
                                    <input name="bookPhotoName" type="file" class="form-control-file" >
                                    <% if (book != null && book.getBookPhotoName() != null && !book.getBookPhotoName().isEmpty()) {%>
                                    <img src="../Books/<%= book.getBookPhotoName()%>" style="height:60px; width:60px;"  />
                                    <input type="hidden" name="oldBookPhoto" value="<%= book.getBookPhotoName()%>">
                                    <% } %>

                                </div>
                                <%
                                    UserRegistration user3 = (UserRegistration) session.getAttribute("loginStudent");

                                    if (user3 != null) {
                                        String userEmail = user3.getUserEmail(); // yaha se specific email mil jayega
%>
                                <input type="hidden" name="userEmail" value="<%= userEmail%>" />
                                <%}

                                %>
                              <input type="hidden" name="findPage" value="userPage" />
                                <div class="text-center mt-4"> <button type="submit " class="btn btn-primary ">Save</button></div>
                            </form>

                        </div>
                    </div>
                </div>  
            </div>
        </div>

        <%@include file="../AllComponent/Footer.jsp" %>
          </body>
</html>

<%    }
%>
<%    }
%>