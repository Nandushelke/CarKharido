package com.carkharido.model;

public class Book extends Cars {
  
	private int Booking_id;
	private int user_id;
	private int quantity;
	private String Booking_date;
	
	
	public Book() {}


	public Book(int Car_id, String name, String model, double price, byte[] image, int booking_id, int user_id,
			int quantity, String booking_date) {
		super(Car_id, name, model, price, image);
		Booking_id = booking_id;
		this.user_id = user_id;
		this.quantity = quantity;
		Booking_date = booking_date;
	}


	public int getBooking_id() {
		return Booking_id;
	}


	@Override
	public String toString() {
		return "Book [Booking_id=" + Booking_id + ", user_id=" + user_id + ", quantity=" + quantity + ", Booking_date="
				+ Booking_date + "]";
	}


	public void setBooking_id(int booking_id) {
		Booking_id = booking_id;
	}


	public int getUser_id() {
		return user_id;
	}


	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public String getBooking_date() {
		return Booking_date;
	}


	public void setBooking_date(String booking_date) {
		Booking_date = booking_date;
	}


	public Book(int Car_id, String name, String model, double price, byte[] image, int user_id, int quantity,
			String booking_date) {
		super(Car_id, name, model, price, image);
		this.user_id = user_id;
		this.quantity = quantity;
		Booking_date = booking_date;
	}
}
