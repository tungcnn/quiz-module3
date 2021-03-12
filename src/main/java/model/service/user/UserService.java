package model.service.user;

import model.entities.User;

import java.util.List;

public class UserService implements IUser{
    @Override
    public List<User> getAll() {
        return null;
    }

    @Override
    public boolean insert(User user) {
        return false;
    }

    @Override
    public boolean update(int id, User user) {
        return false;
    }

    @Override
    public boolean delete(int id, User user) {
        return false;
    }

    @Override
    public User findByID(int id) {
        return null;
    }
}
