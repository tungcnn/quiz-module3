package model.service.user;

import model.DBConnector;
import model.entities.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserService implements IUser {
    private static final String INSERT_USERS_SQL = "INSERT INTO user (name, userName, passWord, email, host) VALUES (?, ?, ?,?);";
    private static final String SELECT_USER_BY_ID = "SELECT * FROM users WHERE id =?;";
    private static final String SELECT_ALL_USERS = "SELECT * FROM user";
    private static final String DELETE_USERS_SQL = "DELETE FROM users WHERE id = ?;";
    private static final String UPDATE_USERS_SQL = "UPDATE users SET name = ?, userName=?, passWord=?, email= ?, host=? WHERE id = ?;";

    @Override
    public List<User> getAll() {
        List<User> users = new ArrayList<>();
        try (Connection connection = DBConnector.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String userName = rs.getString("userName");
                String passWord = rs.getString("passWord");
                String email = rs.getString("email");
                boolean host = rs.getBoolean("host");
                users.add(new User(id, name, userName, passWord, email, host));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean insert(User user) {
        boolean isInserted = false;
        try (
                Connection connection = DBConnector.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getUserName());
            preparedStatement.setString(3, user.getPassWorrd());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setBoolean(5, user.isHost());
            isInserted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return isInserted;
    }

    @Override
    public boolean update(int id, User user) {
        boolean isUpdated = false;
        try (Connection connection = DBConnector.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL);) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getUserName());
            preparedStatement.setString(3, user.getPassWorrd());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setBoolean(5, user.isHost());
            isUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return isUpdated;
    }

    @Override
    public boolean delete(int id, User user) {
        boolean isDeleted = false;
        try (Connection connection = DBConnector.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS_SQL);) {
            preparedStatement.setInt(1, id);
            isDeleted = preparedStatement.executeUpdate() > 0;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return isDeleted;
    }

    @Override
    public User findByID(int id) {
        User user = null;
        try (Connection connection = DBConnector.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String userName = rs.getString("userName");
                String passWord = rs.getString("passWord");
                String email = rs.getString("email");
                boolean host = rs.getBoolean("host");
                user = new User(id, name, userName, passWord, email, host);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    public boolean checkLogin(String uNmame, String pwd) {

        boolean isValid = false;

        return isValid;
    }
}
