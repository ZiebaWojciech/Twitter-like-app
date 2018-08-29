package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UserDetailsService;
import pl.coderslab.entity.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Integer> {
    User findByUsername(String username);

    List<User> findAllByIdIsNot(Integer loggedUserId);

    User findAllByEmail(String email);

    @Query("SELECT u FROM User u WHERE u <> :loggedUser")
    List<User> findAllExceptLogged(@Param("loggedUser") User loggedUser);
}

