/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.DataOperation;


import java.sql.Connection;
import com.ebook.Entity.AddToCardBookDetails;

import java.util.ArrayList;
import java.util.List;import java.sql.ResultSet;
import java.sql.PreparedStatement;
/**
 *
 * @author suraj
 */
public class AddToCardBookDetailsDataOperation {
    
    private Connection con;

    public AddToCardBookDetailsDataOperation(Connection con) {
        this.con = con;
    }
    
      public boolean AddToCardDetails(AddToCardBookDetails book){
        
        boolean add=false;
        
        try {
            
            String query="INSERT INTO addtocardbook(bookId,bookName,bookAuthor,bookCategory,bookQuantity,bookPrice,bookTotalPrice,userEmail,bookPhotoName) VALUES(?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,String.valueOf(book.getBookId()) );
            pstmt.setString(2, book.getBookName());
            pstmt.setString(3, book.getBookAuthor());
            pstmt.setString(4,book.getBookCategory());
            pstmt.setString(5,String.valueOf(book.getBookQuantity()));
            pstmt.setString(6, String.valueOf(book.getBookPrice()));
            pstmt.setString(7, String.valueOf(book.getBookTotalPrice()));
            pstmt.setString(8,book.getUserEmail());
            pstmt.setString(9,book.getBookPhotoName());
            pstmt.executeUpdate();
            add= true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return add;
    }
      public List<AddToCardBookDetails> getAllBooksByUserEmail(String userEmail) {
    List<AddToCardBookDetails> bookList6 = new ArrayList<>();
    try {
        String query = "SELECT * FROM addtocardbook WHERE userEmail=?";
        PreparedStatement pstmt = con.prepareStatement(query);
       pstmt.setString(1, userEmail);
        ResultSet set = pstmt.executeQuery();

        while (set.next()) {
            AddToCardBookDetails book = new AddToCardBookDetails();
            book.setBookAddToCardId(set.getInt("BookAddToCardId"));
            book.setBookId(set.getInt("bookId"));
            book.setBookName(set.getString("bookName"));
            book.setBookAuthor(set.getString("bookAuthor"));
            book.setBookQuantity(set.getInt("bookQuantity"));
            book.setBookPrice(set.getDouble("bookPrice"));
            book.setBookTotalPrice(set.getDouble("bookTotalPrice"));
            book.setBookCategory(set.getString("bookCategory"));
            book.setBookPhotoName(set.getString("bookPhotoName"));
            book.setUserEmail(set.getString("userEmail"));
            book.setAddToCardDate(set.getTimestamp("addToCardDate"));
            bookList6.add(book);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return bookList6;
}
       public boolean UpdateBookDeatils(AddToCardBookDetails book){
        boolean update=false;
        try {
            
            String query="UPDATE  addtocardbook SET bookQuantity=?,bookTotalPrice=? WHERE bookAddToCardId=? AND userEmail=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,String.valueOf( book.getBookQuantity()) );
            pstmt.setString(2,String.valueOf( book.getBookTotalPrice()));
            pstmt.setString(3,String.valueOf(book.getBookAddToCardId()));
            pstmt.setString(4, book.getUserEmail());
            
          int updatedRow=  pstmt.executeUpdate();
            if(updatedRow>0)
            {update= true;}
            else{
                System.out.println("No row updated: check bookId/userEmail mismatch");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return update;
    }
         public List<AddToCardBookDetails> getAllBooksByBookAddToCardId(int bookAddToCardId) {
    List<AddToCardBookDetails> bookList7 = new ArrayList<>();
    try {
        String query = "SELECT * FROM addtocardbook WHERE bookAddToCardId=?";
        PreparedStatement pstmt = con.prepareStatement(query);
       pstmt.setInt(1, bookAddToCardId);
        ResultSet set = pstmt.executeQuery();

        while (set.next()) {
            AddToCardBookDetails book = new AddToCardBookDetails();
            book.setBookAddToCardId(set.getInt("bookAddToCardId"));
            book.setBookId(set.getInt("bookId"));
            book.setBookName(set.getString("bookName"));
            book.setBookAuthor(set.getString("bookAuthor"));
            book.setBookQuantity(set.getInt("bookQuantity"));
            book.setBookPrice(set.getDouble("bookPrice"));
            book.setBookTotalPrice(set.getDouble("bookTotalPrice"));
            book.setBookCategory(set.getString("bookCategory"));
            book.setBookPhotoName(set.getString("bookPhotoName"));
            book.setUserEmail(set.getString("userEmail"));
            book.setAddToCardDate(set.getTimestamp("addToCardDate"));
            bookList7.add(book);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return bookList7;
}
         public boolean DeleteRowByBookAddToCardId(AddToCardBookDetails book){
             boolean delete =false;
             try {
                 String query = "DELETE  FROM addtocardbook WHERE bookAddToCardId=?";
        PreparedStatement pstmt = con.prepareStatement(query);
       pstmt.setInt(1, book.getBookAddToCardId());
        int deletedRow=  pstmt.executeUpdate();
            if(deletedRow>0)
            {
                delete= true;
            }
       
             } catch (Exception e) {
                 e.printStackTrace();
             }
             
             return delete;
         }
         public boolean DeleteRowByBookUserEmail(AddToCardBookDetails book) {
    boolean delete2 = false;
    try {
        String email = book.getUserEmail();
        if (email == null || email.trim().isEmpty()) {
            System.out.println("User email is null or empty. Cannot delete.");
            return false;
        }

        String query = "DELETE FROM addtocardbook WHERE userEmail=?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, email);
        int deletedRow = pstmt.executeUpdate();
        if (deletedRow > 0) {
            delete2 = true;
        }
    } catch (Exception e) {
        e.printStackTrace(); // Most important: Show this in console
    }
    return delete2;
}
   public AddToCardBookDetails  getAllBooksByBookAddToCardIdAndUserEmail(int bookId,String userEmail)
   {
       
       AddToCardBookDetails getbookList=null;
       
       try {
        String query = "SELECT * FROM addtocardbook WHERE bookId=? AND userEmail=? ";
        PreparedStatement pstmt = con.prepareStatement(query);
       pstmt.setInt(1, bookId);
       pstmt.setString(2, userEmail);
        ResultSet set = pstmt.executeQuery();

        if (set.next()) {
            getbookList = new AddToCardBookDetails();
            getbookList.setBookAddToCardId(set.getInt("bookAddToCardId"));
            getbookList.setBookId(set.getInt("bookId"));
            getbookList.setBookName(set.getString("bookName"));
            getbookList.setBookAuthor(set.getString("bookAuthor"));
            getbookList.setBookQuantity(set.getInt("bookQuantity"));
            getbookList.setBookPrice(set.getDouble("bookPrice"));
            getbookList.setBookTotalPrice(set.getDouble("bookTotalPrice"));
            getbookList.setBookCategory(set.getString("bookCategory"));
            getbookList.setBookPhotoName(set.getString("bookPhotoName"));
            getbookList.setUserEmail(set.getString("userEmail"));
            getbookList.setAddToCardDate(set.getTimestamp("addToCardDate"));
           
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
       return getbookList;
   }
         
       

}
