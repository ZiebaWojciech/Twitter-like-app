package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import pl.coderslab.entity.Message;
import pl.coderslab.entity.User;
import pl.coderslab.repository.MessageRepository;
import pl.coderslab.repository.TweetRepository;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;

import javax.jws.WebParam;
import javax.validation.Valid;


@Controller
@RequestMapping("/message")
public class MessageController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    TweetRepository tweetRepository;
    @Autowired
    MessageRepository messageRepository;
    @Autowired
    UserService userService;



    @RequestMapping(value = "/inbox", method = RequestMethod.GET)
    public ModelAndView inbox(@SessionAttribute("loggedUser") User loggedUser) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("receivedMessages", messageRepository.findAllByReceiver(loggedUser));
        modelAndView.addObject("receivers", userRepository.findAllExceptLogged(loggedUser));
        modelAndView.setViewName("inbox");
        return modelAndView;
    }

    @RequestMapping(value = "/sent", method = RequestMethod.GET)
    public ModelAndView sent(@SessionAttribute("loggedUser") User loggedUser) {
        return new ModelAndView("sent", "sentMessages", messageRepository.findAllBySender(loggedUser));
    }

    @RequestMapping(value = "/{id}/new", method = RequestMethod.GET)
    public ModelAndView sendMessageForm(@PathVariable Integer id){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/form/message");
        modelAndView.addObject("message", new Message());
        modelAndView.addObject("receiver", userRepository.getOne(id));
        return modelAndView;
    }

    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public ModelAndView sendMessage(@Valid Message message, BindingResult result,
                                    @SessionAttribute("loggedUser") User loggedUser){
        if(result.hasErrors()){
            return new ModelAndView("/form/message");
        }
        messageRepository.save(message);
        return new ModelAndView("redirect:inbox");
    }


    @RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
    public ModelAndView showMessage(@SessionAttribute("loggedUser") User loggedUser,
                                    @PathVariable Integer id){
        Message message = messageRepository.getOne(id);
        message.setRead(true);
        messageRepository.save(message);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("message", message);
        modelAndView.addObject("reply", new Message());
        modelAndView.setViewName("messageDetails");
        return modelAndView;
    }

}

