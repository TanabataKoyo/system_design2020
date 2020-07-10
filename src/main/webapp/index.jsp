<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>トップページ</title>
</head>
<body>
<div class="uk-sticky">
    <jsp:include page="WEB-INF/topUikit.html"/>
</div>
<div class="uk-container">
    <div class="uk-card uk-card-default uk-card-hover uk-card-body">
        <div class="uk-flex-center">
            <form action="/SystemDesign/ForLogin">
                <button class="uk-button-large uk-button-primary">ログイン</button>
            </form>
        </div>
        <div class="uk-align-center">
            <form action="/SystemDesign/RegistInfo">
                <button class="uk-button-large uk-button-danger">新規登録</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
