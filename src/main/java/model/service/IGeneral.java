package model.service;

import java.sql.SQLException;
import java.util.List;

public interface IGeneral<T> {
    List<T> getAll();
    boolean insert (T t) throws SQLException;
    boolean update(int id, T t);
    boolean delete (int id, T t);
    T findByID(int id);
}
