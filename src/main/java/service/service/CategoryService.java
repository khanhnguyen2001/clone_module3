package service.service;

import model.Category;
import service.connect.ConnectionToMySQL;
import service.iService.IServiceCRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryService implements IServiceCRUD<Category> {
    Connection connection = ConnectionToMySQL.getConnection();

    @Override
    public void add(Category category) {

    }

    @Override
    public void edit(int id, Category category) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public List<Category> getAll() {
        List<Category> categoryList = new ArrayList<>();
        String sql = "select * from category;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int categoryId = resultSet.getInt("categoryId");
                String categoryName = resultSet.getString("categoryName");

                Category category = new Category(categoryId, categoryName);
                categoryList.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categoryList;
    }
}
