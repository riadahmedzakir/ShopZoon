package core;

import data.DataProductCatagory;
import entity.ProductCatagory;
import java.util.ArrayList;
abstract class IProductCatagoryService 
{
    abstract ArrayList<ProductCatagory> showProductCatagory(String str);
    abstract boolean AddCata(ProductCatagory pc);
    abstract boolean DelteCata(ProductCatagory pc);
    
}


public class ServiceProductCatagory extends IProductCatagoryService
{
    private static DataProductCatagory dataProductCatagory=null;
    public ServiceProductCatagory()
    {
        if (ServiceProductCatagory.dataProductCatagory == null)
        {
            ServiceProductCatagory.dataProductCatagory = new DataProductCatagory();
        }  
    }

    public ArrayList<ProductCatagory> showProductCatagory(String str)
    {
        return ServiceProductCatagory.dataProductCatagory.ProductCatagoryData(str); 
    }
    
    public boolean AddCata(ProductCatagory pc)
    {
        return ServiceProductCatagory.dataProductCatagory.AddCata(pc); 
    }
    
    public boolean DelteCata(ProductCatagory pc)
    {
        return ServiceProductCatagory.dataProductCatagory.DeleteCata(pc);
    }
}