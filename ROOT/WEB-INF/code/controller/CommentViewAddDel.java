package controller;

import entity.Comment;
import entity.People;
import entity.Config;
import entity.Error;
import core.ServiceComment; 
import core.ServicePeople; 
import java.util.ArrayList; 
import java.io.*; 
import javax.servlet.*;
import javax.servlet.http.*;

public class CommentViewAddDel extends HttpServlet{  
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        response.setContentType("text/html"); 
        PrintWriter out = response.getWriter();

        ServiceComment obj = new ServiceComment(); 
        ServicePeople  obj1 = new ServicePeople();
        HttpSession session = request.getSession();
        Object idV = request.getSession().getAttribute("ID");
        
        if(request.getParameter("action").equals("view"))
        { 
            ArrayList<Comment> commentList = (ArrayList<Comment>)obj.showComment("where product_id="+request.getParameter("product_id"));
            for(Comment comment: commentList){   
    
                ArrayList<People> peoList = (ArrayList<People>)obj1.showUser("where id="+comment.getPeople_id());
                for(People people: peoList){  
                    out.print("<br><img src='"+Config.isImg("user/user"+comment.getPeople_id()+".png")+"' align='center' style='width: 40px;border-radius: 50px;'><font style='color:#F46475'> "+people.getFname()+" "+people.getLname()+"</font> "+comment.getDatetime());
                    out.print("<p style='margin:0px 45px'> "+comment.getText()+"</p>"); 
                }
            } 
        }

        if(request.getParameter("action").equals("insert"))
        {
            if(idV!=null)
            {
                Error er =new Error();
                Comment comment=new Comment(); 
                comment.setProduct_id(Config.StrToInt(request.getParameter("product_id"))); 
                comment.setPeople_id(Config.StrToInt(idV.toString()));
                comment.setText(request.getParameter("text")); 
    
                if(obj.insertComment(comment,er))
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
                out.print("No Login");
            }
            
        }
        
    } 
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
    }
    public void destroy() {  } 
}