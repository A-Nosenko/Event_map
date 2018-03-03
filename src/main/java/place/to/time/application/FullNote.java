package place.to.time.application;

import place.to.time.model.Note;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
public class FullNote {

    private long commentCount;
    private Note note;

    public long getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(long commentCount) {
        this.commentCount = commentCount;
    }

    public Note getNote() {
        return note;
    }

    public void setNote(Note note) {
        this.note = note;
    }

    public FullNote() {
    }

    public FullNote(long commentCount, Note note) {
        this.commentCount = commentCount;
        this.note = note;
    }
}
