package entities;

import utils.MysqlHelper;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Phone {
    private int id;
    private String name;
    private String brand;
    private int price;
    private String description;

    public Phone() {
    }

    public Phone(HttpServletRequest req) {
        this.name = req.getParameter("name");
        this.brand = req.getParameter("brand");
        this.price = Integer.parseInt(req.getParameter("price"));
        this.description = req.getParameter("description");
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean save() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        Connection connection = MysqlHelper.getConnection();
        PreparedStatement pstmt = connection.prepareStatement("insert into phones('name', brand, price, description) values (?, ?, ?, ?)");
        pstmt.setString(1, this.name);
        pstmt.setString(2, this.brand);
        pstmt.setInt(3, this.price);
        pstmt.setString(4, this.description);
        return pstmt.execute();
    }

    public static List<Phone> getList() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        List<Phone> result = new ArrayList<>();
        Connection connection = MysqlHelper.getConnection();
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery("select * from phones");

        while (rs.next()) {
            Phone phone = new Phone();
            phone.setId(rs.getInt("id"));
            phone.setName(rs.getString("name"));
            phone.setPrice(rs.getInt("price"));
            phone.setBrand(rs.getString("brand"));
            phone.setDescription(rs.getString("description"));
            result.add(phone);
        }
        return result;
    }
}
