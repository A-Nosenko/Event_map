package place.to.time.model;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;

/**
 * Created by ENTITY on 3/24/2017.
 */
@Entity
@Table(name = "comments")
public class Comment implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "userName")
    private String userName;

    @Column(name = "noteId")
    private long noteId;

    @Column(name = "comment")
    private String comment;

    @Column(name = "comment_time")
    private Timestamp time;

    public Comment() {
    }

    public Comment(String userName, long noteId, String comment) {
        this.userName = userName;
        this.noteId = noteId;
        this.comment = comment;
        this.time = new Timestamp(System.currentTimeMillis());
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public long getNoteId() {
        return noteId;
    }

    public void setNoteId(long noteId) {
        this.noteId = noteId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }
}
