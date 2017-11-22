package data;

import entity.ProductCatagory;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;
public class DataProductCatagory {
    static Connection conn = null;
    static ResultSet rs = null;
    static PreparedStatement pst = null; 
    public ArrayList<ProductCatagory> ProductCatagoryData(String str)
    {
        ArrayList<ProductCatagory> pcList = new ArrayList<>();
        conn=Conn.DB();
        if(conn!=null)
        {
            try 
            {
                String sql = "select * from product_catagory "+str;
                pst = conn.prepareStatement(sql);
                rs = pst.executeQuery();
                while(rs.next())
                {
                    ProductCatagory pc = new ProductCatagory();

                    pc.setId(rs.getInt(1));
                    pc.setProduct_catagory(rs.getString(2));
                    pc.setActive(rs.getInt(3));  

                    pcList.add(pc);
                }
            }
            catch (SQLException ex) {
            }
        } 
        return pcList;
    }
    
    
    public boolean AddCata(ProductCatagory pc)
    { 
        if(conn!=null)
        { 
            try
            {   
                String str4 = "Insert into product_catagory(product_catagory) values(?)";
                pst = conn.prepareStatement(str4);
                pst.setString(1, pc.getProduct_catagory()); 
                pst.executeUpdate();
                return true; 
            }
            catch (SQLException e) {return false; }
        }  
        else {return false; }
    }
    
    public boolean DeleteCata(ProductCatagory pc)
    { 
        if(conn!=null)
        { 
            try
            {   
                String str4 = "DELETE FROM product_catagory WHERE id="+pc.getId();
                pst = conn.prepareStatement(str4); 
                pst.executeUpdate(); 
                return true; 
            }
            catch (SQLException e) {return false; }
        }  
        else {return false; }
    }
}