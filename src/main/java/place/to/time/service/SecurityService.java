package place.to.time.service;

/**
 * Created by ENTITY on 2/5/2017.
 */
public interface SecurityService {
    String findLoggedLogin();
    void autoLogin(String login, String password);
}
