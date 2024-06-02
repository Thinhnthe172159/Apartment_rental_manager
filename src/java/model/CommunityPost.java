/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author thinh
 */
public class CommunityPost {

    private int id;
    private String title;
    private String context;
    private User user_id;
    private Date time;

    public CommunityPost() {
    }

    public CommunityPost(int id, String title, String context, User user_id, Date time) {
        this.id = id;
        this.title = title;
        this.context = context;
        this.user_id = user_id;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "CommunityPost{" + "id=" + id + ", title=" + title + ", context=" + context + ", user_id=" + user_id + ", time=" + time + '}';
    }

    
   
 

    
    
    
    

}
