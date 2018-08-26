//package pl.coderslab.config;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.web.authentication.www.BasicAuthenticationEntryPoint;
//import pl.coderslab.repository.UserRepository;
//import pl.coderslab.service.UserService;
//
//import javax.sql.DataSource;
//
//@Configuration
//@EnableWebSecurity
//@EnableGlobalMethodSecurity(prePostEnabled = true)
//public class SecurityConfig extends WebSecurityConfigurerAdapter {
//    @Autowired
//    DataSource dataSource;
//
//    @Autowired
//    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//
//        User.UserBuilder users = User.withDefaultPasswordEncoder();
//        auth
//                .jdbcAuthentication()
//                .dataSource()
//                .withDefaultSchema()
//                .withUser(users.username("user").password("password").roles("USER"))
//                .withUser(users.username("admin").password("password").roles("USER","ADMIN"));
//    }
//}
