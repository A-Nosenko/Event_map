package place.to.time.service;

import org.springframework.beans.factory.annotation.Autowired;
import place.to.time.model.UserPhoto;
import place.to.time.repository.UserPhotoRepository;

/**
 * Created by ENTITY on 4/2/2017.
 */
public class UserPhotoServiceImpl implements UserPhotoService {

    @Autowired
    private UserPhotoRepository userPhotoRepository;

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
        return userPhotoRepository.findUserPhotoByUserId(id);
    }
}
