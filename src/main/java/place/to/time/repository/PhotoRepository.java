package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import place.to.time.model.Photo;

import java.util.List;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
 */
public interface PhotoRepository extends JpaRepository<Photo, Long> {

    List<Photo> findPhotoByNoteId(long noteId);
}
