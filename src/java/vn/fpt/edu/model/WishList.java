/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.model;

/**
 *
 * @author vumin
 */
public class WishList {
    private int id;
    private User user_id;
    private int Apartment_id;

    public WishList() {
    }

    public WishList(int id, User user_id, int Apartment_id) {
        this.id = id;
        this.user_id = user_id;
        this.Apartment_id = Apartment_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    public int getApartment_id() {
        return Apartment_id;
    }

    public void setApartment_id(int Apartment_id) {
        this.Apartment_id = Apartment_id;
    }

    @Override
    public String toString() {
        return "WishList{" + "id=" + id + ", user_id=" + user_id + ", Apartment_id=" + Apartment_id + '}';
    }
    
    
}
