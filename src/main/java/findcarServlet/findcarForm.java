package findcarServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DB_Conn;
import DataClass.CarData;
import DataClass.insert_LoginData;

/**
 * Servlet implementation class findcarForm
 */
@WebServlet("/findcarForm")
public class findcarForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findcarForm() {
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
//			입력정보 변수에 저장
			String car_Type = request.getParameter("car_type");
//			String car_Model = request.getParameter("car_model");
			int car_min_Mileage = Integer.parseInt(request.getParameter("car_min_mileage"));
			int car_max_Mileage = Integer.parseInt(request.getParameter("car_max_mileage"));
			int car_min_Price = Integer.parseInt(request.getParameter("car_min_price"));
			int car_max_Price = Integer.parseInt(request.getParameter("car_max_price"));
			int car_min_Year = Integer.parseInt(request.getParameter("car_min_year"));
			int car_max_Year = Integer.parseInt(request.getParameter("car_max_year"));
			String car_url = request.getParameter("car_url");
			
			System.out.println(car_Type);

	
			CarData _Data = new CarData();
//					차량 DTO 에 값 저장
				_Data.TYPE = car_Type;
//				_Data.MODEL = car_Model;
				_Data.MAX_MILEAGE = car_max_Mileage;
				_Data.MIN_MILEAGE = car_min_Mileage;
				_Data.MAX_PRICE = car_max_Price;
				_Data.MIN_PRICE = car_min_Price;
				_Data.MAX_YEAR = car_max_Year;
				_Data.MIN_YEAR = car_min_Year;
				_Data.URL = car_url;
				
				

				// this.User_ID = user_id;
				// this.User_PW = user_pw;
				// this.User_NAME = user_name;
				// this.User_BIRTH = user_birth;
				// this.User_GENDER = user_gender;
//				차량 조회 함수 호출
				_Db.findcar_CarData(request,response, _Data);
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
