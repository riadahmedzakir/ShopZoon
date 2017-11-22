package core;

import entity.Order;
import entity.Payment;
import entity.People;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

    static SessionFactory sessionFactory;
    static Session session;

    public static Session getSession() {
        sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        session= sessionFactory.openSession();
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }

    public static void closeSession(){
        session.close();
    }
}
