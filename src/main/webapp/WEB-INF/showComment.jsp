<%@ page import="model.Student" %>
<%@ page import="model.Shop" %>
<%@ page import="model.Comment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%Student student = (Student) session.getAttribute("student"); %>
<%Shop shop = (Shop) request.getAttribute("shop");%>
<%List<Comment> commentList = (ArrayList<Comment>) request.getAttribute("commentList"); %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>RegistShop</title>
    <script type="text/javascript">
        function confirmPost(){
            flag = confirm("投稿しますか？");
            // 「はい」が押されたときの処理
            if ( flag == true ){
                alert("投稿しました");
                return true;
            }else{    // 「いいえ」が押されたときの処理
                return false;
            }
        };
    </script>

</head>
<body>
<header>
    <jsp:include page="uiKit.html"/>
</header>
<div class="uk-container" style="height: 70px">

</div>
<div class="uk-container uk-container-center uk-margin">
<div class="uk-card uk-card-body uk-card-default uk-card-hover" style="background-color: #ffffdd">
    <div class="uk-card-header">
        <div class="uk-grid-small uk-flex-middle" uk-grid>
            <div class="uk-width-expand">
                <h3 class="uk-card-title uk-margin-remove-bottom">店名：<%=shop.getShopNAME("shopNAME")%></h3>
                <p class="uk-text-meta uk-margin-remove-top"><address>住所：<%=shop.getShopADDRESS("shopADDRESS")%></address></p>
            </div>
            <div class="uk-card-badge uk-label">
                <span uk-icon="user"></span><%=shop.getAuthorNAME("authorNAME")%>
            </div>
        </div>
    </div>
    <div class="uk-card-body">

        <p><%=shop.getDetailedINFO("detailedInfo")%></p>
    </div>
</div>
<div class="uk-overflow-auto">
    <table class="uk-table uk-table-hover uk-table-middle uk-table-divider">
        <thead>
        <tr>
            <th class="uk-width-small">ユーザー</th>
            <th class="uk-table-expand">コメント</th>
            <th class="uk-width-small">削除</th>
        </tr>
        </thead>

        <%int i = 0;%>
        <%for (Comment comment : commentList) {%>
        <%comment = commentList.get(i);%>
        <%if (comment.getShopId(1) == shop.getShopID(1)){%>
        <tbody>
        <tr>
            <td class="uk-text-normal">
                <%=comment.getCommentAuthorName("commentAuthorName")%>
            </td>
            <td class="uk-text-large">
                <a><%=comment.getCommentDetail("commentDetail")%></a>
            </td>
            <td>
                <%if (comment.getCommentAuthorId("commentAuthorId").equals(student.getStudentID())){%>
                <form action="/SystemDesign/DeleteComment" method="post">
                    <input type="hidden" name="commentId" value=<%=comment.getCommentId(1)%>>
                    <button type="submit" class="uk-icon-button" uk-icon="trash"></button>
                </form>
                <%}else {

                }%>
            </td>
        </tr>
        </tbody>
        <%}i++;}%>
    </table>
</div>
</div>
</body>
</html>