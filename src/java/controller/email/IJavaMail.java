package controller.email;

public interface IJavaMail {

    boolean send(String sendTo, String topic, String message);
}
