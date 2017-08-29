package place.to.time.service;

import place.to.time.model.UserPhoto;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
 */
public interface UserPhotoService {
    UserPhoto findUserPhotoByUserId(long id);
    byte[] findPhoto(long id);
    void save(UserPhoto photo);
    void delete(long id);
}
