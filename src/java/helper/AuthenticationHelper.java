/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import model.Employee;
import model.Role;

/**
 *
 * @author Anonymous
 */
public class AuthenticationHelper {

    public static final String CUSTOMER_ROLE = "Customer";
    public static final String MARKETER_ROLE = "Marketer";
    public static final String SALER_ROLE = "Saler";
    public static final String SALER_MANAGER_ROLE = "SaleManager";
    private static final String ADMIN_ROLE = "Admin";

    private static boolean isCorrectRole(Role role, String role_name) {
        return role.getRole_name().equals(role_name);
    }

    public static boolean isAdmin(Employee user) {
        return isCorrectRole(user.getRole(), ADMIN_ROLE);
    }

    public static boolean isSaler(Employee user) {
        return isCorrectRole(user.getRole(), SALER_ROLE);
    }

    public static boolean isMarketer(Employee user) {
        return isCorrectRole(user.getRole(), MARKETER_ROLE);
    }

    public static boolean isSaleManager(Employee user) {
        return isCorrectRole(user.getRole(), SALER_MANAGER_ROLE);
    }

    // if user.role not in roles return false
public static boolean isAllowedRole(Employee user, String... roles) {
        if (isCorrectRole(user.getRole(), ADMIN_ROLE)) {
            return true;
        }
        if (roles == null || roles.length == 0) {
            return false;
        }
        for (String role : roles) {
            if (!isCorrectRole(user.getRole(), role)) {
                return false;
            }
        }
        return true;
    }
}
