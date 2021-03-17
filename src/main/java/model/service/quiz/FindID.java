package model.service.quiz;

import model.DBConnector;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FindID {
    public int findIds(){
        String query = "sp_getLatestIndex()";
        int id = 0;
        try(Connection con = DBConnector.getConnection();
            CallableStatement cb = con.prepareCall(query)) {
            ResultSet rs = cb.executeQuery();
            while (rs.next()){
                id = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }
}
