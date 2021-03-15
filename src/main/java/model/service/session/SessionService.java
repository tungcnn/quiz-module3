package model.service.session;

import model.DBConnector;
import model.entities.QuizTable;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SessionService {
    public List<QuizTable> findAll() {
        List<QuizTable> quizes = new ArrayList<>();
        try (Connection connection = DBConnector.getConnection();
             CallableStatement cs = connection.prepareCall("{call sp_getAllQuiz}")) {
            ResultSet rs = cs.executeQuery();
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
}
