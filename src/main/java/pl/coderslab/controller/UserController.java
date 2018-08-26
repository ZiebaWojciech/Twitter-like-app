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

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView registerUserForm() {
        return new ModelAndView("form/register", "user", new User());
    }


    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerUser(Model model, @Valid User newUser, BindingResult result) {
        if (result.hasErrors()) {
            return "/form/register";
        }
        newUser.setPassword(userService.hashPassword(newUser.getPassword()));
        userRepository.save(newUser);
        model.addAttribute("registrationSuccess", "Registration successfully completed. You can log in now");
        return "/form/login";
    }


    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView userLogout(HttpSession session, @RequestParam String username, @RequestParam String password) {
        session.removeAttribute("loggedUser");
        return new ModelAndView("index", "logoutSuccess", "You've logged out successfully. See you soon!");
    }

    @RequestMapping(value = "/panel", method = RequestMethod.GET)
    public ModelAndView userPanel(@SessionAttribute("loggedUser") User loggedUser) {
        return new ModelAndView("userPanel", "userTweets", tweetRepository.findAllByUser(loggedUser));
    }
}

