package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;

import java.util.List;

public interface TweetRepository extends JpaRepository<Tweet, Integer> {
    List<Tweet> findAllByUser(User user);

    List<Tweet> findAllByTextContaining(String phrase);

    @Query("SELECT tweet FROM Tweet tweet WHERE tweet.user.id = :id")
    List<Tweet> findAllByUserId(@Param("id") Integer id);

    List<Tweet> findAllByOrderByCreatedDesc();

    List<Tweet> findAllByUserIdOrderByCreatedDesc(Integer id);
}
