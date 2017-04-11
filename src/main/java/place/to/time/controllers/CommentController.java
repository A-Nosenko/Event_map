package place.to.time.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import place.to.time.service.*;
import place.to.time.uploaders.CommentUploader;
import place.to.time.model.Comment;
import place.to.time.model.CommentPhoto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ENTITY on 3/25/2017.
 */
@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private NoteService noteService;

    @Autowired
    private PhotoService photoService;

    @Autowired
    private CommentPhotoService commentPhotoService;

    @RequestMapping(method = RequestMethod.GET, value = "/comments")
    public ModelAndView comment(@RequestParam(value = "noteId")long noteId){
        ModelAndView modelAndView = new ModelAndView("comments", "commentList", commentService.findCommentByNoteId(noteId));
        modelAndView.addObject("note", noteService.findById(noteId));
        modelAndView.addObject("photos", photoService.findPhotoByNoteId(noteId));
        long [] commentIdMassive = commentService.getIdMassive(noteId);
        if(commentIdMassive != null && commentIdMassive.length > 0) {
            List<CommentPhoto> commentPhotoList = new ArrayList<>();
            for(long commentId: commentIdMassive){
                commentPhotoList.addAll(commentPhotoService.findCommentPhotoByCommentId(commentId));
            }
            modelAndView.addObject("commentPhotos", commentPhotoList);
        }
        modelAndView.addObject("commentUploader", new CommentUploader());
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/deleteComment")
    public String delete(@RequestParam(value = "commentId")long commentId,
                               @RequestParam(value = "noteId")long noteId,
                               HttpServletRequest request){
        long[] photoIdMassive = commentPhotoService.getIdMassive(commentId);
        if(photoIdMassive.length > 0){
            for(long id: photoIdMassive){ commentPhotoService.delete(id);}
        }
        commentService.delete(commentId);
        return "redirect:" + request.getHeader("Referer");
    }

    @RequestMapping(method = RequestMethod.POST, value = "/addComment")
    public String addComment(@ModelAttribute("commentUploader") CommentUploader commentUploader,
                                   HttpServletRequest request)
    throws IOException{
        Comment theComment = new Comment(commentUploader.getUserName(), commentUploader.getNoteId(), commentUploader.getComment());
        commentService.save(theComment);

        List<MultipartFile> files = commentUploader.getFiles();
        if(files != null && files.size() > 0) {
            for (MultipartFile file : files) {

                if(!file.isEmpty()) commentPhotoService.save(new CommentPhoto(file.getOriginalFilename(), file.getBytes(), theComment.getId()));
            }

        }
        return "redirect:" + request.getHeader("Referer");
    }

    @RequestMapping("/commentImage/{id}")
    public void getFile(HttpServletRequest request, HttpServletResponse response, @PathVariable("id") long id) {
        try {
            byte[] content = commentPhotoService.findCommentPhoto(id);
            response.setContentType("image/png");
            response.getOutputStream().write(content);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}


