/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import model.Customer_User;
import model.Employee;
import model.Role;

/**
 *
 * @author Anonymous
 */
public class AuthenticationHelper {

    private static final String CUSTOMER_ROLE = "Customer";
    private static final String MARKETER_ROLE = "Marketer";
    private static final String SALER_ROLE = "Saler";
    private static final String ADMIN_ROLE = "Admin";

    private static boolean isCorrectRole(Role role, String role_name) {
        return role.getRole_name().equals(role_name);
    }

    public static boolean isEmployee(Customer_User user) {
        return user instanceof Employee;
    }

    public static boolean isAdmin(Customer_User user) {
        return isCorrectRole(user.getRole(), ADMIN_ROLE);
    }

    public static boolean isCustomer(Customer_User user) {
        return isCorrectRole(user.getRole(), CUSTOMER_ROLE);
    }

    public static boolean isSaler(Customer_User user) {
        return isCorrectRole(user.getRole(), SALER_ROLE);
    }

    public static boolean isMarketer(Customer_User user) {
        return isCorrectRole(user.getRole(), MARKETER_ROLE);

    }
}
