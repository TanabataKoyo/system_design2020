package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import model.Student;
import utility.DriverAccessor;
import model.Shop;

public class ShopDao extends DriverAccessor{
    public static final String DISPLAY_SHOP = "select * from shop inner join student_info on shop.authorId = student_id";
    public static final String REGIST_SHOP = "insert into shop(shopName,shopAddress,authorId,detailedInfo) values(?,?,?,?)";
    public static final String DELETE_SHOP = "delete from shop where shopId = ?";

    public List<Shop> shopList(Connection connection){
        try {
            List<Shop> shopList = new ArrayList<>();
            PreparedStatement statement = connection.prepareStatement(DISPLAY_SHOP);
            ResultSet rs = statement.executeQuery();
            boolean Flag = rs.first();
            while (Flag){
                Shop shop = new Shop();
                shop.setShopID(rs.getInt("shopId"));
                shop.setShopNAME(rs.getString("shopName"));
                shop.setShopADDRESS(rs.getString("shopAddress"));
                shop.setAuthorID(rs.getString("authorId"));
                shop.setDetailedINFO(rs.getString("detailedInfo"));
                shop.setAuthorNAME(rs.getString("student_name"));
                shopList.add(shop);
                Flag = rs.next();
            }
            statement.close();
            rs.close();
            return shopList;
        } catch (SQLException e){
            return null;
        }
    }

    public void registShop(Shop shop,Connection connection) {
        try {
            PreparedStatement statement = connection.prepareStatement(REGIST_SHOP);
            statement.setString(1, shop.getShopNAME("shopNAME"));
            statement.setString(2, shop.getShopADDRESS("shopADDRESS"));
            statement.setString(3, shop.getAuthorID("authorID"));
            statement.setString(4, shop.getDetailedINFO("detailedINFO"));
            statement.executeUpdate();

        } catch (SQLException e) {
            // エラーが発生した場合、エラーの原因を出力する
            e.printStackTrace();
        } finally {
        }
    }

    public void deleteShop(Shop shop,Connection connection){
        try {
            PreparedStatement statement = connection.prepareStatement(DELETE_SHOP);
            statement.setInt(1,shop.getShopID(1));
            statement.executeUpdate();
            statement.close();

        } catch (SQLException e){
            e.printStackTrace();
        } finally {
        }
    }
}
