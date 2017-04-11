package place.to.time.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by ENTITY on 4/2/2017.
 */
@Entity
@Table(name = "messages")
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "userNameFrom")
    private String userNameFrom;

    @Column(name = "userNameTo")
    private String userNameTo;

    @Column(name = "message_time")
    private Timestamp messageTime;

    @Column(name = "message")
    private String messageText;

    public Message() {
    }

    public Message(String userNameFrom, String userNameTo, Timestamp messageTime, String messageText) {
        this.userNameFrom = userNameFrom;
        this.userNameTo = userNameTo;
        this.messageTime = messageTime;
        this.messageText = messageText;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUserNameFrom() {
        return userNameFrom;
    }

    public void setUserNameFrom(String userNameFrom) {
        this.userNameFrom = userNameFrom;
    }

    public String getUserNameTo() {
        return userNameTo;
    }

    public void setUserNameTo(String userNameTo) {
        this.userNameTo = userNameTo;
    }

    public Timestamp getMessageTime() {
        return messageTime;
    }

    public void setMessageTime(Timestamp messageTime) {
        this.messageTime = messageTime;
    }

    public String getMessageText() {
        return messageText;
    }

    public void setMessageText(String messageText) {
        this.messageText = messageText;
    }
}
