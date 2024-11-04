/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author KEISHA
 */
public class Status_Order {

    /**
     *
     * @author KEISHA
     */
    public static final int PENDING = 1;
    public static final int CONFIRMED = 2;
    public static final int SHIPPING = 3;
    public static final int COMPLETED = 4;
    public static final int CANCELLED = 5;
    public static final int CANCEL_REQUEST = 6;

    // Map to store allowed transitions
    private static final Map<Integer, Set<Integer>> statusTransitionMap = new HashMap<>();

    static {
        // Define transitions for each status
        statusTransitionMap.put(PENDING, Set.of(CONFIRMED, CANCELLED, CANCEL_REQUEST));
        statusTransitionMap.put(CONFIRMED, Set.of(SHIPPING, CANCELLED));
        statusTransitionMap.put(SHIPPING, Set.of(COMPLETED, CANCELLED));
        statusTransitionMap.put(COMPLETED, Collections.emptySet());  // No transitions allowed
        statusTransitionMap.put(CANCELLED, Collections.emptySet());  // No transitions allowed
        statusTransitionMap.put(CANCEL_REQUEST, Set.of(CANCELLED));
    }

    private int status_id;
    private String status_name;
    private ArrayList<Order> orders = new ArrayList<>();

    public Status_Order() {
    }

    public Status_Order(int status_id, String status_name) {
        this.status_id = status_id;
        this.status_name = status_name;
    }

    public int getStatus_id() {
        return status_id;
    }

    public void setStatus_id(int status_id) {
        this.status_id = status_id;
    }

    public String getStatus_name() {
        if (status_name != null) {
            return status_name.trim();
        }
        return status_name;
    }

    public String getStatus_name_vn() {
        if (status_name == null) {
            return null;
        }
        switch (status_name.trim()) {
            case "Pending":
                return "Đang Chờ...";
            case "Cancelled":
                return "Đã Huỷ";
            case "CancelRequest":
                return "Yêu Cầu Huỷ";
            case "Completed":
                return "Hoàn Thành";
            case "Shipping":
                return "Đang Vận Chuyển";
            case "Confirmed":
                return "Đã Xác Nhận";
        }
        return status_name.trim();
    }

    public void setStatus_name(String status_name) {
        this.status_name = status_name;
    }

    public ArrayList<Order> getOrders() {
        return orders;
    }

    public void setOrders(ArrayList<Order> orders) {
        this.orders = orders;
    }

    @Override
    public String toString() {
        return "Status_Order{" + "status_id=" + status_id + ", status_name=" + status_name + ", orders=" + orders + '}';
    }

    // Method to check if a status transition is allowed
    public static boolean canTransition(int currentStatus, int newStatus, boolean isUser) {
        // Users can only update to CancelRequest
        if (isUser && newStatus != CANCEL_REQUEST) {
            return false;
        }
        // Only sellers can update to Cancelled
        if (!isUser && newStatus == CANCEL_REQUEST) {
            return false;
        }

        // Check if the new status is in the allowed transitions for the current status
        return statusTransitionMap.getOrDefault(currentStatus, Collections.emptySet()).contains(newStatus);
    }
}
