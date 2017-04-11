package place.to.time.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import place.to.time.model.Message;
import place.to.time.service.MessageService;
import java.sql.Timestamp;

/**
 * Created by ENTITY on 4/2/2017.
 */
@Controller
public class MessageController {

    @Autowired
    private MessageService messageService;

    @RequestMapping(method = RequestMethod.POST, value = "/dialog")
    public ModelAndView getDialog(@RequestParam(value = "userNameFrom")String userNameFrom,
                                  @RequestParam(value = "userNameTo")String userNameTo){
        ModelAndView modelAndView = new ModelAndView("dialog", "messages", messageService.getDialog(userNameFrom, userNameTo));
        modelAndView.addObject("userNameTo", userNameTo);
        return modelAndView;
    }



    @RequestMapping(method = RequestMethod.POST, value = "/addMessage")
    public ModelAndView addMessage(Message message, @RequestParam(value = "messageText")String messageText,
                             @RequestParam(value = "userNameFrom")String userNameFrom,
                             @RequestParam(value = "userNameTo")String userNameTo){
        message.setMessageTime(new Timestamp(System.currentTimeMillis()));
        messageService.save(message);
        return getDialog(userNameFrom, userNameTo);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/deleteMessage")
    public ModelAndView deleteMessage(@RequestParam(value = "id")long id,
                                      @RequestParam(value = "userNameFrom")String userNameFrom,
                                      @RequestParam(value = "userNameTo")String userNameTo){
        messageService.delete(id);
        return getDialog(userNameFrom, userNameTo);
    }
}
