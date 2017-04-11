package place.to.time.service;

import org.springframework.beans.factory.annotation.Autowired;
import place.to.time.model.CommentPhoto;
import place.to.time.repository.CommentPhotoRepository;

import java.util.List;

/**
 * Created by ENTITY on 3/25/2017.
 */
public class CommentPhotoServiceImpl implements CommentPhotoService {

    @Autowired
    private CommentPhotoRepository commentPhotoRepository;

    @Override
    public byte[] findCommentPhoto(long id) {
        return commentPhotoRepository.findOne(id).getBody();
    }

    @Override
    public long[] getIdMassive(long commentId) {
        List<CommentPhoto> photoList = findCommentPhotoByCommentId(commentId);
        int i = photoList.size();
        long[] result = new long[i];
        for(int t = 0; t < result.length; t++ ){result[t] = photoList.get(t).getId();}
        return result;
    }

    @Override
    public List<CommentPhoto> findCommentPhotoByCommentId(long commentId) {
        return commentPhotoRepository.findPhotoByCommentId(commentId);
    }

    @Override
    public void save(CommentPhoto photo) {
        commentPhotoRepository.save(photo);
    }

    @Override
    public void delete(long id) {
        commentPhotoRepository.delete(id);
    }

    @Override
    public void delete(CommentPhoto photo) {
        commentPhotoRepository.delete(photo);
    }

    @Override
    public CommentPhoto getCommentPhoto(long id) {
        return commentPhotoRepository.getOne(id);
    }
}
