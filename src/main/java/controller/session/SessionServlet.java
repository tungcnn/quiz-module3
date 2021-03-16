package controller.session;

import model.entities.Question;
import model.entities.QuizTable;
import model.service.session.SessionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SessionServlet", value = "/session")
public class SessionServlet extends HttpServlet {
    private SessionService ss = new SessionService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "play":
                playQuiz(request, response);
                break;
            default:
                listQuizes(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
//        switch (action) {
//            case "submit":
//                submitQuiz(request, response);
//                break;
//        }
    }

//    private void submitQuiz(HttpServletRequest request, HttpServletResponse response) {
//        String
//    }

    private void listQuizes(HttpServletRequest request, HttpServletResponse response) {
        List<QuizTable> quizes = this.ss.findAll();
        request.setAttribute("quizes", quizes);

        RequestDispatcher dispatcher = request.getRequestDispatcher("quizlist.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void playQuiz(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Question> qa = this.ss.findAllQuestion(id);
        request.setAttribute("questions", qa);

        RequestDispatcher dispatcher = request.getRequestDispatcher("play.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
