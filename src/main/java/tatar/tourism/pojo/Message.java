package tatar.tourism.pojo;


import java.util.Date;

/**
 * Created by habar on 29.10.2016.
 */
public class Message {

    private int message_ID = -1;
    private String sender;
    private String receiver;
    private Date date;



    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }




    private String message;

    public int getMessage_ID() {
        return message_ID;
    }

    public void setMessage_ID(int message_ID) {
        this.message_ID = message_ID;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
