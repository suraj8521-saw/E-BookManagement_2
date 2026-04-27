/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.DataOperation;

import com.ebook.Entity.AdminRegistration;
import com.ebook.Entity.UserRegistration;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author suraj
 */
public class AdminRegistrationDataOperation {
    private  Connection con;

    public AdminRegistrationDataOperation(Connection con) {
        this.con = con;
    }
      public boolean registerAdmin(AdminRegistration adminRegistration){
        
        boolean register=false;
        
        try {
            
            String query="INSERT INTO registeredadmin(adminName,adminEmail,adminMobile,adminPasward) VALUES(?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,adminRegistration.getAdminName() );
            pstmt.setString(2, adminRegistration.getAdminEmail());
            pstmt.setString(3, adminRegistration.getAdminMobile());
            pstmt.setString(4, adminRegistration.getAdminPassword());
            
            pstmt.executeUpdate();
            register= true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return register;
    }
      public AdminRegistration getAdminDetailsByAdminEmailandAdminPasward(String adminEmail,String adminPasward){
        AdminRegistration admin=null;
        try {
            String query = "SELECT * FROM registeredadmin WHERE adminEmail=? AND adminPasward=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, adminEmail);
            pstmt.setString(2, adminPasward);
            
            ResultSet set =  pstmt.executeQuery();
            if (set.next()){
                admin=new AdminRegistration();
                int adminRegisterId=set.getInt("adminRegistrationId");
                admin.setAdminRegistrationId(adminRegisterId);
                admin.setAdminEmail(set.getString("adminEmail"));
                admin.setAdminMobile(set.getString("adminMobile"));
                admin.setAdminName(set.getString("adminName"));
                admin.setAdminPassword(set.getString("adminPasward"));
                admin.setAdminRegisterDate(set.getTimestamp("adminRegisterDate"));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }
       public AdminRegistration getAdminDetailsByAdminEmail(String adminEmail)
    {
        AdminRegistration admin=null;
        try {
            String query = "SELECT * FROM registeredadmin WHERE adminEmail=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, adminEmail);
            ResultSet set =  pstmt.executeQuery();
            if (set.next()){
               admin=new AdminRegistration();
                int adminRegisterId=set.getInt("adminRegistrationId");
                admin.setAdminRegistrationId(adminRegisterId);
                admin.setAdminEmail(set.getString("adminEmail"));
                admin.setAdminMobile(set.getString("adminMobile"));
                admin.setAdminName(set.getString("adminName"));
                admin.setAdminPassword(set.getString("adminPasward"));
                admin.setAdminRegisterDate(set.getTimestamp("adminRegisterDate"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }
}
