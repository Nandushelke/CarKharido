package com.carkharido.model;

public class Cars {
    private int Car_id;
    private String name;
    private String model;
    private double price;
    private byte[] image;

    public Cars(int Car_id, String name, String model, double price, byte[] image) {
        this.Car_id = Car_id;
        this.name = name;
        this.model = model;
        this.price = price;
        this.image = image;
    }

    @Override
    public String toString() {
        return "Cars [car_id=" + Car_id + ", name=" + name + ", model=" + model + ", price=" + price + ", image=" + (image != null ? "exists" : "null") + "]";
    }

    public int getCar_id() {
        return Car_id;
    }

    public void setCar_id(int car_id) {
        this.Car_id = car_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double d) {
        this.price = d;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public Cars() {
    }
}
