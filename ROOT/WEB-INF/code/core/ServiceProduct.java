package core;

import data.DataOrder;
import data.DataProduct;
import entity.Product;
import entity.Error; 
import entity.Payment;
import java.util.ArrayList;
abstract class IProductService 
{
    abstract ArrayList<Product> showProduct(String str);     
    abstract ArrayList<Payment> showCancelPayment(String str);
    abstract ArrayList<Product> productSearch(String str);
    abstract boolean uploadProduct(Product pt,Error errr);    
    abstract boolean updateProduct(Product pt); 
 
    
}


public class ServiceProduct extends IProductService
{
    private static DataProduct dataProduct=null;    
 
    public ServiceProduct()
    {
        if (ServiceProduct.dataProduct == null)
        {
            ServiceProduct.dataProduct = new DataProduct();
        }  
         
    }

    @Override
    public ArrayList<Product> showProduct(String str)
    {
        return ServiceProduct.dataProduct.ProductData(str); 
    }
     
    @Override
    public ArrayList<Payment> showCancelPayment(String str)
    {
        return ServiceProduct.dataProduct.ShowCancelPayment(str); 
    }
    
    @Override
    public ArrayList<Product> productSearch(String str)
    {
        return ServiceProduct.dataProduct.ProductSearch(str); 
    }
    
    @Override
    public boolean uploadProduct(Product pt,Error errr)
    {
        return ServiceProduct.dataProduct.ProductUpload(pt,errr); 
    } 
    
    @Override
    public boolean updateProduct(Product pt)
    {
        return ServiceProduct.dataProduct.ProductUpdate(pt); 
    }
}