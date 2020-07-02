<%--
  Created by IntelliJ IDEA.
  User: koyotanabata
  Date: 2020/07/03
  Time: 1:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import = "model.Student" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "java.util.List" %>
<%Student userData = (Student) request.getAttribute("userData") ;%>
<%--<%int errorFlag = (int) request.getAttribute("errorFlag");%>--%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/vali.css" >

<div class="form">
<%--    <%if(errorFlag!=1){%>--%>

    <form action="/SystemDesign/RegistInfo" method="post">
        氏名<input type="text" placeholder="氏名" id="name" name="name" maxlength="20" minlength="1" pattern=".*\S+.*" required><br>
        ユーザーID<input type="email" placeholder="メールアドレスを入力してください" id="mail" name="mail" size="40" required><br>
        パスワード<input type="password" placeholder="8~16字半角英数" id="pass" name="pass"  maxlength="16" minlength="8" pattern=".*\S+.*" required><br>
        <button>登録</button>
    </form>
<%--    <%}else{%>--%>

<%--    <form action="/SystemDesign/registration" method="post">--%>
<%--        すでに登録されたアカウントです。別のメールアドレスでお試しください。<br>--%>
<%--        氏名<input type="text" placeholder="氏名" id="name" name="name" maxlength="20" minlength="1" pattern=".*\S+.*" required value = <%=userData.getName()%>><br>--%>
<%--        メールアドレス<input type="email" placeholder="メールアドレス" id="mail" name="mail" required value = <%=userData.getMail()%>><br>--%>
<%--        パスワード<input type="password" placeholder="8~16字半角英数" id="pass" name="pass1" maxlength="16" minlength="8" pattern=".*\S+.*" required value = <%=userData.getPass()%>><br>--%>
<%--        <button>登録</button>--%>
<%--    </form>--%>
<%--    <%}%>--%>
</div>


