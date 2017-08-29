package place.to.time.service;

import org.springframework.beans.factory.annotation.Autowired;
import place.to.time.model.Message;
import place.to.time.repository.MessageRepository;
import java.util.List;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
 */
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageRepository messageRepository;

    public List<Message> getDialog(String userNameFrom, String userNameTo){
        return messageRepository.getDialog(userNameFrom, userNameTo);
    }

    @Override
    public void save(Message message) {
        messageRepository.save(message);
    }

    @Override
    public void delete(long id) {
        messageRepository.delete(id);
    }

    @Override
    public List<Message> getMessages(String userName) {
        return messageRepository.getMessages(userName);
    }
}
