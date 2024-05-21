/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author thinh
 */
public class Post_image extends Image{
    private CommunityPost post_id;

    public Post_image() {
    }

    public Post_image( int id, String image, CommunityPost post_id) {
        super(id, image);
        this.post_id = post_id;
    }

    public CommunityPost getPost_id() {
        return post_id;
    }

    public void setPost_id(CommunityPost post_id) {
        this.post_id = post_id;
    }

    
    
    
    
}
