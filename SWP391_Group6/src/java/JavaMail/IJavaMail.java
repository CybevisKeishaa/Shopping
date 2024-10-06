/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package JavaMail;

/**
 *
 * @author KEISHA
 */
public interface IJavaMail {
    
    boolean send(String sendT, String topic, String message, String verificationCode);
}
