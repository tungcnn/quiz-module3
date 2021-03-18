package controller.session;

import com.mysql.cj.ServerPreparedQuery;
import model.entities.QuizPlay;
import model.entities.Quiz;
import model.entities.SessionView;
import model.service.session.SessionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
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
            case "history":
                showHistory(request, response);
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
        switch (action) {
            case "submit":
                submitQuiz(request, response);
                break;
        }
    }

    private void submitQuiz(HttpServletRequest request, HttpServletResponse response) {
        int idQuiz = Integer.parseInt(request.getParameter("idQuiz"));
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        String username = request.getParameter("username");

        List<Integer> questionsId = this.ss.findAllQuestionID(idQuiz);
        int score = this.ss.getScore(questionsId, request, idQuiz, idUser);

        request.setAttribute("username", username);
        request.setAttribute("idUser", idUser);
        request.setAttribute("score", score);
        RequestDispatcher dispatcher = request.getRequestDispatcher("session/result.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listQuizes(HttpServletRequest request, HttpServletResponse response) {
        List<Quiz> quizes = this.ss.findAll();
        request.setAttribute("quizes", quizes);
        request.setAttribute("username", "Hien");
        request.setAttribute("idUser", 2);
        RequestDispatcher dispatcher = request.getRequestDispatcher("session/quizlist.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void playQuiz(HttpServletRequest request, HttpServletResponse response) {
        int idQuiz = Integer.parseInt(request.getParameter("idQuiz"));
        List<QuizPlay> qa = this.ss.findAllQuestion(idQuiz);
        request.setAttribute("questions", qa);

        String username = request.getParameter("username");
        String idUser = request.getParameter("idUser");
        String quizName = request.getParameter("quizName");
        request.setAttribute("username", username);
        request.setAttribute("idUser", idUser);
        request.setAttribute("idQuiz", idQuiz);
        request.setAttribute("quizName", quizName);

        RequestDispatcher dispatcher = request.getRequestDispatcher("session/play.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showHistory(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String idUser = request.getParameter("idUser");
        int page = Integer.parseInt(request.getParameter("page"));
        int numberOfPages = this.ss.getTotalSessionPage(Integer.parseInt(idUser));
        List<Integer> pages = new ArrayList<>();
        for (int i = 1; i <= numberOfPages ; i++) {
            pages.add(i);
        }

        request.setAttribute("pages", pages);
        request.setAttribute("username", username);
        request.setAttribute("idUser", idUser);

        List<SessionView> sessions = this.ss.getAllSession(Integer.parseInt(idUser), page);
        request.setAttribute("sessions", sessions);
        RequestDispatcher dispatcher = request.getRequestDispatcher("session/history.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
