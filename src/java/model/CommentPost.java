/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author thinh
 */
public class CommentPost {
    
    private int id;
    private String massgee;
    private User user_id;
    private CommunityPost post_id;

    public CommentPost() {
    }

    public CommentPost(int id, String massgee, User user_id, CommunityPost post_id) {
        this.id = id;
        this.massgee = massgee;
        this.user_id = user_id;
        this.post_id = post_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMassgee() {
        return massgee;
    }

    public void setMassgee(String massgee) {
        this.massgee = massgee;
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

    @Override
    public String toString() {
        return "CommentPost{" + "id=" + id + ", massgee=" + massgee + ", user_id=" + user_id + ", post_id=" + post_id + '}';
    }
    
    
    
}
