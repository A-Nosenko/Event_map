package place.to.time.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import place.to.time.uploaders.NoteUploader;
import place.to.time.model.Note;
import place.to.time.model.Photo;
import place.to.time.service.NoteService;
import place.to.time.service.PhotoService;
import place.to.time.validation.PlaceValidator;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * Created by ENTITY on 3/24/2017.
 */
@Controller
public class NoteController {

    @Autowired
    private NoteService noteService;

    @Autowired
    private PhotoService photoService;

    @RequestMapping(method = RequestMethod.GET, value = "noteViewAndAlter")
    public ModelAndView noteViewAndAlter(@RequestParam(value = "id")long id){
        ModelAndView modelAndView = new ModelAndView("noteView", "note", noteService.findById(id));
        modelAndView.addObject("photos", photoService.findPhotoByNoteId(id));
        modelAndView.addObject("noteUploader", new NoteUploader());
        if(noteService.findById(id).getLatitude() == null || noteService.findById(id).getLongitude() == null){
            modelAndView.addObject("error", "Coordinates are set incorrectly");
        }
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.POST, value = "noteViewAndAlter")
    public String saveNote(@ModelAttribute("noteUploader")NoteUploader noteUploader,
                                 @RequestParam(value = "id")long id,
                                 HttpServletRequest request) throws IOException{
        Note note = noteService.findById(id);
        note.setAction(noteUploader.getAction());
        note.setDate(noteUploader.getDate());

        String latitude = noteUploader.getLatitude().trim();
        String longitude = noteUploader.getLongitude().trim();
        if(PlaceValidator.validate(latitude, longitude)){
            note.setLatitude(latitude);
            note.setLongitude(longitude);} else {
            note.setLatitude(null);
            note.setLongitude(null);
        }
        note.setPlaceDescription(noteUploader.getPlaceDescription());
        noteService.save(note);

        List<MultipartFile> files = noteUploader.getFiles();
        if(files != null && files.size() > 0) {
            for (MultipartFile file : files) {

                if(!file.isEmpty()) photoService.save(new Photo(file.getOriginalFilename(),
                        file.getBytes(), note.getId()));
            }

        }

        return "redirect:" + request.getHeader("Referer");
    }

    @RequestMapping(method = RequestMethod.POST, value = "/deletePhoto")
    public String deletePhoto(@RequestParam(value="id") long id,
                                    HttpServletRequest request) {
        long noteId = photoService.getPhoto(id).getNoteId();
        if(photoService.getPhoto(id) != null) {
            photoService.delete(id);
        }
        return "redirect:" + request.getHeader("Referer");
    }
}
