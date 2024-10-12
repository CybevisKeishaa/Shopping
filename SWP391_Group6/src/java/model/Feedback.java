package model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author KEISHA
 */
public class Feedback {

    private int fb_id;
    private Date date;
    private String content;
    private int rating;
    private Product product;
    private Customer_User customer;
    private ArrayList<Image> images = new ArrayList<>();

    public int getFb_id() {
        return fb_id;
    }

    public void setFb_id(int fb_id) {
        this.fb_id = fb_id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Customer_User getCustomer() {
        return customer;
    }

    public void setCustomer(Customer_User customer) {
        this.customer = customer;
    }

    
    
    public ArrayList<Image> getImages() {
        return images;
    }

    public void setImages(ArrayList<Image> images) {
        this.images = images;
    }

}
