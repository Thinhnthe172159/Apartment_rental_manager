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
public class IncidentReport {
    private int id;
    private int tenant_id;
    private int landlord_id;
    private String context;
    private String image;
    private String status;
    private Date date;

    public IncidentReport() {
    }

    public IncidentReport(int id, int tenant_id, int landlord_id, String context, String image, String status, Date date) {
        this.id = id;
        this.tenant_id = tenant_id;
        this.landlord_id = landlord_id;
        this.context = context;
        this.image = image;
        this.status = status;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTenant_id() {
        return tenant_id;
    }

    public void setTenant_id(int tenant_id) {
        this.tenant_id = tenant_id;
    }

    public int getLandlord_id() {
        return landlord_id;
    }

    public void setLandlord_id(int landlord_id) {
        this.landlord_id = landlord_id;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Incident{" + "id=" + id + ", tenant_id=" + tenant_id + ", landlord_id=" + landlord_id + ", context=" + context + ", image=" + image + ", status=" + status + ", date=" + date + '}';
    }
    
    
    
}
