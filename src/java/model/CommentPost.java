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
public class CommentPost {
    
    private int id;
    private String mesage;
    private User user_id;
    private CommunityPost post_id;
    private LocalDateTime time;

    public CommentPost() {
    }

    public CommentPost(int id, String mesage, User user_id, CommunityPost post_id, LocalDateTime time) {
        this.id = id;
        this.mesage = mesage;
        this.user_id = user_id;
        this.post_id = post_id;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMesage() {
        return mesage;
    }

    public void setMesage(String mesage) {
        this.mesage = mesage;
    }

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    public CommunityPost getPost_id() {
        return post_id;
    }

    public void setPost_id(CommunityPost post_id) {
        this.post_id = post_id;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "CommentPost{" + "id=" + id + ", mesage=" + mesage + ", user_id=" + user_id + ", post_id=" + post_id + ", time=" + time + '}';
    }
    
    


    
    
}
