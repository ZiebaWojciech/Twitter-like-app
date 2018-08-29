package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.repository.TweetRepository;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class SearchController {
    @Autowired
    TweetRepository tweetRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserService userService;

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public ModelAndView search(@RequestParam String searchPhrase) {
        List<User> users = userRepository.findAllByUsernameContaining(searchPhrase);
        List<Tweet> tweets = tweetRepository.findAllByTextContaining(searchPhrase);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("searchResult");
        modelAndView.addObject("users", users);
        modelAndView.addObject("tweets", tweets);
        return modelAndView;
    }
}
