package model;

import java.util.ArrayList;


/**
 *
 * @author KEISHA
 */

public class Capacity {

    private int capacity_id;
    private int value;
    private ArrayList<Product> products = new ArrayList<>();

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
