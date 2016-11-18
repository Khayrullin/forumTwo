package tatar.tourism.dao;

import tatar.tourism.pojo.Message;
import tatar.tourism.pojo.Theme;

import java.security.NoSuchAlgorithmException;
import java.util.List;

/**
 * Created by Bulat Khayrullin on 30.10.2015.
 */
public interface ThemeDao {
    /**
     * Создает новую запись и соответствующий ей объект
     */
    public void create(Theme theme);


    public Theme read(int key) throws NoSuchAlgorithmException;

    /**
     * Удаляет запись об объекте из базы данных
     */

    public void delete(int id);

    /**
     * Возвращает dialog
     */
    public List<Theme> getAll() throws NoSuchAlgorithmException;
}
