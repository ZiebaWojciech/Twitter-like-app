package pl.coderslab.entity;

import org.springframework.beans.factory.annotation.Autowired;
import pl.coderslab.service.UserService;
import pl.coderslab.validator.UniqueEmail;
import pl.coderslab.validator.UniqueUsername;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "TwitterUser")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotNull
    @UniqueUsername
    private String username;

    @NotNull
    private String password;

    @NotNull
    @Email
    @UniqueEmail
    private String email;

    @OneToMany(mappedBy = "receiver")
    private List<Message> receivedMessages = new ArrayList<>();

    @OneToMany(mappedBy = "sender")
    private List<Message> sentMessages = new ArrayList<>();

    private Boolean enabled;

    @OneToMany(mappedBy = "user", cascade = CascadeType.REFRESH)
    private List<Tweet> tweets = new ArrayList<>();

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public List<Tweet> getTweets() {
        return tweets;
    }

    public void setTweets(List<Tweet> tweets) {
        this.tweets = tweets;
    }

    public User() {
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
            this.email = email;
    }

    public List<Message> getReceivedMessages() {
        return receivedMessages;
    }

    public void setReceivedMessages(List<Message> receivedMessages) {
        this.receivedMessages = receivedMessages;
    }

    public List<Message> getSentMessages() {
        return sentMessages;
    }

    public void setSentMessages(List<Message> sentMessages) {
        this.sentMessages = sentMessages;
    }
}
