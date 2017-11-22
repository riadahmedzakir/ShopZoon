package controller;


import core.ServiceProduct;
import entity.Product;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/person")
public class ProductView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        try {
            ArrayList<Product> productList = new ArrayList<>();
            ServiceProduct sp=new ServiceProduct(); 
            productList=sp.showProduct("");
            request.setAttribute("productList", productList);
            request.getRequestDispatcher("XProduct/productEdit.jsp").forward(request, response);
        }
        catch (IOException | ServletException ex) {
        }
    }
}
