package data;

import entity.Order;
import entity.Error;
import entity.Payment;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.*;
import java.text.*;

public class DataOrder {

    static Connection conn = Conn.DB();
    static ResultSet rs = null;
    static PreparedStatement pst = null;
  
    public boolean AddOrder(Order order, Error er) {
        String str4 = "Insert into product_order(customer_id,product_id,product_qty,product_price,product_delivery_cost,product_total_cost,customer_name,customer_address,customer_district,customer_phone,order_id,order_date) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        if (conn != null) {
            long i = System.currentTimeMillis();
            String orderID = order.getCustomer_id()+"_"+ String.valueOf(i); 
            
            Date dNow = new Date( );
            SimpleDateFormat dateOrder =new SimpleDateFormat ("E yyyy.MM.dd");
            try { 
                pst = conn.prepareStatement(str4);
                pst.setInt(1, order.getCustomer_id());
                pst.setInt(2, order.getProduct_id());
                pst.setInt(3, order.getProduct_qty());
                pst.setInt(4, order.getProduct_price());
                pst.setInt(5, order.getProduct_delivery_cost()); 
                pst.setInt(6, (order.getProduct_qty()*order.getProduct_price())+order.getProduct_delivery_cost()); 
                pst.setString(7, order.getCustomer_name()); 
                pst.setString(8, order.getCustomer_address()); 
                pst.setString(9, order.getCustomer_district()); 
                pst.setString(10, order.getCustomer_phone()); 
                pst.setString(11, orderID); 
                pst.setString(12, dateOrder.format(dNow)); 
                pst.executeUpdate();
                order.setId(orderID);
                return true;
            } catch (SQLException e) { 
                er.setError(e.toString()+"\n"+str4);
                return false;
            }
        } else { 
            return false;
        }
    } 
    
    public ArrayList<Order> ShowOrder(String str) {
        ArrayList<Order> orderList = new ArrayList<>();
        if (conn != null) {
            try {
                String sql = "select * from Product_order " + str;
                pst = conn.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    Order order = new Order();

                    order.setId(rs.getString("order_id"));
                    order.setCustomer_id(rs.getInt("Customer_id"));
                    order.setProduct_id(rs.getInt("Product_id"));
                    order.setProduct_qty(rs.getInt("Product_qty"));
                    order.setProduct_price(rs.getInt("Product_price"));
                    order.setProduct_delivery_cost(rs.getInt("Product_delivery_cost"));
                    order.setPayment_id(rs.getInt("Payment_id"));
                    order.setAction(rs.getString("Action"));
                    order.setCustomer_name(rs.getString("Customer_name"));
                    order.setCustomer_address(rs.getString("Customer_address"));
                    order.setCustomer_district(rs.getString("Customer_district"));
                    order.setCustomer_phone(rs.getString("Customer_phone")); 
                     order.setDate(rs.getString("order_date"));

                    orderList.add(order);
                }
            } catch (SQLException ex) {
            }
        }
        return orderList;
    }
    
    public boolean DeleteOrder(Order order,Error er)
    { 
        if(conn!=null)
        { 
            try
            {   
                String str4 = "DELETE FROM product_order WHERE order_id='"+order.getId()+"'";
                pst = conn.prepareStatement(str4); 
                pst.executeUpdate(); 
                
                String str = "Insert into product_cancel(order_id,customer_id,product_id,payment_type,payment_address,transaction_id,amount) SELECT order_id,customer_id,product_id,payment_type,payment_address,transaction_id,amount FROM product_payment";
                PreparedStatement pst1 = conn.prepareStatement(str); 
                pst1.executeUpdate();
                        
                String str5 = "DELETE FROM product_payment WHERE order_id='"+order.getId()+"'";
                PreparedStatement pst2 = conn.prepareStatement(str5); 
                pst2.executeUpdate();
                        
                return true; 
            }
            catch (SQLException e) 
            {
                er.setError(e.toString());
                return false; 
            }
        }  
        else {return false; }
    }
    
    public boolean AddPayment(Payment payment, Error er) {
        String str4 = "Insert into product_payment(order_id,customer_id,product_id,payment_type,payment_address,transaction_id,amount) values(?,?,?,?,?,?,?)";
        if (conn != null) { 
            try { 
                pst = conn.prepareStatement(str4);
                pst.setString(1, payment.getOrder_id());
                pst.setInt(2, payment.getCustomer_id());
                pst.setInt(3, payment.getProduct_id());
                pst.setString(4, payment.getPayment_type());
                pst.setString(5, payment.getPayment_address());
                pst.setString(6, payment.getTransaction_id()); 
                pst.setInt(7, payment.getAmount()); 
                pst.executeUpdate(); 
                return true;
            } catch (SQLException e) { 
                er.setError(e.toString()+"\n"+str4);
                return false;
            }
        } else { 
            er.setError("Conn Fail");
            return false;
        }
    }   
    public ArrayList<Payment> ShowPayment(String str) {
        ArrayList<Payment> paymentList = new ArrayList<>();
        if (conn != null) {
            try {
                String sql = "select * from Product_Payment " + str;
                pst = conn.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    Payment payment = new Payment();

                    payment.setPayment_id(rs.getInt("payment_id"));
                    payment.setOrder_id(rs.getString("order_id"));
                    payment.setCustomer_id(rs.getInt("Customer_id"));
                    payment.setProduct_id(rs.getInt("product_id"));
                    payment.setPayment_type(rs.getString("payment_type"));
                    payment.setPayment_address(rs.getString("payment_address"));
                    payment.setTransaction_id(rs.getString("transaction_id"));
                    payment.setAmount(rs.getInt("amount")); 
                    payment.setSuccess(rs.getInt("success"));

                    paymentList.add(payment);
                }
            } catch (SQLException ex) {
            }
        }
        return paymentList;
    } 
}
