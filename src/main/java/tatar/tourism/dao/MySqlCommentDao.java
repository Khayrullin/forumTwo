package tatar.tourism.dao;

import tatar.tourism.pojo.Comment;

import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by habar on 29.10.2016.
 */
public class MySqlCommentDao extends MySqlDao implements CommentDao {
    @Override
    public void create(Comment comment) {
        PreparedStatement stmt = null;
        Connection con = getConnection();
        try {
            stmt = con.prepareStatement("INSERT INTO comments "
                    + "( themeID, autor, comment, time)"
                    + "VALUES( ?,?,?,?)");
            stmt.setInt(1, comment.getThemeID());
            stmt.setString(2, comment.getAutor());
            stmt.setString(3, comment.getComment());
            stmt.setTimestamp(4, new Timestamp(comment.getDate().getTime()));
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                stmt.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


    }

    @Override
    public void delete(Comment comment) {
        PreparedStatement stmt = null;
        Connection con = getConnection();
        try {
            stmt = con.prepareStatement("DELETE FROM comments WHERE message_ID =  ?");
            stmt.setInt(1, comment.getId());

            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                stmt.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    @Override
    public List<Comment> getAll(int theme) throws NoSuchAlgorithmException {
        String sql = "SELECT * FROM comments";
        List<Comment> list = new ArrayList<>();
        PreparedStatement stm = null;
        Connection con = getConnection();
        try {
            stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                if (rs.getInt("themeID") == theme){
                    Comment s = new Comment();
                    s.setId(rs.getInt("id"));
                    s.setThemeID(theme);
                    s.setAutor(rs.getString("autor"));
                    s.setComment(rs.getString("comment"));
                    s.setDate(rs.getTimestamp("time"));

                    list.add(s);
                }
                }


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                stm.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }


}
