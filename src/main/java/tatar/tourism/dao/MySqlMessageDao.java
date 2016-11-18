package tatar.tourism.dao;

import tatar.tourism.pojo.*;

import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by habar on 29.10.2016.
 */
public class MySqlMessageDao extends MySqlDao implements MessagesDao {
    @Override
    public void create(Message message) {
        PreparedStatement stmt = null;
        Connection con = getConnection();
        try {
            stmt = con.prepareStatement("INSERT INTO messages "
                    + "( receiver, sender, message, time)"
                    + "VALUES( ?,?,?,?)");
            stmt.setString(1, message.getReceiver());
            stmt.setString(2, message.getSender());
            stmt.setString(3, message.getMessage());
            stmt.setTimestamp(4, new Timestamp(message.getDate().getTime()));
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
    public void delete(Message message) {
        PreparedStatement stmt = null;
        Connection con = getConnection();
        try {
            stmt = con.prepareStatement("DELETE FROM messages WHERE message_ID =  ?");
            stmt.setInt(1, message.getMessage_ID());

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
    public List<Message> getAll(String sender, String receiver) throws NoSuchAlgorithmException {
        String sql = "SELECT * FROM messages";
        List<Message> list = new ArrayList<>();
        PreparedStatement stm = null;
        Connection con = getConnection();
        try {
            stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                if ((rs.getString("sender").equals(sender)  &&
                        rs.getString("receiver").equals(receiver)  )||
                        (rs.getString("sender").equals(receiver) &&
                                rs.getString("receiver").equals(sender))) {
                    Message s = new Message();
                    s.setMessage_ID(rs.getInt("message_ID"));
                    s.setReceiver(rs.getString("receiver"));
                    s.setSender(rs.getString("sender"));
                    s.setMessage(rs.getString("message"));
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
