package core;

import data.DataJoin;  
import entity.People;
abstract class IJoinService 
{ 
    abstract String unComplicateOrder(String str);
 
    
}
 
public class ServiceJoin extends IJoinService
{
    private static DataJoin dataJoin=null;
    public ServiceJoin()
    {
        if (ServiceJoin.dataJoin == null)
        {
            ServiceJoin.dataJoin = new DataJoin();
        }  
    }
 
    @Override
    public String unComplicateOrder(String str)
    {
        return DataJoin.UnComplicateOrder(str); 
    }
}