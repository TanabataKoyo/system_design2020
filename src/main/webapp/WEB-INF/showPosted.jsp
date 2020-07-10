<%--
  Created by IntelliJ IDEA.
  User: koyotanabata
  Date: 2020/07/03
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="model.Student" %>
<%@ page import="model.Shop" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Comment" %>
<%List<Shop> shopList = (ArrayList<Shop>) request.getAttribute("shopList"); %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/simple-grid.css">

<%Student student = (Student) session.getAttribute("student"); %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>home</title>
    <script type="text/javascript">
        function confirmDelete(){
            flag = confirm("本当に削除しますか？");
            // 「はい」が押されたときの処理
            if ( flag == true ){
                alert("削除しました");
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
    <div class="uk-text-center">
        <%if (shopList.size() == 0) {%>
        投稿がありません
        <%} else {%>
    </div>
    <div class="uk-text-center">
        <span uk-icon="user"></span><%=student.getStudentName()%>さん
    </div>
    <br>
    <%int i = 0;%>
    <%for (Shop shop : shopList) {%>
    <%shop = shopList.get(i);%>
    <%if (student.getStudentID().equals(shop.getAuthorID(""))){%>
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
                <form action="/SystemDesign/DeleteShop" method="post">
                    <input type="hidden" name="shopId" value=<%=shop.getShopID(1)%>>
                    <button type="submit" class="uk-icon-button" uk-icon="trash" onclick="return confirmDelete()"></button>
                </form>
                <button type="button" class="uk-icon-button" uk-icon="commenting" uk-toggle="target: #comment-form1"></button>
                <form action="/SystemDesign/DisplayComment" method="post">
                    <input type="hidden" name="shopId" value=<%=shop.getShopID(1)%>>
                    <input type="hidden" name="shopName" value=<%=shop.getShopNAME("shopNAME")%>>
                    <input type="hidden" name="shopAddress" value=<%=shop.getShopADDRESS("shopADDRESS")%>>
                    <input type="hidden" name="authorName" value=<%=shop.getAuthorNAME("authorNAME")%>>
                    <input type="hidden" name="detailedInfo" value=<%=shop.getDetailedINFO("detailedInfo")%>>
                    <button class="uk-icon-button" type="submit" uk-icon="comments"></button>
                </form>
                <div id="comment-form1" uk-modal style="z-index: 9999">
                    <div class="uk-modal-dialog uk-modal-body">
                        <h2 class="uk-modal-title">コメント記入</h2>
                        <form action="/SystemDesign/RegistComment" method="post">
                            <textarea class="uk-textarea" rows="4" type="commentDetail" name="commentDetail" placeholder="コメント" maxlength="200" size="60" pattern=".*\S+.*"></textarea>
                            <input type="hidden" name="commentAuthorId" value=<%=student.getStudentID()%>>
                            <input type="hidden" name="shopId" value=<%=shop.getShopID(1)%>>
                            <div class="uk-text-right">
                                <button class="uk-button uk-button-primary" type="submit">Save</button>
                            </div>
                        </form>
                        <div class="uk-text-left">
                            <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="uk-card-body">
            <p><%=shop.getDetailedINFO("detailedINFO")%></p>
        </div>
    </div>
    <%} else {%>
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
                <button type="submit" class="uk-icon-button" uk-icon="commenting" uk-toggle="target: #comment-form2"></button>
                <form action="/SystemDesign/DisplayComment" method="post">
                    <input type="hidden" name="shopId" value=<%=shop.getShopID(1)%>>
                    <input type="hidden" name="shopName" value=<%=shop.getShopNAME("shopNAME")%>>
                    <input type="hidden" name="shopAddress" value=<%=shop.getShopADDRESS("shopADDRESS")%>>
                    <input type="hidden" name="authorName" value=<%=shop.getAuthorNAME("authorNAME")%>>
                    <input type="hidden" name="detailedInfo" value=<%=shop.getDetailedINFO("detailedInfo")%>>
                    <button class="uk-icon-button" type="submit" uk-icon="comments"></button>
                </form>
                <div id="comment-form2" uk-modal style="z-index: 9999">
                    <div class="uk-modal-dialog uk-modal-body">
                        <h2 class="uk-modal-title" >コメント記入</h2>
                        <form action="/SystemDesign/RegistComment" method="post">
                            <textarea class="uk-textarea" rows="4" type="commentDetail" name="commentDetail" placeholder="コメント" maxlength="200" size="60" pattern=".*\S+.*"></textarea>
                            <input type="hidden" name="commentAuthorId" value=<%=student.getStudentID()%>>
                            <input type="hidden" name="shopId" value=<%=shop.getShopID(2)%>>
                            <div class="uk-text-right">
                                <button type="submit" href="/SystemDesign/RegistComment" class="uk-button uk-button-primary">Save</button>
                            </div>
                        </form>
                        <div class="uk-text-left">
                            <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="uk-card-body">
            <p><%=shop.getDetailedINFO("detailedINFO")%></p>
        </div>
    </div>
    <%}%>
    <br>
    <%i++;%>
    <%}%>
    <%}%>
</div>
</body>
</html>
