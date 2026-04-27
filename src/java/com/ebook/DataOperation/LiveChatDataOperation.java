/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.DataOperation;
import com.ebook.Entity.LiveChat;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.ebook.Entity.LiveChat;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author suraj
 */
public class LiveChatDataOperation {
    
    private Connection con;

    public LiveChatDataOperation(Connection con) {
        this.con = con;
    }
    
       public boolean messagestore(LiveChat message){
        
        boolean insert=false;
        
        try {
            
            String query="INSERT INTO chat_messages(registerId,senderRole,message) VALUES(?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setInt(1,message.getRegisterId());
            pstmt.setString(2, message.getSenderRole());
            pstmt.setString(3, message.getMessage());
           
        int row=  pstmt.executeUpdate();
         if(row>0){
            insert= true;
         }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return insert;
    }
       
       public List<LiveChat> GetAllUserList() {
    List<LiveChat> userList = new ArrayList<>();
    try {
        String query = "SELECT DISTINCT registerId FROM chat_messages";
        PreparedStatement pstmt = con.prepareStatement(query);
        ResultSet set = pstmt.executeQuery();

        while (set.next()) {
            LiveChat user = new LiveChat();
            user.setRegisterId(set.getInt("registerId"));
            userList.add(user);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return userList;
}
            public List<LiveChat> chatListByRegisterIdAndRole(int registerId,String SenderRole) {
    List<LiveChat> chatList = new ArrayList<>();
    
    try {
        String query = "SELECT *  FROM chat_messages WHERE registerId=? AND SenderRole=?";
        PreparedStatement pstmt = con.prepareStatement(query);
         pstmt.setInt(1,registerId);
          pstmt.setString(1,SenderRole);
        ResultSet set = pstmt.executeQuery();

        while (set.next()) {
            LiveChat user = new LiveChat();
            user.setRegisterId(set.getInt("registerId"));
            user.setSenderRole(set.getString("senderRole"));
            user.setMessage(set.getString("Message"));
            user.setChatDate(set.getTimestamp("chatDate"));
            chatList.add(user);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return chatList;
}
     public List<LiveChat> chatListByRegisterId(int registerId ) {
    List<LiveChat> chatList = new ArrayList<>();
    
    try {
        String query = "SELECT *  FROM chat_messages WHERE registerId=? ORDER BY chatId ASC";
        PreparedStatement pstmt = con.prepareStatement(query);
         pstmt.setInt(1,registerId);
        ResultSet set = pstmt.executeQuery();

        while (set.next()) {
            LiveChat user = new LiveChat();
            user.setRegisterId(set.getInt("registerId"));
            user.setSenderRole(set.getString("senderRole"));
            user.setMessage(set.getString("Message"));
            user.setChatDate(set.getTimestamp("chatDate"));
            chatList.add(user);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return chatList;
}
    
}
