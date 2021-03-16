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
        String queryAll = "SELECT * FROM quiz";
        List<Quiz> list = new ArrayList<>();
        try (Connection con = DBConnector.getConnection();
             PreparedStatement pstmt = con.prepareStatement(queryAll)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String difficulty = rs.getString(3);
                list.add(new Quiz(id, name, difficulty));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean insert(Quiz quiz) {
        //insert into quiz (name, do kho)
        //Statement s = con.createStatement(select LAST_INSERT_ID());
        //RS rs = s.executeQuerry()
        //int id = rs.getInt(1);
        //Quiz quiz = new Quiz(id, name, do kho)
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
