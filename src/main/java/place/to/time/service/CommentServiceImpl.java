package place.to.time.service;

import org.springframework.beans.factory.annotation.Autowired;
import place.to.time.model.Comment;
import place.to.time.repository.CommentRepository;

import java.util.List;

/**
 * Created by ENTITY on 3/24/2017.
 */
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentRepository commentRepository;

    @Override
    public List<Comment> findCommentByNoteId(long noteId) {

        return commentRepository.findCommentByNoteId(noteId);
    }

    @Override
    public void save(Comment comment) {
        commentRepository.save(comment);

    }

    @Override
    public void delete(long id) {
        commentRepository.delete(id);

    }

    @Override
    public void delete(Comment comment) {
        commentRepository.delete(comment);
    }

    @Override
    public long[] getIdMassive(long noteId) {
        List<Comment> commentList = findCommentByNoteId(noteId);
        int i = commentList.size();
        long [] result = new long[i];
        for(int t = 0; t < result.length; t++){result[t] = commentList.get(t).getId();}
        return result;
    }
}
