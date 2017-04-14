package place.to.time.service;

import place.to.time.model.User;

import java.util.List;

/**
 * Created by ENTITY on 2/5/2017.
 */
public interface UserService {

    void save(User user);
    User findByLogin(String login);
    User findByEmail(String email);
    List<User> getUsersList();
    }
