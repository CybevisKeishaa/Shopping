/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author DINH SON
 */
public class History {

    private int HistoryId;
    private String name;
    private Date date;
    private int stock;
    private int TotalPrice;
    private int importPrice;
    private ArrayList<Product> products = new ArrayList<>();
    
    public History() {
    }

    public History(int HistoryId, String name, Date date, int stock, int TotalPrice) {
        this.HistoryId = HistoryId;
        this.name = name;
        this.date = date;
        this.stock = stock;
        this.TotalPrice = TotalPrice;
    }

    public int getHistoryId() {
        return HistoryId;
    }

    public void setHistoryId(int HistoryId) {
        this.HistoryId = HistoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public int getImportPrice() {
        return importPrice;
    }

    public void setImportPrice(int importPrice) {
        this.importPrice = importPrice;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(int TotalPrice) {
        this.TotalPrice = TotalPrice;
    }

    public ArrayList<Product> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<Product> products) {
        this.products = products;
    }
    
}
