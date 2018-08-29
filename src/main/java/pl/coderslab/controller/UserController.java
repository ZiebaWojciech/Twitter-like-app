package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pl.coderslab.entity.Message;
import pl.coderslab.entity.User;
import pl.coderslab.repository.TweetRepository;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    TweetRepository tweetRepository;

    @Autowired
    UserService userService;

    @RequestMapping(value = "/{id}/info", method = RequestMethod.GET)
    public ModelAndView userInfo(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userInfo");
        modelAndView.addObject("user", userRepository.getOne(id));
        modelAndView.addObject("userTweets", tweetRepository.findAllByUserId(id));
        modelAndView.addObject("message", new Message());
        return modelAndView;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView userLogout(HttpSession session) {
        session.removeAttribute("loggedUser");
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView userPanel() {
        return new ModelAndView("userEditPanel");
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public ModelAndView changePassword(@RequestParam("oldPassword") String oldPassword,
                                       @RequestParam("newPassword") String newPassword,
                                       @RequestParam("newPasswordRepeated") String newPasswordRepeated,
                                       @SessionAttribute("loggedUser") User loggedUser) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userEditPanel");
        if (userService.checkPassword(oldPassword, loggedUser)) {
            if (newPassword.equals(newPasswordRepeated)) {
                loggedUser.setPassword(userService.hashPassword(newPassword));
                userRepository.save(loggedUser);
                modelAndView.addObject("passwordChangeMessage", "Password changed");
            } else {
                modelAndView.addObject("passwordChangeMessage", "New password doesn't match");
            }
        } else {
            modelAndView.addObject("passwordChangeMessage", "Wrong old password");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/changeEmail", method = RequestMethod.POST)
    public ModelAndView changePassword(@RequestParam("newEmail") String newEmail,
                                       @RequestParam("newEmailRepeated") String newEmailRepeated,
                                       @SessionAttribute("loggedUser") User loggedUser) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userEditPanel");
        if (newEmail.equals(newEmailRepeated)) {
            loggedUser.setEmail(newEmail);
            userRepository.save(loggedUser);
            modelAndView.addObject("emailChangeMessage", "E-mail changed");
        } else {
            modelAndView.addObject("emailChangeMessage", "E-mails doesn't match");
        }
        return modelAndView;
    }

}

