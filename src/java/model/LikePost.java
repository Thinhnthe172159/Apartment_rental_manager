/*  
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author thinh
 */
public class LikePost {
    private int id;
    private CommunityPost post_id;
    private User user_id;

    public LikePost() {
    }

    public LikePost(int id, CommunityPost post_id, User user_id) {
        this.id = id;
        this.post_id = post_id;
        this.user_id = user_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public CommunityPost getPost_id() {
        return post_id;
    }

    public void setPost_id(CommunityPost post_id) {
        this.post_id = post_id;
    }

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "LikePost{" + "id=" + id + ", post_id=" + post_id + ", user_id=" + user_id + '}';
    }
    
    
}
