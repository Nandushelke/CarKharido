package com.carkharido.model;

public class Carsell {
    private String registerNumber;
    private String name;
    private String model;
    private String price;
    private String imagePath;

    // Default constructor
    public Carsell() {}

    // Parameterized constructor
    public Carsell(String registerNumber, String name, String model, String price, String imagePath) {
        this.registerNumber = registerNumber;
        this.name = name;
        this.model = model;
        this.price = price;
        this.imagePath = imagePath;
    }

    // Getters and Setters
    public String getRegisterNumber() {
        return registerNumber;
    }

    public void setRegisterNumber(String registerNumber) {
        this.registerNumber = registerNumber;
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    @Override
    public String toString() {
        return "Carsell{" +
                "registerNumber='" + registerNumber + '\'' +
                ", name='" + name + '\'' +
                ", model='" + model + '\'' +
                ", price='" + price + '\'' +
                ", imagePath='" + imagePath + '\'' +
                '}';
    }
}
