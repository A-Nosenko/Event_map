package place.to.time.configs;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.multipart.support.MultipartFilter;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;

/**
 * Created by ENTITY on 2/15/2017.
 */
public class SecurityWebInitializer extends AbstractSecurityWebApplicationInitializer  {

    @Override
    protected void beforeSpringSecurityFilterChain(ServletContext servletContext) {

        FilterRegistration.Dynamic encodingFilter = servletContext.addFilter("encodingFilter", new CharacterEncodingFilter());
        encodingFilter.setInitParameter("encoding", "UTF-8");
        encodingFilter.setInitParameter("forceEncoding", "true");
        encodingFilter.addMappingForUrlPatterns(null, false, "/*");
        insertFilters(servletContext, new MultipartFilter());
        }
    }
