package place.to.time.uploaders;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by ENTITY on 3/25/2017.
 */
public class CommentUploader {
    private List<MultipartFile> files;
    private String userName;
    private long noteId;
    private String comment;

    public CommentUploader() {
    }

    public CommentUploader(List<MultipartFile> files, String userName, long noteId, String comment) {
        this.files = files;
        this.userName = userName;
        this.noteId = noteId;
        this.comment = comment;
    }

    public List<MultipartFile> getFiles() {
        return files;
    }

    public void setFiles(List<MultipartFile> files) {
        this.files = files;
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
}
