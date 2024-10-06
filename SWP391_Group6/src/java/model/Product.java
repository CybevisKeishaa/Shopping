/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author KEISHA
 */
public class Product {
    private int product_id;
    private String name;
    private int price;
    private Date date;
    private int stock;
    private Discount discount;
    private Brand brand;
    private boolean status;
    private ArrayList<Capacity> capacity;
    private ArrayList<Gender> gender;
    private Employee_User emp;
    private ArrayList<Image> img;
    private ArrayList<Feedback> fb;
    private ArrayList<Item> items;
    private ArrayList<OrderDetail> orders;

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Discount getDiscount() {
        return discount;
    }

    public void setDiscount(Discount discount) {
        this.discount = discount;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public ArrayList<Capacity> getCapacity() {
        return capacity;
    }

    public void setCapacity(ArrayList<Capacity> capacity) {
        this.capacity = capacity;
    }

    public ArrayList<Gender> getGender() {
        return gender;
    }

    public void setGender(ArrayList<Gender> gender) {
        this.gender = gender;
    }

    public Employee_User getEmp() {
        return emp;
    }

    public void setEmp(Employee_User emp) {
        this.emp = emp;
    }

    public ArrayList<Image> getImg() {
        return img;
    }

    public void setImg(ArrayList<Image> img) {
        this.img = img;
    }

    public ArrayList<Feedback> getFb() {
        return fb;
    }

    public void setFb(ArrayList<Feedback> fb) {
        this.fb = fb;
    }

    public ArrayList<Item> getItems() {
        return items;
    }

    public void setItems(ArrayList<Item> items) {
        this.items = items;
    }

    public ArrayList<OrderDetail> getOrders() {
        return orders;
    }

    public void setOrders(ArrayList<OrderDetail> orders) {
        this.orders = orders;
    }
    
}
