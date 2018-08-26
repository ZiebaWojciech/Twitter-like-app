package pl.coderslab.converter;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.repository.TweetRepository;
import pl.coderslab.repository.UserRepository;

public class UserConverter implements Converter<String, User> {
    @Autowired
    UserRepository userRepository;
    @Override
    public User convert(String id) {
        return userRepository.getOne(Integer.parseInt(id));
    }
}
