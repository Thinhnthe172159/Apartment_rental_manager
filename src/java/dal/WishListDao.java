/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.WishList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

import org.apache.tomcat.dbcp.dbcp2.SQLExceptionList;

/**
 *
 * @author vumin
 */
public class WishListDao extends DBContext {

    private DBContext dBContext;
    private UserDao userDao;

    public WishListDao(DBContext dBContext) {
        this.dBContext = dBContext;
        this.userDao = new UserDao();

    }

    public void addWishListItem(WishList item) throws SQLExceptionList {
        String query = "INSERT INTO [dbo].[Whislist]\n"
                + "           ([user_id]\n"
                + "           ,[Apartment_id])\n"
                + "           VALUES (?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, item.getUser_id().getId());
            statement.setInt(2, item.getApartment_id());
            statement.executeUpdate();
        } catch (SQLException e) {

        }

    }

    public List<WishList> getWishListByUserId(int userId) throws SQLException {
        List<WishList> wishlist = new ArrayList<>();
        String query = "SELECT* FROM[dbo].[Whislist] WHERE user_id = ? ";
        try (PreparedStatement statement = connection.prepareStatement(query);) {
            statement.setInt(1, userId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    WishList wish = new WishList();
                    wish.setId(resultSet.getInt("id"));
                    User userid = userDao.getUser(resultSet.getInt("user_id"));
                    wish.setUser_id(userid);
                    wish.setApartment_id(resultSet.getInt("Apartment_id"));
                    wishlist.add(wish);
                }

            }

        }
        return wishlist;
    }

    public void addWishList(WishList wishlist) throws SQLException {
        String query = "INSERT INTO [dbo].[Whislist]\n"
                + "           ([user_id]\n"
                + "           ,[Apartment_id])\n"
                + "    VALUES (?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);

            statement.setInt(1, wishlist.getUser_id().getId());
            statement.setInt(2, wishlist.getApartment_id());
            statement.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void deleteWishList(int id) throws SQLException {
        String query = "DELETE FROM [dbo].[Whislist]\n"
                + "      WHERE id = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(query);

            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            
        }
    }
}
