/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author KEISHA
 */
public class Status_Order {

    public static final int PENDING = 1;
    public static final int CONFIRMED = 2;
    public static final int SHIPPING = 3;
    public static final int COMPLETED = 4;
    public static final int CANCELLED = 5;
    public static final int CANCEL_REQUEST = 6;
    
    private int status_id;
    private String status_name;
    private ArrayList<Order> orders = new ArrayList<>();

    public Status_Order() {
    }

    public Status_Order(int status_id, String status_name) {
        this.status_id = status_id;
        this.status_name = status_name;
    }

    public int getStatus_id() {
        return status_id;
    }

    public void setStatus_id(int status_id) {
        this.status_id = status_id;
    }

    public String getStatus_name() {
        if (status_name != null) {
            return status_name.trim();
        }
        return status_name;
    }

    public void setStatus_name(String status_name) {
        this.status_name = status_name;
    }

    public ArrayList<Order> getOrders() {
        return orders;
    }

    public void setOrders(ArrayList<Order> orders) {
        this.orders = orders;
    }

    @Override
    public String toString() {
        return "Status_Order{" + "status_id=" + status_id + ", status_name=" + status_name + ", orders=" + orders + '}';
    }

    
}
