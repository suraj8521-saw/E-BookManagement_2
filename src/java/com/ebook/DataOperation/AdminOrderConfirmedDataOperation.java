/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.DataOperation;
import java.sql.Connection;
import com.ebook.Entity.AdminOrderConfirm;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author suraj
 */
public class AdminOrderConfirmedDataOperation {
    
    private Connection con;

    public AdminOrderConfirmedDataOperation(Connection con) {
        this.con = con;
    }
    
    public boolean orderConfirmed(AdminOrderConfirm order){
        
        boolean insert=false;
        
        try {
            
            String query="INSERT INTO adminorderconfirm(bookId,bookName,bookAuthor,bookPhotoName,bookQuantity,totalPrice,paymentMethod,userName,userMobile,userEmail,userVillage,userLandmark,userDistrict,userPincode,userState,orderedDate,orderStatus,receipt) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setInt(1,order.getBookId());
            pstmt.setString(2, order.getBookName());
            pstmt.setString(3, order.getBookAuthor());
            pstmt.setString(4, order.getBookPhotoName());
             pstmt.setInt(5,order.getBookQuantity());
            pstmt.setDouble(6, order.getTotalPrice());
            pstmt.setString(7, order.getPaymentMethod());
            pstmt.setString(8, order.getUserName());
             pstmt.setString(9,order.getUserMobile() );
            pstmt.setString(10, order.getUserEmail());
            pstmt.setString(11, order.getUserVillage());
            pstmt.setString(12, order.getUserLandmark());
             pstmt.setString(13,order.getUserDistrict());
            pstmt.setString(14, order.getUserPincode());
            pstmt.setString(15, order.getUserState());
            pstmt.setTimestamp(16, order.getOrderedDate());
             pstmt.setString(17, order.getOrderStatus());
             pstmt.setString(18, order.getReceipt());
            
            pstmt.executeUpdate();
            insert= true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return insert;
    }
    
    public List<AdminOrderConfirm> getAllConfirmedOrderByStatus(String orderStatus) {
    List<AdminOrderConfirm> bookList10 = new ArrayList<>();
    try {
        String query = "SELECT * FROM adminorderconfirm WHERE orderStatus=?";
        PreparedStatement pstmt = con.prepareStatement(query);
       pstmt.setString(1, orderStatus);
        
        ResultSet set = pstmt.executeQuery();

        while (set.next()) {
            AdminOrderConfirm order = new AdminOrderConfirm();
            
            order.setConfirmedId(set.getInt("confirmedId"));
            order.setBookId(set.getInt("bookId"));
            order.setBookName(set.getString("bookName"));
            order.setBookAuthor(set.getString("bookAuthor"));
            order.setBookPhotoName(set.getString("bookPhotoName"));
            order.setBookQuantity(set.getInt("bookQuantity"));
            order.setTotalPrice(set.getDouble("totalPrice"));
            order.setPaymentMethod(set.getString("paymentMethod"));
            order.setUserName(set.getString("userName"));
            order.setUserMobile(set.getString("userMobile"));
            order.setUserEmail(set.getString("userEmail"));
            order.setUserVillage(set.getString("userVillage"));
            order.setUserLandmark(set.getString("userLandmark"));
            order.setUserDistrict(set.getString("userDistrict"));
            order.setUserPincode(set.getString("userPincode"));
            order.setUserState(set.getString("userState"));
            order.setOrderedDate(set.getTimestamp("orderedDate"));
            order.setOrderStatus(set.getString("orderStatus"));
            order.setOrderConfirmedDate(set.getTimestamp("orderConfirmedDate"));
            order.setReceipt(set.getString("receipt"));
            bookList10.add(order);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return bookList10;
}
     public List<AdminOrderConfirm> getAllConfirmedOrderBySearchKeyAndEmail(String searchKey) {
    List<AdminOrderConfirm> bookList11 = new ArrayList<>();
    try {
        String query = "SELECT * FROM adminorderconfirm WHERE (confirmedId like ? or  bookId like ? or bookName like ? or bookQuantity like ? or totalPrice like ? or  paymentMethod like ? or userName like ? or userMobile like ? or userEmail like ? or userVillage like ? or userDistrict like ? or userPincode like ? or userState like ? or orderedDate like ? or orderConfirmedDate like ? or receipt like ? ) AND orderStatus='Confirm'";
        PreparedStatement pstmt = con.prepareStatement(query);
             pstmt.setString(1, searchKey + "%");
         pstmt.setString(2, searchKey + "%");
           pstmt.setString(3, searchKey + "%");
             pstmt.setString(4, searchKey + "%");
               pstmt.setString(5, searchKey + "%");
                 pstmt.setString(6,  "%" + searchKey + "%");
                 pstmt.setString(7, searchKey + "%");
         pstmt.setString(8, searchKey + "%");
           pstmt.setString(9, searchKey + "%");
             pstmt.setString(10, searchKey + "%");
               pstmt.setString(11, searchKey + "%");
                 pstmt.setString(12,  "%" + searchKey + "%");
                 pstmt.setString(13, searchKey + "%");
             pstmt.setString(14, searchKey + "%");
               pstmt.setString(15, searchKey + "%");
                 pstmt.setString(16,  "%" + searchKey + "%");
        
        
        ResultSet set = pstmt.executeQuery();

        while (set.next()) {
            AdminOrderConfirm order = new AdminOrderConfirm();
            
            order.setConfirmedId(set.getInt("confirmedId"));
            order.setBookId(set.getInt("bookId"));
            order.setBookName(set.getString("bookName"));
            order.setBookAuthor(set.getString("bookAuthor"));
            order.setBookPhotoName(set.getString("bookPhotoName"));
            order.setBookQuantity(set.getInt("bookQuantity"));
            order.setTotalPrice(set.getDouble("totalPrice"));
            order.setPaymentMethod(set.getString("paymentMethod"));
            order.setUserName(set.getString("userName"));
            order.setUserMobile(set.getString("userMobile"));
            order.setUserEmail(set.getString("userEmail"));
            order.setUserVillage(set.getString("userVillage"));
            order.setUserLandmark(set.getString("userLandmark"));
            order.setUserDistrict(set.getString("userDistrict"));
            order.setUserPincode(set.getString("userPincode"));
            order.setUserState(set.getString("userState"));
            order.setOrderedDate(set.getTimestamp("orderedDate"));
            order.setOrderStatus(set.getString("orderStatus"));
            order.setOrderConfirmedDate(set.getTimestamp("orderConfirmedDate"));
            order.setReceipt(set.getString("receipt"));
            bookList11.add(order);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return bookList11;
}
}
