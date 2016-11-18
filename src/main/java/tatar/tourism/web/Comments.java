package tatar.tourism.web;

import org.apache.log4j.Logger;
import tatar.tourism.dao.CommentDao;
import tatar.tourism.dao.DaoFactory;
import tatar.tourism.dao.ThemeDao;
import tatar.tourism.pojo.Comment;
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
@WebServlet("/comments")
public class Comments extends HttpServlet {
    static Logger log = Logger.getLogger(Comments.class);
    static ThemeDao themeDao = DaoFactory.getDAOFactory(1).getThemeDao();
    static CommentDao commentDao = DaoFactory.getDAOFactory(1).getCommentDao();


    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String themeID = req.getParameter("id");
        Theme theme = null;
        List<Comment> commentList = null;


        try {

            theme = themeDao.read(Integer.parseInt(themeID));
            commentList = commentDao.getAll(theme.getId());

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        req.setAttribute("theme", theme);
        req.setAttribute("commentList", commentList);
        req.setAttribute("sessionUser", req.getSession().getAttribute("user"));
        getServletContext().getRequestDispatcher("/comments.jsp").forward(req, resp);


    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("ISO-8859-1");
        resp.setContentType("text/html;charset=UTF-8");
        String autor = ((User) (req.getSession().getAttribute("user"))).getUsername();
        String message = req.getParameter("message");
        String themeID = req.getParameter("id");


        Comment comment = new Comment();
        comment.setDate(new java.util.Date());
        comment.setComment(message);
        comment.setAutor(autor);
        comment.setThemeID(Integer.parseInt(themeID));


        commentDao.create(comment);
        req.setAttribute("id", themeID);


        doGet(req, resp);

    }
}
