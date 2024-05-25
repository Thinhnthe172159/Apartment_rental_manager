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
public class Apartment_Post {
    private int id;
    private String title;
    private String desciption;
    private int post_status;
    private Date post_start,post_end;
    private Apartment apartment_id;
    private Payment_method payment_id;
    private User landlord_id;

    public Apartment_Post() {
    }

    public Apartment_Post(int id, String title, String desciption, int post_status, Date post_start, Date post_end, Apartment apartment_id, Payment_method payment_id, User landlord_id) {
        this.id = id;
        this.title = title;
        this.desciption = desciption;
        this.post_status = post_status;
        this.post_start = post_start;
        this.post_end = post_end;
        this.apartment_id = apartment_id;
        this.payment_id = payment_id;
        this.landlord_id = landlord_id;
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

    public String getDesciption() {
        return desciption;
    }

    public void setDesciption(String desciption) {
        this.desciption = desciption;
    }

    public int getPost_status() {
        return post_status;
    }

    public void setPost_status(int post_status) {
        this.post_status = post_status;
    }

    public Date getPost_start() {
        return post_start;
    }

    public void setPost_start(Date post_start) {
        this.post_start = post_start;
    }

    public Date getPost_end() {
        return post_end;
    }

    public void setPost_end(Date post_end) {
        this.post_end = post_end;
    }

    public Apartment getApartment_id() {
        return apartment_id;
    }

    public void setApartment_id(Apartment apartment_id) {
        this.apartment_id = apartment_id;
    }

    public Payment_method getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(Payment_method payment_id) {
        this.payment_id = payment_id;
    }

    public User getLandlord_id() {
        return landlord_id;
    }

    public void setLandlord_id(User landlord_id) {
        this.landlord_id = landlord_id;
    }
    
    
}
