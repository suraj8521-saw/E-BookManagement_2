package com.ebook.Servlets;

import com.razorpay.Order;
import com.razorpay.RazorpayException;
import com.ebook.config.RazorpayConfig;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import org.json.JSONObject;
import org.json.JSONPointer;
import com.razorpay.RazorpayClient;
import static java.lang.System.out;
import com.ebook.Entity.razorpayonlinepayment;

import com.ebook.Helper.ConnectionProvider;
import com.ebook.DataOperation.razorpayonlinepaymentDataOperation;

public class CreateRazorpayOrderIdServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        // PrintWriter out = response.getWriter();

        try {
            int amount = Integer.parseInt(request.getParameter("amount"));
            int amount2 = amount * 100;
            String userEmail = request.getParameter("userEmail2");

            int registerId = Integer.parseInt(request.getParameter("registerId"));
            //JOptionPane.showMessageDialog(null, "servlet hit");
            // JOptionPane.showMessageDialog(null, System.getProperty("java.version"));

            String keyId = RazorpayConfig.get("key_id");
            String keySecret = RazorpayConfig.get("key_secret");

            //  JOptionPane.showMessageDialog(null, keyId);
            // JOptionPane.showMessageDialog(null, keySecret);
            // JOptionPane.showMessageDialog(null, "key generated");
            RazorpayClient razorpay = new RazorpayClient(keyId, keySecret);

            // JOptionPane.showMessageDialog(null, "key dene ke bad problem hai");
            JSONObject orderRequest = new JSONObject();
            //  JOptionPane.showMessageDialog(null, "problem 4");
            String receipt = "UID" + registerId + "_TS" + System.currentTimeMillis();

            orderRequest.put("amount", amount2);
            orderRequest.put("currency", "INR");
            orderRequest.put("receipt", receipt);

            JSONObject notes = new JSONObject();
            //   JOptionPane.showMessageDialog(null, "problem 5");
            //JOptionPane.showMessageDialog(null, userEmail);
            notes.put("notes_key_1", "Tea, Earl Grey, Hot");
            notes.put("notes_key_1", "Tea, Earl Grey, Hot");
            orderRequest.put("notes", notes);
//Start insertion deta in db

            razorpayonlinepaymentDataOperation paymentData = new razorpayonlinepaymentDataOperation(ConnectionProvider.getConnection());
            try (PrintWriter out = response.getWriter()) {

                Order order = razorpay.orders.create(orderRequest);

                razorpayonlinepayment payment = new razorpayonlinepayment((String) order.get("id"), amount2, "CREATED", userEmail, receipt, registerId);
                boolean insert = paymentData.OrderInsert(payment);

//JOptionPane.showMessageDialog(null, insert);
                if (insert) {
//JOptionPane.showMessageDialog(null, order);
                    JSONObject jsonResponse = new JSONObject();
                    jsonResponse.put("id", (String) order.get("id"));
                    jsonResponse.put("amount", (Integer) order.get("amount"));
                    jsonResponse.put("currency", (String) order.get("currency"));
                    jsonResponse.put("receipt", (String) order.get("receipt"));
//JOptionPane.showMessageDialog(null, "Order Created:\n" + jsonResponse.toString());
                    out.print(jsonResponse.toString());
                    out.flush();

                } else {
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    out.print("{\"error\":\"DB insert failed\"}");
                }
            }
            out.println("<h3 style='color:green;'>✅ Order Created Successfully</h3>");

        } catch (Exception e) {
            e.printStackTrace(); // Console log

            // Send error response to AJAX properly
            response.setStatus(500); // Force HTTP 500
            PrintWriter out = response.getWriter();
            out.println("❌ Razorpay Error: " + e.getClass().getName());
            out.println("Message: " + e.getMessage());
        } finally {
//        out.close();

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method not supported");
    }

    @Override
    public String getServletInfo() {
        return "Servlet to create Razorpay order ID";
    }
}
