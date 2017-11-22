package data.admin;

import data.Conn;  
import entity.ProductCatagory;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;
public class DataAdmin {
    static Connection conn = Conn.DB();
    static ResultSet rs = null;
    static PreparedStatement pst = null;  
    public ArrayList<ProductCatagory> ShowCata(String str)
    {
        ArrayList<ProductCatagory> cataList = new ArrayList<>(); 
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
                    cataList.add(pc);
                }
            }
            catch (SQLException ex) {
                ex.printStackTrace();
            }
        } 
        return cataList;
    } 
}