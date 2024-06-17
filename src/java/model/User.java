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
public class User {
    
    private int id;
    private String email;
    private String password;
    private Role role_id;
    private int status;
    private String first_name;
    private String last_name;
    private Date dob;
    private String image;
    private double money;

    public User() {
    }
    
    public User(String email, String password, Role role_id, int status, String first_name, String last_name, Date dob, String image, double money) {
        this.email = email;
        this.password = password;
        this.role_id = role_id;
        this.status = status;
        this.first_name = first_name;
        this.last_name = last_name;
        this.dob = dob;
        this.image = image;
        this.money = money;
    }

    public User(int id, String email, String password, Role role_id, int status, String first_name, String last_name, Date dob, String image, double money) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.role_id = role_id;
        this.status = status;
        this.first_name = first_name;
        this.last_name = last_name;
        this.dob = dob;
        this.image = image;
        this.money = money;
    }

    public User(int id, String email, String first_name, String last_name, Date dob, double money) {
        this.id = id;
        this.email = email;
        this.first_name = first_name;
        this.last_name = last_name;
        this.dob = dob;
        this.money = money;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole_id() {
        return role_id;
    }

    public void setRole_id(Role role_id) {
        this.role_id = role_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }
    

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", email=" + email + ", password=" + password + ", role_id=" + role_id + ", status=" + status + ", first_name=" + first_name + ", last_name=" + last_name + ", dob=" + dob + ", image=" + image + '}';
    }
    
    
    
}
