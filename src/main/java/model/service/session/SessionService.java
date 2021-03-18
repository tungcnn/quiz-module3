package model.service.session;

import model.DBConnector;
import model.entities.QuizPlay;
import model.entities.Quiz;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SessionService {
    private final String GET_ALL_QUIZ = "call sp_getAllQuiz";
    private final String GET_ALL_QUESTION = "call sp_getQuizQuestions(?)";
    private final String GET_ALL_QUESTION_ID = "call sp_getQuestionsID(?)";
    private final String INSERT_SESSION = "call sp_createSession(?, ?)";
    private final String GET_LATEST_INDEX = "call sp_getLatestIndex";
    private final String INSERT_PLAYER_ANSWER = "call sp_insertPlayerAnswer(?,?,?)";
    private final String CHECK_CORRECT = "call sp_checkCorrect(?)";

    public List<Quiz> findAll() {
        List<Quiz> quizes = new ArrayList<>();
        try (Connection connection = DBConnector.getConnection();
             PreparedStatement ps = connection.prepareStatement(GET_ALL_QUIZ)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("quizName");
                String difficulty = rs.getString("difficulty");
                quizes.add(new Quiz(id, name, difficulty));
            }
        } catch (SQLException e) {

        }
        return quizes;
    }

    public List<QuizPlay> findAllQuestion(int id) {
        List<QuizPlay> questions = new ArrayList<>();
        try (Connection connection = DBConnector.getConnection();
             CallableStatement s = connection.prepareCall(GET_ALL_QUESTION)) {
            s.setInt(1, id);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String content = rs.getString("content");
                int idQuestion = rs.getInt("idQuestion");
                String a1 = rs.getString("a1");
                String a2 = rs.getString("a2");
                String a3 = rs.getString("a3");
                String a4 = rs.getString("a4");
                int a1_id = rs.getInt("a1id");
                int a2_id = rs.getInt("a2id");
                int a3_id = rs.getInt("a3id");
                int a4_id = rs.getInt("a4id");
                questions.add(new QuizPlay(content, idQuestion, a1, a2, a3, a4, a1_id, a2_id, a3_id, a4_id));
            }
        } catch (SQLException e) {

        }
        return questions;
    }

    public List<Integer> findAllQuestionID(int idQuiz) {
        List<Integer> questions_id = new ArrayList<>();
        try (Connection connection = DBConnector.getConnection();
             CallableStatement s = connection.prepareCall(GET_ALL_QUESTION_ID)) {
            s.setInt(1, idQuiz);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                questions_id.add(rs.getInt(1));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return questions_id;
    }

    public int getScore(List<Integer> questionsId, HttpServletRequest request, int idQuiz, int idUser) {
        int totalScore = 0;
        try {
            Connection connection = DBConnector.getConnection();
            CallableStatement insertSession = connection.prepareCall(INSERT_SESSION);
            CallableStatement getIndex = connection.prepareCall(GET_LATEST_INDEX);
            CallableStatement insertPlayerAnswer = connection.prepareCall(INSERT_PLAYER_ANSWER);
            CallableStatement checkCorrect = connection.prepareCall(CHECK_CORRECT);
            insertSession.setInt(1, idQuiz);
            insertSession.setInt(2, idUser);
            insertSession.execute();
            ResultSet rs = getIndex.executeQuery();

            int idSession = 0;
            while (rs.next()) {
                idSession = rs.getInt(1);
            }
            for (int idQuestion:questionsId) {
                int idAnswer = Integer.parseInt(request.getParameter(String.valueOf(idQuestion)));
                insertPlayerAnswer.setInt(1, idSession);
                insertPlayerAnswer.setInt(2, idQuestion);
                insertPlayerAnswer.setInt(3, idAnswer);
                insertPlayerAnswer.execute();
                checkCorrect.setInt(1, idAnswer);
                ResultSet correct =  checkCorrect.executeQuery();
                while (correct.next()) {
                    int score = correct.getInt(1);
                    totalScore += score;
                }
            }
            System.out.println(totalScore);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return totalScore;
    }
}
