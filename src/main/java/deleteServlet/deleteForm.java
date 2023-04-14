package deleteServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DB_Conn;
import DataClass.insert_LoginData;

/**
 * Servlet implementation class deleteForm
 */
@WebServlet("/deleteForm")
public class deleteForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		try {
			DB_Conn _Db = new DB_Conn();

			String user_Id = request.getParameter("User_id");
			
			insert_LoginData _Data = new insert_LoginData(); 
					
				_Data.ID = user_Id;


				// this.User_ID = user_id;
				// this.User_PW = user_pw;
				// this.User_NAME = user_name;
				// this.User_BIRTH = user_birth;
				// this.User_GENDER = user_gender;
				// this.User_EMAIL = user_email;
				// this.User_P = user_phone;
				
				_Db.delete_UserData(request, response, _Data);
		} catch (Exception e) {
			
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

