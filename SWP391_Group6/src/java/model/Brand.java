package model;

import java.util.ArrayList;


/**
 *
 * @author KEISHA
 */

public class Brand {

    private int brand_id;
    private String name;
    private ArrayList<Product> products = new ArrayList<>();

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<Product> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<Product> products) {
        this.products = products;
    }

}
