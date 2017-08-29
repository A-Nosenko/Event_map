package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import place.to.time.model.UserPhoto;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
 */
public interface UserPhotoRepository extends JpaRepository<UserPhoto, Long> {
    UserPhoto findUserPhotoByUserId(long id);
}
