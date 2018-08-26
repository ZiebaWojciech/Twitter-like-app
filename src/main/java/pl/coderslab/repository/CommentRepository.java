package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Comment;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Integer> {
    List<Comment> findAllByCommentedTweetOrderByCreatedDesc(Tweet tweet);
    List<Comment> findAllByCommentedTweetIdOrderByCreatedDesc(Integer id);

}
