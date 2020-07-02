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
<div class="form">
    <form action="/SE19G2/login" method="post" style="font-size:15pt">
        <%if (err != null) {%>
        <%}%><br>
        ID <input type="text" id="mail" name="mail" style="font-size:15pt" value=<%=mail%> ><br>
        パスワード <input type="password" id="pass" name="pass" style="font-size:15pt" ><br>
        <button style="font-size:10pt">ログイン</button>
    </form>
</div>

</body>
</html>
