package place.to.time.controllers;

/**
 * Created by ENTITY on 2/1/2017.
 */

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import place.to.time.application.FullNote;
import place.to.time.uploaders.NoteUploader;
import place.to.time.model.Note;
import place.to.time.model.Photo;
import place.to.time.service.*;
import org.springframework.web.servlet.ModelAndView;
import place.to.time.validation.PlaceValidator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;



@Controller
public class DataController {

    @Autowired
    private NoteService noteService;

    @Autowired
    private PhotoService photoService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private CommentPhotoService commentPhotoService;

    @RequestMapping(method = RequestMethod.GET, value = "/app")
    public ModelAndView app() {
        List<FullNote> fullNoteList = new ArrayList<>();
        List<Note> noteList = noteService.findAllNotes();
        for(Note note : noteList){
            fullNoteList.add(new FullNote(commentService.commentCounter(note.getId()), note));
        }

        ModelAndView modelAndView = new ModelAndView("app", "fullNoteList", fullNoteList);
        modelAndView.addObject("photos", photoService.findAllPhotos());
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/appSearch")
        public ModelAndView appSearch(@RequestParam(value="pattern")String pattern) {
        String finalPattern = pattern.replace(" ", "%");
        List<FullNote> fullNoteList = new ArrayList<>();
        List<Note> noteList = noteService.findNotes(finalPattern);
        for(Note note : noteList){
            fullNoteList.add(new FullNote(commentService.commentCounter(note.getId()), note));
        }

        ModelAndView modelAndView = new ModelAndView("app", "fullNoteList", fullNoteList);
        modelAndView.addObject("photos", photoService.findAllPhotos());
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/appSearchByLogin")
    public ModelAndView appSearchByLogin(@RequestParam(value="pattern")String pattern) {
        String finalPattern = pattern.replace(" ", "%");
        List<FullNote> fullNoteList = new ArrayList<>();
        List<Note> noteList = noteService.findNotesByUserName(finalPattern);
        for(Note note : noteList){
            fullNoteList.add(new FullNote(commentService.commentCounter(note.getId()), note));
        }

        ModelAndView modelAndView = new ModelAndView("app", "fullNoteList", fullNoteList);
        modelAndView.addObject("photos", photoService.findAllPhotos());
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/appSearchByDate")
    public ModelAndView appSearchByDate(@RequestParam(value="pattern")String date) {
        List<FullNote> fullNoteList = new ArrayList<>();
        List<Note> noteList = noteService.findNotesByDate(date);
        for(Note note : noteList){
            fullNoteList.add(new FullNote(commentService.commentCounter(note.getId()), note));
        }

        ModelAndView modelAndView = new ModelAndView("app", "fullNoteList", fullNoteList);
        modelAndView.addObject("photos", photoService.findAllPhotos());
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/appSortByNoteTime")
    public ModelAndView appSortByNoteTime() {
        List<FullNote> fullNoteList = new ArrayList<>();
        List<Note> noteList = noteService.sortNotesByLoadTime();
        for(Note note : noteList){
            fullNoteList.add(new FullNote(commentService.commentCounter(note.getId()), note));
        }

        ModelAndView modelAndView = new ModelAndView("app", "fullNoteList", fullNoteList);
        modelAndView.addObject("photos", photoService.findAllPhotos());
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/appSearchByAddress")
    public ModelAndView appSearchByAddress(@RequestParam(value="pattern")String pattern) {
        String finalPattern = pattern.replace(" ", "%");
        List<FullNote> fullNoteList = new ArrayList<>();
        List<Note> noteList = noteService.findNotesByPlaceDescription(finalPattern);
        for(Note note : noteList){
            fullNoteList.add(new FullNote(commentService.commentCounter(note.getId()), note));
        }

        ModelAndView modelAndView = new ModelAndView("app", "fullNoteList", fullNoteList);
        modelAndView.addObject("photos", photoService.findAllPhotos());
        return modelAndView;
    }

    @RequestMapping(value = "/")
    public String start(Model model) {

        return "index";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/addNote")
    public String addNote(Model model) {
        model.addAttribute("noteUploader", new NoteUploader());
        return "add_note";}


    @RequestMapping(method = RequestMethod.POST, value = "/addNote")
    public String saveNote(@ModelAttribute("noteUploader")NoteUploader noteUploader) throws IOException{
        Note note = new Note(noteUploader.getUserName(), null, null, noteUploader.getPlaceDescription(),
                noteUploader.getDate(), noteUploader.getAction(), new Timestamp(System.currentTimeMillis()));
        String latitude = noteUploader.getLatitude().trim();
        String longitude = noteUploader.getLongitude().trim();
        if(PlaceValidator.validate(latitude, longitude)){
            note.setLatitude(latitude);
            note.setLongitude(longitude);}
        noteService.save(note);
        List<MultipartFile> files = noteUploader.getFiles();
        if(files != null && files.size() > 0) {
         for (MultipartFile file : files) {

             if(!file.isEmpty()) photoService.save(new Photo(file.getOriginalFilename(), file.getBytes(), note.getId()));
          }

       }
        return "redirect:/app";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/delete")
    public ModelAndView delete(@RequestParam(value="id") long id ) {
        return new ModelAndView("confirmDelete", "id" , id);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/deleteTrue")
    public ModelAndView deleteTrue(@RequestParam(value="id") long id ) {

        if(commentService.findCommentByNoteId(id) != null){
            long[] commentIdMassive = commentService.getIdMassive(id);
            for(long commentId: commentIdMassive){

                long[] photoIdMassive = commentPhotoService.getIdMassive(commentId);
                if(photoIdMassive.length > 0){
                    for(long photoId: photoIdMassive){ commentPhotoService.delete(photoId);}
                }

                commentService.delete(commentId); }
        }

        if(noteService.findById(id) != null) {
            long[] photoIdMassive = photoService.getIdMassive(id);
            if(photoIdMassive.length > 0)
                for (long photoId : photoIdMassive) {
                    photoService.delete(photoId);
                }
            noteService.delete(id);
        }

        List<FullNote> fullNoteList = new ArrayList<>();
        List<Note> noteList = noteService.findAllNotes();
        for(Note note : noteList){
            fullNoteList.add(new FullNote(commentService.commentCounter(note.getId()), note));
        }

        ModelAndView modelAndView = new ModelAndView("app", "fullNoteList", fullNoteList);
        modelAndView.addObject("photos", photoService.findAllPhotos());
        return modelAndView;
    }

    @RequestMapping("/image/{id}")
    public void getFile(HttpServletRequest request, HttpServletResponse response, @PathVariable("id") long id) {
        try {
                    byte[] content = photoService.findPhoto(id);
                    response.setContentType("image/png");
                    response.getOutputStream().write(content);
                    } catch (IOException e) {
                   e.printStackTrace();
                 }
    }

}
