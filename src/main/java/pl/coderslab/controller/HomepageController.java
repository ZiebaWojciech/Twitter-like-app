package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.repository.TweetRepository;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class HomepageController {
    @Autowired
    TweetRepository tweetRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserService userService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView homepage(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        User loggedUser = (User) request.getSession().getAttribute("loggedUser");
        if (loggedUser != null) {
            modelAndView.setViewName("homepage");
            modelAndView.addObject("allTweets", tweetRepository.findAllByOrderByCreatedDesc());
            modelAndView.addObject("tweet", new Tweet());
        } else {
            modelAndView.setViewName("index");
        }
        return modelAndView;

    }

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
                return new ModelAndView("redirect:/");
            }
            //TODO different view for login/logout/registration success?
        }
        return new ModelAndView("/form/login", "loginFailure", "Something went wrong. Try again");
    }


}
