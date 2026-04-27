/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.DataOperation;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author suraj
 */
public class UpdateUserOrderBookStatusDataOperation {
    
    private Connection con;

    public UpdateUserOrderBookStatusDataOperation(Connection con) {
        this.con = con;
    }
    public boolean deleteBookByBookOrderedId(int bookOrderedId) {
        boolean deleted = false;
        try {
            String query = "UPDATE  userproductordered SET orderStatus=? WHERE bookOrderedId = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
             pstmt.setString(1, "Confirm");
            pstmt.setInt(2, bookOrderedId);
            deleted = pstmt.executeUpdate() == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return deleted;
    }
}
