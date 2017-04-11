package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import place.to.time.model.Photo;

import java.util.List;

/**
 * Created by ENTITY on 3/3/2017.
 */
public interface PhotoRepository extends JpaRepository<Photo, Long> {

    List<Photo> findPhotoByNoteId(long noteId);

}
