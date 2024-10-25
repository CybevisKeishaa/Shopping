package model;

import java.sql.Timestamp;
import java.util.ArrayList;

public class Order {

    private int order_id;
    private String firstProductName;
    private int numberOfOtherProducts;
    private Customer_User customer;
    private int total_price;

    private Timestamp create_at;
    private String payment_method;
    private Status_Order status;
    private Payment payment;
    private String shipping_method;
    private ArrayList<OrderDetail> orderDetails = new ArrayList<>();
    private int successOrders;
    private int cancelledOrders;
    private int pendingOrders;
    private double totalRevenue;
    private boolean paidStatus;
    private String note;
    private Address address;

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public boolean isPaidStatus() {
        return paidStatus;
    }

    public void setPaidStatus(boolean paidStatus) {
        this.paidStatus = paidStatus;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    // Các getter và setter
    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    // Getters and Setters for the new fields
    public int getSuccessOrders() {
        return successOrders;
    }

    public void setSuccessOrders(int successOrders) {
        this.successOrders = successOrders;
    }

    public int getCancelledOrders() {
        return cancelledOrders;
    }

    public void setCancelledOrders(int cancelledOrders) {
        this.cancelledOrders = cancelledOrders;
    }

    public int getPendingOrders() {
        return pendingOrders;
    }

    public void setPendingOrders(int pendingOrders) {
        this.pendingOrders = pendingOrders;
    }

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

    public Timestamp getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Timestamp create_at) {
        this.create_at = create_at;
    }

    public Status_Order getStatus() {
        return status;
    }

    public void setStatus(Status_Order status) {
        this.status = status;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
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

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public String getPaidStatus_str() {
        return this.paidStatus ? "Đã Trả Tiền" : "Chưa Trả Tiền";
    }

    @Override
    public String toString() {
        return "Order{" + "order_id=" + order_id + ", firstProductName=" + firstProductName + ", numberOfOtherProducts=" + numberOfOtherProducts + ", customer=" + customer + ", total_price=" + total_price + ", create_at=" + create_at + ", payment_method=" + payment_method + ", status=" + status + ", payment=" + payment + ", shipping_method=" + shipping_method + ", orderDetails=" + orderDetails + ", successOrders=" + successOrders + ", cancelledOrders=" + cancelledOrders + ", pendingOrders=" + pendingOrders + ", totalRevenue=" + totalRevenue + '}';
    }

}
