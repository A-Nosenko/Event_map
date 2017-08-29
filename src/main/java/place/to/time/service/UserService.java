package place.to.time.service;

import place.to.time.model.User;

import java.util.List;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
 */
public interface UserService {

    void save(User user);
    User findByLogin(String login);
    User findByEmail(String email);

    List<User> getUsersList();
}
