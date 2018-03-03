package place.to.time.service;

import place.to.time.model.UserPhoto;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
public interface UserPhotoService {
    UserPhoto findUserPhotoByUserId(long id);

    byte[] findPhoto(long id);

    void save(UserPhoto photo);

    void delete(long id);
}
