package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import place.to.time.application.LatLng;
import place.to.time.model.Note;

import java.util.List;

/**
 * Created by ENTITY on 3/10/2017.
 */
public interface NoteRepository extends JpaRepository<Note, Long> {

    @Query("SELECT n FROM Note n ORDER BY n.date DESC ")
    List<Note> findAllNotes();

    @Query("SELECT n.id FROM Note n ORDER BY n.date DESC ")
    List<Long> findAllNotesId();

    @Query("SELECT n FROM Note n WHERE  n.action LIKE:pattern ORDER BY n.date DESC")
    List<Note> findNotes(@Param("pattern")String pattern);
    @Query("SELECT n FROM Note n WHERE n.userName LIKE :pattern ORDER BY n.date DESC")
    List<Note> findNotesByUserName(@Param("pattern")String pattern);
    @Query("SELECT n FROM Note n WHERE n.date = :date ORDER BY n.date DESC")
    List<Note> findNotesByDate(@Param("date")String date);
    @Query("SELECT n FROM Note n WHERE n.placeDescription LIKE :pattern ORDER BY n.date DESC")
    List<Note> findNotesByPlaceDescription(@Param("pattern")String pattern);
    @Query("SELECT n FROM Note n ORDER BY n.note_time DESC ")
    List<Note> sortNotesByLoadTime ();
    }
