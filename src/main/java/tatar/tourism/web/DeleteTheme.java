package tatar.tourism.web;

import org.apache.log4j.Logger;
import tatar.tourism.dao.DaoFactory;
import tatar.tourism.dao.ThemeDao;
import tatar.tourism.pojo.Theme;
import tatar.tourism.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

/**
 * Created by habar on 30.10.2016.
 */
@WebServlet("/deleteTheme")
public class DeleteTheme extends HttpServlet {
    static Logger log = Logger.getLogger(DeleteTheme.class);
    static ThemeDao themeDao = DaoFactory.getDAOFactory(1).getThemeDao();


    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {


        req.setCharacterEncoding("ISO-8859-1");
        resp.setContentType("text/html;charset=UTF-8");
        int themeId = Integer.parseInt(req.getParameter("themeId"));

        themeDao.delete(themeId);

        getServletContext().getRequestDispatcher("/themes").forward(req, resp);




    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req,resp);
    }
}
