package place.to.time.service;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
 */
public interface SecurityService {
    String findLoggedLogin();
    void autoLogin(String login, String password);
}
