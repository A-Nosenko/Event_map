package place.to.time.service;

import place.to.time.model.Note;
import java.util.List;

/**
 * Created by ENTITY on 3/10/2017.
 */
public interface NoteService {
    List<Note> findAllNotes();
    List<Note> findNotes(String pattern);
    List<Note> findNotesByUserName(String pattern);
    List<Note> findNotesByDate(String date);
    List<Note> findNotesByPlaceDescription(String pattern);
    List<Note> sortNotesByLoadTime ();
    void delete(long id);
    void save(Note note);
    Note findById(long id);
}
