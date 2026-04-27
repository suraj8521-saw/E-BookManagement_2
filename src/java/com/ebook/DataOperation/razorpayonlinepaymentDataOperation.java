/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.DataOperation;
import java.sql.Connection;
import com.ebook.Entity.razorpayonlinepayment;
import java.sql.PreparedStatement;
import javax.swing.JOptionPane;
import java.sql.ResultSet;
/**
 *
 * @author suraj
 */
public class razorpayonlinepaymentDataOperation {
    
    private Connection con;

    public razorpayonlinepaymentDataOperation(Connection con) {
        this.con = con;
    }
    
        public boolean OrderInsert(razorpayonlinepayment payment){
        
        boolean insert=false;
        
        try {
            
            String query="INSERT INTO razorpayonlinepayment(razorpayOrderId,amount,status,userEmail,receipt,registerId) VALUES(?,?,?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,payment.getRazorpayOrderId());
            pstmt.setDouble(2, payment.getAmount());
            pstmt.setString(3, payment.getStatus());
            pstmt.setString(4, payment.getUserEmail());
            pstmt.setString(5, payment.getReceipt());
            pstmt.setInt(6, payment.getRegisterId());
            
         int rows=   pstmt.executeUpdate();
           // JOptionPane.showMessageDialog(null, rows);
            if(rows>0){
            insert= true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return insert;
    }
        public razorpayonlinepayment getOrderDetailsByUserRegisteredIdAndOrderId(String razorpayOrderId,int registerId){
        razorpayonlinepayment result=null;
        try {
            String query = "SELECT * FROM razorpayonlinepayment WHERE razorpayOrderId=? AND registerId=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, razorpayOrderId);
            pstmt.setInt(2, registerId);
            
            ResultSet set =  pstmt.executeQuery();
            if (set.next()){
                result=new razorpayonlinepayment();
                int onlinePayId=set.getInt("onlinePayId");
                result.setOnlinePayId(onlinePayId);
                result.setRazorpayOrderId(set.getString("razorpayOrderId"));
                result.setAmount(Double.parseDouble(set.getString("amount")));
                result.setStatus(set.getString("status"));
                result.setUserEmail(set.getString("userEmail"));
                result.setPaymentDate(set.getTimestamp("paymentDate"));
                result.setReceipt(set.getString("receipt"));
                result.setRegisterId(set.getInt("registerId"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
     public boolean UpdatePaymentDetails(razorpayonlinepayment payment){
        boolean update=false;
        try {
            
            String query="UPDATE  razorpayonlinepayment SET razorpaySignature=?,status=?,razorpayPaymentId=? WHERE razorpayOrderId=? AND registerId=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,payment.getRazorpaySignature());
            pstmt.setString(2, payment.getStatus());
            pstmt.setString(3, payment.getRazorpayPaymentId());
            pstmt.setString(4, payment.getRazorpayOrderId());
            pstmt.setInt(5, payment.getRegisterId());
//            pstmt.setDouble(5, payment.getAmount());
            
            
          int updatedRow=  pstmt.executeUpdate();
            if(updatedRow>0)
            {update= true;}
        } catch (Exception e) {
            e.printStackTrace();
        }
        return update;
    }
}
