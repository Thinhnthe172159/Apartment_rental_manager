/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author thinh
 */
public class CommunityPost {

    private int id;
    private String title;
    private String context;
    private User user_id;

    public CommunityPost() {
    }

    public CommunityPost(int id, String title, String conetext, User user_id) {
        this.id = id;
        this.title = title;
        this.context = conetext;
        this.user_id = user_id;
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

    public String getConetext() {
        return context;
    }

    public void setConetext(String conetext) {
        this.context = conetext;
    }

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "CommunityPost{" + "id=" + id + ", title=" + title + ", conetext=" + context + ", user_id=" + user_id + '}';
    }

   
 

    
    
    
    

}
