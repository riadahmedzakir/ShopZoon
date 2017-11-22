package controller;

import entity.People; 
import entity.Error;
import core.ServicePeople; 
import java.util.ArrayList; 
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Reg extends HttpServlet{  
    String fname = null;
    String lname = null;
    String username = null;
    String email = null;
    String type = null;
    String password = null;
    String location = null;
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        response.setContentType("text/html"); 
        PrintWriter out = response.getWriter();
        ServicePeople obj = new ServicePeople();
        fname = request.getParameter("fname");
        lname = request.getParameter("lname");
        email = request.getParameter("email");
        password = request.getParameter("password");
        type = request.getParameter("type"); 
        location = request.getParameter("location"); 

        Error er =new Error();
        People people=new People();
        people.setFname(request.getParameter("fname"));
        people.setLname(request.getParameter("lname"));
        people.setEmail(request.getParameter("email"));
        people.setPassword(request.getParameter("password"));
        people.setType(request.getParameter("type")); 
        people.setLocation(request.getParameter("location")); 
        if(validateFields())
        {
            if(obj.Reg(people,er))
            {
                out.print("ok");
            }
            else
            {  
                out.print(er.getClassName()+"<br>");
                out.print(er.getError());
                
            }
        } 
        else
        {
            out.print("Field Empty");
        }
        
         
    } 
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
    }
    public void destroy() {  } 

    private boolean validateFields(){
        if (fname.isEmpty() | lname.isEmpty()| email.isEmpty() | password.isEmpty()|type.isEmpty()|location.isEmpty())
        { 
            return false;
        } 
        return true;
    } 
}