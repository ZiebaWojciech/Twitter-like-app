package pl.coderslab.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import pl.coderslab.entity.User;

@Service
public class UserService {
    public String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public boolean checkPassword(String passwordToCheck, User userToValidate) {
        return BCrypt.checkpw(passwordToCheck, userToValidate.getPassword());
    }

}
