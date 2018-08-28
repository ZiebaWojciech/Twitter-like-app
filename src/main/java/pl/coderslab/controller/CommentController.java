package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import pl.coderslab.entity.Comment;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.repository.CommentRepository;
import pl.coderslab.repository.TweetRepository;

import javax.validation.Valid;


@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    CommentRepository commentRepository;
    @Autowired
    TweetRepository tweetRepository;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ModelAndView addComment(@Valid Comment comment, BindingResult result, @SessionAttribute("loggedUser") User user) {
        ModelAndView modelAndView = new ModelAndView();
        if(result.hasErrors()){
            modelAndView.addObject("tweet", tweetRepository.getOne(comment.getCommentedTweet().getId()));
            modelAndView.addObject("comments", commentRepository.findAllByCommentedTweetIdOrderByCreatedDesc(comment.getCommentedTweet().getId()));
            modelAndView.setViewName("tweetDetails");
            return modelAndView;
        }
        commentRepository.save(comment);
        return new ModelAndView("redirect:/tweet/details/"+comment.getCommentedTweet().getId());
    }

}

