package place.to.time.service;

import org.springframework.beans.factory.annotation.Autowired;
import place.to.time.model.Photo;
import place.to.time.repository.PhotoRepository;
import java.util.List;

/**
 * Created by ENTITY on 3/10/2017.
 */


public class PhotoServiceImpl implements PhotoService {

    @Autowired
    private PhotoRepository photoRepository;

    @Override
    public void delete(long id) {
        photoRepository.delete(id);
    }

    @Override
    public void delete(Photo photo) {photoRepository.delete(photo); }

    @Override
    public void save(Photo photo) {
        photoRepository.save(photo);
    }

    @Override
    public List<Photo> findPhotoByNoteId(long noteId) {
        return photoRepository.findPhotoByNoteId(noteId);
    }

    public long[] getIdMassive(long noteId){
        List<Photo> photoList = findPhotoByNoteId(noteId);
        int i = photoList.size();
        long[] result = new long[i];
        for(int t = 0; t < result.length; t++ ){result[t] = photoList.get(t).getId();}
        return result;
    }

    @Override
    public List<Photo> findAllPhotos(){return photoRepository.findAll();}

    @Override
    public byte[] findPhoto(long id){
        return photoRepository.findOne(id).getBody();
    }

    @Override
    public Photo getPhoto(long id){return photoRepository.findOne(id);}
}
