/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebook.Servlets;

import com.ebook.DataOperation.LiveChatDataOperation;
import com.ebook.Entity.LiveChat;
import com.ebook.Helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author suraj
 */
public class AdminShowUserChatServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int registerId=(Integer.parseInt(request.getParameter("registerId")));
            HttpSession session=request.getSession();
           // HttpSession session2=request.getSession();
        LiveChatDataOperation chatData=new LiveChatDataOperation(ConnectionProvider.getConnection());
         List<LiveChat> chatlist=chatData.chatListByRegisterId(registerId);
          if(chatlist!=null )
            {
//            List<LiveChat> chatlist2=chatData.chatListByRegisterId(registerId);
//            session.setAttribute("chatlist2", chatlist2);
          //  session2.setAttribute("registerId", registerId);
                // Servlet Response:
JSONArray chatArray = new JSONArray();
for (LiveChat chat : chatlist) {
    JSONObject msg = new JSONObject();
    msg.put("role", chat.getSenderRole());
    msg.put("text", chat.getMessage());
    chatArray.put(msg);
}

response.setContentType("application/json");
request.setCharacterEncoding("UTF-8"); // For reading emoji from request
    response.setContentType("text/html;charset=UTF-8"); // For sending emoji to browser
    response.setCharacterEncoding("UTF-8");
response.getWriter().write(chatArray.toString());


            }
          else{
              response.setContentType("application/json");
    response.getWriter().write("[]");
          }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
