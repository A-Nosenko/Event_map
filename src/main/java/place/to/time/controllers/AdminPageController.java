package place.to.time.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import place.to.time.service.UserRoleService;
import place.to.time.service.UserService;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
 */
@Controller
public class AdminPageController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;

    @RequestMapping(method = RequestMethod.POST, value = "/admin")
    public ModelAndView getAdminPage(){
        ModelAndView modelAndView = new ModelAndView("adminPage", "users", userService.getUsersList());
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/ban")
    public ModelAndView ban(@RequestParam(value = "id")long id){
        userRoleService.ban(id);
        ModelAndView modelAndView = new ModelAndView("adminPage", "users", userService.getUsersList());
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/unBan")
    public ModelAndView unBan(@RequestParam(value = "id")long id){
        userRoleService.unBan(id);
        ModelAndView modelAndView = new ModelAndView("adminPage", "users", userService.getUsersList());
        return modelAndView;
    }
}
