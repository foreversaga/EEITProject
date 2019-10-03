package config;

import javax.servlet.Filter;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { RootAppConfig.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { WebAppConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}

	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		characterEncodingFilter.setForceEncoding(true);
		return new Filter[] { characterEncodingFilter };
	}

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		FilterRegistration filter = servletContext.addFilter("login", "config.LoginCheckingFilter");
		String[] s = new String[] { "/CheckOut", "/ConfirmOrder", "/ProcessNewReview", "/ProcessAmendReview",
				"/PostArticle", "/EditArticle", "/EditReply","/ReplyArticle/*","/AddThumb/*" };
		filter.addMappingForUrlPatterns(null, false, s);
		super.onStartup(servletContext);
	}

}
