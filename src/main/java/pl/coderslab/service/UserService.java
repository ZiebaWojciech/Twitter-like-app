package pl.coderslab.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;

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

    public boolean isEmailUniqe(User userToSetEmail){
        User existingUser = userRepository.findAllByEmail(userToSetEmail.getEmail());
        existingUser == null || existingUser.getId().equals(userToSetEmail.getId())? return true : return false;
        if(existingUser == null || existingUser.getId().equals(userToSetEmail.getId())){
            return true;
        } else return false;
    }
}
