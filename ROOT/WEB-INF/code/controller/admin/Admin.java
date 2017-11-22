package controller.admin;

import entity.People;
import entity.Error;
import entity.Config;
import core.ServicePeople;
import java.util.ArrayList;
import java.io.*;
import java.util.Iterator;
import javax.servlet.*;
import javax.servlet.http.*;

public class Admin extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        ServicePeople obj = new ServicePeople();
        Error er = new Error();

        ArrayList<People> personList = (ArrayList<People>) obj.showUser("where id='" + request.getParameter("id") + "'");
        
        if(request.getSession().getAttribute("TYPE").equals("Admin") & request.getParameter("action").equals("active"))
        {
            if (personList.size() > 0) {
                for (People peopleN : personList) {
                    if(obj.UpdateOne(peopleN, er, "active","1", peopleN.getId()))
                    {
                        out.print("ok");
                    }
                    else if(obj.UpdateOne(peopleN, er, "active","1", peopleN.getId()))
                    {
                        out.print(er.getError());
                    }
                }
            }
        }
        else if(request.getSession().getAttribute("TYPE").equals("Admin") & request.getParameter("action").equals("inactive"))
        {
            if (personList.size() > 0) {
                for (People peopleN : personList) {
                    if(obj.UpdateOne(peopleN, er, "active","10", peopleN.getId()))
                    {
                        out.print("ok");
                    }
                    else if(obj.UpdateOne(peopleN, er, "active","10", peopleN.getId()))
                    {
                        out.print(er.getError());
                    }
                }
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
