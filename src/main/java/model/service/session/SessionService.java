package model.service.session;

import model.DBConnector;
import model.entities.Question;
import model.entities.QuizTable;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SessionService {
    private final String GET_ALL_QUIZ = "call sp_getAllQuiz";
    private final String GET_ALL_QUESTION = "call sp_getAllQuestion";
    private final String GET_QUESTION_ANSWER = "SELECT a.id, a.content from answer a join question q on q.id = a.id_question where q.id = ?";
    public List<QuizTable> findAll() {
        List<QuizTable> quizes = new ArrayList<>();
        try (Connection connection = DBConnector.getConnection();
             CallableStatement s = connection.prepareCall(GET_ALL_QUIZ)) {
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("quizName");
                String difficulty = rs.getString("difficulty");
                String author = rs.getString("author");
                quizes.add(new QuizTable(id, name, difficulty, author));
            }
        } catch (SQLException e) {

        }
        return quizes;
    }

    public List<Question> findAllQuestion(int id) {
        List<Question> questions = new ArrayList<>();
        try (Connection connection = DBConnector.getConnection();
             CallableStatement s = connection.prepareCall(GET_ALL_QUESTION)) {
            String idTrue = String.valueOf(id);
            s.setString(1, idTrue);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String content = rs.getString(1);
                String a1 = rs.getString(2);
                String a2 = rs.getString(3);
                String a3 = rs.getString(4);
                String a4 = rs.getString(5);
            }
        } catch (SQLException e) {

        }
        return questions;
    }
}
