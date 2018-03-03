package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import place.to.time.model.UserPhoto;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
public interface UserPhotoRepository extends JpaRepository<UserPhoto, Long> {
    UserPhoto findUserPhotoByUserId(long id);
}
