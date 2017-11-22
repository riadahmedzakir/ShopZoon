package controller;

import entity.People;
import entity.Error;
import entity.Config;
import core.ServicePeople; 
import java.util.ArrayList; 
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Random;
public class Login extends HttpServlet{  
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        response.setContentType("text/html"); 
        PrintWriter out = response.getWriter();
        ServicePeople obj = new ServicePeople(); 
        Error er=new Error();

        Random rand = new Random(); 
        int  genCode = rand.nextInt(10000000) + 1;

        ArrayList<People> personList = (ArrayList<People>)obj.showUser("where email='"+request.getParameter("email")+"' and password='"+request.getParameter("password")+"'");
        if(personList.size()<=0)
        {  
            ArrayList<People> personNot = (ArrayList<People>)obj.showUser("where email='"+request.getParameter("email")+"'");
            if(personNot.size()>0)
            { 
                for(People peopleN: personNot){ 
                    int xx=peopleN.getLogfail()+1;
                    if(peopleN.getLogfail()<=4)
                    {   
                        if(peopleN.getLogfail()==4)
                        {
                            obj.UpdateOne(peopleN,er,"logfail",Integer.toString(xx),peopleN.getId()); 
                            obj.UpdateOne(peopleN,er,"passcode",Integer.toString(genCode),peopleN.getId()); 
                            String unlock=Config.home+"unlock?email="+request.getParameter("email")+"&passcode="+Integer.toString(genCode)+"&username="+peopleN.getUsername();
                            SendEmail sendToEmail= new SendEmail(request.getParameter("email"),"Shopzoon Unlock",unlock); 
                            out.print("plzUnlock"); 
                        }
                        else if(peopleN.getLogfail()<4)
                        { 
                            obj.UpdateOne(peopleN,er,"logfail",Integer.toString(xx),peopleN.getId()); 
                            out.print("Email or Password Not Match");
                            out.print("/"+Integer.toString(peopleN.getLogfail()+1));
                        }
                    }
                    else if(peopleN.getLogfail()==5)
                    {
                        out.print("plzUnlock"); 
                        obj.UpdateOne(peopleN,er,"passcode",Integer.toString(genCode),peopleN.getId()); 
                        String unlock=Config.home+"unlock?email="+request.getParameter("email")+"&passcode="+Integer.toString(genCode)+"&username="+peopleN.getUsername();
                        SendEmail sendToEmail= new SendEmail(request.getParameter("email"),"Shopzoon Unlock",unlock);  
                    } 
                }
            }
        } 

        else
        {
            for(People people: personList){    
                if(people.getActive()==0){out.print("Account Panding"); }
                else if(people.getActive()==10){out.print("Account Inactive"); }
                else if(people.getLogfail()<5)
                {  
                    String cook=Integer.toString(genCode)+"R";
                    if(request.getParameter("remember").equals("R"))
                    {
                        obj.UpdateOne(people,er,"cookies",cook,people.getId()); 
                        out.print("<script>document.cookie = \"remember="+cook+";expires=10000000;path=/\";</script>");
 
                    }
                    HttpSession session = request.getSession();
                    session.setAttribute("ID", people.getId()); 
                    session.setAttribute("FNAME", people.getFname()); 
                    session.setAttribute("LNAME", people.getLname()); 
                    session.setAttribute("USERNAME", people.getUsername()); 
                    session.setAttribute("EMAIL", people.getEmail()); 
                    session.setAttribute("PASSWORD", people.getPassword()); 
                    session.setAttribute("LOCATION", people.getLocation()); 
                    session.setAttribute("COOKIES", people.getCookies());
                    session.setAttribute("TYPE", people.getType());  
                    session.setAttribute("RATING", people.getRating()); 
                        
                    if(session.getAttribute("ID") != null && people.getType().equals("Deliver")){ 
                        if(obj.UpdateOne(people,er,"logfail","0",people.getId()))
                        { 
                            session.setAttribute("TYPE", "Deliver");
                            out.print("/success");
                        } 
                    }
                    else if(session.getAttribute("ID") != null && people.getType().equals("Staff")){ 
                        if(obj.UpdateOne(people,er,"logfail","0",people.getId()))
                        {
                            session.setAttribute("TYPE", "Staff");
                            out.print("/success");
                        } 
                    } 
                    else if(session.getAttribute("ID") != null && people.getType().equals("Customar")){
                        if(obj.UpdateOne(people,er,"logfail","0",people.getId()))
                        {
                            session.setAttribute("TYPE", "Customar");
                            out.print("/success");
                        } 
                    } 
                    
                    else if(session.getAttribute("ID") != null && people.getType().equals("Admin")){  
                        if(obj.UpdateOne(people,er,"logfail","0",people.getId()))
                        {
                            session.setAttribute("TYPE", "Admin");
                            out.print("/success");
                        } 
                    } 
                }
                else
                {
                    out.print("plzUnlock"); 
                }
            } 
        }
    } 
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
    }
    public void destroy() {  } 
}