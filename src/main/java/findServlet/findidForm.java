package findServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DB_Conn;
import DataClass.insert_LoginData;

/**
 * Servlet implementation class findidForm
 */
@WebServlet("/findidForm")
public class findidForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public findidForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		// TODO Auto-generated method stub
		try {
			DB_Conn _Db = new DB_Conn();

			String user_Name = request.getParameter("user_name");
			String user_Birth = request.getParameter("user_birth");
			String user_Gender = request.getParameter("user_gender");

			insert_LoginData _Data = new insert_LoginData();
//	               유저 DTO 에 값 저장 
			_Data.NAME = user_Name;
			_Data.BIRTH = user_Birth;
			_Data.GENDER = user_Gender;

//	            아이디 찾기 함수 호출
			_Db.findid_UserData(request, response, _Data);
		} catch (Exception e) {

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
	}

}
