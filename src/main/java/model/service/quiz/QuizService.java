package model.service.quiz;

import model.DBConnector;
import model.entities.Quiz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuizService implements IQuiz {
    @Override
    public List<Quiz> getAll() {

       return null;
    }

    @Override
    public boolean insert(Quiz quiz) {
//        String queryInsert = "";
//        boolean rowInsert = false;
//        try(Connection conn = DBConnector.getConnection();
//        PreparedStatement statement = conn.prepareStatement()) {
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
        return false;
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
}
