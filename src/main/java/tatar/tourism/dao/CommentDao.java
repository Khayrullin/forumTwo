package tatar.tourism.dao;

import tatar.tourism.pojo.Comment;

import java.security.NoSuchAlgorithmException;
import java.util.List;

/**
 * Created by Bulat Khayrullin on 30.10.2015.
 */
public interface CommentDao {
    /**
     * Создает новую запись и соответствующий ей объект
     */
    public void create(Comment comment);


    /**
     * Удаляет запись об объекте из базы данных
     */

    public void delete(Comment comment);


    public List<Comment> getAll(int themeID) throws NoSuchAlgorithmException;
}
