/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebook.WebSocket;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import javax.websocket.OnClose;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

/**
 *
 * @author suraj
 */
@ServerEndpoint("/wsreceiver")
public class ChatReceiverEndpoint {
    
    public static final Map<String,List<Session>> clients =new  ConcurrentHashMap<>();
    
    @OnOpen
    public void onOpen(Session session){
        String registerId=session.getQueryString().split("=")[1];
        clients.computeIfAbsent(registerId, k-> new CopyOnWriteArrayList<>());
        clients.get(registerId).add(session);
        
    }
    @OnClose
    public void onClose(Session session){
        clients.values().forEach(list-> list.remove(session));
        clients.entrySet().removeIf(entry-> entry.getValue().isEmpty());
    }
}
