package tatar.tourism.web;

import org.apache.log4j.Logger;
import tatar.tourism.dao.DaoFactory;
import tatar.tourism.dao.MessagesDao;
import tatar.tourism.pojo.Message;
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
@WebServlet({"/dialog", "/coden"})
public class Dialog extends HttpServlet {
    static Logger log = Logger.getLogger(Dialog.class);
    static MessagesDao messagesDao = DaoFactory.getDAOFactory(1).getMessageDao();


    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String receiver = req.getParameter("receiver");
        String sender = ((User) (req.getSession().getAttribute("user"))).getUsername();
        List<Message> messageList = null;
        try {
            messageList = messagesDao.getAll(sender, receiver);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        req.setAttribute("messages", messageList);
        req.setAttribute("sessionUser", req.getSession().getAttribute("user"));
        req.setAttribute("receiver", receiver);
        getServletContext().getRequestDispatcher("/dialog.jsp").forward(req, resp);


    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("ISO-8859-1");
        resp.setContentType("text/html;charset=UTF-8");
        String receiver = req.getParameter("receiver");
        String sender = ((User) (req.getSession().getAttribute("user"))).getUsername();
        String message = req.getParameter("message");
        Message messageBD = new Message();
        messageBD.setDate(new java.util.Date());
        messageBD.setMessage(message);
        messageBD.setReceiver(receiver);
        messageBD.setSender(sender);
        messagesDao.create(messageBD);
        resp.getWriter().write(messageBD.getSender() + "  " + messageBD.getDate() + "<br>\n" +
                "\n" +
                messageBD.getMessage() + "            <br>\n" +
                "            <br>\n" +
                "            <br>");

    }
}

