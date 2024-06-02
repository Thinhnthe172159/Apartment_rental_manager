/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author thinh
 */
public class Apartment_image extends Image {

    private Apartment Apartment_id;

    public Apartment_image() {
    }

    public Apartment_image(int id, String image, Apartment Apartment_id) {
        super(id, image);
        this.Apartment_id = Apartment_id;
    }

    public Apartment getApartment_id() {
        return Apartment_id;
    }

    public void setApartment_id(Apartment Apartment_id) {
        this.Apartment_id = Apartment_id;
    }

    @Override
    public String toString() {
        return super.toString() + " Apartment_image{" + "Apartment_id=" + Apartment_id.getId() + '}';
    }
    
    

}
