
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
public class ForgotPassword extends HttpServlet{  
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();
		ServicePeople obj = new ServicePeople(); 
		Error er=new Error();

		Random rand = new Random(); 
		int  genCode = rand.nextInt(10000000) + 1;
		
		if(request.getParameter("action").equals("check"))
		{
			ArrayList<People> personList = (ArrayList<People>)obj.showUser("where email='"+request.getParameter("email")+"'");
			if(personList.size()!=0)
			{  
				for(People peopleN: personList)
				{
					String c=Integer.toString(genCode);
					if(obj.UpdateOne(peopleN,er,"passcode",c,peopleN.getId()))
					{  
						SendEmail sendToEmail= new SendEmail(request.getParameter("email"),"Shopzoon Password","Your Password Change Code "+c); 
						out.print("found"); 
					} 
				}
			}
			else
			{
				out.print("not found"); 
			}

		}
		else if(request.getParameter("action").equals("codecheck"))
		{
			ArrayList<People> personList = (ArrayList<People>)obj.showUser("where email='"+request.getParameter("email")+"' and passcode='"+request.getParameter("code")+"'");
			if(personList.size()!=0)
			{  
				for(People peopleN: personList)
				{
					out.print("codefound");
				}
			}
			else
			{
				out.print("not found"); 
			}

		}
		else if(request.getParameter("action").equals("passChange"))
		{
			ArrayList<People> personList = (ArrayList<People>)obj.showUser("where email='"+request.getParameter("email")+"' and passcode='"+request.getParameter("code")+"'");
			if(personList.size()!=0)
			{  
				for(People peopleN: personList)
				{
					if(obj.UpdateOne(peopleN,er,"password",request.getParameter("password"),peopleN.getId()))
					{ 
						out.print("success");
					}
				}
			}
			else
			{
				out.print("not found"); 
			}

		}
		 

	} 
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doGet(request, response);
	}
	public void destroy() {  } 
}