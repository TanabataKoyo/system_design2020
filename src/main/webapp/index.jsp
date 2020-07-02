<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <body>
  <ul>
    <div class="rectangle-login">
      <li class="login">
        <button style="background-color: aqua">
          <a href="/SystemDesign/ForLogin">
          ログイン
          </a>
        </button>
      </li>
    </div>
  </ul>
  <ul>
    <div class="rectangle-new">
      <li class="new">
        <button style="background-color: palegreen">
          <a href="/SystemDesign/RegistInfo">
          新規登録
          </a>
        </button>
      </li>
    </div>
  </ul>
    <form action="./RegistInfo" method="post">
      ID <input type="text" name="stu_id" /><br />
      名前<input type="text" name="stu_name" /><br />
      出身地<input type="text" name="stu_birthplace" /><br />
      <input type="submit" name="OK" />
    </form>
    <br />
    学籍番号によるサーチ
    <a href="/SystemDesign/SearchInfo">Click here! </a>
  </body>
</html>
