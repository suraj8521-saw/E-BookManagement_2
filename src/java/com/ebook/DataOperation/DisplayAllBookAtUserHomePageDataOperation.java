/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.DataOperation;

import com.ebook.Entity.BookDetails;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import java.sql.ResultSet;

import java.sql.PreparedStatement;
/**
 *
 * @author suraj
 */
public class DisplayAllBookAtUserHomePageDataOperation {
    
    private Connection con;

    public DisplayAllBookAtUserHomePageDataOperation(Connection con) {
        this.con = con;
    }
  public List<BookDetails> getAllBooksByNewCategoryAndActive(String bookStatus,String bookCategory) {
    List<BookDetails> bookList = new ArrayList<>();
    try {
        String query = "SELECT * FROM bookdetails WHERE bookStatus=? AND bookCategory=?";
        PreparedStatement pstmt = con.prepareStatement(query);
       pstmt.setString(1, bookStatus);
        pstmt.setString(2, bookCategory);
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
  
  public List<BookDetails> getAllBookByActive(String bookStatus ){
      List<BookDetails> bookList2 = new ArrayList<>();
       try {
        String query = "SELECT * FROM bookdetails WHERE bookStatus=?";
        PreparedStatement pstmt = con.prepareStatement(query);
       pstmt.setString(1, bookStatus);
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
            bookList2.add(book);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return bookList2;
  }
   public List<BookDetails> getAllBookByCategory(String bookStatus ,String bookCategory ){
      List<BookDetails> bookList3 = new ArrayList<>();
       try {
        String query = "SELECT * FROM bookdetails WHERE bookStatus =? AND bookCategory=?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, bookStatus);
        pstmt.setString(2, bookCategory);
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
            bookList3.add(book);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return bookList3;
  }
    public List<BookDetails> getAllBookByBookId(int bookId ){
      List<BookDetails> bookList4 = new ArrayList<>();
       try {
        String query = "SELECT * FROM bookdetails WHERE bookId=?";
        PreparedStatement pstmt = con.prepareStatement(query);
       pstmt.setInt(1, bookId);
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
            bookList4.add(book);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return bookList4;
  }
     public List<BookDetails> getAllSuggestedBook(String searchKey ){
      List<BookDetails> Searchlist = new ArrayList<>();
       try {
        String query = "SELECT * FROM bookdetails WHERE (bookName LIKE ? or bookAuthor like ? or bookCategory like ?  or bookPrice like ?) AND bookStatus='Active' ";
        PreparedStatement pstmt = con.prepareStatement(query);
   pstmt.setString(1,"%"+ searchKey + "%");
pstmt.setString(2,"%"+ searchKey + "%");
pstmt.setString(3,"%"+ searchKey + "%");
pstmt.setString(4,"%"+ searchKey + "%");
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
            Searchlist.add(book);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return Searchlist;
  }
      public List<BookDetails> getAllSuggestedBookByCategory(String searchKey ,String bookCategory ){
      List<BookDetails> Searchlist = new ArrayList<>();
       try {
        String query = "SELECT * FROM bookdetails WHERE (bookName LIKE ? or bookAuthor like ? or bookCategory like ? or bookPrice like ? ) AND bookStatus='Active' AND bookCategory=? ";
        PreparedStatement pstmt = con.prepareStatement(query);
   pstmt.setString(1,"%"+ searchKey + "%");
pstmt.setString(2,"%"+ searchKey + "%");
pstmt.setString(3,"%"+ searchKey + "%");

pstmt.setString(4,"%"+ searchKey + "%");
pstmt.setString(5, bookCategory);
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
            Searchlist.add(book);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return Searchlist;
  }
}
