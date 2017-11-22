package controller; 

import core.ServiceProductCatagory;
import entity.Config;
import entity.ProductCatagory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class ProductCatagoryAddDel extends HttpServlet{   
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        response.setContentType("text/html"); 
        PrintWriter out = response.getWriter();
        ServiceProductCatagory obj = new ServiceProductCatagory(); 
 
        if(request.getParameter("action").equals("add"))
        {
            ProductCatagory pc=new ProductCatagory();
            pc.setProduct_catagory(request.getParameter("product_catagory"));
            if(!request.getParameter("product_catagory").equals(""))
            {
                if(obj.AddCata(pc))
                {
                    out.print("ok");
                }
                else { out.print("fail"); }
            } 
            else
            {
                out.print("Field Empty");
            }
        }
        
        if(request.getParameter("action").equals("delete"))
        {
            ProductCatagory pc=new ProductCatagory();
            pc.setId(Config.StrToInt(request.getParameter("id")));
            if(obj.DelteCata(pc))
            {
                out.print("ok");
            }
            else { out.print("fail"); } 
        }
        
         
    } 
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    
    @Override
    public void destroy() {  } 
 
}