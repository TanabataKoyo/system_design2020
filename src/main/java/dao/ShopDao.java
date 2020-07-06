package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import utility.DriverAccessor;
import model.Shop;

public class ShopDao extends DriverAccessor{
    public static final String DISPLAY_SHOP = "select * from shop";

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
}
