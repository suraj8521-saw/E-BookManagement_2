/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ebook.Servlets;

import com.ebook.DataOperation.LiveChatDataOperation;
import com.ebook.Entity.LiveChat;
import com.ebook.Helper.ConnectionProvider;
import com.ebook.WebSocket.ChatReceiverEndpoint;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import javax.websocket.Session;
import org.json.JSONObject;

/**
 *
 * @author suraj
 */
public class LiveChatWebSocketServlets extends HttpServlet {

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
        

       request.setCharacterEncoding("UTF-8"); // For reading emoji from request
    response.setContentType("text/html;charset=UTF-8"); // For sending emoji to browser
    response.setCharacterEncoding("UTF-8"); try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
           String message=request.getParameter("message");
            String senderRole=request.getParameter("senderRole");
             String content;
            String color;
            String icon;
            HttpSession Sesssion = request.getSession();
           
            
            int registerId=(Integer.parseInt(request.getParameter("registerId")));
            LiveChatDataOperation saveData=new LiveChatDataOperation(ConnectionProvider.getConnection());
            LiveChat save=new LiveChat(registerId, senderRole, message);
            boolean insert=saveData.messagestore(save);
            if(insert){
               // JOptionPane.showMessageDialog(null, "insert ho gaya");
                
                  JSONObject payload = new JSONObject();
                 // JOptionPane.showMessageDialog(null, "obj bana raha hu");
    payload.put("registerId", registerId);
    payload.put("senderRole", senderRole); // "ADMIN" or "USER"
    payload.put("message", message);
  //  JOptionPane.showMessageDialog(null, "obj ban gaya");
     List<Session> session= ChatReceiverEndpoint.clients.get(String.valueOf(registerId));
    // JOptionPane.showMessageDialog(null, "live user ka list map kar raha hu");
    if (session != null ) {
        for(Session s: session){
           //  JOptionPane.showMessageDialog(null, "open kar raha hu session");
                s.getBasicRemote().sendText(payload.toString());
        }
        
    }
                 out.print("success");
            }else{
                 content = "Something Went Wrong Please Try Again!!";
                       
                         response.setStatus(500); // optional
    out.print("error");
                     
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
