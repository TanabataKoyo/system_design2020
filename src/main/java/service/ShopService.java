package service;

import java.sql.Connection;
import java.util.List;

import model.Shop;
import dao.ShopDao;

import javax.servlet.http.HttpServlet;

public class ShopService extends HttpServlet{
    private Connection connection = null;

    public ShopService(){

    }
    public List<Shop> shopList() {
        ShopDao shopDao = new ShopDao();
        this.connection = shopDao.createConnection();
        List<Shop> shopList = shopDao.shopList(this.connection);
        shopDao.closeConnection(this.connection);
        this.connection = null;
        return shopList;
    }

    public void registShop(Shop shop){
        ShopDao shopDao = new ShopDao();
        this.connection = shopDao.createConnection();
        shopDao.registShop(shop,this.connection);
        shopDao.closeConnection(this.connection);
        this.connection = null;
    }

    public void deleteShop(Shop shop){
        ShopDao shopDao = new ShopDao();
        this.connection = shopDao.createConnection();
        shopDao.deleteShop(shop,this.connection);
        shopDao.closeConnection(this.connection);
        this.connection = null;
    }
}
