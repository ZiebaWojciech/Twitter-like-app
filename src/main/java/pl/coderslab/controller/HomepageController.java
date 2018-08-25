package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import pl.coderslab.repository.TweetRepository;

@Controller
public class HomepageController {
    @Autowired
    TweetRepository tweetRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView homepage(){
//        return new ModelAndView("index");
        return new ModelAndView("index", "tweets", tweetRepository.findFirst20ByOrderByCreatedDesc() );
    }
}
