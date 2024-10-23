package model;

import java.util.ArrayList;

/**
 *
 * @author KEISHA
 */
public class Capacity {

    private int capacity_id;
    private int value;
    private ArrayList<Product> products;
    private int stock;
    private int unit_price;

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(int unit_price) {
        this.unit_price = unit_price;
    }
    
    

    public Capacity() {
    }

    
    public Capacity(int capacity_id, int value) {
        this.capacity_id = capacity_id;
        this.value = value;
    }


    public int getCapacity_id() {
        return capacity_id;
    }

    public int getValue() {
        return value;
    }

    public ArrayList<Product> getProducts() {
        return products;
    }

    public void setCapacity_id(int capacity_id) {
        this.capacity_id = capacity_id;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public void setProducts(ArrayList<Product> products) {
        this.products = products;
    }

}
