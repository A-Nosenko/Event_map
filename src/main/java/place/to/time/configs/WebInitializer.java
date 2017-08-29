package place.to.time.configs;

/**
 * Created by ENTITY on 2/1/2017.
 */


import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
import javax.servlet.*;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
 */
public class WebInitializer  implements WebApplicationInitializer {

    private static final String LOCATION = "C:/temp/";
    private static final long MAX_FILE_SIZE = 20*1024*1024;
    private static final long MAX_REQUEST_SIZE = 100*1024*1024;
    private static final int FILE_SIZE_THRESHOLD = 0;

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {

        AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
        ctx.register(AppConfig.class);

        ctx.setServletContext(servletContext);

        ServletRegistration.Dynamic servlet = servletContext
                .addServlet("dispatcher", new DispatcherServlet(ctx));
        servlet.addMapping("/");
        servlet.setLoadOnStartup(1);
        servlet.setMultipartConfig(new MultipartConfigElement(LOCATION, MAX_FILE_SIZE, MAX_REQUEST_SIZE, FILE_SIZE_THRESHOLD));
      }
}

