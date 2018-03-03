package place.to.time.service;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
public interface SecurityService {
    String findLoggedLogin();

    void autoLogin(String login, String password);
}
