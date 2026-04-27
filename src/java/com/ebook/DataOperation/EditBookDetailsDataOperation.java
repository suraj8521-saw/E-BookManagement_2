/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.DataOperation;

import com.ebook.Entity.BookDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author suraj
 */
public class EditBookDetailsDataOperation {
    private  Connection con;

    public EditBookDetailsDataOperation(Connection con) {
        this.con = con;
    }
    
     public boolean EditBookAddDeatils(BookDetails book){
        boolean edit=false;
        try {
            
            String query="UPDATE  bookdetails SET bookName=?,bookAuthor=?,bookPrice=?,bookCategory=?,bookStatus=?,bookPhotoName=?,userEmail=? WHERE bookId=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,book.getBookName() );
            pstmt.setString(2, book.getBookAuthor());
            pstmt.setString(3,String.valueOf(book.getBookPrice()));
            pstmt.setString(4, book.getBookCategory());
            pstmt.setString(5, book.getBookStatus());
            pstmt.setString(6, book.getBookPhotoName());
            pstmt.setString(7, book.getUserEmail());
            pstmt.setInt(8, book.getBookId());
            
          int updatedRow=  pstmt.executeUpdate();
            if(updatedRow>0)
            {edit= true;}
        } catch (Exception e) {
            e.printStackTrace();
        }
        return edit;
    }
    
}
