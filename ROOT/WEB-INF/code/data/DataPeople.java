package data;

import entity.People;
import entity.Error;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;

public class DataPeople {

    static Connection conn = Conn.DB();
    static ResultSet rs = null;
    static PreparedStatement pst = null;

    public ArrayList<People> PeopleData(String str) {
        ArrayList<People> peopleList = new ArrayList<>();
        if (conn != null) {
            try {
                String sql = "select * from people " + str;
                pst = conn.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    People people = new People();

                    people.setId(rs.getInt(1));
                    people.setFname(rs.getString(2));
                    people.setLname(rs.getString(3));
                    people.setUsername(rs.getString(4));
                    people.setEmail(rs.getString(5));
                    people.setPassword(rs.getString(6));
                    people.setPhone(rs.getString(8));
                    people.setLocation(rs.getString(9));
                    people.setCookies(rs.getString(10));
                    people.setLogfail(rs.getInt(11));
                    people.setType(rs.getString(12));
                    people.setActive(rs.getInt(13));
                    people.setRating(rs.getString(14));

                    peopleList.add(people);
                }
            } catch (SQLException ex) {
            }
        }
        return peopleList;
    }

    public boolean SignUp(People people, Error errr) {
        if (conn != null) {
            try {
                long i = System.currentTimeMillis();
                String username = people.getFname() + String.valueOf(i);

                String str4 = "Insert into people(fname,lname,username,email,password,location,type,active) values(?,?,?,?,?,?,?,?)";
                pst = conn.prepareStatement(str4);
                pst.setString(1, people.getFname());
                pst.setString(2, people.getLname());
                pst.setString(3, username);
                pst.setString(4, people.getEmail());
                pst.setString(5, people.getPassword());
                pst.setString(6, people.getLocation());
                pst.setString(7, people.getType());
                if (people.getType().equals("Customar")) {
                    pst.setInt(8, 1);
                } else {
                    pst.setInt(8, 0);
                }
                pst.executeUpdate();
                return true;
            } catch (Exception e) {
                errr.setClassName("DataPople.java");
                errr.setError(e.toString());
                return false;
            }
        } else {
            errr.setClassName("DataPople.java");
            errr.setError("Connection Problem");
            return false;
        }
    }

    public boolean emailUse(People people, Error errr) {
        if (conn != null) {
            try {
                String sql = "select * from people where email = ?";
                pst = conn.prepareStatement(sql);
                pst.setString(1, people.getEmail());
                rs = pst.executeQuery();
                if (rs.next()) {
                    errr.setError("Email Already Use");
                    return false;
                } else {
                    return true;
                }
            } catch (Exception e) {
                errr.setClassName("DataPople.java");
                errr.setError(e.toString());
                return false;
            }
        } else {
            errr.setClassName("DataPople.java");
            errr.setError("Connection Problem");
            return false;
        }
    }

    public boolean updateOne(People people, Error errr, String col, String colValue, int idValue) {
        if (conn != null) {
            try {
                String sqlUp = "UPDATE people SET " + col + " = ? " + " WHERE id =" + idValue;
                PreparedStatement pst = conn.prepareStatement(sqlUp);
                pst.setString(1, colValue);
                pst.executeUpdate();
                return true; 
            } catch (SQLException e) {
                System.out.print(e.toString());
                errr.setClassName("DataPople.java");
                errr.setError(e.toString());
                return false;
            }
        } else {
            errr.setClassName("DataPople.java");
            errr.setError("Connection Problem");
            return false;
        }
    }
    
    public String OneData(People people) throws SQLException  
    { 
        try
        {
            String sql = "select * from people where type='Deliver' and active=1 and (email='"+people.getEmail()+"' or id='"+people.getEmail()+"')";
            pst = conn.prepareStatement(sql); 
            rs = pst.executeQuery();
            if (rs.next()) { 
                return rs.getString(2)+" "+rs.getString(3)+"/"+rs.getInt(1);
            } 
          }
        catch(SQLException ex) { }    
        return null;
    }
}
