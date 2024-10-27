/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import jakarta.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author Anonymous
 */
public class RequestHelper {

    public static Integer getIntParameterWithDefault(String parameter, Integer defaultValue, HttpServletRequest request) {
        Integer value = defaultValue;
        try {
            value = Integer.parseInt(request.getParameter(parameter));
        } catch (Exception ex) {
            //do nothing
        }
        return value;
    }

    public static Date getDateParameterWithDefault(String param, Date defaultValue, HttpServletRequest request) {
        try {
            return Date.valueOf(request.getParameter(param));
        } catch (Exception ex) {
            return defaultValue;
        }
    }

    public static Timestamp getTimeStampParameterWithDefault(String param, Timestamp defaultValue, HttpServletRequest request) {
        try {
            return Timestamp.valueOf(request.getParameter(param));
        } catch (Exception ex) {
            return defaultValue;
        }
    }

    public static String getStringParameterWithDefault(String parameter, String defaultValue, HttpServletRequest request) {
        String value = request.getParameter(parameter);
        return (value != null && !value.isEmpty()) ? value : defaultValue;
    }

    public static Boolean getCheckboxParameterWithDefault(String parameter, Object defaultValue, HttpServletRequest request) {
        String value = request.getParameter(parameter);
        return (value != null) ? value.equals("on") : (Boolean) defaultValue;
    }

    public static Boolean getBooleanWithDefault(String status, Object defaultValue, HttpServletRequest request) {
        String value = request.getParameter(status);
        return (value != null) ? value.equals("true") : (Boolean) defaultValue;
    }

}
