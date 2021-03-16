package model.controllerquiz;

import model.entities.Quiz;
import model.service.quiz.IQuiz;
import model.service.quiz.QuizService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "QuizServlet", value = "/quiz")
public class QuizServlet extends HttpServlet {
    private static final IQuiz quizService = new QuizService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createQuestion(request, response);
                break;
            default:
                home(request, response);
                break;
        }
    }

    private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/managerquiz/home.jsp");
        dispatcher.forward(request, response);
    }

    private void createQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/managerquiz/create.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createQuiz(request, response);
                break;
        }
    }

    private void createQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/managerquiz/category.jsp");
        List<Quiz> listQ = quizService.getAll();
        request.setAttribute("listq", listQ);
        dispatcher.forward(request, response);
    }
}
