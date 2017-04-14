package place.to.time.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import place.to.time.service.UserPhotoService;
import place.to.time.service.UserService;

/**
 * Created by ENTITY on 4/14/2017.
 */
@Controller
public class AdminPageController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserPhotoService userPhotoService;

    @RequestMapping(method = RequestMethod.POST, value = "/admin")
    public ModelAndView getAdminPage(){
        ModelAndView modelAndView = new ModelAndView("adminPage", "users", userService.getUsersList());
        return modelAndView;
    }

}
