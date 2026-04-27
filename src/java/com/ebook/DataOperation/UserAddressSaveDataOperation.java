/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.DataOperation;

import java.sql.Connection;
import com.ebook.Entity.UserAddressSave;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import com.ebook.Entity.UserAddressSave;
import java.sql.ResultSet;


/**
 *
 * @author suraj
 */
public class UserAddressSaveDataOperation {
    
    private Connection con;

    public UserAddressSaveDataOperation(Connection con) {
        this.con = con;
    }
    
      public boolean userAddressSave(UserAddressSave user){
        
        boolean addresssave=false;
        
        try {
            
            String query="INSERT INTO useraddress(userName,userMobile,userVilage,userLandmark,userDistrict,userPincode,userState,userEmail) VALUES(?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,user.getUserName() );
            pstmt.setString(2, user.getUserMobile());
            pstmt.setString(3, user.getUserVilage());
            pstmt.setString(4, user.getUserLandmark());
            pstmt.setString(5, user.getUserDistrict());
            pstmt.setString(6, user.getUserPincode());
            pstmt.setString(7, user.getUserState());
            pstmt.setString(8, user.getUserEmail());
            
            pstmt.executeUpdate();
            addresssave= true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return addresssave;
    }
        public List<UserAddressSave> getUserAddressByEmail(String userEmail ) {
    List<UserAddressSave> addressList = new ArrayList<>();
    try {
        String query = "SELECT * FROM useraddress WHERE userEmail=?";
        PreparedStatement pstmt = con.prepareStatement(query);
       pstmt.setString(1, userEmail);
        
        ResultSet set = pstmt.executeQuery();

        while (set.next()) {
            UserAddressSave address = new UserAddressSave();
            address.setUserName(set.getString("userName"));
            address.setUserMobile(set.getString("userMobile"));
            address.setUserVilage(set.getString("userVilage"));
            address.setUserLandmark(set.getString("userLandmark"));
            address.setUserDistrict(set.getString("userDistrict"));
            address.setUserPincode(set.getString("userPincode"));
            address.setUserState(set.getString("userState"));
            address.setUserEmail(set.getString("userEmail"));
            address.setUserAddressId(set.getInt("userAddressId"));
            addressList.add(address);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return addressList;
}
        public List<UserAddressSave> getUserAddressById(int userAddressId ) {
    List<UserAddressSave> addressList2 = new ArrayList<>();
    try {
        String query = "SELECT * FROM useraddress WHERE userAddressId=?";
        PreparedStatement pstmt = con.prepareStatement(query);
       pstmt.setInt(1, userAddressId);
        
        ResultSet set = pstmt.executeQuery();

        while (set.next()) {
            UserAddressSave address = new UserAddressSave();
            address.setUserName(set.getString("userName"));
            address.setUserMobile(set.getString("userMobile"));
            address.setUserVilage(set.getString("userVilage"));
            address.setUserLandmark(set.getString("userLandmark"));
            address.setUserDistrict(set.getString("userDistrict"));
            address.setUserPincode(set.getString("userPincode"));
            address.setUserState(set.getString("userState"));
            address.setUserEmail(set.getString("userEmail"));
            address.setUserAddressId(set.getInt("userAddressId"));
            addressList2.add(address);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return addressList2;
}
}
