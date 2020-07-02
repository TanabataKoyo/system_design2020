//　自分が格納されているフォルダ名
package service;

//  自分が格納されているフォルダの外にある必要なクラス
import java.sql.Connection;

import model.Student;
import dao.StudentDAO;

import javax.servlet.http.HttpServlet;

public class StudentManager extends HttpServlet {

    // 属性
    private Connection connection = null;

    // 引数を持たないコンストラクタ
    public StudentManager() {
    }

    // 追加
    // 引数はStudentオブジェクト
    public void registStudent(Student student) {

        // StudentDAOオブジェクト生成
        StudentDAO studentDAO = new StudentDAO();

        // DataBaseへ接続し、コネクションオブジェクトを生成する
        this.connection = studentDAO.createConnection();

        // StudentオブジェクトをDataBaseに登録する
        studentDAO.registStudent(student, this.connection);

        // DataBaseとの接続を切断する
        studentDAO.closeConnection(this.connection);

        // コネクションオブジェクトを破棄する
        this.connection = null;

    }

    // 検索
    public Student searchStudent(Student student) {

        // StudentDAOオブジェクト生成
        StudentDAO studentDAO = new StudentDAO();

        // DataBaseへ接続し、コネクションオブジェクトを生成する
        this.connection = studentDAO.createConnection();

        // 検索する
        student = studentDAO.searchStudent(student, this.connection);

        // DataBaseとの接続を切断する
        studentDAO.closeConnection(this.connection);

        // コネクションオブジェクトを破棄する
        this.connection = null;

        return student;
    }

}
