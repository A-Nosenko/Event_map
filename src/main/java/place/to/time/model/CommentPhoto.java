package place.to.time.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
@Entity
@Table(name = "photoscomment")
public class CommentPhoto implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "body")
    private byte[] body;

    @Column(name = "commentId")
    private long commentId;

    public CommentPhoto() {
    }

    public CommentPhoto(String name, byte[] body, long commentId) {
        this.name = name;
        this.body = body;
        this.commentId = commentId;
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

    public long getCommentId() {
        return commentId;
    }

    public void setCommentId(long commentId) {
        this.commentId = commentId;
    }
}
