package place.to.time.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import place.to.time.model.User;
import place.to.time.service.SecurityService;
import place.to.time.service.UserService;
import place.to.time.validation.RegistrationValidator;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
@Controller
public class SecurityController {

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserService userService;

    @Autowired
    private RegistrationValidator registrationValidator;


    @RequestMapping(method = RequestMethod.GET, value = "/login")
    public String makelogin(User user, ModelMap modelMap, Model model, String error) {

        modelMap.put("user", user);
        if (error != null) {
            model.addAttribute("error", "Wrong login or password.");
        }
        return "login";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/register")
    public String register(User user, ModelMap modelMap) {
        modelMap.put("user", user);
        return "register";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/register")
    public String makeRegistration(User user, BindingResult result) {

        registrationValidator.validate(user, result);
        if (result.hasErrors()) {
            return "register";
        }

        userService.save(user);
        securityService.autoLogin(user.getLogin(), user.getRepeatedPassword());
        return "registrationReady";
    }
}
