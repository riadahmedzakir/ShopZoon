package data;

import core.deliver.ServiceDeliver;
import entity.Order;
import entity.Payment;
import entity.People; 
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;

public class DataStaff {

    static Connection conn = Conn.DB();
    static ResultSet rs = null;
    static PreparedStatement pst = null;     
    static PreparedStatement pst1 = null; 

    
    public String FindDeliver(People people) throws SQLException  
    { 
        try
        {
            String sql = "select * from people where type='Deliver' and active=1 and (area like '%"+people.getEmail()+"%' or fname='"+people.getEmail()+"' or lname='"+people.getEmail()+"' or email='"+people.getEmail()+"' or id='"+people.getEmail()+"')";
            pst = conn.prepareStatement(sql); 
            rs = pst.executeQuery();
            if (rs.next()) { 
                return rs.getString(2)+" "+rs.getString(3)+"/"+rs.getInt(1);
            } 
          }
        catch(SQLException ex) { }    
        return null;
    }
    
    public String FindDeliverAll(People people) throws SQLException  
    {  
        try
        {
            String xx="";
            String sql = "select * from people where type='Deliver' and active=1 and (area like '%"+people.getEmail()+"%' or fname='"+people.getEmail()+"' or lname='"+people.getEmail()+"' or email='"+people.getEmail()+"' or id='"+people.getEmail()+"')";
            pst = conn.prepareStatement(sql); 
            rs = pst.executeQuery();
            while (rs.next()) { 
                xx +=rs.getString(2)+" "+rs.getString(3)+"/"+rs.getInt(1)+"@";
            } 
            return xx;
          }
        catch(SQLException ex) { }    
        return null;
    }
    
    public String DeliverArea(People people) throws SQLException  
    {  
        try
        {
            String sql = "select * from people where type='Deliver' and active=1 and id='"+people.getEmail()+"'";
            pst = conn.prepareStatement(sql); 
            rs = pst.executeQuery();
            if (rs.next()) { 
                return rs.getString("area");
            } 
          }
        catch(SQLException ex) { }    
        return null;
    }
    
    public boolean AssignDeliver(People people,Order order) {
        if (conn != null) {
            try {
                ServiceDeliver obj=new ServiceDeliver();
                String sql = "UPDATE product_order SET deliver_id='"+people.getId()+"',payment_id='"+obj.paymentId(order.getId())+"'" + " WHERE order_id ='" + order.getId()+"'";
                pst = conn.prepareStatement(sql); 
                pst.executeUpdate();
                return true;
            } catch (SQLException e) { 
                System.out.print(e.toString());
                return false;
            }
        } else { 
            return false;
        }
    }
    
    public boolean PaymentSubmit(Order order,Payment payment) {
        if (conn != null) { 
            try {
                ServiceDeliver obj=new ServiceDeliver();
                String sql = "UPDATE product_payment SET amount='"+payment.getAmount()+"'" + " WHERE order_id ='" + order.getId()+"'";
                pst = conn.prepareStatement(sql); 
                pst.executeUpdate();
                
                String sql1 = "UPDATE product_order SET action='Complete',payment_id='"+obj.paymentId(order.getId())+"'" + " WHERE order_id ='" + order.getId()+"'";
                pst1 = conn.prepareStatement(sql1); 
                pst1.executeUpdate();
                return true;
            } catch (SQLException e) { 
                System.out.print(e.toString());
                return false;
            }
        } else { 
            return false;
        }
    }
}
