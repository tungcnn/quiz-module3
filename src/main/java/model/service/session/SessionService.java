package model.service.session;

import model.DBConnector;
import model.entities.QuizPlay;
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
}
