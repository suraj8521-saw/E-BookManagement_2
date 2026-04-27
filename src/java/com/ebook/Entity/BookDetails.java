/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.Entity;

/**
 *
 * @author suraj
 */
public class BookDetails {
    private int bookId;
    private String bookName;
    private String bookAuthor;
    private Double bookPrice;
    private String bookCategory;
    private String bookStatus;
    private String bookPhotoName;
    private String userEmail;

    public BookDetails() {
    }

    public BookDetails(int bookId) {
        this.bookId = bookId;
    }

    public BookDetails(int bookId, String bookName, String bookAuthor, Double bookPrice, String bookCategory, String bookStatus, String bookPhotoName, String userEmail) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.bookPrice = bookPrice;
        this.bookCategory = bookCategory;
        this.bookStatus = bookStatus;
        this.bookPhotoName = bookPhotoName;
        this.userEmail = userEmail;
    }
    

    public BookDetails(String bookName, String bookAuthor, Double bookPrice, String bookCategory, String bookStatus, String bookPhotoName) {
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.bookPrice = bookPrice;
        this.bookCategory = bookCategory;
        this.bookStatus = bookStatus;
        this.bookPhotoName = bookPhotoName;
    }

    public BookDetails(String bookName, String bookAuthor, Double bookPrice, String bookCategory, String bookStatus, String bookPhotoName, String userEmail) {
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.bookPrice = bookPrice;
        this.bookCategory = bookCategory;
        this.bookStatus = bookStatus;
        this.bookPhotoName = bookPhotoName;
        this.userEmail = userEmail;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public Double getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(Double bookPrice) {
        this.bookPrice = bookPrice;
    }

    public String getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(String bookCategory) {
        this.bookCategory = bookCategory;
    }

    public String getBookStatus() {
        return bookStatus;
    }

    public void setBookStatus(String bookStatus) {
        this.bookStatus = bookStatus;
    }

    public String getBookPhotoName() {
        return bookPhotoName;
    }

    public void setBookPhotoName(String bookPhotoName) {
        this.bookPhotoName = bookPhotoName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
    
    
}
