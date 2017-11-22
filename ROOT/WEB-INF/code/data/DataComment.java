package data;

import entity.Comment;
import entity.Error;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DataComment {

    static Connection conn = Conn.DB();
    static ResultSet rs = null;
    static PreparedStatement pst = null;

    public ArrayList<Comment> CommentData(String str) {
        ArrayList<Comment> CommentList = new ArrayList<>();
        if (conn != null) {
            try {
                String sql = "select * from product_comment " + str;
                pst = conn.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    Comment comment = new Comment();

                    comment.setId(rs.getInt(1));
                    comment.setProduct_id(rs.getInt(2));
                    comment.setPeople_id(rs.getInt(3));
                    comment.setText(rs.getString(4));
                    comment.setDatetime(rs.getString(5));

                    CommentList.add(comment);
                }
            } catch (SQLException ex) {
            }
        }
        return CommentList;
    }

    public boolean InsertComment(Comment comment, Error errr) {
        if (conn != null) {
            try {
                SimpleDateFormat sdfDate = new SimpleDateFormat("dd, MMM yy HH.mm aa");
                Date now = new Date();
                String strDate = sdfDate.format(now);

                String str4 = "Insert into product_comment(product_id,people_id,text,datetime) values(?,?,?,?)";
                pst = conn.prepareStatement(str4);
                pst.setInt(1, comment.getProduct_id());
                pst.setInt(2, comment.getPeople_id());
                pst.setString(3, comment.getText());
                pst.setString(4, strDate);
                pst.executeUpdate();
                return true;
            } catch (SQLException e) {
                errr.setClassName("DataComment.java<br>");
                errr.setError(e.toString());
                return false;
            }
        } else {
            errr.setClassName("DataComment.java<br>");
            errr.setError("Connection Problem");
            return false;
        }
    }

}
