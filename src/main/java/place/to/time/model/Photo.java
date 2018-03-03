package place.to.time.model;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.IOException;
import java.io.Serializable;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
@Entity
@Table(name = "photos")
public class Photo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "body")
    private byte[] body;

    @Column(name = "noteId")
    private long noteId;

    public Photo(MultipartFile file, Note note) throws IOException {
        name = file.getOriginalFilename();
        body = file.getBytes();
        noteId = note.getId();
    }

    public Photo(String name, byte[] body, long noteId) {
        this.name = name;
        this.body = body;
        this.noteId = noteId;
    }

    public Photo() {
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

    public long getNoteId() {
        return noteId;
    }

    public void setNoteId(long noteId) {
        this.noteId = noteId;
    }
}
