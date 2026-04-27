package com.ebook.DataOperation;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DeleteBookDataOperation {
    private Connection con;

    public DeleteBookDataOperation(Connection con) {
        this.con = con;
    }

    public boolean deleteBookById(int bookId) {
        boolean deleted = false;
        try {
            String query = "DELETE FROM bookdetails WHERE bookId = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, bookId);
            deleted = pstmt.executeUpdate() == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return deleted;
    }
}
