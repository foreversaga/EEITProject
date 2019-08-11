package filter;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import login.HibernateUtils;

@WebListener
public class FactoryListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		HibernateUtils.getSessionFactory();

	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		HibernateUtils.getSessionFactory().close();

	}

}
