package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.User;

public interface TweetRepository extends JpaRepository<User, Integer> {
    User findByUsername(String username);
}
