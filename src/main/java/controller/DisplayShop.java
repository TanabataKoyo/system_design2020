package controller;

import model.Student;
import model.Shop;
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

@WebServlet("/DisplayShop")

public class DisplayShop extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public DisplayShop(){
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        response.setContentType("text/html; charset=utf-8");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/showPosted.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String mail = request.getParameter("mail");
            String pass = request.getParameter("pass");

            UserService userService = new UserService();
            Student student = userService.login(mail, pass);

            if (student == null) {
                request.setAttribute("ERROR", "IDまたはパスワードが違います");
                request.setAttribute("mail", mail);
                getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            }

            HttpSession session = request.getSession();
            session.setAttribute("student", student);

            ShopService shopService = new ShopService();
            List<Shop> shopList = shopService.shopList();

            request.setAttribute("shopList",shopList);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/showPosted.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
        }
    }
}
