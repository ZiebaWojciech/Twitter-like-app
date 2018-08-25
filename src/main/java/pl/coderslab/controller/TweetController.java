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

import javax.servlet.http.HttpSession;
import javax.validation.Valid;


@Controller
@RequestMapping("/tweet")
public class TweetController {
    @Autowired
    TweetRepository tweetRepository;

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addTweetForm() {
        return new ModelAndView("form/addTweet", "tweet", new Tweet());
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ModelAndView addTweet(@Valid Tweet tweet, BindingResult result, @SessionAttribute("loggedUser") User user) {
        if(result.hasErrors()){
            return new ModelAndView("form/addTweet");
        }
        tweet.setUser(user);
        tweetRepository.save(tweet);
        return new ModelAndView("index");
    }

}

