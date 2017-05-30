package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import place.to.time.model.Comment;

import java.util.List;

/**
 * Created by ENTITY on 3/24/2017.
 */
public interface CommentRepository extends JpaRepository<Comment, Long> {
    List<Comment> findCommentByNoteId(long noteId);

    @Query("SELECT COUNT (c) FROM Comment c WHERE c.noteId = :noteId")
    long findNumberOfCommentsByNoteId(@Param("noteId")long noteId);
    }
