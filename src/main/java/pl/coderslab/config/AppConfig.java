package pl.coderslab.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalEntityManagerFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.LocaleContextResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.persistence.EntityManagerFactory;
import javax.validation.Validator;
import java.util.Locale;

@Configuration
@EnableWebMvc
@ComponentScan("pl.coderslab")
@EnableTransactionManagement

@EnableJpaRepositories(basePackages = "pl.coderslab.repository")
public class AppConfig implements WebMvcConfigurer {

    @Bean
    public LocalEntityManagerFactoryBean entityManagerFactory() {
        LocalEntityManagerFactoryBean emfb = new LocalEntityManagerFactoryBean();
        emfb.setPersistenceUnitName("twitterPersistenceUnit");
        return emfb;
    }

    @Bean
    public JpaTransactionManager transactionManager(EntityManagerFactory emf) {
        JpaTransactionManager tm = new JpaTransactionManager(emf);
        return tm;
    }

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("**")
                .allowedMethods("GET", "POST", "PUT", "DELETE")
                .allowedOrigins("http://localhost");
    }

    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/META-INF/views/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

//    @Override
//    public void addFormatters(FormatterRegistry registry) {
//        registry.addConverter(getPublisherConverter());
//        registry.addConverter(getAuthorConverter());
//    }

//    @Bean
//    public PublisherConverter getPublisherConverter() {
//        return new PublisherConverter();
//    }
//
//    @Bean
//    public AuthorConverter getAuthorConverter() {
//        return new AuthorConverter();
//    }

    @Bean(name = "localeResolver")
    public LocaleContextResolver getLocaleContextResolver() {
        SessionLocaleResolver localeResolver = new SessionLocaleResolver();
        localeResolver.setDefaultLocale(new Locale("pl", "PL"));
        return localeResolver;
    }

    @Bean
    public Validator validator() {
        return new LocalValidatorFactoryBean();
    }
}

