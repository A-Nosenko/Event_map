package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import place.to.time.model.UserPhoto;

/**
 * Created by ENTITY on 4/2/2017.
 */
public interface UserPhotoRepository extends JpaRepository<UserPhoto, Long> {
    UserPhoto findUserPhotoByUserId(long id);
}
