package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pl.coderslab.entity.Comment;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.repository.CommentRepository;
import pl.coderslab.repository.TweetRepository;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;


@Controller
@PreAuthorize("hasRole('ROLE_USER')")
@RequestMapping("/tweet")
public class TweetController {
    @Autowired
    TweetRepository tweetRepository;

    @Autowired
    CommentRepository commentRepository;

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView tweetAddForm() {
        return new ModelAndView("form/addTweet", "tweet", new Tweet());
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ModelAndView tweetAdd(@Valid Tweet tweet, BindingResult result, @SessionAttribute("loggedUser") User user) {
        if(result.hasErrors()){
            return new ModelAndView("form/addTweet");
        }
        tweet.setUser(user);
        tweetRepository.save(tweet);
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public ModelAndView tweetDetails(@PathVariable Integer id){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("tweet", tweetRepository.getOne(id));
        modelAndView.addObject("comments", commentRepository.findAllByCommentedTweetIdOrderByCreatedDesc(id));
        modelAndView.addObject("newComment", new Comment());
        modelAndView.setViewName("tweetDetails");
        return modelAndView;
    }

}

