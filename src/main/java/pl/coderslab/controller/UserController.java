package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;

import javax.validation.Valid;


@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserRepository userRepository;

    @Autowired
    UserService userService;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView registerUserForm() {
        return new ModelAndView("form/registerUser", "user", new User());
    }


    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerUser(Model model, @Valid User newUser, BindingResult result) {
        if (result.hasErrors()) {
            return "form/registerUser";
        }
        newUser.setPassword(userService.hashPassword(newUser.getPassword()));
        userRepository.save(newUser);
        model.addAttribute("success", "Registration successfully completed. You can log in now");
        return "redirect:/";
    }
}

