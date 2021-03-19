package model.service.quiz;

import model.DBConnector;
import model.entities.Question;
import model.entities.Questions;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuestionService implements IQuestion {

    @Override
    public List<Question> getAll() {
        return null;
    }

    @Override
    public boolean insert(Question question) {
        String query = "INSERT INTO question (content,id_quiz) VALUES(?,?)";
        boolean rowinsert = false;
        try (Connection conn = DBConnector.getConnection();
             PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setString(1, question.getContent());
            statement.setInt(2, question.getId_quiz());
            rowinsert = statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowinsert;
    }

    @Override
    public boolean update(int id, Question question) {
        return false;
    }

    @Override
    public boolean delete(int id, Question question) {
        return false;
    }

    @Override
    public Question findByID(int id) {
        return null;
    }

    @Override
    public int getQuestionId(Question question) {
        int id = 0;
        String query = "CALL sp_getLatestIndex()";
        String queryInsert = "INSERT INTO question (content,id_quiz) VALUES(?,?)";
        try {
            Connection conn = DBConnector.getConnection();
            PreparedStatement statement = conn.prepareStatement(queryInsert);
            statement.setString(1, question.getContent());
            statement.setInt(2, question.getId_quiz());
            statement.executeUpdate();

            CallableStatement stmt = conn.prepareCall(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    @Override
    public List<Questions> getQuestions() {
        String query = "CALL getallquestion()";
        List<Questions> list = new ArrayList<>();
        try (Connection conn = DBConnector.getConnection();
             CallableStatement call = conn.prepareCall(query)) {
            ResultSet rs = call.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String quizName = rs.getString(2);
                String content = rs.getString(3);
                String answer1 = rs.getString(4);
                String answer2 = rs.getString(5);
                String answer3 = rs.getString(6);
                String answer4 = rs.getString(7);
                list.add(new Questions(id,content,quizName,answer1,answer2,answer3,answer4));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
