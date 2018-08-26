package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pl.coderslab.entity.User;
import pl.coderslab.repository.TweetRepository;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpSession;

@Controller
public class HomepageController {
    @Autowired
    TweetRepository tweetRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserService userService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView homepage() {
        return new ModelAndView("index", "tweets", tweetRepository.findFirst20ByOrderByCreatedDesc());
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginUser() {
        return "/form/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView loginUser(HttpSession session, @RequestParam String username, @RequestParam String password) {
        User userToCheck = userRepository.findByUsername(username);
        if (userToCheck != null) {
            if (userService.checkPassword(password, userToCheck)) {
                session.setAttribute("loggedUser", userToCheck);
                return new ModelAndView("redirect:/", "loginSuccess", "You've logged in successfully. Have fun!");
            }
            //TODO different view for login/logout/registration success?
        }
        return new ModelAndView("/form/login", "loginFailure", "Something went wrong. Try again");
    }

}
