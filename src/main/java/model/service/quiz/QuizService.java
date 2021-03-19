package model.service.quiz;

import model.DBConnector;
import model.entities.Quiz;

import java.sql.*;
import java.util.List;

public class QuizService implements IQuiz {
    @Override
    public List<Quiz> getAll() {

        return null;
    }

    @Override
    public boolean insert(Quiz quiz) {
        String queryInsert = "INSERT INTO quiz (`name`,`difficulty`) VALUES (?,?)";
        boolean rowInsert = false;
        try (Connection conn = DBConnector.getConnection();
             PreparedStatement statement = conn.prepareStatement(queryInsert)) {
            statement.setString(1, quiz.getName());
            statement.setString(2, quiz.getDifficulty());
            rowInsert = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInsert;
    }

    @Override
    public boolean update(int id, Quiz quiz) {
        return false;
    }

    @Override
    public boolean delete(int id, Quiz quiz) {
        return false;
    }

    @Override
    public Quiz findByID(int id) {
        return null;
    }

    @Override
    public int getQuizId(Quiz quiz) {
        int id = 0;
        String query = "CALL sp_getLatestIndex()";
        String queryInsert = "INSERT INTO quiz (`name`,`difficulty`) VALUES (?,?)";
        try (Connection conn = DBConnector.getConnection();
             PreparedStatement statement = conn.prepareStatement(queryInsert)) {
            statement.setString(1, quiz.getName());
            statement.setString(2, quiz.getDifficulty());
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
    public boolean deleteQuestion(int id) {
        String query = "DELETE FROM question WHERE (id = ?)";
        boolean rowDeleted = false;
        try(Connection conn = DBConnector.getConnection();
        PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setInt(1,id);
            rowDeleted = statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

}
