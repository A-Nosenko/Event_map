package place.to.time.service;

import org.springframework.beans.factory.annotation.Autowired;
import place.to.time.model.DefaultUserPhoto;
import place.to.time.model.UserPhoto;
import place.to.time.repository.DefaultUserPhotoRepository;
import place.to.time.repository.UserPhotoRepository;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
 */
public class UserPhotoServiceImpl implements UserPhotoService {

    @Autowired
    private UserPhotoRepository userPhotoRepository;

    @Autowired
    private DefaultUserPhotoRepository defaultUserPhotoRepository;

    private final Long index = 1L;

    @Override
    public byte[] findPhoto(long id) {
        return userPhotoRepository.findUserPhotoByUserId(id).getBody();
    }

    @Override
    public void save(UserPhoto photo) {
        userPhotoRepository.save(photo);
    }

    @Override
    public void delete(long id) {
        userPhotoRepository.delete(id);
    }

    @Override
    public UserPhoto findUserPhotoByUserId(long id) {
        UserPhoto userPhoto = userPhotoRepository.findUserPhotoByUserId(id);
        if (userPhoto == null) {
            userPhoto = new UserPhoto();
            DefaultUserPhoto defaultUserPhoto = defaultUserPhotoRepository.findOne(index);
            userPhoto.setBody(defaultUserPhoto.getBody());
            userPhoto.setName(defaultUserPhoto.getName());
            userPhoto.setUserId(id);
        }
        return userPhoto;
    }
}
