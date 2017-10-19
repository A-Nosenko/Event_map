package place.to.time.model;

import javax.persistence.*;

/**
 * Created by ENTITY on 10/19/2017.
 */
@Entity
@Table(name = "defaultphoto")
public class DefaultUserPhoto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "body")
    private byte[] body;

    public DefaultUserPhoto() {
    }

    public DefaultUserPhoto(String name, byte[] body) {
        this.name = name;
        this.body = body;
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
}
