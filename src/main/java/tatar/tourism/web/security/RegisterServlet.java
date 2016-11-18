package tatar.tourism.web.security;

import org.apache.log4j.Logger;
import tatar.tourism.dao.DaoFactory;
import tatar.tourism.dao.TokenDao;
import tatar.tourism.dao.UserDao;
import tatar.tourism.mail.GreetingEmail;
import tatar.tourism.pojo.JUser;
import tatar.tourism.pojo.Token;
import tatar.tourism.pojo.User;
import tatar.tourism.pojo.UserTypes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;

/**
 * Created by Ilya Evlampiev on 31.10.2015.
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    static Logger log = Logger.getLogger(RegisterServlet.class);
    static UserDao userDao = DaoFactory.getDAOFactory(1).getUserDao();
    static TokenDao tokenDao = DaoFactory.getDAOFactory(1).getTokenDao();

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        log.info("Starting registering user");
        User newUser = new JUser();
        log.debug("Retrieving user name from session");
        newUser.setRole(UserTypes.JUSER.toString());
        newUser.setUsername(req.getParameter("username"));
        newUser.setFirstname(req.getParameter("firstname"));
        newUser.setLastname(req.getParameter("lastname"));
        try {
            newUser.setPassword(req.getParameter("password"));
        } catch (NoSuchAlgorithmException e) {
            log.error("MD5 algorithm not fount");
            e.printStackTrace();
        }
        newUser.setEmail(req.getParameter("email"));
        log.debug("Retrieving user email from request");
        newUser.setLocale(req.getSession().getAttribute("language").toString());


        log.debug("Saving user " + newUser.getUsername());
        try {
            userDao.create(newUser);
            newUser = userDao.read(newUser.getUsername());
            log.info("Saving user " + newUser.getUsername() + " succeed");
            Token tk = new Token();
            tk.setUuid(java.util.UUID.randomUUID().toString());
            Calendar c = Calendar.getInstance();
            c.setTime(new java.util.Date()); // Now use today date.
            c.add(Calendar.DATE, 3);
            java.util.Date now_plus_5_days = c.getTime();
            tk.setDeleteDate(now_plus_5_days);
            tk.setUser(newUser);
            tokenDao.create(tk);
            getServletContext().getRequestDispatcher("/userCreated.jsp").forward(req, resp);
            GreetingEmail ge = new GreetingEmail(req.getSession().getAttribute("language").toString(), newUser.getEmail(), newUser.getUsername(), req.getParameter("password"), tk.getUuid());
            ge.send();

        } catch (Exception ex) {
            getServletContext().getRequestDispatcher("/register.jsp").forward(req, resp);
        }


    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/register.jsp").forward(req, resp);
    }
}
