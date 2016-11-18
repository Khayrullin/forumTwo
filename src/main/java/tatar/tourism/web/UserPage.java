package tatar.tourism.web;

import org.apache.log4j.Logger;
import tatar.tourism.dao.DaoFactory;
import tatar.tourism.dao.UserDao;
import tatar.tourism.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

/**
 * Created by Ilya Evlampiev on 26.10.2015.
 */
@WebServlet("/userSettings")
public class UserPage extends HttpServlet {
    static Logger log = Logger.getLogger(UserPage.class);
    static UserDao userDao = DaoFactory.getDAOFactory(1).getUserDao();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        User user = null;
        try {
            user = userDao.read(((User) req.getSession().getAttribute("user")).getUsername());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        log.debug("User is got from the db");
        req.setAttribute("sessionUser", req.getSession().getAttribute("user"));
        req.setAttribute("userP", user);
        getServletContext().getRequestDispatcher("/userPage.jsp").forward(req, resp);
    }

    // Переопределим стандартные методы
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String userName = req.getParameter("username");
        User userToLookAfter = null;
        try {
            userToLookAfter = userDao.read(userName);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        log.debug("User list is got from the db");
        req.setAttribute("sessionUser", req.getSession().getAttribute("user"));
        req.setAttribute("userP", userToLookAfter);

        getServletContext().getRequestDispatcher("/userPage.jsp").forward(req, resp);
    }


}
