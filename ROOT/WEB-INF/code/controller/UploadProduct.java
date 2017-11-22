package controller;

import entity.People;
import entity.Product;
import entity.Error;
import core.ServiceProduct; 
import java.util.ArrayList; 
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class UploadProduct extends HttpServlet{  
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        response.setContentType("text/html"); 
        PrintWriter out = response.getWriter();
        ServiceProduct obj = new ServiceProduct(); 

        Error er =new Error();
        Product pt=new Product();
        if(request.getParameter("action").equals("save"))
        {
            pt.setProduct_catagory(request.getParameter("catagory"));
            pt.setProduct_title(request.getParameter("title"));
            pt.setProduct_code(request.getParameter("code"));
            pt.setProduct_price(Integer.parseInt(request.getParameter("price")));
            pt.setProduct_discount(Integer.parseInt(request.getParameter("discount"))); 
            pt.setProduct_size(request.getParameter("size")); 
            pt.setProduct_image(request.getParameter("image")); 
            pt.setProduct_img_catagory(request.getParameter("img_catagory")); 
            pt.setProduct_season(request.getParameter("season")); 
            pt.setProduct_limit(Integer.parseInt(request.getParameter("limit"))); 
            pt.setProduct_discription(request.getParameter("discription")); 
            if(obj.uploadProduct(pt,er))
            {
                out.print("ok");
            }
            else
            {  
                out.print(er.getError());

            }
        }
        
        if(request.getParameter("action").equals("update"))
        {
            pt.setProduct_id(Integer.parseInt(request.getParameter("id")));
            pt.setProduct_catagory(request.getParameter("catagory"));
            pt.setProduct_title(request.getParameter("title"));
            pt.setProduct_code(request.getParameter("code"));
            pt.setProduct_price(Integer.parseInt(request.getParameter("price")));
            pt.setProduct_discount(Integer.parseInt(request.getParameter("discount"))); 
            pt.setProduct_size(request.getParameter("size")); 
            pt.setProduct_image(request.getParameter("image")); 
            pt.setProduct_img_catagory(request.getParameter("img_catagory")); 
            pt.setProduct_season(request.getParameter("season")); 
            pt.setProduct_limit(Integer.parseInt(request.getParameter("limit"))); 
            pt.setProduct_discription(request.getParameter("discription")); 
            if(obj.updateProduct(pt))
            {
                out.print("ok");
            }
            else 
            {  
                out.print("no");

            }
        }
         
    } 
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
    }
    public void destroy() {  } 
}