package com.PineappleStore.WebSocket;

import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

@Component
@ServerEndpoint("/pay/{id}")
public class PayWebSocket {

    private static ConcurrentHashMap<String, Session> sessionMap = new ConcurrentHashMap<>();

    public static void sendPay(String orderId, String Msg) {

        try {
            Session session = sessionMap.get(orderId);
            session.getBasicRemote().sendText(Msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //建立链接就会执行此方法
    @OnOpen
    public void open(@PathParam("id") String orderId, Session session) {
        sessionMap.put(orderId, session);
    }

    //关闭链接就会执行此方法
    @OnClose
    public void close(@PathParam("id") String orderId) {
        sessionMap.remove(orderId);
    }

    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println("发生错误");
    }

    @OnMessage
    public void onMessage(String message) throws IOException {
        System.out.println(message);
    }

}
