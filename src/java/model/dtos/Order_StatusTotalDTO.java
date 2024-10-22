/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dtos;

/**
 *
 * @author Anonymous
 */
public class Order_StatusTotalDTO {

    private String status = null;
    private double total = 0;

    public Order_StatusTotalDTO() {
    }

    public Order_StatusTotalDTO(String status, double total) {
        this.status = status;
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        StringBuilder jsonBuilder = new StringBuilder();
        jsonBuilder.append("{");
        jsonBuilder.append("\"status\":").append("\"").append(status).append("\"").append(", ");
        jsonBuilder.append("\"total\":").append(total);
        jsonBuilder.append("}");
        return jsonBuilder.toString();
    }

}
