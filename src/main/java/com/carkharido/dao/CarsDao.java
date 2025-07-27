package com.carkharido.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.carkharido.model.Cars;
import com.carkharido.model.Cart;

public class CarsDao {
	private Connection con;
	private  String query;
	private PreparedStatement pst;
	private ResultSet rs;
	public CarsDao(Connection con) {
		
		this.con = con;
	}
	public List<Cars> getAllcars(){
		List<Cars> cars=new ArrayList<Cars>();
		
		try {
			query= "select * from cars";
			pst= this.con.prepareStatement(query);
			rs= pst.executeQuery();
			while (rs.next()) {
                Cars row = new Cars();
                row.setCar_id(rs.getInt("Car_id"));
                row.setName(rs.getString("name"));
                row.setModel(rs.getString("model"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getBytes("image"));  // Handle image as byte array

                cars.add(row);
			   
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return cars;
	}
	
	public List<Cart> getCartCars(ArrayList<Cart> cartlist){
		List<Cart> Cars=new ArrayList<Cart>();
		
		try {
			if (cartlist.size()>0) {
				for(Cart item:cartlist) {
				query="select * from cars where Car_id=?";
				pst=this.con.prepareStatement(query);
				pst.setInt(1,item.getCar_id());
				rs= pst.executeQuery();
				while(rs.next()) {
					Cart row= new Cart();
					row.setCar_id(rs.getInt("Car_id"));
					row.setName(rs.getString("name"));
					row.setModel(rs.getString("model"));
					row.setPrice(rs.getDouble("price")*item.getQuantity()); 
					row.setQuantity(item.getQuantity());
					Cars.add(row);
					
				}
			}
			}
		} catch (Exception e) {
		System.out.println(e.getMessage());	
		}
		return Cars;
	}
	
	
	public Cars getSingleCar (int Car_id) {
		Cars row=null;
		
		try {
			query="select * from cars where car_id=?";
			pst= this.con.prepareStatement(query);
			pst.setInt(1, Car_id);
			rs=pst.executeQuery();
			
			
			while(rs.next()) {
				row = new Cars();
                row.setCar_id(rs.getInt("Car_id"));
                row.setName(rs.getString("name"));
                row.setModel(rs.getString("model"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getBytes("image"));  // Handle image as byte array
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return row;
		
	}
	
	public double getTotalCartPrice(ArrayList<Cart>cartlist) {
	double sum=0;
	
	try {
		if (cartlist.size()>0) {
			for(Cart item:cartlist) {
				query="select price from cars where Car_id=?";
				pst= this.con.prepareStatement(query);
				pst.setInt(1, item.getCar_id());
				rs= pst.executeQuery();
				
				while(rs.next()) {
					sum+=rs.getDouble("price")*item.getQuantity();
					
				}
			}
		}
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	return sum;
	}
}
