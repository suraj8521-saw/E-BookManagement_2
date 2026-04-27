/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.Entity;

import java.sql.Timestamp;

/**
 *
 * @author suraj
 */
public class LiveChat {
    
    private int chatId;
    private int registerId;
    private String senderRole;
    private String message;
    private Timestamp chatDate;

    public LiveChat() {
    }

    public LiveChat(int chatId, int registerId, String senderRole, String message, Timestamp chatDate) {
        this.chatId = chatId;
        this.registerId = registerId;
        this.senderRole = senderRole;
        this.message = message;
        this.chatDate = chatDate;
    }

    public LiveChat(int registerId, String senderRole, String message) {
        this.registerId = registerId;
        this.senderRole = senderRole;
        this.message = message;
    }

    public int getChatId() {
        return chatId;
    }

    public void setChatId(int chatId) {
        this.chatId = chatId;
    }

    public int getRegisterId() {
        return registerId;
    }

    public void setRegisterId(int registerId) {
        this.registerId = registerId;
    }

    public String getSenderRole() {
        return senderRole;
    }

    public void setSenderRole(String senderRole) {
        this.senderRole = senderRole;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getChatDate() {
        return chatDate;
    }

    public void setChatDate(Timestamp chatDate) {
        this.chatDate = chatDate;
    }
    
    
}
