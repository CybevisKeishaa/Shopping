package model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author KEISHA
 */
public class Blog {

    private int blog_id;
    private String title;
    private String shortContent;
    private String content;
    private Date date;
    private Employee employee;
    private Boolean status;
    private ArrayList<Image> image = new ArrayList<>();

    public Blog() {
    }

    public Blog(int blog_id, String title, String shortContent, String content, Date date, Employee employee, Boolean status) {
        this.blog_id = blog_id;
        this.title = title;
        this.shortContent = shortContent;
        this.content = content;
        this.date = date;
        this.employee = employee;
        this.status = status;
    }

    public Blog(String title, String shortContent, String content, Boolean status) {
        this.title = title;
        this.shortContent = shortContent;
        this.content = content;
        this.status = status;
    }

    public int getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShortContent() {
        return shortContent;
    }

    public void setShortContent(String shortContent) {
        this.shortContent = shortContent;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public ArrayList<Image> getImage() {
        return image;
    }

    public void setImage(ArrayList<Image> image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Blog{" + "blog_id=" + blog_id + ", title=" + title + ", shortContent=" + shortContent + ", content="
                + content + ", date=" + date + ", employee=" + employee + ", status=" + status + ", image=" + image
                + '}';
    }
}
