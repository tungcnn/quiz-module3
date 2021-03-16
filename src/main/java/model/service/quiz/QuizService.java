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
                int id_user = rs.getInt(2);
                String name = rs.getString(3);
                String difficulty = rs.getString(4);
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
        //Quiz quiz = new Quiz(name, do kho)
        //select q.id from quiz q where q.name = name
        //quiz.setId(id)
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
