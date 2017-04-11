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
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "login", "login.empty", "Введите логин");
          if(!loginCorrect(user.getLogin())) {
            errors.rejectValue("login", "login.incorrect", "Логин должен состоять из буквенных или цифровых знаков или знака подчеркивания, 3 - 100 знаков ");
            }

         if(userService.findByLogin(user.getLogin()) != null) {
           errors.rejectValue("login", "login.alreadyExists", "Такой логин уже существует");
          }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "password.empty", "Пароль не может быть пустым");
        if(!(user.getPassword()).equals(user.getRepeatedPassword())){
            errors.rejectValue("repeatedPassword", "repeatedPassword.passwordDon'tMatch", "Пароли не совпадают");
        }
        if((user.getPassword().length()) < 4 && (user.getPassword().trim().length()) > 0 ) {
            errors.rejectValue("password", "password.tooShort", "Слишком короткий пароль, минимальная длина пароля - 4 символа");
        }

        if((user.getEmail().trim().length() != 0) && !EmailValidator.getInstance().isValid(user.getEmail())){
            errors.rejectValue("email", "email.notValid", "Введите корректный email, или оставьте поле пустым");
        }

        if((user.getEmail().trim().length() != 0) && userService.findByEmail(user.getEmail()) != null){
            errors.rejectValue("email", "email.alreadyExists", "Этот адрес уже используется");
        }
    }
}
