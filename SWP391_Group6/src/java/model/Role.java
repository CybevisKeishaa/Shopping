package model;

import java.util.ArrayList;

public class Role {

    private int role_id;
    private String role_name;
    private ArrayList<Feature> features = new ArrayList<>();
    private ArrayList<Employee> emp_users = new ArrayList<>();
    private ArrayList<Customer_User> cus_users = new ArrayList<>();

    
    
    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    public ArrayList<Feature> getFeatures() {
        return features;
    }

    public void setFeatures(ArrayList<Feature> features) {
        this.features = features;
    }

    public ArrayList<Employee> getEmp_users() {
        return emp_users;
    }

    public void setEmp_users(ArrayList<Employee> emp_users) {
        this.emp_users = emp_users;
    }

    public ArrayList<Customer_User> getCus_users() {
        return cus_users;
    }

    public void setCus_users(ArrayList<Customer_User> cus_users) {
        this.cus_users = cus_users;
    }

    

}
