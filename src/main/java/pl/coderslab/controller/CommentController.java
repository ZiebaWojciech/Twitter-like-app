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

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addCommentForm() {
        return new ModelAndView("form/addComment", "comment", new Comment());
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ModelAndView addComment(@Valid Comment comment, BindingResult result, @SessionAttribute("loggedUser") User user) {
        if(result.hasErrors()){
            return new ModelAndView("tweetDetails");
        }
        comment.setAuthor(user);
        commentRepository.save(comment);
        return new ModelAndView("redirect:/tweet/details/"+comment.getCommentedTweet().getId());
    }

}

