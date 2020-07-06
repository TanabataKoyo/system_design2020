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
<%List<Shop> shopList = (ArrayList<Shop>) request.getAttribute("shopList"); %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/simple-grid.css">

<%Student student = (Student) session.getAttribute("student"); %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>home</title>
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
        ログインユーザー：<%=student.getStudentName()%>さん
    </div>
    <%int i = 0;%>
    <%for (Shop shop : shopList) {%>
    <%shop = shopList.get(i);%>
    <div class="uk-card uk-card-body uk-card-default uk-card-hover" style="background-color: #ffffdd">
        <div class="uk-card-header">
            <div class="uk-grid-small uk-flex-middle" uk-grid>
                <div class="uk-width-expand">
                    <h3 class="uk-card-title uk-margin-remove-bottom">店名：<%=shop.getShopNAME("shopNAME")%></h3>
                    <p class="uk-text-meta uk-margin-remove-top"><address>住所：<%=shop.getShopADDRESS("shopADDRESS")%></address></p>
                </div>
            </div>
        </div>
        <div class="uk-card-body">
            <p><%=shop.getDetailedINFO("detailedINFO")%></p>
        </div>
    </div>
    <br>
    <%i++;%>
    <%}%>
    <%}%>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    a
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    ss

</div>
</body>
</html>
