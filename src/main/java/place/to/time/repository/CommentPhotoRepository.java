package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import place.to.time.model.CommentPhoto;

import java.util.List;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
public interface CommentPhotoRepository extends JpaRepository<CommentPhoto, Long> {
    List<CommentPhoto> findPhotoByCommentId(long commentId);
}
