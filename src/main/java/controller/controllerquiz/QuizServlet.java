package controller.controllerquiz;

import model.entities.Answer;
import model.entities.Question;
import model.entities.Questions;
import model.entities.Quiz;
import model.service.quiz.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "QuizServlet", value = "/quiz")
public class QuizServlet extends HttpServlet {
    private static final IQuiz quizService = new QuizService();
    private static final IQuestion questionService = new QuestionService();
    private static final IAnswer answerService = new AnswerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                deleteQuestion(request, response);
            case "create":
                showQuizView(request, response);
                    break;
            default:
                home(request, response);
                break;
        }
    }

    private void deleteQuestion(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        int idQuiz = Integer.parseInt(request.getParameter("idquiz"));
        quizService.deleteQuestion(id);
        request.setAttribute("idquiz", idQuiz);
        Trigger(request,response);
    }

    private void showQuizView(HttpServletRequest request, HttpServletResponse response) {

    }

    private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/quiz/trigger.jsp");
        dispatcher.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "trigger":
                Trigger(request, response);
                break;
            case "create":
                try {
                    create(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String namequestion = request.getParameter("namequestion");
        int idquiz = Integer.parseInt(request.getParameter("idquiz"));
        String correct = request.getParameter("correct");
        Question question = new Question(namequestion, idquiz);
        int idquestion = questionService.getQuestionId(question);
        Answer answer1 = new Answer(idquestion, idquiz, request.getParameter("answer1"));
        Answer answer2 = new Answer(idquestion, idquiz, request.getParameter("answer2"));
        Answer answer3 = new Answer(idquestion, idquiz, request.getParameter("answer3"));
        Answer answer4 = new Answer(idquestion, idquiz, request.getParameter("answer4"));

        switch (correct) {
            case "a1":
                answer1.setCorrect(1);
                break;
            case "a2":
                answer2.setCorrect(1);
                break;
            case "a3":
                answer3.setCorrect(1);
                break;
            case "a4":
                answer4.setCorrect(1);
                break;
        }
        answerService.insert(answer1);
        answerService.insert(answer2);
        answerService.insert(answer3);
        answerService.insert(answer4);
        request.setAttribute("idquiz", idquiz);
        List<Questions> list = questionService.getQuestions(idquiz);
        request.setAttribute("lisqq", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/quiz/create.jsp");
        dispatcher.forward(request, response);
//
    }

    private void Trigger(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String namequiz = request.getParameter("namequiz");
        String level = request.getParameter("difficulty");
        int idquiz = quizService.getQuizId(new Quiz(namequiz, level));
        request.setAttribute("idquiz", idquiz);
        List<Questions> list = questionService.getQuestions(idquiz);
        request.setAttribute("lisqq", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/quiz/create.jsp");
        dispatcher.forward(request, response);
    }
}
