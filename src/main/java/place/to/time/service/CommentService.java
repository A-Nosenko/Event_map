package place.to.time.service;

import place.to.time.model.Comment;

import java.util.List;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
 */
public interface CommentService {

    long commentCounter(long noteId);
    List<Comment> findCommentByNoteId(long noteId);
    void save(Comment comment);
    void delete(long id);
    void delete(Comment comment);
    long[] getIdMassive(long noteId);
}
