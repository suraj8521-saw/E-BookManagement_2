package com.ebook.Servlets;

import com.ebook.DataOperation.DeleteBookDataOperation;
import com.ebook.DataOperation.DisplayAllBookAtUserHomePageDataOperation;
import com.ebook.Entity.BookDetails;
import com.ebook.Helper.ConnectionProvider;
import com.ebook.Helper.Message;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.*;
import java.util.List;

public class DeleteBookServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try {
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            String bookPhoto = request.getParameter("photo");

            String findPage=request.getParameter("findPage");
          String adminPage="adminPage" ;
          String userPage="userPage";
            DeleteBookDataOperation bookOp = new DeleteBookDataOperation(ConnectionProvider.getConnection());
            boolean deleted = bookOp.deleteBookById(bookId);

            HttpSession session = request.getSession();
             HttpSession session1 = request.getSession();
              HttpSession sesssion2 = request.getSession();
               HttpSession session3 = request.getSession();

            if (deleted) {
                // Book image delete karna
                String path = getServletContext().getRealPath("/") + "Books" + File.separator + bookPhoto;
                File file = new File(path);
                if (file.exists()) {
                    file.delete();
                }

                Message m = new Message("Book Deleted Successfully", "green", "fa fa-check");
                session.setAttribute("mymessage", m);
                if(findPage.equals(userPage)){
                     String bookCategory="New";
            String bookStatus="Active";
           String bookCategory2="Old";
           session.removeAttribute("bookListnewCategory");
           
           session.removeAttribute("bookList2");
           session.removeAttribute("bookList3");
           DisplayAllBookAtUserHomePageDataOperation bookData= new DisplayAllBookAtUserHomePageDataOperation( ConnectionProvider.getConnection());
         
            List<BookDetails> bookList = bookData.getAllBooksByNewCategoryAndActive(bookStatus, bookCategory);
session1.setAttribute("bookListnewCategory", bookList);
List<BookDetails> bookList2=bookData.getAllBookByActive(bookStatus);
sesssion2.setAttribute("bookList2", bookList2);
List<BookDetails> bookList3=bookData.getAllBookByCategory(bookStatus,bookCategory2);
session3.setAttribute("bookList3", bookList3);
                       response.sendRedirect("User/Home.jsp");
}else{
  
       response.sendRedirect("Admin/Home.jsp");
}
            } else {
                Message m = new Message("Book Delete Failed", "red", "fa fa-times");
                session.setAttribute("mymessage", m);
                if(findPage.equals(userPage)){
                       response.sendRedirect("User/Home.jsp");
}else{
  
       response.sendRedirect("Admin/Home.jsp");
}
             
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Exception: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
