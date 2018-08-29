package pl.coderslab.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;

import javax.servlet.http.HttpSession;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;


    public String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public boolean checkPassword(String passwordToCheck, User userToValidate) {
        return BCrypt.checkpw(passwordToCheck, userToValidate.getPassword());
    }

    public boolean isEmailUnique(String emailToValidate){
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession();

        User existingUser = userRepository.findAllByEmail(emailToValidate);
        User loggedUser = (User) session.getAttribute("loggedUser");

        return (existingUser == null || loggedUser != null && existingUser.getId().equals(loggedUser.getId()));
    }

    public boolean isUsernameUnique(String usernameToValidate){
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession();

        User existingUser = userRepository.findByUsername(usernameToValidate);
        User loggedUser = (User) session.getAttribute("loggedUser");

        return (existingUser == null || loggedUser != null && existingUser.getId().equals(loggedUser.getId()));
    }
}
