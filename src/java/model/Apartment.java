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
    private int number_of_bedroom;
    private int status_apartment;
    private User landLord_id;
    private User tenant_id;

    public Apartment() {
    }

    public Apartment(int id, String name, Apartment_type type_id, String address, String city, String district, String commune, double price, double area, int number_of_bedroom, int status_apartment, User landLord_id, User tenant_id) {
        this.id = id;
        this.name = name;
        this.type_id = type_id;
        this.address = address;
        this.city = city;
        this.district = district;
        this.commune = commune;
        this.price = price;
        this.area = area;
        this.number_of_bedroom = number_of_bedroom;
        this.status_apartment = status_apartment;
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

    public int getNumber_of_bedroom() {
        return number_of_bedroom;
    }

    public void setNumber_of_bedroom(int number_of_bedroom) {
        this.number_of_bedroom = number_of_bedroom;
    }

    public int getStatus_apartment() {
        return status_apartment;
    }

    public void setStatus_apartment(int status_apartment) {
        this.status_apartment = status_apartment;
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

    @Override
    public String toString() {
        return "Apartment{" + "id=" + id + ", name=" + name + ", type_id=" + type_id + ", address=" + address + ", city=" + city + ", district=" + district + ", commune=" + commune + ", price=" + price + ", area=" + area + ", number_of_bedroom=" + number_of_bedroom + ", status_apartment=" + status_apartment + ", landLord_id=" + landLord_id + ", tenant_id=" + tenant_id + '}';
    }

}
