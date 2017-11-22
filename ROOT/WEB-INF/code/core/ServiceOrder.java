package core;

import data.DataJoin;
import data.DataOrder;
import entity.Error;
import entity.Order;
import entity.Payment;
import java.util.ArrayList;
abstract class IOrderService 
{  
    abstract boolean addOrder(Order or,Error er);
    abstract  ArrayList<Order> showOrder(String str);
    abstract boolean addPayment(Payment pay,Error er);
    abstract boolean deleteOrder(Order or,Error er);
    abstract  ArrayList<Order> showUnComplicateOrder(String str);
    abstract  ArrayList<Order> showComplicateOrder(String str);
    
}


public class ServiceOrder extends IOrderService
{ 
    private static DataOrder dataOrder=null;
    private static DataJoin dataJoin=null;
    public ServiceOrder()
    { 
        
        if (ServiceOrder.dataOrder == null)
        {
            ServiceOrder.dataOrder = new DataOrder();
        } 
        
        if (ServiceOrder.dataJoin == null)
        {
            ServiceOrder.dataJoin = new DataJoin();
        } 
    } 
    @Override
    public boolean addOrder(Order or,Error er) {
        return ServiceOrder.dataOrder.AddOrder(or,er);
    }
    
    @Override
    public  ArrayList<Order> showOrder(String str) {
        return ServiceOrder.dataOrder.ShowOrder(str);
    }
    
    @Override
    public boolean addPayment(Payment pay,Error er) {
        return ServiceOrder.dataOrder.AddPayment(pay, er);
    }
    
    @Override
    public boolean deleteOrder(Order or,Error er) {
        return ServiceOrder.dataOrder.DeleteOrder(or,er);
    }
    
    @Override
    public  ArrayList<Order> showUnComplicateOrder(String str) {
        return ServiceOrder.dataJoin.ShowUnComplicateOrder(str);
    }
    
    @Override
    public  ArrayList<Order> showComplicateOrder(String str) {
        return ServiceOrder.dataJoin.ShowComplicateOrder(str);
    }
 
 
}
