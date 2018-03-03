package place.to.time.configs;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.Database;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import place.to.time.service.*;

import javax.sql.DataSource;
import java.util.Locale;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
@Configuration
@ComponentScan("place.to.time")
@EnableWebMvc
@EnableJpaRepositories(basePackages = "place.to.time.repository")
@PropertySource("classpath:connectionToDataBase.properties")
@EnableTransactionManagement
public class AppConfig extends WebMvcConfigurerAdapter {

    @Bean
    public static PropertySourcesPlaceholderConfigurer propertyConfigInDev() {
        return new PropertySourcesPlaceholderConfigurer();
    }

    @Autowired
    private Environment env;

    @Bean
    public DataSource dataSource() {

        final String driverClassName = env.getProperty("driverClassName");
        final String encoding = env.getProperty("encoding");
        final String url = env.getProperty("url");
        final String user = env.getProperty("name");
        final String password = env.getProperty("password");

        BasicDataSource basicDataSource = new BasicDataSource();

        basicDataSource.setDriverClassName(driverClassName);
        basicDataSource.setConnectionProperties(encoding);
        basicDataSource.setUrl(url);
        basicDataSource.setUsername(user);
        basicDataSource.setPassword(password);

        return basicDataSource;
    }

    @Bean
    public JpaVendorAdapter jpaVendorAdapter() {
        HibernateJpaVendorAdapter adapter = new HibernateJpaVendorAdapter();
        adapter.setDatabase(Database.MYSQL);
        adapter.setShowSql(true);
        adapter.setGenerateDdl(false);
        adapter.setDatabasePlatform("org.hibernate.dialect.MySQLDialect");
        return adapter;
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory(
            DataSource dataSource, JpaVendorAdapter jpaVendorAdapter) {
        LocalContainerEntityManagerFactoryBean factoryBean =
                new LocalContainerEntityManagerFactoryBean();
        factoryBean.setDataSource(dataSource);
        factoryBean.setJpaVendorAdapter(jpaVendorAdapter);
        factoryBean.setPackagesToScan("place.to.time.model");
        return factoryBean;
    }

    @Bean
    public PlatformTransactionManager transactionManager() {
        JpaTransactionManager jpaTransactionManager = new JpaTransactionManager();
        jpaTransactionManager.setEntityManagerFactory(entityManagerFactory(dataSource(), jpaVendorAdapter()).getObject());
        return jpaTransactionManager;
    }

    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver internalResourceViewResolver = new InternalResourceViewResolver();
        internalResourceViewResolver.setPrefix("WEB-INF/pages/");
        internalResourceViewResolver.setSuffix(".jsp");
        return internalResourceViewResolver;
    }

    @Bean
    public NoteService noteService() {
        return new NoteServiceImpl();
    }

    @Bean
    public PhotoService photoService() {
        return new PhotoServiceImpl();
    }

    @Bean
    public CommentService commentService() {
        return new CommentServiceImpl();
    }

    @Bean
    public CommentPhotoService commentPhotoService() {
        return new CommentPhotoServiceImpl();
    }

    @Bean
    public UserPhotoService userPhotoService() {
        return new UserPhotoServiceImpl();
    }

    @Bean
    public MessageService messageService() {
        return new MessageServiceImpl();
    }

    @Bean
    public LatLngService latLngService() {
        return new LatLngServiceImpl();
    }

    @Bean
    public UserRoleService userRoleService() {
        return new UserRoleServiceImpl();
    }

    @Bean
    public MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasename("/i18n/content");
        messageSource.setDefaultEncoding("UTF-8");
        return messageSource;
    }

    @Bean
    public LocaleResolver localeResolver() {
        CookieLocaleResolver resolver = new CookieLocaleResolver();
        resolver.setDefaultLocale(Locale.ENGLISH);
        resolver.setCookieName("myLocaleCookie");
        resolver.setCookieMaxAge(4800);
        return resolver;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
        interceptor.setParamName("mylocale");
        registry.addInterceptor(interceptor);
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Override
    public void addResourceHandlers(final ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }
}