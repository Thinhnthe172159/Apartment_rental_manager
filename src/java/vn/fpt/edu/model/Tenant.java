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
public class Tenant extends User{
    private int tenantId;
    private String civil_id;
    private String phone;

    public Tenant() {
    }

    public Tenant(int tenantId, String civil_id, String phone, int id, String email, String password, Role role_id, int status, String first_name, String last_name, Date dob, String image, double money) {
        super(id, email, password, role_id, status, first_name, last_name, dob, image, money);
        this.tenantId = tenantId;
        this.civil_id = civil_id;
        this.phone = phone;
    }

    public int getTenantId() {
        return tenantId;
    }

    public void setTenantId(int tenantId) {
        this.tenantId = tenantId;
    }

    public String getCivil_id() {
        return civil_id;
    }

    public void setCivil_id(String civil_id) {
        this.civil_id = civil_id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
}
