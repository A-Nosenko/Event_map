package place.to.time.service;

import place.to.time.model.Comment;

import java.util.List;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
public interface CommentService {

    long commentCounter(long noteId);

    List<Comment> findCommentByNoteId(long noteId);

    void save(Comment comment);

    void delete(long id);

    void delete(Comment comment);

    long[] getIdMassive(long noteId);
}
