package core;
 
import static core.HibernateUtil.closeSession;
import entity.Order;
import entity.Payment;
import entity.model.Product_Order; 
import entity.model.Product_Payment;
import java.util.ArrayList;
import java.util.List; 
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class HibernateService{        

    ArrayList<Order> orderList = new ArrayList<Order>();    
    ArrayList<Payment> paymentList = new ArrayList<Payment>();


    public HibernateService() {}
 

    public Session getSession(){
        return HibernateUtil.getSession();
    }
  

    public ArrayList<Order> getOrder() {
        Session session=getSession();
        Transaction t = session.beginTransaction();
        orderList = (ArrayList<Order>)session.createQuery("from Order where deliver_id>0").list();
        t.commit();
        closeSession(); 
        return orderList;
    }
     
    
    public ArrayList<Order> getCompleteOrder(String x) {
        Session session=getSession();
        Transaction t = session.beginTransaction();
        orderList = (ArrayList<Order>)session.createQuery("from Order where deliver_id='"+x+"' and action='Complete'").list();
        t.commit();
        closeSession(); 
        return orderList;
    }
    
    public ArrayList<Order> getNewDeliverOrder(String x) {
        Session session=getSession();
        Transaction t = session.beginTransaction();
        orderList = (ArrayList<Order>)session.createQuery("from Order where deliver_id='"+x+"' and action='order'").list();
        t.commit();
        closeSession(); 
        return orderList;
    } 
    
    public String PaymentAmount(String identify)
    {
        SessionFactory factory = new Configuration().configure().addAnnotatedClass(Product_Order.class).addAnnotatedClass(Product_Payment.class).buildSessionFactory();
        Session session = factory.getCurrentSession();
        session.beginTransaction();
        Product_Order user = (Product_Order) session.get(Product_Order.class, identify);
        return Integer.toString(user.payment.amount); 
    }
    
    public String PaymentType(String identify)
    {
        SessionFactory factory = new Configuration().configure().addAnnotatedClass(Product_Order.class).addAnnotatedClass(Product_Payment.class).buildSessionFactory();
        Session session = factory.getCurrentSession();
        session.beginTransaction();
        Product_Order user = (Product_Order) session.get(Product_Order.class, identify);
        return user.payment.payment_type; 
    }
    
    public String PaymentTransaction (String identify)
    {
        SessionFactory factory = new Configuration().configure().addAnnotatedClass(Product_Order.class).addAnnotatedClass(Product_Payment.class).buildSessionFactory();
        Session session = factory.getCurrentSession();
        session.beginTransaction();
        Product_Order user = (Product_Order) session.get(Product_Order.class, identify);
        return user.payment.transaction_id; 
    }
    
    public int PaymentId (String identify)
    {
        SessionFactory factory = new Configuration().configure().addAnnotatedClass(Product_Order.class).addAnnotatedClass(Product_Payment.class).buildSessionFactory();
        Session session = factory.getCurrentSession();
        session.beginTransaction();
        Product_Order user = (Product_Order) session.get(Product_Order.class, identify);
        return user.payment.payment_id; 
    }
}