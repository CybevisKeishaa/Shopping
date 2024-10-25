package model;

import java.util.ArrayList;

/**
 *
 * @author KEISHA
 */
public class OrderDetail {

    private int detail_id;
    private ArrayList<Product> products = new ArrayList<>();
    private int price_at_order;
    private int quantity;
    private Gender gender;
    private Brand brand;
    private Capacity capacity;
    private Order order;
    private Product product;

    public int getDetail_id() {
        return detail_id;
    }

    public void setDetail_id(int detail_id) {
        this.detail_id = detail_id;
    }

    public ArrayList<Product> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<Product> products) {
        this.products = products;
    }

    public int getPrice_at_order() {
        return price_at_order;
    }

    public void setPrice_at_order(int price_at_order) {
        this.price_at_order = price_at_order;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Capacity getCapacity() {
        return capacity;
    }

    public void setCapacity(Capacity capacity) {
        this.capacity = capacity;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

}
