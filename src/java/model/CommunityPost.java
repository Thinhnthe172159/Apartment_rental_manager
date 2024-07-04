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
    private String first_image;
    private int num_of_view;
    private int num_of_like;
    private int num_of_comment;

    public CommunityPost() {
    }

    public CommunityPost(int id, String title, String context, User user_id, Date time, String first_image, int num_of_view, int num_of_like, int num_of_comment) {
        this.id = id;
        this.title = title;
        this.context = context;
        this.user_id = user_id;
        this.time = time;
        this.first_image = first_image;
        this.num_of_view = num_of_view;
        this.num_of_like = num_of_like;
        this.num_of_comment = num_of_comment;
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

    public String getFirst_image() {
        return first_image;
    }

    public void setFirst_image(String first_image) {
        this.first_image = first_image;
    }

    public int getNum_of_view() {
        return num_of_view;
    }

    public void setNum_of_view(int num_of_view) {
        this.num_of_view = num_of_view;
    }

    public int getNum_of_like() {
        return num_of_like;
    }

    public void setNum_of_like(int num_of_like) {
        this.num_of_like = num_of_like;
    }

    public int getNum_of_comment() {
        return num_of_comment;
    }

    public void setNum_of_comment(int num_of_comment) {
        this.num_of_comment = num_of_comment;
    }

    @Override
    public String toString() {
        return "CommunityPost{" + "id=" + id + ", title=" + title + ", context=" + context + ", user_id=" + user_id + ", time=" + time + ", first_image=" + first_image + ", num_of_view=" + num_of_view + ", num_of_like=" + num_of_like + ", num_of_comment=" + num_of_comment + '}';
    }
    
    
    
      
    
    
    
    
    
    
   
    
    
    
    
   
 

    
    
    
    

}
