package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import place.to.time.model.DefaultUserPhoto;

/**
 * Created by ENTITY on 10/19/2017.
 */
public interface DefaultUserPhotoRepository extends JpaRepository<DefaultUserPhoto, Long> {
}
