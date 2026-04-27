/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.DataOperation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.ebook.Entity.UserRegistration;

import java.sql.ResultSet;

/**
 *
 * @author suraj
 */
public class UserRegistrationDataOperation {

   
    
       private  Connection con;

    public UserRegistrationDataOperation(Connection con) {
        this.con = con;
    }
       
        //student registration start
    public boolean registerUser(UserRegistration user){
        
        boolean register=false;
        
        try {
            
            String query="INSERT INTO registereduser(userName,userEmail,userMobile,userPasward) VALUES(?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,user.getUserName() );
            pstmt.setString(2, user.getUserEmail());
            pstmt.setString(3, user.getUserMobile());
            pstmt.setString(4, user.getUserPassword());
            
          pstmt.executeUpdate();
         
            register= true;
        
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return register;
    }
    
    
    //student registration stop
    
    //get user details by email start

    /**
     *
     * @param userEmail
     * @return
     */
    public UserRegistration getUserDetailsByUserEmail(String userEmail)
    {
        UserRegistration email=null;
        try {
            String query = "SELECT * FROM registereduser WHERE userEmail=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, userEmail);
            ResultSet set =  pstmt.executeQuery();
            if (set.next()){
                email=new UserRegistration();
                int registerId=set.getInt("registerId");
                email.setRegisterId(registerId);
                email.setUserEmail(set.getString("userEmail"));
                email.setUserMobile(set.getString("userMobile"));
                email.setUserName(set.getString("userName"));
                email.setUserPassword(set.getString("userPasward"));
                email.setUserRegisterDate(set.getTimestamp("userRegisterDate"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return email;
    }
    //get user details by email stop
    //get user details by email and pasward start
    
    public UserRegistration getUserDetailsByUserEmailandUserPasward(String userEmail,String userPasward){
        UserRegistration number=null;
        try {
            String query = "SELECT * FROM registereduser WHERE userEmail=? AND userPasward=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, userEmail);
            pstmt.setString(2, userPasward);
            
            ResultSet set =  pstmt.executeQuery();
            if (set.next()){
                number=new UserRegistration();
                int registerId=set.getInt("registerId");
                number.setRegisterId(registerId);
                number.setUserEmail(set.getString("userEmail"));
                number.setUserMobile(set.getString("userMobile"));
                number.setUserName(set.getString("userName"));
                number.setUserPassword(set.getString("userPasward"));
                number.setUserRegisterDate(set.getTimestamp("userRegisterDate"));
                number.setUserPhotoName(set.getString("userPhotoName"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return number;
    }
    //get user details by email and pasward end
    //get user detail by userMobile
     public UserRegistration getUserDetailsByUserMobile(String userMobile)
    {
        UserRegistration user=null;
        try {
            String query = "SELECT * FROM registereduser WHERE userMobile=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, userMobile);
            ResultSet set =  pstmt.executeQuery();
            if (set.next()){
                user=new UserRegistration();
                int registerId=set.getInt("registerId");
                user.setRegisterId(registerId);
                user.setUserEmail(set.getString("userEmail"));
                user.setUserMobile(set.getString("userMobile"));
                user.setUserName(set.getString("userName"));
                user.setUserPassword(set.getString("userPasward"));
                user.setUserRegisterDate(set.getTimestamp("userRegisterDate"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
      public boolean UpdateUserProfile(UserRegistration user){
        boolean update=false;
        try {
            
            String query="UPDATE  registereduser SET userName=?,userMobile=?,userPhotoName=? WHERE userEmail=? AND registerId=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,user.getUserName());
            pstmt.setString(2, user.getUserMobile());
            pstmt.setString(3,user.getUserPhotoName());
            pstmt.setString(4, user.getUserEmail());
            pstmt.setInt(5, user.getRegisterId());
          
            
          int updatedRow=  pstmt.executeUpdate();
            if(updatedRow>0)
            {update= true;}
        } catch (Exception e) {
            e.printStackTrace();
        }
        return update;
    }
    //get user detail by mobile end
}
