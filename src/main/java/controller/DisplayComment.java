package controller;

import model.Comment;
import model.Shop;
import service.CommentService;
import service.ShopService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet("/DisplayComment")
public class DisplayComment extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public DisplayComment(){
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
            Shop shop = new Shop();
            shop.setAuthorNAME(request.getParameter("authorName"));
            shop.setShopID(Integer.parseInt(request.getParameter("shopId")));
            shop.setShopNAME(request.getParameter("shopName"));
            shop.setShopADDRESS(request.getParameter("shopAddress"));
            shop.setDetailedINFO(request.getParameter("detailedInfo"));
            request.setAttribute("shop",shop);

            Comment comment = new Comment();
            CommentService commentService = new CommentService();
            List<Comment> commentList = commentService.commentList();
            Collections.reverse(commentList);
            request.setAttribute("commentList",commentList);

            response.setContentType("text/html; charset=utf-8");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/showComment.jsp");
            dispatcher.forward(request, response);
        }catch (Exception e){
        }
    }
}
