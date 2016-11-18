package tatar.tourism.dao;

import tatar.tourism.pojo.Message;
import tatar.tourism.pojo.Theme;

import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by habar on 29.10.2016.
 */
public class MySqlThemeDao extends MySqlDao implements ThemeDao {
    @Override
    public void create(Theme theme) {
        PreparedStatement stmt = null;
        Connection con = getConnection();
        try {
            stmt = con.prepareStatement("INSERT INTO themes "
                    + "( autor, theme,message, time)"
                    + "VALUES( ?,?,?,?)");
            stmt.setString(1, theme.getAutor());
            stmt.setString(2, theme.getTheme());
            stmt.setString(3, theme.getMessage());
            stmt.setTimestamp(4, new Timestamp(theme.getDate().getTime()));
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
    public Theme read(int key) throws NoSuchAlgorithmException {
        String sql = "SELECT * FROM themes WHERE id = ?";
        Theme s = new Theme();
        PreparedStatement stm = null;
        Connection con = getConnection();
        try {
            stm = con.prepareStatement(sql);
            stm.setInt(1, key);
            ResultSet rs = stm.executeQuery();
            rs.next();
            s.setId(rs.getInt("id"));
            s.setTheme(rs.getString("theme"));
            s.setAutor(rs.getString("autor"));
            s.setMessage(rs.getString("message"));
            s.setDate(rs.getTimestamp("time"));
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

        return s;
    }

    @Override
    public void delete(int id) {
        PreparedStatement stmt = null;
        Connection con = getConnection();
        try {
            stmt = con.prepareStatement("DELETE FROM themes WHERE id =  ?");
            stmt.setInt(1, id);

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
    public List<Theme> getAll() throws NoSuchAlgorithmException {
        String sql = "SELECT * FROM themes";
        List<Theme> list = new ArrayList<>();
        PreparedStatement stm = null;
        Connection con = getConnection();
        try {
            stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {

                Theme s = new Theme();
                s.setId(rs.getInt("id"));
                s.setAutor(rs.getString("autor"));
                s.setTheme(rs.getString("theme"));
                s.setDate(rs.getTimestamp("time"));
                s.setMessage(rs.getString("message"));

                list.add(s);

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
