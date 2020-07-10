<%@ page import="model.Student" %><%--
  Created by IntelliJ IDEA.
  User: koyotanabata
  Date: 2020/07/07
  Time: 6:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%Student student = (Student) session.getAttribute("student"); %>
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
    <div class="uk-card uk-card-body uk-card-default uk-card-hover" style="background-color: #d8eafc">
        <form action="/SystemDesign/RegistShop" method="post">
            <div class="uk-margin-auto">
                店名 　　<input type="text" id="shopName" name="shopName" placeholder="店名" maxlength="25" minlength="1" pattern=".*\S+.*" size="30" required>
            </div>
            <div class="uk-margin-auto">
                住所 　　<input type="shopAddress" id="shopAddress" name="shopAddress" placeholder="住所" maxlength="50" minlength="1" size="40" pattern=".*\S+.*" required >
            </div>
            <div class="uk-margin-auto">
                店舗詳細 <textarea class="uk-textarea" rows="4" type="detailedInfo" id="detailedInfo" name="detailedInfo" placeholder="詳細" maxlength="200" size="60" pattern=".*\S+.*"></textarea>
            </div>
            <input type="hidden" name="authorId" value=<%=student.getStudentID()%>>
            <div class="uk-margin-auto">
                <button class="uk-button-primary" onclick="return confirmPost()">投稿</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
