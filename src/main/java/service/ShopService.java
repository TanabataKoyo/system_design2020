package service;

import java.sql.Connection;
import java.util.List;

import dao.StudentDAO;
import model.Student;
import model.Shop;
import dao.ShopDao;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

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
}
