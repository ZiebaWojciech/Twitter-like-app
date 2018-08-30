package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pl.coderslab.entity.Message;
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

    @RequestMapping(value = "/{id}/info", method = RequestMethod.GET)
    public ModelAndView userInfo(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userInfo");
        modelAndView.addObject("user", userRepository.getOne(id));
        modelAndView.addObject("userTweets", tweetRepository.findAllByUserIdOrderByCreatedDesc(id));
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
    @RequestMapping(value = "/changePassword", method = RequestMethod.GET)
    public ModelAndView changePasswordForm() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/form/changePassword");
        return modelAndView;
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public ModelAndView changePassword(@RequestParam("oldPassword") String oldPassword,
                                       @RequestParam("newPassword") String newPassword,
                                       @RequestParam("newPasswordRepeated") String newPasswordRepeated,
                                       @SessionAttribute("loggedUser") User loggedUser,
                                       HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        if (userService.checkPassword(oldPassword, loggedUser)) {
            if (newPassword.equals(newPasswordRepeated)) {
                loggedUser.setPassword(userService.hashPassword(newPassword));
                session.setAttribute("loggedUser", loggedUser);
                userRepository.save(loggedUser);
                modelAndView.setViewName("userEditPanel");
                modelAndView.addObject("passwordChangeMessage", "Password changed");
            } else {
                modelAndView.setViewName("/form/changePassword");
                modelAndView.addObject("passwordChangeMessage", "New password doesn't match");
            }
        } else {
            modelAndView.setViewName("/form/changePassword");
            modelAndView.addObject("passwordChangeMessage", "Wrong old password");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/changeEmail", method = RequestMethod.GET)
    public ModelAndView changeEmailForm(@SessionAttribute("loggedUser") User loggedUser) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/form/changeEmail");
        modelAndView.addObject("user", loggedUser);
        return modelAndView;
    }

    @RequestMapping(value = "/changeEmail", method = RequestMethod.POST)
    public ModelAndView changeEmail(@Valid User user, BindingResult result, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        if (result.hasErrors()) {
            modelAndView.setViewName("/form/changeEmail");
            return modelAndView;
        }
        session.setAttribute("loggedUser", user);
        userRepository.save(user);
        modelAndView.setViewName("userEditPanel");
        modelAndView.addObject("emailChangeMessage", "E-mail changed");
        return modelAndView;
    }

}

