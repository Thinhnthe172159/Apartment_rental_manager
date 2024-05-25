/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author thinh
 */
public class Apartment_room {
    private int id;
    private Apartment apartment_id;
    private Property property_id;

    public Apartment_room() {
    }

    public Apartment_room(int id, Apartment apartment_id, Property property_id) {
        this.id = id;
        this.apartment_id = apartment_id;
        this.property_id = property_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Apartment getApartment_id() {
        return apartment_id;
    }

    public void setApartment_id(Apartment apartment_id) {
        this.apartment_id = apartment_id;
    }

    public Property getProperty_id() {
        return property_id;
    }

    public void setProperty_id(Property property_id) {
        this.property_id = property_id;
    }


    
    
}
