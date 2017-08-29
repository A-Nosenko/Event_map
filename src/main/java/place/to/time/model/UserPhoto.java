package place.to.time.model;

import javax.persistence.*;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
 */
@Entity
@Table(name = "usersphoto")
public class UserPhoto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "body")
    private byte[] body;

    @Column(name = "userId")
    private long userId;

    public UserPhoto() {
    }

    public UserPhoto(String name, byte[] body, long userId) {
        this.name = name;
        this.body = body;
        this.userId = userId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public byte[] getBody() {
        return body;
    }

    public void setBody(byte[] body) {
        this.body = body;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }
}
