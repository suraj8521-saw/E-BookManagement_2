/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.DataOperation;

import java.sql.Connection;
import com.ebook.Entity.BookDetails;
import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author suraj
 */
public class BookAddDetailsDataOperation {
     private  Connection con;

    public BookAddDetailsDataOperation(Connection con) {
        this.con = con;
    }
     
    public boolean BookAddDeatils(BookDetails book){
        boolean insert=false;
        try {
            
            String query="INSERT INTO bookdetails(bookName,bookAuthor,bookPrice,bookCategory,bookStatus,bookPhotoName,userEmail) VALUES(?,?,?,?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,book.getBookName() );
            pstmt.setString(2, book.getBookAuthor());
            pstmt.setDouble(3,book.getBookPrice());
            pstmt.setString(4, book.getBookCategory());
            pstmt.setString(5, book.getBookStatus());
            pstmt.setString(6, book.getBookPhotoName());
            pstmt.setString(7, book.getUserEmail());
           
          int result = pstmt.executeUpdate();
insert = result > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return insert;
    }
    //fetching book details by  owner email
  public List<BookDetails> getAllBooksByUserEmail(String userEmail) {
    List<BookDetails> bookList = new ArrayList<>();
    try {
        String query = "SELECT * FROM bookdetails WHERE userEmail=?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, userEmail);
        ResultSet set = pstmt.executeQuery();

        while (set.next()) {
            BookDetails book = new BookDetails();
            book.setBookId(set.getInt("bookId"));
            book.setBookName(set.getString("bookName"));
            book.setBookAuthor(set.getString("bookAuthor"));
            book.setBookPrice(set.getDouble("bookPrice"));
            book.setBookCategory(set.getString("bookCategory"));
            book.setBookStatus(set.getString("bookStatus"));
            book.setBookPhotoName(set.getString("bookPhotoName"));
            book.setUserEmail(set.getString("userEmail"));
            bookList.add(book);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return bookList;
}

    
}
