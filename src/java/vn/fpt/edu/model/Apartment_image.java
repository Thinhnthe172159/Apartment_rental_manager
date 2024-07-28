/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.model;

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

  
    

}
