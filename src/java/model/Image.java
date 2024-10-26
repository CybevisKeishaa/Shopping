package model;

import java.util.ArrayList;

/**
 *
 * @author KEISHA
 */
public class Image {

    private int img_id;
    private String img_url;
    private String img_name;

    private Feedback feedback;
    private ArrayList<Product> product = new ArrayList<>();
    private Slider slider;
    private ArrayList<Blog> blog = new ArrayList<>();

    public Image() {
    }

    public Image(int img_id, String img_url) {
        this.img_id = img_id;
        this.img_url = img_url;
    }

    public int getImg_id() {
        return img_id;
    }

    public void setImg_id(int img_id) {
        this.img_id = img_id;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public Feedback getFeedback() {
        return feedback;
    }

    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }

    public ArrayList<Product> getProduct() {
        return product;
    }

    public void setProduct(ArrayList<Product> product) {
        this.product = product;
    }

    public Slider getSlider() {
        return slider;
    }

    public void setSlider(Slider slider) {
        this.slider = slider;
    }

    public ArrayList<Blog> getBlog() {
        return blog;
    }

    public void setBlog(ArrayList<Blog> blog) {
        this.blog = blog;
    }

    public String getImg_name() {
        return img_name;
    }

    public void setImg_name(String img_name) {
        this.img_name = img_name;
    }

    
    @Override
    public String toString() {
        return "Image{" + "img_id=" + img_id + ", img_url=" + img_url + ", feedback=" + feedback + ", product=" + product + ", slider=" + slider + ", blog=" + blog + '}';
    }

}
