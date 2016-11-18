package tatar.tourism.dao;

/**
 * Created by Ilya Evlampiev on 20.10.2015.
 */

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Фабрика объектов для работы с базой данных
 */
public abstract class DaoFactory {

    public static final int MYSQL = 1;

    public static DaoFactory getDAOFactory(
            int whichFactory) {

        switch (whichFactory) {
            case MYSQL:
                return new MySQLDaoFactory();
            default           :
                return null;
        }
    }
    /**
     * Возвращает подключение к базе данных
     */
    public abstract Connection getConnection() throws SQLException;


    public abstract UserDao getUserDao();

    public abstract MessagesDao getMessageDao();

    public abstract TokenDao getTokenDao();

    public abstract ThemeDao getThemeDao();

    public abstract CommentDao getCommentDao();



}
