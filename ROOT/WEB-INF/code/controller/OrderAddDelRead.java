package controller;

import core.ServiceOrder;
import entity.Config;
import entity.Error;
import entity.Order;
import entity.Payment;
import java.io.*; 
import javax.servlet.*;
import javax.servlet.http.*;

public class OrderAddDelRead extends HttpServlet{  
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        response.setContentType("text/html"); 
        PrintWriter out = response.getWriter();

        ServiceOrder obj = new ServiceOrder();  
        HttpSession session = request.getSession();
        Object idV = request.getSession().getAttribute("ID");
         Error er=new Error();
         
        if(request.getParameter("action").equals("insertOrder"))
        {
            if(idV!=null)
            { 
                Order order=new Order(); 
                order.setCustomer_id(Config.StrToInt(idV.toString()));
                order.setProduct_id(Config.StrToInt(request.getParameter("product_id"))); 
                order.setProduct_qty(Config.StrToInt(request.getParameter("product_qty"))); 
                order.setProduct_price(Config.StrToInt(request.getParameter("product_price"))); 
                order.setProduct_delivery_cost(Config.StrToInt(request.getParameter("product_del_cost"))); 
                order.setCustomer_name(request.getParameter("customer_name")); 
                order.setCustomer_address(request.getParameter("customer_address"));  
                order.setCustomer_district(request.getParameter("customer_district"));  
                order.setCustomer_phone(request.getParameter("customer_phone")); 
                if(obj.addOrder(order,er))
                {
                    out.print("ok/"+order.getId());
                }
                else
                {  
                    out.print(er.getError()); 
                    
                }
            }
            else
            {
                out.print("No Login");
            }
            
        }
        if(request.getParameter("action").equals("delOrder"))
        {
            if(idV!=null)
            { 
                Order order=new Order(); 
                order.setId(request.getParameter("id"));   
                if(obj.deleteOrder(order,er))
                {
                    out.print("ok");
                }
                else
                {  
                    out.print(er.getError()+request.getParameter("id")); 
                    
                }
            }
            else
            {
                out.print("No Login");
            }
            
        }
        
        if(request.getParameter("action").equals("insertPayment"))
        {
            if(idV!=null)
            { 
                Payment payment=new Payment(); 
                payment.setOrder_id(request.getParameter("order_id"));
                payment.setCustomer_id(Config.StrToInt(idV.toString()));
                payment.setProduct_id(Config.StrToInt(request.getParameter("product_id"))); 
                payment.setPayment_type(request.getParameter("payment_type")); 
                payment.setPayment_address(request.getParameter("payment_address")); 
                payment.setTransaction_id(request.getParameter("transaction_id")); 
                payment.setAmount(Config.StrToInt(request.getParameter("amount")));  
                if(obj.addPayment(payment,er))
                {
                    out.print("ok");
                }
                else
                {  
                    out.print(er.getError()); 
                    
                }
            }
            else
            {
                out.print("No Login");
            }
            
        }
    } 
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
    }
    @Override
    public void destroy() {  } 
}