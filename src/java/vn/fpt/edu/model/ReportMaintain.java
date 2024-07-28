/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.model;

import java.sql.Date;

/**
 *
 * @author ASUS
 */
public class ReportMaintain {
    private int id;
    private Apartment apartmentId;
    private User tenantId;
    private User landlordId;
    private String context;
    private String status;
    private Date datePost;
    private String image1;
    private String image2;
    private String image3;

    public ReportMaintain() {
    }

    public ReportMaintain(int id, Apartment apartmentId, User tenantId, User landlordId, String context, String status, Date datePost, String image1, String image2, String image3) {
        this.id = id;
        this.apartmentId = apartmentId;
        this.tenantId = tenantId;
        this.landlordId = landlordId;
        this.context = context;
        this.status = status;
        this.datePost = datePost;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
    }

    
    
    public ReportMaintain(Apartment apartmentId, User tenantId, User landlordId, String context, String status, Date datePost, String image1, String image2, String image3) {
        this.apartmentId = apartmentId;
        this.tenantId = tenantId;
        this.landlordId = landlordId;
        this.context = context;
        this.status = status;
        this.datePost = datePost;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public Apartment getApartmentId() {
        return apartmentId;
    }

    public void setApartmentId(Apartment apartmentId) {
        this.apartmentId = apartmentId;
    }

    public User getTenantId() {
        return tenantId;
    }

    public void setTenantId(User tenantId) {
        this.tenantId = tenantId;
    }

    public User getLandlordId() {
        return landlordId;
    }

    public void setLandlordId(User landlordId) {
        this.landlordId = landlordId;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDatePost() {
        return datePost;
    }

    public void setDatePost(Date datePost) {
        this.datePost = datePost;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }
}
