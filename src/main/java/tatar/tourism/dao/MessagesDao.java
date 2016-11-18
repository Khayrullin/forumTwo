package tatar.tourism.dao;

import tatar.tourism.pojo.Message;

import java.security.NoSuchAlgorithmException;
import java.util.List;

/**
 * Created by Bulat Khayrullin on 30.10.2015.
 */
public interface MessagesDao {
    /**
     * Создает новую запись и соответствующий ей объект
     */
    public void create(Message message);


    /**
     * Удаляет запись об объекте из базы данных
     */

    public void delete(Message message);

    /**
     * Возвращает dialog
     */
    public List<Message> getAll(String sender_ID, String  receiver_ID) throws NoSuchAlgorithmException;
}
