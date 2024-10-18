/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import jakarta.servlet.http.HttpServletRequest;

/**
 *
 * @author Anonymous
 */
public class RequestHelper {

    public static Integer getIntParameterWithDefault(String parameter, Integer defaultValue, HttpServletRequest request) {
        Integer page = defaultValue;
        try {
            page = Integer.parseInt(request.getParameter(parameter));
        } catch (Exception ex) {
            //do nothing
        }
        return page;
    }
}
