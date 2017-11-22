package controller;

import entity.People; 
import entity.Error;
import core.ServicePeople; 
import java.util.ArrayList; 
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class EmailUse extends HttpServlet{  
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        response.setContentType("text/html"); 
        PrintWriter out = response.getWriter();
        ServicePeople obj = new ServicePeople();  

        Error er =new Error();
        People people=new People(); 
        people.setEmail(request.getParameter("email")); 
        if(request.getParameter("email")!=null)
        {
            if(obj.EmailUse(people,er)) { out.print("ok"); }
            else {   out.print(er.getClassName()+"<br>"); out.print(er.getError()); }
        } 
        else { out.print("Field Empty"); } 
    } 
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
    }
    public void destroy() {  } 
 
}