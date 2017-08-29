package place.to.time.service;

import place.to.time.model.Message;

import java.util.List;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
 */
public interface MessageService {
    List<Message> getDialog(String userNameFrom, String userNameTo);
    List<Message> getMessages(String userName);
    void save(Message message);
    void delete(long id);
}
