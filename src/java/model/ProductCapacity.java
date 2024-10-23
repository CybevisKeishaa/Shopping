/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Anonymous
 */
public class ProductCapacity extends Capacity {

    private int product_id;
    private int unit_price;
    private int stock;

    public ProductCapacity(int product_id, int capacity_id, int unit_price, int stock, int value) {
        super(capacity_id, value);
        this.product_id = product_id;
        this.unit_price = unit_price;
        this.stock = stock;
    }

    public ProductCapacity() {
        super();
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(int unit_price) {
        this.unit_price = unit_price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    @Override
    public String toString() {
        return "ProductCapacity{" + "product_id=" + product_id + ", unit_price=" + unit_price + ", stock=" + stock + ", value=" + getValue() + '}';
    }

}
