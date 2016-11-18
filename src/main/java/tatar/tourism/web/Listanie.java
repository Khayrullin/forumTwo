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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

/**
 * Created by habar on 30.10.2016.
 */
@WebServlet("/listanie")
public class Listanie extends HttpServlet {
    static Logger log = Logger.getLogger(Listanie.class);

    private static final int THEMES_ON_PAGE = 10;

    protected void listanie(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String whichPage = req.getParameter("whichPage");

        List<Theme> themeList2 = (List<Theme>) req.getSession().getAttribute("themes");

        List<Theme> themeList = null;

        if (whichPage == null) {
            if (themeList2.size() < 10) {
                themeList = themeList2;
            } else {
                themeList = themeList2.subList(0, THEMES_ON_PAGE);
            }


        } else {
            int page = (Integer.parseInt(whichPage) - 1) * THEMES_ON_PAGE;
            if (themeList2.size() < page + THEMES_ON_PAGE) {
                themeList = themeList2.subList(page, themeList2.size());
            } else {
                themeList = themeList2.subList(page, page + THEMES_ON_PAGE);
            }

        }
        req.setAttribute("themes", themeList);
        int size = themeList2.size() / 10;
        int[] pages = new int[size + 1];
        for (int i = 0; i < size + 1; i++) {
            pages[i] = i + 1;
        }

        req.setAttribute("pages", pages);
        req.setAttribute("sessionUser", req.getSession().getAttribute("user"));
        getServletContext().getRequestDispatcher("/forum.jsp").forward(req, resp);


    }


    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        listanie(req, resp);


    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        listanie(req, resp);
    }
}
