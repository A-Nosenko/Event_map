package place.to.time.service;

import org.springframework.beans.factory.annotation.Autowired;
import place.to.time.application.LatLng;
import place.to.time.model.Note;
import place.to.time.repository.NoteRepository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ENTITY on 4/14/2017.
 */
public class LatLngServiceImpl implements LatLngService {

    @Autowired
    private NoteRepository noteRepository;

    @Override
    public List<LatLng> getLatLng() {
        List<Note> noteList = noteRepository.findAllNotes();
        List<LatLng> latLngList = new ArrayList();
        for (Note note : noteList){
            latLngList.add(new LatLng(note.getId(), note.getLatitude(), note.getLongitude(),note.getPlaceDescription() + " :: " + note.getAction()));
        }
        return latLngList;
    }
}
