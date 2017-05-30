package place.to.time.service;

import place.to.time.model.Comment;

import java.util.List;

/**
 * Created by ENTITY on 3/24/2017.
 */
public interface CommentService {

    long commentCounter(long noteId);
    List<Comment> findCommentByNoteId(long noteId);
    void save(Comment comment);
    void delete(long id);
    void delete(Comment comment);
    long[] getIdMassive(long noteId);
}
