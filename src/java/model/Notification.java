/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author thinh
 */
public class Notification {

    private int id;
    private User From_user_id;
    private User To_user_id;
    private String message;
    private String title;
    private int status;
    private LocalDateTime time;

    public Notification() {
    }

    public Notification(int id, User From_user_id, User To_user_id, String message, String title, int status, LocalDateTime time) {
        this.id = id;
        this.From_user_id = From_user_id;
        this.To_user_id = To_user_id;
        this.message = message;
        this.title = title;
        this.status = status;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getFrom_user_id() {
        return From_user_id;
    }

    public void setFrom_user_id(User From_user_id) {
        this.From_user_id = From_user_id;
    }

    public User getTo_user_id() {
        return To_user_id;
    }

    public void setTo_user_id(User To_user_id) {
        this.To_user_id = To_user_id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Notification{" + "id=" + id + ", From_user_id=" + From_user_id + ", To_user_id=" + To_user_id + ", message=" + message + ", title=" + title + ", status=" + status + ", time=" + time + '}';
    }
    
     
   
    
   
    

}
