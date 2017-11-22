package core;

import data.DataPeople;
import entity.People;
import entity.Error;
import java.util.ArrayList;
abstract class IPeopleService 
{
    abstract ArrayList<People> showUser(String str);

    abstract boolean Reg(People people,Error errr);

    abstract boolean EmailUse(People people,Error errr);
    abstract boolean UpdateOne(People people,Error errr, String col, String colValue, int idValue);
    
}


public class ServicePeople extends IPeopleService
{
    private static DataPeople dataPeople=null;
    public ServicePeople()
    {
        if (ServicePeople.dataPeople == null)
        {
            ServicePeople.dataPeople = new DataPeople();
        }  
    }

    @Override
    public ArrayList<People> showUser(String str)
    {
        return ServicePeople.dataPeople.PeopleData(str); 
    }

    @Override
    public boolean Reg(People people,Error errr)
    {
        return ServicePeople.dataPeople.SignUp(people,errr); 
    }

    @Override
    public boolean EmailUse(People people,Error errr)
    {
        return ServicePeople.dataPeople.emailUse(people,errr); 
    }

    @Override
    public boolean UpdateOne(People people,Error errr, String col, String colValue, int idValue)
    {
        return ServicePeople.dataPeople.updateOne(people,errr,col,colValue,idValue); 
    }
}