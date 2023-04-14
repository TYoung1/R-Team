package findServlet2;

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
@WebServlet("/findpwForm")
public class findpwForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findpwForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		// TODO Auto-generated method stub
		try {
			DB_Conn _Db = new DB_Conn();
			String user_Id = request.getParameter("user_id");
			String user_Name = request.getParameter("user_name");
	
			insert_LoginData _Data = new insert_LoginData(); 
			
				_Data.ID = user_Id;
				_Data.NAME = user_Name;
	
				// this.User_ID = user_id;
				// this.User_PW = user_pw;
				// this.User_NAME = user_name;
				// this.User_BIRTH = user_birth;
				// this.User_GENDER = user_gender;
				
				_Db.findpw_UserData(request,response, _Data);
		} catch (Exception e) {
			
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
	}

}
