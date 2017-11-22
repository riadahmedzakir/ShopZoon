package data;

import static data.DataOrder.rs;
import entity.Order;
import entity.People;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;
import java.util.ArrayList;

public class DataJoin {

    static Connection conn = Conn.DB();
    static ResultSet rs1 = null;
    static PreparedStatement pst1 = null;
    
    static ResultSet rs2 = null;
    static PreparedStatement pst2 = null;

    public static String UnComplicateOrder(String str) {
        int x=0;
        if (conn != null) {
            try { 
                String sql1 = "select *from product_order where customer_id='"+str+"'";
                pst1 = conn.prepareStatement(sql1);
                rs1 = pst1.executeQuery();  
                while (rs1.next()) {
                    String sql2 = "select *from product_payment where order_id='"+rs1.getString(1)+"'";
                    pst2 = conn.prepareStatement(sql2);
                    rs2 = pst2.executeQuery();  
                    if(rs2.next()){ }
                    else
                    {
                        x +=1;
                    }
                }
            }catch (SQLException ex) {}
        } 
        return Integer.toString(x);
    }
    
    public ArrayList<Order> ShowUnComplicateOrder(String str) { 
        ArrayList<Order> orderList = new ArrayList<>();
        if (conn != null) {
            try { 
                String sql1 = "select *from product_order where customer_id="+str;
                pst1 = conn.prepareStatement(sql1);
                rs1 = pst1.executeQuery();  
                while (rs1.next()) {
                    Order order = new Order();
                    String sql2 = "select *from product_payment where order_id='"+rs1.getString("order_id")+"'";
                    pst2 = conn.prepareStatement(sql2);
                    rs2 = pst2.executeQuery();  
                    if(rs2.next()){ }
                    else
                    {
                        order.setId(rs1.getString("order_id"));
                        order.setCustomer_id(rs1.getInt("Customer_id"));
                        order.setProduct_id(rs1.getInt("Product_id"));
                        order.setProduct_qty(rs1.getInt("Product_qty"));
                        order.setProduct_price(rs1.getInt("Product_price"));
                        order.setProduct_delivery_cost(rs1.getInt("Product_delivery_cost"));
                        order.setPayment_id(rs1.getInt("Payment_id"));
                        order.setAction(rs1.getString("Action"));
                        order.setCustomer_name(rs1.getString("Customer_name"));
                        order.setCustomer_address(rs1.getString("Customer_address"));
                        order.setCustomer_district(rs1.getString("Customer_district"));
                        order.setCustomer_phone(rs1.getString("Customer_phone"));
                        orderList.add(order);
                    }
                }
            }catch (SQLException ex) {}
        } 
        return orderList;
    }
    
    public static ArrayList<Order> ShowComplicateOrder(String str) { 
        ArrayList<Order> orderList = new ArrayList<>();
        if (conn != null) {
            try { 
                String sql1 = "select *from product_order where customer_id="+str;
                pst1 = conn.prepareStatement(sql1);
                rs1 = pst1.executeQuery();  
                while (rs1.next()) {
                    Order order = new Order();
                    String sql2 = "select *from product_payment where order_id='"+rs1.getString(1)+"'";
                    pst2 = conn.prepareStatement(sql2);
                    rs2 = pst2.executeQuery();  
                    if(rs2.next()){
                        order.setId(rs1.getString("order_id"));
                        order.setCustomer_id(rs1.getInt("Customer_id"));
                        order.setProduct_id(rs1.getInt("Product_id"));
                        order.setProduct_qty(rs1.getInt("Product_qty"));
                        order.setProduct_price(rs1.getInt("Product_price"));
                        order.setProduct_delivery_cost(rs1.getInt("Product_delivery_cost"));
                        order.setPayment_id(rs1.getInt("Payment_id"));
                        if(rs1.getString("Action").equals("order"))
                        {
                            order.setAction("Pandding");
                        }
                        else if(rs1.getString("Action").equals("success"))
                        {
                            order.setAction("Complete");
                        }
                        else if(rs1.getString("Action").equals("Cencel"))
                        {
                            order.setAction("Complete");
                        }
                        order.setCustomer_name(rs1.getString("Customer_name"));
                        order.setCustomer_address(rs1.getString("Customer_address"));
                        order.setCustomer_district(rs1.getString("Customer_district"));
                        order.setCustomer_phone(rs1.getString("Customer_phone"));
                        orderList.add(order);
                    } 
                }
            }catch (SQLException ex) {}
        } 
        return orderList;
    }
}
