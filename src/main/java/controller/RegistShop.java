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
import controller.SessionFilter;

@WebServlet("/RegistShop")

public class RegistShop extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public RegistShop(){
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        response.setContentType("text/html; charset=utf-8");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/registShop.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            Shop shop = new Shop();
            shop.setShopNAME(request.getParameter("shopName"));
            shop.setShopADDRESS(request.getParameter("shopAddress"));
            shop.setDetailedINFO(request.getParameter("detailedInfo"));
            shop.setAuthorID(request.getParameter("authorId"));

            ShopService shopService = new ShopService();
            shopService.registShop(shop);

            ShopService shopService1 = new ShopService();
            List<Shop> shopList = shopService1.shopList();

            request.setAttribute("shopList",shopList);

            response.setContentType("text/html; charset=utf-8");
            response.sendRedirect("/SystemDesign/DisplayShop");

        } catch (Exception e) {
        }
    }
}
