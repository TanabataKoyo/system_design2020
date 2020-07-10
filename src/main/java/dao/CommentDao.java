package dao;

import model.Comment;
import model.Shop;
import utility.DriverAccessor;
import model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDao extends DriverAccessor {
    public static final String REGIST_COMMENT = "insert into comment(shopId,commentDetail,commentAuthorId) values(?, ?, ?)";
    public static final String DISPLAY_COMMENT = "select * from comment inner join student_info on comment.commentAuthorId = student_id";

    //コメント登録
    public void registComment(Comment comment, Connection connection) {
        try {
            // SQLコマンドの実行
            PreparedStatement statement = connection.prepareStatement(REGIST_COMMENT);

            // SQLコマンドのクエッションマークに値を、1番目から代入する
            statement.setInt(1, comment.getShopId(1));
            statement.setString(2, comment.getCommentDetail("commentDetail"));
            statement.setString(3, comment.getCommentAuthorId("commentAuthorId"));
            statement.executeUpdate();

        } catch (SQLException e) {
            // エラーが発生した場合、エラーの原因を出力する
            e.printStackTrace();
        } finally {
        }
    }

    //コメント取得
    public List<Comment> commentList(Connection connection){
        try {
            List<Comment> commentList = new ArrayList<>();
            PreparedStatement statement = connection.prepareStatement(DISPLAY_COMMENT);
            ResultSet rs = statement.executeQuery();
            boolean Flag = rs.first();
            while (Flag){
                Comment comment = new Comment();
                comment.setShopId(rs.getInt("shopId"));
                comment.setCommentDetail(rs.getString("commentDetail"));
                comment.setCommentAuthorId(rs.getString("commentAuthorId"));
                comment.setCommentAuthorName(rs.getString("student_name"));
                comment.setCommentId(Integer.parseInt(rs.getString("commentId")));
                commentList.add(comment);
                Flag = rs.next();
            }
            statement.close();
            rs.close();
            return commentList;
        } catch (SQLException e){
            return null;
        }
    }
}