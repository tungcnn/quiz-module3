package model.service.session;

import model.DBConnector;
import model.entities.QuestionAnswer;
import model.entities.Quiz;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SessionService {
    private final String GET_ALL_QUIZ = "call sp_getAllQuiz";
    private final String GET_ALL_QUESTION = "call sp_getQuizQuestions(?)";
    private final String GET_QUESTION_ANSWER = "SELECT a.id, a.content from answer a join question q on q.id = a.id_question where q.id = ?";

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

    public List<QuestionAnswer> findAllQuestion(int id) {
        List<QuestionAnswer> questions = new ArrayList<>();
        try (Connection connection = DBConnector.getConnection();
             CallableStatement s = connection.prepareCall(GET_ALL_QUESTION)) {
            String idTrue = String.valueOf(id);
            s.setString(1, idTrue);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {

            }
        } catch (SQLException e) {

        }
        return questions;
    }
}
