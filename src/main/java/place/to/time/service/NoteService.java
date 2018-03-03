package place.to.time.service;

import place.to.time.model.Note;

import java.util.List;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
public interface NoteService {
    List<Note> findAllNotes();

    List<Long> getIdlist();

    List<Note> findNotes(String pattern);

    List<Note> findNotesByUserName(String pattern);

    List<Note> findNotesByDate(String date);

    List<Note> findNotesByPlaceDescription(String pattern);

    List<Note> sortNotesByLoadTime();

    void delete(long id);

    void save(Note note);

    Note findById(long id);
}
