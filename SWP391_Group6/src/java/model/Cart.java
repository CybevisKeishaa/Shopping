package model;

import model.Customer_User;
import java.util.ArrayList;

public class Cart {

    private int cart_id;
    private Customer_User customer;
    private ArrayList<Item> items = new ArrayList<>();

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public Customer_User getCustomer() {
        return customer;
    }

    public void setCustomer(Customer_User customer) {
        this.customer = customer;
    }

    

    public ArrayList<Item> getItems() {
        return items;
    }

    public void setItems(ArrayList<Item> items) {
        this.items = items;
    }

}
