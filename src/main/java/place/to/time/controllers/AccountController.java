package place.to.time.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import place.to.time.model.UserPhoto;
import place.to.time.service.MessageService;
import place.to.time.service.UserPhotoService;
import place.to.time.service.UserService;
import place.to.time.uploaders.AccountUploader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by ENTITY on 4/2/2017.
 */
@Controller
public class AccountController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserPhotoService userPhotoService;

    @Autowired
    MessageService messageService;

    @RequestMapping(method = RequestMethod.POST, value = "/account")
    public ModelAndView getAccount(String userName){
        ModelAndView modelAndView = new ModelAndView("account", "accountUploader", new AccountUploader());
        modelAndView.addObject("messages", messageService.getMessages(userName));
	    return modelAndView;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/setAccount")
    public ModelAndView setAccount(@ModelAttribute("accountUploader")AccountUploader accountUploader
                                   ) throws IOException {
        ModelAndView modelAndView = new ModelAndView("account", "accountUploader", new AccountUploader());
        MultipartFile file = accountUploader.getFile();
        String userName = accountUploader.getUserName();
        if(file.getBytes().length > 0) {
            long userId = userService.findByLogin(userName).getId();
            UserPhoto currentPhoto = userPhotoService.findUserPhotoByUserId(userId);
            if (currentPhoto != null) {
                userPhotoService.delete(currentPhoto.getId());
            }
            UserPhoto userPhoto = new UserPhoto(file.getName(),
                    file.getBytes(), userId);
            userPhotoService.save(userPhoto);
        }
        return getAccount(userName);
    }

    @RequestMapping("/userImage/{userName}")
    public void getFile(HttpServletRequest request, HttpServletResponse response,
                        @PathVariable("userName") String userName) {

        long userId = userService.findByLogin(userName).getId();
        try {
            byte[] content = userPhotoService.findUserPhotoByUserId(userId).getBody();
            response.setContentType("image/png");
            response.getOutputStream().write(content);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(method = RequestMethod.POST, value = "/deleteMessageFromAccount")
    public ModelAndView deleteMessageFromAccount(@RequestParam(value = "id")long id,
                                      @RequestParam(value = "thisUserName")String thisUserName){
        messageService.delete(id);
        return getAccount(thisUserName);
    }
}
