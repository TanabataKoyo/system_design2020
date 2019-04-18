//--------------------------------
//	RegistInfo.java
//--------------------------------
//　自分が格納されているフォルダ名
package servlet;

//自分が格納されているフォルダの外にある必要なクラス
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Student;
import control.StudentManager;

	//HttpServletを継承することで、このクラスはServletとして、働くことができる
	public class RegistInfo extends HttpServlet{

	/**
	*
	*/
		private static final long serialVersionUID = 1L;

	//  doGetメソッドは使わないので、doPostメソッドへ転送
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}

	//  requestオブジェクトには、フォームで入力された文字列などが格納されている。
	//  responseオブジェクトを使って、次のページを表示する
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{

		// requestオブジェクトの文字エンコーディングの設定
		request.setCharacterEncoding("UTF-8");

		// requestオブジェクトから登録情報の取り出し
		String stu_id = request.getParameter("stu_id");
		String stu_name = request.getParameter("stu_name");
		String stu_birthplace = request.getParameter("stu_birthplace");

		System.out.println("取得した文字列は"+stu_id+"です！");
		System.out.println("取得した文字列は"+stu_name+"です！");
		System.out.println("取得した文字列は"+stu_birthplace+"です！");

		// studentオブジェクトに情報を格納
		Student student = new Student(stu_id, stu_name, stu_birthplace);

		//  StudentManagerオブジェクトの生成
		StudentManager manager = new StudentManager();

		//  登録
		manager.registStudent(student);

		//  成功画面を表示する
		//System.out.println("OK牧場");
		response.sendRedirect(response.encodeRedirectURL("./registStudentSuccess.jsp"));
		}
}
