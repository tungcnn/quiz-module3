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
    private static final String INSERT_USER = "INSERT INTO user (name, userName, passWord, email, host) VALUES (?, ?, ?,?,?);";
    private static final String SELECT_USER_BY_USERNAME = "SELECT * FROM user WHERE username =?;";
    private static final String SELECT_USER_BY_ID = "SELECT * FROM user WHERE id =?;";
    private static final String SELECT_ALL = "SELECT * FROM user";
    private static final String DELETE_USER_BY_ID = "DELETE FROM user WHERE id = ?;";
    private static final String DELETE_USER_BY_USERNAME = "DELETE FROM user WHERE username = ?;";
    private static final String UPDATE_USER_BY_ID = "UPDATE user SET name = ?, userName=?, passWord=?, email= ?, host=? WHERE id = ?;";
    private static final String UPDATE_USER_BY_USERNAME = "UPDATE user SET name = ?, passWord=?, email= ?, WHERE username = ?;";

    @Override
    public List<User> getAll() {
        List<User> users = new ArrayList<>();
        try (Connection connection = DBConnector.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String userName = rs.getString("userName");
                String passWord = rs.getString("passWord");
                String email = rs.getString("email");
                int host = rs.getInt("host");
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
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getUserName());
            preparedStatement.setString(3, user.getPassWord());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setInt(5, user.getHost());
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
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_BY_ID);) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getUserName());
            preparedStatement.setString(3, user.getPassWord());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setInt(5, user.getHost());
            isUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return isUpdated;
    }

    public boolean update(String uName, User user) {
        boolean isUpdated = false;
        try (Connection connection = DBConnector.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_BY_USERNAME);) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getPassWord());
            preparedStatement.setString(3, user.getEmail());
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
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            isDeleted = preparedStatement.executeUpdate() > 0;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return isDeleted;
    }

    public boolean delete(String uName, User user) {
        boolean isDeleted = false;
        try (Connection connection = DBConnector.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_BY_USERNAME);) {
            preparedStatement.setString(1, uName);
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
                int host = rs.getInt("host");
                user = new User(id, name, userName, passWord, email, host);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    public User findByUserName(String uName) {
        User user = null;
        try (Connection connection = DBConnector.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_USERNAME);) {
            preparedStatement.setString(1, uName);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("id"));
                String name = rs.getString("name");
                String userName = rs.getString("username");
                String passWord = rs.getString("password");
                String email = rs.getString("email");
                int host = Integer.parseInt(rs.getString("host"));
                user = new User(id,name,userName,passWord,email,host);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    public boolean checkLogin(String uName, String pwd) {
        List<User> users = getAll();
        boolean isValid = false;
        for (User u : users) {
            if (u.getUserName().equals(uName) && u.getPassWord().equals(pwd)) {
                isValid = true;
            }
        }
        return isValid;
    }


}
