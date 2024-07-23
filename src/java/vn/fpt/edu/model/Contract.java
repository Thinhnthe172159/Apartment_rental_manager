package vn.fpt.edu.model;

import java.sql.Date;

public class Contract {

    private int id;
    private User tenant_id;
    private User landlord_id;
    private Apartment apartment_id;
    private int status;
    private String phone;
    private String full_name;
    private String email;
    private String city;
    private String district;
    private String commune;
    private String address;
    private String note;
    private String cccd;
    private String current_living;
    private String tenant_avatar;
    private String cccd_civil_card_front;
    private String cccd_civil_card_back;
    private Date dob;
    private Date cccd_receive_date;
    private String office_name;

    public Contract() {
    }

    public Contract(int id, User tenant_id, User landlord_id, Apartment apartment_id, int status, String phone, String full_name, String email, String city, String district, String commune, String address, String note, String cccd, String current_living, String tenant_avatar, String cccd_civil_card_front, String cccd_civil_card_back, Date dob, Date cccd_receive_date, String office_name) {
        this.id = id;
        this.tenant_id = tenant_id;
        this.landlord_id = landlord_id;
        this.apartment_id = apartment_id;
        this.status = status;
        this.phone = phone;
        this.full_name = full_name;
        this.email = email;
        this.city = city;
        this.district = district;
        this.commune = commune;
        this.address = address;
        this.note = note;
        this.cccd = cccd;
        this.current_living = current_living;
        this.tenant_avatar = tenant_avatar;
        this.cccd_civil_card_front = cccd_civil_card_front;
        this.cccd_civil_card_back = cccd_civil_card_back;
        this.dob = dob;
        this.cccd_receive_date = cccd_receive_date;
        this.office_name = office_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getTenant_id() {
        return tenant_id;
    }

    public void setTenant_id(User tenant_id) {
        this.tenant_id = tenant_id;
    }

    public User getLandlord_id() {
        return landlord_id;
    }

    public void setLandlord_id(User landlord_id) {
        this.landlord_id = landlord_id;
    }

    public Apartment getApartment_id() {
        return apartment_id;
    }

    public void setApartment_id(Apartment apartment_id) {
        this.apartment_id = apartment_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCccd() {
        return cccd;
    }

    public void setCccd(String cccd) {
        this.cccd = cccd;
    }

    public String getCurrent_living() {
        return current_living;
    }

    public void setCurrent_living(String current_living) {
        this.current_living = current_living;
    }

    public String getTenant_avatar() {
        return tenant_avatar;
    }

    public void setTenant_avatar(String tenant_avatar) {
        this.tenant_avatar = tenant_avatar;
    }

    public String getCccd_civil_card_front() {
        return cccd_civil_card_front;
    }

    public void setCccd_civil_card_front(String cccd_civil_card_front) {
        this.cccd_civil_card_front = cccd_civil_card_front;
    }

    public String getCccd_civil_card_back() {
        return cccd_civil_card_back;
    }

    public void setCccd_civil_card_back(String cccd_civil_card_back) {
        this.cccd_civil_card_back = cccd_civil_card_back;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Date getCccd_receive_date() {
        return cccd_receive_date;
    }

    public void setCccd_receive_date(Date cccd_receive_date) {
        this.cccd_receive_date = cccd_receive_date;
    }

    public String getOffice_name() {
        return office_name;
    }

    public void setOffice_name(String office_name) {
        this.office_name = office_name;
    }
    
    

    @Override
    public String toString() {
        return "Contract{" + "id=" + id + ", tenant_id=" + tenant_id + ", landlord_id=" + landlord_id + ", apartment_id=" + apartment_id + ", status=" + status + ", phone=" + phone + ", full_name=" + full_name + ", email=" + email + ", city=" + city + ", district=" + district + ", commune=" + commune + ", address=" + address + ", note=" + note + ", cccd=" + cccd + ", current_living=" + current_living + ", tenant_avatar=" + tenant_avatar + ", cccd_civil_card_front=" + cccd_civil_card_front + ", cccd_civil_card_back=" + cccd_civil_card_back + ", dob=" + dob + ", cccd_receive_date=" + cccd_receive_date + ", office_name=" + office_name + '}';
    }

   
   

    
    
}
