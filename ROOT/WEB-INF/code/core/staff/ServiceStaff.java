package core.staff;

import data.DataOrder;
import data.DataPeople;
import data.DataStaff;
import entity.Order;
import entity.Payment;
import entity.People;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
abstract class IStaffService 
{  
    abstract  ArrayList<Order> showNewOrder(String str);
    abstract  ArrayList<Payment> showPayment(String str);
    abstract  String findDeliver(People p);
    abstract  String findDeliverAll(People p);    
    abstract  String deliverArea(People p);
    abstract  boolean assignDeliver(People people,Order order);

    
}


public class ServiceStaff extends IStaffService
{ 
    private static DataOrder dataOrder=null; 
    private static DataStaff dataStaff=null; 
    public ServiceStaff()
    { 
        
        if (ServiceStaff.dataOrder == null)
        {
            ServiceStaff.dataOrder = new DataOrder();
        }  
        
        if (ServiceStaff.dataStaff == null)
        {
            ServiceStaff.dataStaff = new DataStaff();
        } 
    }
  
    
    @Override
    public  ArrayList<Order> showNewOrder(String str) {
        return ServiceStaff.dataOrder.ShowOrder(str);
    }

    @Override
    public  ArrayList<Payment> showPayment(String str) {
        return ServiceStaff.dataOrder.ShowPayment(str);
    }

    @Override
    public String findDeliver(People p) {
        try {
            return ServiceStaff.dataStaff.FindDeliver(p);
        } catch (SQLException ex) {
            Logger.getLogger(ServiceStaff.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    @Override
    public String findDeliverAll(People p) {
        try {
            return ServiceStaff.dataStaff.FindDeliverAll(p);
        } catch (SQLException ex) {
            Logger.getLogger(ServiceStaff.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    @Override
    public String deliverArea(People p) {
        try {
            return ServiceStaff.dataStaff.DeliverArea(p);
        } catch (SQLException ex) {
            Logger.getLogger(ServiceStaff.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    @Override
    public  boolean assignDeliver(People people,Order order) {
        return ServiceStaff.dataStaff.AssignDeliver(people,order);
    }
 
 
}
