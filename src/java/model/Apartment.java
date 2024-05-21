/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

import model.Payment_method;

/**
 *
 * @author thinh
 */
public class Apartment {
        private int id;
        private String name;
        private Apartment_type type_id;
        private String address;
        private String city;
        private String district;
        private String commune;
        private double price;
        private double area;
        private String title;
        private String description;
        private int number_of_bedroom;
        private Payment_method payment_type_for_post_id;
        private int status_apartment;
        private Date post_start;
        private Date post_end;
        private User landLord_id;
        private User tenant_id;

    public Apartment() {
    }

    public Apartment(int id, String name, Apartment_type type_id, String address, String city, String district, String commune, double price, double area, String title, String description, int number_of_bedroom, Payment_method payment_type_for_post_id, int status_apartment, Date post_start, Date post_end, User landLord_id, User tenant_id) {
        this.id = id;
        this.name = name;
        this.type_id = type_id;
        this.address = address;
        this.city = city;
        this.district = district;
        this.commune = commune;
        this.price = price;
        this.area = area;
        this.title = title;
        this.description = description;
        this.number_of_bedroom = number_of_bedroom;
        this.payment_type_for_post_id = payment_type_for_post_id;
        this.status_apartment = status_apartment;
        this.post_start = post_start;
        this.post_end = post_end;
        this.landLord_id = landLord_id;
        this.tenant_id = tenant_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Apartment_type getType_id() {
        return type_id;
    }

    public void setType_id(Apartment_type type_id) {
        this.type_id = type_id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCommune() {
        return commune;
    }

    public void setCommune(String commune) {
        this.commune = commune;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getNumber_of_bedroom() {
        return number_of_bedroom;
    }

    public void setNumber_of_bedroom(int number_of_bedroom) {
        this.number_of_bedroom = number_of_bedroom;
    }

    public Payment_method getPayment_type_for_post_id() {
        return payment_type_for_post_id;
    }

    public void setPayment_type_for_post_id(Payment_method payment_type_for_post_id) {
        this.payment_type_for_post_id = payment_type_for_post_id;
    }

    public int getStatus_apartment() {
        return status_apartment;
    }

    public void setStatus_apartment(int status_apartment) {
        this.status_apartment = status_apartment;
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

    public User getLandLord_id() {
        return landLord_id;
    }

    public void setLandLord_id(User landLord_id) {
        this.landLord_id = landLord_id;
    }

    public User getTenant_id() {
        return tenant_id;
    }

    public void setTenant_id(User tenant_id) {
        this.tenant_id = tenant_id;
    }

 

    
        
        
}
