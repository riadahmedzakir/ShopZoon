package controller;

import entity.People;
import entity.Error;
import entity.Config;
import core.ServicePeople; 
import java.util.ArrayList; 
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*; 
public class Unlock extends HttpServlet{  
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        response.setContentType("text/html"); 
        PrintWriter out = response.getWriter();
        ServicePeople obj = new ServicePeople(); 
        Error er=new Error();

        ArrayList<People> personList = (ArrayList<People>)obj.showUser("where email='"+request.getParameter("email")+"' and passcode='"+request.getParameter("passcode")+"'");
        if(personList.size()!=0)
        { 
            for(People peopleN: personList)
            {
                if(obj.UpdateOne(peopleN,er,"logfail","0",peopleN.getId()))
                {  
                    out.print("<script>window.location.href='"+Config.home+"log'</script>"); 
                }
                else
                {
                    out.print(er.getError());
                }
            }
        } 
        else
        {
            out.print("Not Found");
        }

    } 
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
    }
    public void destroy() {  } 
}