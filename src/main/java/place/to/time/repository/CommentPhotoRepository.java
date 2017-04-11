package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import place.to.time.model.CommentPhoto;

import java.util.List;

/**
 * Created by ENTITY on 3/25/2017.
 */
public interface CommentPhotoRepository extends JpaRepository<CommentPhoto, Long> {
    List<CommentPhoto> findPhotoByCommentId(long commentId);
}
