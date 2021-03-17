package controller.user;

import model.entities.User;
import model.service.user.IUser;
import model.service.user.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    private static UserService service = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                showLoginForm(request, response);
                break;
            case "register":
                showRegisterForm(request, response);
                break;
            case "view":
                break;
            default:

                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                login(request, response);
                break;
            case "register":
                register(request, response);
                break;
            default:
                break;
        }
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/login.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showRegisterForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/register.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void login(HttpServletRequest request, HttpServletResponse response) {
        String uName = request.getParameter("userName");
        String pwd = request.getParameter("passWord");
        service.checkLogin(uName, pwd);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/view.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    private void register(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String userName = request.getParameter("username");
        String passWord = request.getParameter("password");
        String email = request.getParameter("email");
        int host = Integer.parseInt(request.getParameter("host"));
        service.insert(new User(name,userName,passWord,email,host));
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/login.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}


