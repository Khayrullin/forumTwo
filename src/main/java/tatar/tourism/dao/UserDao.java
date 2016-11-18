package tatar.tourism.dao;

import tatar.tourism.pojo.User;

import java.security.NoSuchAlgorithmException;
import java.util.List;

/**
 * Created by Ilya Evlampiev on 20.10.2015.
 */
public interface UserDao {
    /**
     * Создает новую запись и соответствующий ей объект
     */
    public void create(User user);

    /**
     * Возвращает объект соответствующий записи с первичным ключом key или null
     */
    public User read(int key) throws NoSuchAlgorithmException;

    /**
     * Сохраняет состояние объекта group в базе данных
     */
    public void update(User user);

    /**
     * Удаляет запись об объекте из базы данных
     */
    public void delete(User user);

    /**
     * Возвращает список объектов соответствующих всем записям в базе данных
     */
    public List<User> getAll() throws NoSuchAlgorithmException;

    public User read(String login, String password) throws NoSuchAlgorithmException;

    public User read(String login) throws NoSuchAlgorithmException;
}
