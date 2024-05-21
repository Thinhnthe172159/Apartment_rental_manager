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
    private Room room_id;
    private int apartment_id;

    public Apartment_room() {
    }

    public Apartment_room(int id, Room room_id, int apartment_id) {
        this.id = id;
        this.room_id = room_id;
        this.apartment_id = apartment_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Room getRoom_id() {
        return room_id;
    }

    public void setRoom_id(Room room_id) {
        this.room_id = room_id;
    }

    public int getApartment_id() {
        return apartment_id;
    }

    public void setApartment_id(int apartment_id) {
        this.apartment_id = apartment_id;
    }
    
    
}
