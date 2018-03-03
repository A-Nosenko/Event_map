package place.to.time.service;

import org.springframework.beans.factory.annotation.Autowired;
import place.to.time.model.Note;
import place.to.time.repository.NoteRepository;

import java.util.List;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
public class NoteServiceImpl implements NoteService {

    @Autowired
    private NoteRepository noteRepository;

    @Override
    public List<Note> findAllNotes() {
        return noteRepository.findAllNotes();
    }

    @Override
    public void save(Note note) {
        noteRepository.save(note);
    }

    @Override
    public void delete(long id) {
        noteRepository.delete(id);
    }

    @Override
    public Note findById(long id) {
        return noteRepository.findOne(id);
    }

    @Override
    public List<Note> findNotes(String pattern) {
        String p = "%" + pattern + "%";
        return noteRepository.findNotes(p);
    }

    @Override
    public List<Note> findNotesByUserName(String pattern) {
        String p = "%" + pattern + "%";
        return noteRepository.findNotesByUserName(p);
    }

    @Override
    public List<Note> findNotesByDate(String date) {
        return noteRepository.findNotesByDate(date);
    }

    @Override
    public List<Note> findNotesByPlaceDescription(String pattern) {
        String p = "%" + pattern + "%";
        return noteRepository.findNotesByPlaceDescription(p);
    }

    @Override
    public List<Note> sortNotesByLoadTime() {
        return noteRepository.sortNotesByLoadTime();
    }

    @Override
    public List<Long> getIdlist() {
        return noteRepository.findAllNotesId();
    }
}
