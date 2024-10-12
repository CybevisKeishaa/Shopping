package model;

import java.util.ArrayList;

/**
 *
 * @author KEISHA
 */

public class Gender {

    private int gender_id;
    private String name;
    private ArrayList<Product> products = new ArrayList<>();

    public Gender(int gender_id, String name) {
        this.gender_id = gender_id;
        this.name = name;
    }

    public Gender() {
    }

    

    public int getGender_id() {
        return gender_id;
    }

    public void setGender_id(int gender_id) {
        this.gender_id = gender_id;
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
