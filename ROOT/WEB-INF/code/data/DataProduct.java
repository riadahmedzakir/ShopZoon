package data;

import static data.DataOrder.conn;
import entity.Product;
import entity.Config;
import entity.Error;
import entity.Payment;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;
import java.io.*;
import java.text.DateFormat;
import java.util.Date;

public class DataProduct {

    static Connection conn = Conn.DB();
    static ResultSet rs = null;
    static PreparedStatement pst = null;

    public ArrayList<Product> ProductData(String str) {
        ArrayList<Product> ProductList = new ArrayList<>();
        if (conn != null) {
            try {
                String sql = "select * from Product " + str;
                pst = conn.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    Product Product = new Product();

                    Product.setProduct_id(rs.getInt(1));
                    Product.setProduct_catagory(rs.getString(2));
                    Product.setProduct_title(rs.getString(3));
                    Product.setProduct_code(rs.getString(4));
                    Product.setProduct_price(rs.getInt(5));
                    Product.setProduct_discount(rs.getInt(6));
                    Product.setProduct_size(rs.getString(7));
                    Product.setProduct_image(rs.getString(8));
                    Product.setProduct_img_catagory(rs.getString(9));
                    Product.setProduct_season(rs.getString(10));
                    Product.setProduct_time(rs.getString(11));
                    Product.setProduct_limit(rs.getInt(12));
                    Product.setProduct_discription(rs.getString(13));

                    ProductList.add(Product);
                }
            } catch (SQLException ex) {
            }
        }
        return ProductList;
    }

    public static ArrayList<Product> ProductSearch(String str) {
        ArrayList<Product> ProductList = new ArrayList<>();
        if (conn != null) {
            try { 
                String sql1 = "select * from Product where product_title LIKE ?";
                pst = conn.prepareStatement(sql1);
                pst.setString(1, "%" + str + "%");
                rs = pst.executeQuery();
                while (rs.next()) {  
                    Product Product = new Product();
                    Product.setProduct_id(rs.getInt(1));
                    Product.setProduct_catagory(rs.getString(2));
                    Product.setProduct_title(rs.getString(3));
                    Product.setProduct_code(rs.getString(4));
                    Product.setProduct_price(rs.getInt(5));
                    Product.setProduct_discount(rs.getInt(6));
                    Product.setProduct_size(rs.getString(7));
                    Product.setProduct_image(rs.getString(8));
                    Product.setProduct_img_catagory(rs.getString(9));
                    Product.setProduct_season(rs.getString(10));
                    Product.setProduct_time(rs.getString(11));
                    Product.setProduct_limit(rs.getInt(12));
                    Product.setProduct_discription(rs.getString(13));

                    ProductList.add(Product);
                } 
                
                String sql2 = "select * from Product where product_discription LIKE '%" + str + "%'";
                pst = conn.prepareStatement(sql2);
                rs = pst.executeQuery();
                while (rs.next()) {  
                    Product Product = new Product();
                    Product.setProduct_id(rs.getInt(1));
                    Product.setProduct_catagory(rs.getString(2));
                    Product.setProduct_title(rs.getString(3));
                    Product.setProduct_code(rs.getString(4));
                    Product.setProduct_price(rs.getInt(5));
                    Product.setProduct_discount(rs.getInt(6));
                    Product.setProduct_size(rs.getString(7));
                    Product.setProduct_image(rs.getString(8));
                    Product.setProduct_img_catagory(rs.getString(9));
                    Product.setProduct_season(rs.getString(10));
                    Product.setProduct_time(rs.getString(11));
                    Product.setProduct_limit(rs.getInt(12));
                    Product.setProduct_discription(rs.getString(13));

                    ProductList.add(Product);
                }
                
                String sql3 = "select * from Product where product_catagory='" + str + "' or product_code='" + str + "' or product_price='" + str + "' or product_season ='" + str + "'";
                pst = conn.prepareStatement(sql3);
                rs = pst.executeQuery();
                while (rs.next()) {  
                    Product Product = new Product();
                    Product.setProduct_id(rs.getInt(1));
                    Product.setProduct_catagory(rs.getString(2));
                    Product.setProduct_title(rs.getString(3));
                    Product.setProduct_code(rs.getString(4));
                    Product.setProduct_price(rs.getInt(5));
                    Product.setProduct_discount(rs.getInt(6));
                    Product.setProduct_size(rs.getString(7));
                    Product.setProduct_image(rs.getString(8));
                    Product.setProduct_img_catagory(rs.getString(9));
                    Product.setProduct_season(rs.getString(10));
                    Product.setProduct_time(rs.getString(11));
                    Product.setProduct_limit(rs.getInt(12));
                    Product.setProduct_discription(rs.getString(13));

                    ProductList.add(Product);
                }
                
            } 
            catch (SQLException ex) {
            }
        }
        return ProductList;
    }

    public boolean ProductUpload(Product pt, Error errr) {
        if (conn != null) {
            File imgFile = new File(Config.root + "/img/temp/" + pt.getProduct_image());
            try {
                Date now = new Date();
                DateFormat defaultDf = DateFormat.getDateTimeInstance();
                DateFormat shortDf = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT);
                String product_time = defaultDf.format(now);

                if (imgFile.renameTo(new File(Config.root + "/img/product/" + pt.getProduct_image()))) {
                    String str4 = "Insert into product(product_catagory,product_title,product_code,product_price,product_discount,product_size,product_image,product_img_catagory,product_season,product_limit,product_time,product_discription) values(?,?,?,?,?,?,?,?,?,?,?,?)";
                    pst = conn.prepareStatement(str4);
                    pst.setString(1, pt.getProduct_catagory());
                    pst.setString(2, pt.getProduct_title());
                    pst.setString(3, pt.getProduct_code());
                    pst.setInt(4, pt.getProduct_price());
                    pst.setInt(5, pt.getProduct_discount());
                    pst.setString(6, pt.getProduct_size());
                    pst.setString(7, pt.getProduct_image());
                    pst.setString(8, pt.getProduct_img_catagory());
                    pst.setString(9, pt.getProduct_season());
                    pst.setInt(10, pt.getProduct_limit());
                    pst.setString(11, product_time);
                    pst.setString(12, pt.getProduct_discription());
                    pst.executeUpdate();
                    return true;
                } else {
                    imgFile.delete();
                    errr.setClassName("DataProduct.java");
                    errr.setError("Img File Problem");
                    return false;
                }
            } catch (SQLException e) {
                imgFile.delete();
                errr.setClassName("DataProduct.java");
                errr.setError(e.toString());
                return false;
            }
        } else {
            errr.setClassName("DataProduct.java");
            errr.setError("Connection Problem");
            return false;
        }
    }
    
    public boolean ProductUpdate(Product pt) {
        if (conn != null) { 
            try {  
                    String str4 = "UPDATE product SET product_catagory=?,product_title=?,product_code=?,product_price=?,product_discount=?,product_size=?,product_image=?,product_img_catagory=?,product_season=?,product_limit=?,product_discription=? where product_id="+pt.getProduct_id();
                    pst = conn.prepareStatement(str4);
                    pst.setString(1, pt.getProduct_catagory());
                    pst.setString(2, pt.getProduct_title());
                    pst.setString(3, pt.getProduct_code());
                    pst.setInt(4, pt.getProduct_price());
                    pst.setInt(5, pt.getProduct_discount());
                    pst.setString(6, pt.getProduct_size());
                    pst.setString(7, pt.getProduct_image());
                    pst.setString(8, pt.getProduct_img_catagory());
                    pst.setString(9, pt.getProduct_season());
                    pst.setInt(10, pt.getProduct_limit()); 
                    pst.setString(11, pt.getProduct_discription()); 
                    pst.executeUpdate();
                    return true;   
            } 
            catch (SQLException e) {  
                System.out.print(e.toString());
                return false;
            }
        } else { 
            return false;
        }
    }
    
    public ArrayList<Payment> ShowCancelPayment(String str) {
        ArrayList<Payment> paymentList = new ArrayList<>();
        if (conn != null) {
            try {
                String sql = "select * from Product_Cancel " + str;
                pst = conn.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    Payment payment = new Payment();

                    payment.setPayment_id(rs.getInt("payment_id"));
                    payment.setOrder_id(rs.getString("order_id"));
                    payment.setCustomer_id(rs.getInt("Customer_id"));
                    payment.setProduct_id(rs.getInt("product_id"));
                    payment.setPayment_type(rs.getString("payment_type"));
                    payment.setPayment_address(rs.getString("payment_address"));
                    payment.setTransaction_id(rs.getString("transaction_id"));
                    payment.setAmount(rs.getInt("amount")); 
                    payment.setSuccess(rs.getInt("success"));

                    paymentList.add(payment);
                }
            } catch (SQLException ex) {
            }
        }
        return paymentList;
    }
}
