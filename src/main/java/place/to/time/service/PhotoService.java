package place.to.time.service;

import place.to.time.model.Photo;

import java.util.List;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
public interface PhotoService {
    byte[] findPhoto(long id);

    long[] getIdMassive(long noteId);

    List<Photo> findAllPhotos();

    List<Photo> findPhotoByNoteId(long noteId);

    void save(Photo photo);

    void delete(long id);

    void delete(Photo photo);

    Photo getPhoto(long id);
}
