package model;

import jakarta.persistence.*;
import Enum.*;
@Embeddable
public class Address {

    private City city;
    private Province province;
    private String village;
    private String latitude;
    private String longitude;

    public Address(){

    }

    public Address(City city, Province province, String village, String latitude, String longitude) {
        this.city = city;
        this.province = province;
        this.village = village;
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getState() {
        return village;
    }

    public void setState(String village) {
        this.village = village;
    }

    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }




}
