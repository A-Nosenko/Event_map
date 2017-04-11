package place.to.time.service;

import place.to.time.model.UserPhoto;

/**
 * Created by ENTITY on 4/2/2017.
 */
public interface UserPhotoService {
    UserPhoto findUserPhotoByUserId(long id);
    byte[] findPhoto(long id);
    void save(UserPhoto photo);
    void delete(long id);
}
