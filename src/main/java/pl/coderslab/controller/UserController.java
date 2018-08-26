package pl.coderslab.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pl.coderslab.entity.User;
import pl.coderslab.repository.TweetRepository;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;


@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    TweetRepository tweetRepository;

    @Autowired
    UserService userService;



    @RequestMapping(value = "/panel", method = RequestMethod.GET)
    public ModelAndView userPanel(@SessionAttribute("loggedUser") User loggedUser) {
        return new ModelAndView("userPanel", "userTweets", tweetRepository.findAllByUser(loggedUser));
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView homepage() {
        return new ModelAndView("index", "tweets", tweetRepository.findFirst20ByOrderByCreatedDesc());
    }
}

