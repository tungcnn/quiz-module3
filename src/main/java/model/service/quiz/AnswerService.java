package model.service.quiz;

import model.DBConnector;
import model.entities.Answer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class AnswerService implements IAnswer {
    @Override
    public List<Answer> getAll() {
        return null;
    }

    @Override
    public boolean insert(Answer answer) {
        String query = "insert into answer (id_question, id_quiz, content, correct) values(?,?,?,?)";
        boolean rowInsert = false;
        try {
            Connection con = DBConnector.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, answer.getId_question());
            pstmt.setInt(2, answer.getId_quiz());
            pstmt.setString(3, answer.getContent());
            pstmt.setInt(4, answer.getCorrect());

            rowInsert = pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInsert;
    }

    @Override
    public boolean update(int id, Answer answer) {
        return false;
    }

    @Override
    public boolean delete(int id, Answer answer) {
        return false;
    }

    @Override
    public Answer findByID(int id) {
        return null;
    }
}
