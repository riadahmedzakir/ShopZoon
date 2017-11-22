package core.deliver; 

import core.HibernateService; 
import data.DataStaff;
import entity.Order;
import entity.Payment;
import entity.People;
abstract class IDeliverService 
{ 
    abstract String paymentAmount(String str);
    abstract String paymentType(String str);    
    abstract int paymentId(String str);
    abstract String paymentTransaction(String str);
    abstract boolean paymentSubmit(Order order,Payment payment);
 
    
}
 
public class ServiceDeliver extends IDeliverService
{
    private static HibernateService dataHibernate=null;
    private static DataStaff dataStaff=null;
    public ServiceDeliver()
    {
        if (ServiceDeliver.dataHibernate == null)
        {
            ServiceDeliver.dataHibernate = new HibernateService();
        }  
        
        if (ServiceDeliver.dataStaff == null)
        {
            ServiceDeliver.dataStaff = new DataStaff();
        }  
    }
 
    @Override
    public String paymentAmount(String str)
    {
        return ServiceDeliver.dataHibernate.PaymentAmount(str); 
    }
    
    @Override
    public String paymentType(String str)
    {
        return ServiceDeliver.dataHibernate.PaymentType(str); 
    }
    
    @Override
    public int paymentId(String str){
        return ServiceDeliver.dataHibernate.PaymentId(str); 
    }
    
    @Override
    public String paymentTransaction(String str)
    {
        return ServiceDeliver.dataHibernate.PaymentTransaction(str); 
    }

    @Override
    public boolean paymentSubmit(Order order,Payment payment) {
        return ServiceDeliver.dataStaff.PaymentSubmit(order,payment); 
    }
    
}