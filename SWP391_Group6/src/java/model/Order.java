package model;


import java.util.ArrayList;

import java.util.Date;

public class Order {

    private String firstProductName;  
    private int numberOfOtherProducts;
    private int order_id;
    private Customer_User customer;
    private int total_price;
    private Date create_at;
    private String status;
    private String payment_method;
    private String shipping_method;
    private ArrayList<OrderDetail> orderDetails = new ArrayList<>();

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public Customer_User getCustomer() {
        return customer;
    }

    public void setCustomer(Customer_User customer) {
        this.customer = customer;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }

    public Date getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public String getShipping_method() {
        return shipping_method;
    }

    public void setShipping_method(String shipping_method) {
        this.shipping_method = shipping_method;
    }

    public ArrayList<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(ArrayList<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }
    
    public String getFirstProductName() {
        return firstProductName;
    }

    public void setFirstProductName(String firstProductName) {
        this.firstProductName = firstProductName;
    }

    public int getNumberOfOtherProducts() {
        return numberOfOtherProducts;
    }

    public void setNumberOfOtherProducts(int numberOfOtherProducts) {
        this.numberOfOtherProducts = numberOfOtherProducts;
    }
}


