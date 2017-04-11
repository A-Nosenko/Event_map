package place.to.time.service;

import place.to.time.model.Message;

import java.util.List;

/**
 * Created by ENTITY on 4/2/2017.
 */
public interface MessageService {
    List<Message> getDialog(String userNameFrom, String userNameTo);
    List<Message> getMessages(String userName);
    void save(Message message);
    void delete(long id);
    }
