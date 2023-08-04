package service.service;

import model.Role;
import service.connect.ConnectionToMySQL;
import service.iService.IServiceCRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoleService implements IServiceCRUD<Role> {
    Connection connection = ConnectionToMySQL.getConnection();

    @Override
    public void add(Role role) {

    }

    @Override
    public void edit(int id, Role role) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public List<Role> getAll() {
        List<Role> roleList = new ArrayList<>();
        String sql = "select * from role;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int roleId = resultSet.getInt("roleId");
                String roleName = resultSet.getString("roleName");

                Role role = new Role(roleId, roleName);
                roleList.add(role);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return roleList;
    }
}
