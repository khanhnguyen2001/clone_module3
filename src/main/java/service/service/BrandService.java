package service.service;

import model.Brand;
import service.connect.ConnectionToMySQL;
import service.iService.IServiceCRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BrandService implements IServiceCRUD<Brand> {
    Connection connection = ConnectionToMySQL.getConnection();

    @Override
    public void add(Brand brand) {

    }

    @Override
    public void edit(int id, Brand brand) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public List<Brand> getAll() {
        List<Brand> brandList = new ArrayList<>();
        String sql = "select * from brand;";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int brandId = resultSet.getInt("brandId");
                String brandName = resultSet.getString("brandName");

                Brand brand = new Brand(brandId, brandName);
                brandList.add(brand);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return brandList;
    }
}
