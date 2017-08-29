package place.to.time.service;

import place.to.time.model.CommentPhoto;

import java.util.List;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
 */
public interface CommentPhotoService {

    byte[] findCommentPhoto(long id);
    long[] getIdMassive(long commentId);
    List<CommentPhoto> findCommentPhotoByCommentId(long commentId);
    void save(CommentPhoto photo);
    void delete(long id);
    void delete(CommentPhoto photo);
    CommentPhoto getCommentPhoto(long id);
}
