package place.to.time.validation;

import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import place.to.time.model.User;
import place.to.time.service.UserService;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by ENTITY on 2/2/2017.
 */
@Component
public class RegistrationValidator implements Validator {

    private boolean loginCorrect(String login){
        Pattern p = Pattern.compile("^[\\w]{3,100}$", Pattern.UNICODE_CHARACTER_CLASS);
        Matcher m = p.matcher(login);
        return m.matches();
    }

    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.isAssignableFrom(aClass);
    }
    @Override
    public void validate(Object object, Errors errors){
        User user = (User)object;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "login", "login.empty", "Enter login");
          if(!loginCorrect(user.getLogin())) {
            errors.rejectValue("login", "login.incorrect", "The login must consist of alphabetic or numeric characters or an underscore, 3 - 100 characters ");
            }

         if(userService.findByLogin(user.getLogin()) != null) {
           errors.rejectValue("login", "login.alreadyExists", "This login already exists");
          }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "password.empty", "Password cannot be empty");
        if(!(user.getPassword()).equals(user.getRepeatedPassword())){
            errors.rejectValue("repeatedPassword", "repeatedPassword.passwordDon'tMatch", "Passwords do not match");
        }
        if((user.getPassword().length()) < 4 && (user.getPassword().trim().length()) > 0 ) {
            errors.rejectValue("password", "password.tooShort", "The password is too short, the minimum password length is 4 characters");
        }

        if((user.getEmail().trim().length() != 0) && !EmailValidator.getInstance().isValid(user.getEmail())){
            errors.rejectValue("email", "email.notValid", "Enter the correct email, or leave the field blank");
        }

        if((user.getEmail().trim().length() != 0) && userService.findByEmail(user.getEmail()) != null){
            errors.rejectValue("email", "email.alreadyExists", "This address is already in use");
        }
    }
}
