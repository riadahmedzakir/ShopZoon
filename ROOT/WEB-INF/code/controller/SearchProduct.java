package controller;

import core.ServiceProduct;
import entity.Product;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.ArrayList;

public class SearchProduct extends HttpServlet {

    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement pst = null;

    ResultSet Ars = null;
    PreparedStatement Apst = null;

    @Override
    public void init() throws ServletException {
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/xml;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");

        ServiceProduct objPtoduct = new ServiceProduct();
        ArrayList<Product> productList = (ArrayList<Product>) objPtoduct.productSearch(request.getParameter("q"));

        out.append("<search>\n"); 
        ArrayList<String> common=new ArrayList<>(); 
        for (Product product : productList) {  
            if (common.contains(Integer.toString(product.getProduct_id()))) { } 
            else {
                common.add(Integer.toString(product.getProduct_id()));
                out.append("    <product pid=\"" + product.getProduct_id() + "\">\n");
                out.append("        <id>"    + product.getProduct_id() + "</id>\n");
                out.append("        <title>"    + product.getProduct_title() + "</title>\n");
                out.append("        <price>"    + product.getProduct_price() + "</price>\n");
                out.append("        <discount>" + product.getProduct_discount() + "</discount>\n");
                out.append("        <image>"    + product.product_image + "</image>\n"); 
                out.append("    </product>\n");
           } 
        }  
        out.append("</search>");

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public void destroy() {
    }
}
