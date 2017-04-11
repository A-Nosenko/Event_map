package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import place.to.time.model.Comment;

import java.util.List;

/**
 * Created by ENTITY on 3/24/2017.
 */
public interface CommentRepository extends JpaRepository<Comment, Long> {
    List<Comment> findCommentByNoteId(long noteId);
    }
