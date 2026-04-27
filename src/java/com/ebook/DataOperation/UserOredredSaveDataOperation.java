/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.DataOperation;

import java.sql.Connection;
import com.ebook.Entity.UserOrderedBook;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp; // ✅ Sahi

/**
 *
 * @author suraj
 */
public class UserOredredSaveDataOperation {
    
    private Connection con;

    public UserOredredSaveDataOperation(Connection con) {
        this.con = con;
    }
    public boolean orderBook(UserOrderedBook order){
        
        boolean orderconfirm=false;
        
        try {
            
            String query="INSERT INTO userproductordered(bookId,bookName,BookAuthor,orderedBookQuantity,orderedBookTotalPrice,orderedBookPhotoName,orderedUserName,orderedUserMobileNo,orderedUserEmail,orderedUserVilage,orderedUserLandmark,orderedUserDistrict,orderedUserPincode,orderedUserState,paymentMethod,userAddressId,receipt) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setInt(1,order.getBookId());
            pstmt.setString(2, order.getBookName());
            pstmt.setString(3, order.getBookAuthor());
            pstmt.setInt(4, order.getOrderedBookQuantity());
             pstmt.setDouble(5,order.getOrderedBookTotalPrice() );
            pstmt.setString(6, order.getOrderedBookPhotoName());
            pstmt.setString(7, order.getOrderedUserName());
            pstmt.setString(8, order.getOrderedUserMobileNo());
             pstmt.setString(9,order.getOrderedUserEmail() );
            pstmt.setString(10, order.getOrderedUserVilage());
            pstmt.setString(11, order.getOrderedUserLandmark());
            pstmt.setString(12, order.getOrderedUserDistrict());
             pstmt.setString(13,order.getOrderedUserPincode());
            pstmt.setString(14, order.getOrderedUserState());
            pstmt.setString(15, order.getPaymentMethod());
            pstmt.setInt(16, order.getUserAddressId());
            pstmt.setString(17, order.getReceipt());
            pstmt.executeUpdate();
            orderconfirm= true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderconfirm;
    }
     public List<UserOrderedBook> getAllBooksByUserEmail(String userEmail) {
    List<UserOrderedBook> bookList8 = new ArrayList<>();
    try {
        String query = "SELECT * FROM userproductordered WHERE orderedUserEmail=?";
        PreparedStatement pstmt = con.prepareStatement(query);
       pstmt.setString(1, userEmail);
        ResultSet set = pstmt.executeQuery();

        while (set.next()) {
            UserOrderedBook book = new UserOrderedBook();
            book.setBookOrderedId(set.getInt("bookOrderedId"));
            book.setBookId(set.getInt("bookId"));
            book.setBookName(set.getString("bookName"));
            book.setBookAuthor(set.getString("bookAuthor"));
            book.setOrderedBookQuantity(set.getInt("orderedBookQuantity"));
            book.setOrderedBookTotalPrice(set.getDouble("orderedBookTotalPrice"));
            book.setOrderedBookPhotoName(set.getString("orderedBookPhotoName"));
            book.setOrderedUserName(set.getString("orderedUserName"));
            book.setOrderedUserMobileNo(set.getString("orderedUserMobileNo"));
            book.setOrderedUserEmail(set.getString("orderedUserEmail"));
            book.setOrderedUserVilage(set.getString("orderedUserVilage"));
            book.setOrderedUserLandmark(set.getString("orderedUserLandmark"));
            book.setOrderedUserDistrict(set.getString("orderedUserDistrict"));
            book.setOrderedUserPincode(set.getString("orderedUserPincode"));
            book.setOrderedUserState(set.getString("orderedUserState"));
            book.setPaymentMethod(set.getString("paymentMethod"));
            book.setUserAddressId(set.getInt("userAddressId"));
            
            book.setOrderedDate(set.getTimestamp("orderedDate"));
            book.setReceipt(set.getString("receipt"));
            bookList8.add(book);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return bookList8;
}
     
     public List<UserOrderedBook> getAllBooksByOrderStatus(String orderStatus) {
    List<UserOrderedBook> bookList9 = new ArrayList<>();
    try {
        String query = "SELECT * FROM userproductordered WHERE orderStatus=?";
        PreparedStatement pstmt = con.prepareStatement(query);
       pstmt.setString(1, orderStatus);
        ResultSet set = pstmt.executeQuery();

        while (set.next()) {
            UserOrderedBook book = new UserOrderedBook();
            book.setBookOrderedId(set.getInt("bookOrderedId"));
            book.setBookId(set.getInt("bookId"));
            book.setBookName(set.getString("bookName"));
            book.setBookAuthor(set.getString("bookAuthor"));
            book.setOrderedBookQuantity(set.getInt("orderedBookQuantity"));
            book.setOrderedBookTotalPrice(set.getDouble("orderedBookTotalPrice"));
            book.setOrderedBookPhotoName(set.getString("orderedBookPhotoName"));
            book.setOrderedUserName(set.getString("orderedUserName"));
            book.setOrderedUserMobileNo(set.getString("orderedUserMobileNo"));
            book.setOrderedUserEmail(set.getString("orderedUserEmail"));
            book.setOrderedUserVilage(set.getString("orderedUserVilage"));
            book.setOrderedUserLandmark(set.getString("orderedUserLandmark"));
            book.setOrderedUserDistrict(set.getString("orderedUserDistrict"));
            book.setOrderedUserPincode(set.getString("orderedUserPincode"));
            book.setOrderedUserState(set.getString("orderedUserState"));
            book.setPaymentMethod(set.getString("paymentMethod"));
            book.setUserAddressId(set.getInt("userAddressId"));
            
            book.setOrderedDate(set.getTimestamp("orderedDate"));
            book.setReceipt(set.getString("receipt"));
            bookList9.add(book);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return bookList9;
}
    
      
     public List<UserOrderedBook> getAllBooksBySearchKey(String searchKey) {
    List<UserOrderedBook> bookListforAdminpendin = new ArrayList<>();
    try {
        String query = "SELECT * FROM userproductordered WHERE (bookOrderedId like ? or bookId like ? or bookName LIKE ? or BookAuthor LIKE ? or orderedBookQuantity LIKE ? or orderedBookTotalPrice LIKE ? or orderedUserName like ? or orderedUserMobileNo like ? or orderedUserEmail like ? or orderedUserVilage like ? or orderedUserLandmark like ? or orderedUserDistrict like ? or orderedUserPincode like ? or orderedUserState like ? or paymentMethod LIKE ? or userAddressId like ? or orderedDate LIKE ? or receipt like ?) AND orderStatus='Pending'";
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
                  pstmt.setString(17, searchKey + "%");
                 pstmt.setString(18,  "%" + searchKey + "%");
      
        ResultSet set = pstmt.executeQuery();

        while (set.next()) {
            UserOrderedBook book = new UserOrderedBook();
            book.setBookOrderedId(set.getInt("bookOrderedId"));
            book.setBookId(set.getInt("bookId"));
            book.setBookName(set.getString("bookName"));
            book.setBookAuthor(set.getString("bookAuthor"));
            book.setOrderedBookQuantity(set.getInt("orderedBookQuantity"));
            book.setOrderedBookTotalPrice(set.getDouble("orderedBookTotalPrice"));
            book.setOrderedBookPhotoName(set.getString("orderedBookPhotoName"));
            book.setOrderedUserName(set.getString("orderedUserName"));
            book.setOrderedUserMobileNo(set.getString("orderedUserMobileNo"));
            book.setOrderedUserEmail(set.getString("orderedUserEmail"));
            book.setOrderedUserVilage(set.getString("orderedUserVilage"));
            book.setOrderedUserLandmark(set.getString("orderedUserLandmark"));
            book.setOrderedUserDistrict(set.getString("orderedUserDistrict"));
            book.setOrderedUserPincode(set.getString("orderedUserPincode"));
            book.setOrderedUserState(set.getString("orderedUserState"));
            book.setPaymentMethod(set.getString("paymentMethod"));
            book.setUserAddressId(set.getInt("userAddressId"));
            
            book.setOrderedDate(set.getTimestamp("orderedDate"));
            book.setReceipt(set.getString("receipt"));
            bookListforAdminpendin.add(book);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return bookListforAdminpendin;
}
      public List<UserOrderedBook> getAllBooksBySearchKey(String searchKey ,String userEmail) {
    List<UserOrderedBook> SearchResult = new ArrayList<>();
    try {
        String query = "SELECT * FROM userproductordered WHERE (bookName LIKE ? or BookAuthor LIKE ? or orderedBookQuantity LIKE ? or orderedBookTotalPrice LIKE ? or paymentMethod LIKE ? or orderedDate LIKE ?) AND orderedUserEmail=?";
        PreparedStatement pstmt = con.prepareStatement(query);
       pstmt.setString(1, searchKey + "%");
         pstmt.setString(2, searchKey + "%");
           pstmt.setString(3, searchKey + "%");
             pstmt.setString(4, searchKey + "%");
               pstmt.setString(5, searchKey + "%");
                 pstmt.setString(6,  "%" + searchKey + "%");
                 
                 pstmt.setString(7, userEmail);
        ResultSet set = pstmt.executeQuery();

        while (set.next()) {
            UserOrderedBook book = new UserOrderedBook();
            book.setBookOrderedId(set.getInt("bookOrderedId"));
            book.setBookId(set.getInt("bookId"));
            book.setBookName(set.getString("bookName"));
            book.setBookAuthor(set.getString("bookAuthor"));
            book.setOrderedBookQuantity(set.getInt("orderedBookQuantity"));
            book.setOrderedBookTotalPrice(set.getDouble("orderedBookTotalPrice"));
            book.setOrderedBookPhotoName(set.getString("orderedBookPhotoName"));
            book.setOrderedUserName(set.getString("orderedUserName"));
            book.setOrderedUserMobileNo(set.getString("orderedUserMobileNo"));
            book.setOrderedUserEmail(set.getString("orderedUserEmail"));
            book.setOrderedUserVilage(set.getString("orderedUserVilage"));
            book.setOrderedUserLandmark(set.getString("orderedUserLandmark"));
            book.setOrderedUserDistrict(set.getString("orderedUserDistrict"));
            book.setOrderedUserPincode(set.getString("orderedUserPincode"));
            book.setOrderedUserState(set.getString("orderedUserState"));
            book.setPaymentMethod(set.getString("paymentMethod"));
            book.setUserAddressId(set.getInt("userAddressId"));
            
            book.setOrderedDate(set.getTimestamp("orderedDate"));
            book.setReceipt(set.getString("receipt"));
            SearchResult.add(book);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return SearchResult;
}
}
