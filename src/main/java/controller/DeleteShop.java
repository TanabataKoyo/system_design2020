package controller;


import model.Shop;
import model.Student;
import service.ShopService;
import service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/DeleteShop")
public class DeleteShop extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public DeleteShop(){
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            Shop shop = new Shop();
            shop.setShopID(Integer.parseInt(request.getParameter("shopId")));
            ShopService shopService = new ShopService();
            shopService.deleteShop(shop);

            response.setContentType("text/html; charset=utf-8");
            response.sendRedirect("/SystemDesign/DisplayShop");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
