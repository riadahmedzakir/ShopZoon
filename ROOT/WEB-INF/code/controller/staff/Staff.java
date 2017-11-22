package controller.staff;

import entity.People;
import entity.Error;
import entity.Config;
import core.ServicePeople;
import core.deliver.ServiceDeliver;
import core.staff.ServiceStaff; 
import entity.Order;
import entity.Payment;
import java.io.*; 
import javax.servlet.*;
import javax.servlet.http.*;

public class Staff extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        ServicePeople obj = new ServicePeople();
        ServiceStaff obj1=new ServiceStaff();
        ServiceDeliver obj2=new ServiceDeliver();
        Error er = new Error();
        
        if(request.getParameter("action").equals("checkUser"))
        {
            People p=new People();
            p.setEmail(request.getParameter("email"));
            out.print(obj1.findDeliver(p));
        } 
        
        if(request.getParameter("action").equals("checkUserAll"))
        {
            People p=new People();
            p.setEmail(request.getParameter("email"));
            out.print(obj1.findDeliverAll(p));
        }
        
        if(request.getParameter("action").equals("changeArea"))
        {
            People p=new People();
            p.setArea(request.getParameter("area"));
            if(obj.UpdateOne(p,er,"area",request.getParameter("area"),Config.StrToInt(request.getParameter("id"))))
            {
                out.print("ok");
            }
        }
        
        if(request.getParameter("action").equals("findArea"))
        {
            People p=new People();
            p.setEmail(request.getParameter("email"));
            out.print(obj1.deliverArea(p));
        }
        
        if(request.getParameter("action").equals("assignDeliver"))
        {
            People people=new People();
            Order order=new Order();
            people.setId(Config.StrToInt(request.getParameter("deliver_id")));
            order.setId(request.getParameter("order_id"));
            if(obj1.assignDeliver(people,order))
            {
                out.print("ok");
            }
            else
            {
                out.print("error");
            }
        }
        
        if(request.getParameter("action").equals("paymentSubmit"))
        {
            People people=new People();
            Order order=new Order(); 
            Payment payment=new Payment();
            order.setId(request.getParameter("order_id"));
            payment.setAmount(Config.StrToInt(request.getParameter("amount")));
            if(obj2.paymentSubmit(order,payment))
            {
                out.print("ok");
            }
            else
            {
                out.print("error");
            }
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public void destroy() {
    }
}
