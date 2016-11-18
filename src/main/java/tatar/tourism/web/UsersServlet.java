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
import java.util.List;

/**
 * Created by Ilya Evlampiev on 26.10.2015.
 */
@WebServlet("/users")
public class UsersServlet extends HttpServlet {
    static Logger log = Logger.getLogger(UsersServlet.class);
    static UserDao userDao = DaoFactory.getDAOFactory(1).getUserDao();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        List<User> userList = null;
        try {

            userList = userDao.getAll();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        log.debug("User list is got from the db");
        req.setAttribute("users", userList);
        req.setAttribute("sessionUser", req.getSession().getAttribute("user"));
        getServletContext().getRequestDispatcher("/users.jsp").forward(req, resp);
    }

    // Переопределим стандартные методы
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String dbId = req.getParameter("dbId");
        String role = req.getParameter("role");
        String firstname = req.getParameter("firstname");
        String lastname = req.getParameter("lastname");
        String email = req.getParameter("email");

        User userToBeUpdated = null;
        try {
            userToBeUpdated = userDao.read(Integer.parseInt(dbId));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        if (role != null) userToBeUpdated.setRole(role);
        if (firstname != null) userToBeUpdated.setFirstname(firstname);
        if (lastname != null) userToBeUpdated.setLastname(lastname);
        if (email != null) userToBeUpdated.setEmail(email);
        userDao.update(userToBeUpdated);
        List<User> userList = null;
        try {
            userList = userDao.getAll();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        log.debug("User list is got from the db");
        req.setAttribute("users", userList);
        req.setAttribute("sessionUser", req.getSession().getAttribute("user"));
        getServletContext().getRequestDispatcher("/users.jsp").forward(req, resp);
    }


}
