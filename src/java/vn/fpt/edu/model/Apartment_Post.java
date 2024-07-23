/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.model;

import java.sql.Date;

/**
 *
 * @author thinh
 */
public class Apartment_Post {
    private int id;
    private String title;
    private String description;
    private int post_status;
    private Date post_start,post_end;
    private Apartment apartment_id;
    private Payment_method payment_id;
    private User landlord_id;
    private String first_image;
    private String city,district,commune;
    private double area;
    private int number_of_bedroom;
    private String apartment_name;
    private double price;
    private Apartment_type apartment_type;
    private int total_image;
    private double paid_for_post;
    private int week;

    public Apartment_Post() {
    }

    public Apartment_Post(int id, String title, String description, int post_status, Date post_start, Date post_end, Apartment apartment_id, Payment_method payment_id, User landlord_id, String first_image, String city, String district, String commune, double area, int number_of_bedroom, String apartment_name, double price, Apartment_type apartment_type, int total_image, double paid_for_post, int week) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.post_status = post_status;
        this.post_start = post_start;
        this.post_end = post_end;
        this.apartment_id = apartment_id;
        this.payment_id = payment_id;
        this.landlord_id = landlord_id;
        this.first_image = first_image;
        this.city = city;
        this.district = district;
        this.commune = commune;
        this.area = area;
        this.number_of_bedroom = number_of_bedroom;
        this.apartment_name = apartment_name;
        this.price = price;
        this.apartment_type = apartment_type;
        this.total_image = total_image;
        this.paid_for_post = paid_for_post;
        this.week = week;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public String getFirst_image() {
        return first_image;
    }

    public void setFirst_image(String first_image) {
        this.first_image = first_image;
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

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public int getNumber_of_bedroom() {
        return number_of_bedroom;
    }

    public void setNumber_of_bedroom(int number_of_bedroom) {
        this.number_of_bedroom = number_of_bedroom;
    }

    public String getApartment_name() {
        return apartment_name;
    }

    public void setApartment_name(String apartment_name) {
        this.apartment_name = apartment_name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Apartment_type getApartment_type() {
        return apartment_type;
    }

    public void setApartment_type(Apartment_type apartment_type) {
        this.apartment_type = apartment_type;
    }

    public int getTotal_image() {
        return total_image;
    }

    public void setTotal_image(int total_image) {
        this.total_image = total_image;
    }

    public double getPaid_for_post() {
        return paid_for_post;
    }

    public void setPaid_for_post(double paid_for_post) {
        this.paid_for_post = paid_for_post;
    }

    public int getWeek() {
        return week;
    }

    public void setWeek(int week) {
        this.week = week;
    }

    @Override
    public String toString() {
        return "Apartment_Post{" + "id=" + id + ", title=" + title + ", description=" + description + ", post_status=" + post_status + ", post_start=" + post_start + ", post_end=" + post_end + ", apartment_id=" + apartment_id + ", payment_id=" + payment_id + ", landlord_id=" + landlord_id + ", first_image=" + first_image + ", city=" + city + ", district=" + district + ", commune=" + commune + ", area=" + area + ", number_of_bedroom=" + number_of_bedroom + ", apartment_name=" + apartment_name + ", price=" + price + ", apartment_type=" + apartment_type + ", total_image=" + total_image + ", paid_for_post=" + paid_for_post + ", week=" + week + '}';
    }
    
    

}