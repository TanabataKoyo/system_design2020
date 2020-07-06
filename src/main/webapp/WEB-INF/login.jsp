<%--
  Created by IntelliJ IDEA.
  User: koyotanabata
  Date: 2020/06/28
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String err = (String) request.getAttribute("ERROR");%>
<%String mail = (String) request.getAttribute("mail");%>
<%if (mail == null) {%>
<%mail = "";%>
<%}%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>login</title>
</head>
<body>
<div class="uk-sticky">
    <jsp:include page="topUikit.html"/>
</div>
<div class="uk-container">
    <form action="/SystemDesign/DisplayShop" method="post" style="font-size:15pt">
        <div class="uk-alert-danger">
            <%if (err != null) {%>
            <strong><%=err%></strong>
            <%}%><br>
        </div>
        <div class="uk-margin-auto">
            ID <input type="text" id="mail" name="mail" value=<%=mail%> >
        </div>
        <div class="uk-margin-auto">
            パスワード <input type="password" id="pass" name="pass" >
        </div>
        <div class="uk-margin-auto">
            <button class="uk-button-primary">ログイン</button>
        </div>
    </form>
</div>
</body>
</html>
