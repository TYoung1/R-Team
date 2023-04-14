package DB;

import java.awt.Desktop;
import java.io.IOException;
import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DataClass.CarData;
import DataClass.insert_LoginData;

public class DB_Conn {

	public String _sql;

	Connection conn = null;

	public DB_Conn() {
		Connection();
	}

	public DB_Conn(String _sql) {
		Connection();
		this._sql = _sql;
	}

	void Connection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String url = "jdbc:mysql://192.168.250.33/gaebalcar?characterEncoding=UTF-8&serverTimezone=UTC";
			String id = "team";																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																												
			String pwd = "1234"; // mysql 접속 비번
			conn = DriverManager.getConnection(url, id, pwd);
			System.out.println("db접속 성공");
		} catch (Exception e) {

			System.out.println("db접속 실패");
			e.printStackTrace();
		}

	}

	public void Insert_UserData(HttpServletRequest request, HttpServletResponse response, insert_LoginData _Data)
			throws IOException {
		// Connection conn = null; // DB접속 객체
		PreparedStatement pstmt = null; // SQL실행객체

		try {
			// sql insert query  User_Info table에 _ID, _PW, _Name, _Birth, _Gender에 values를 넣을거다.
			String sql = "insert into User_Info(_ID, _PW, _Name, _Birth, _Gender)" + "values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, _Data.ID);
			pstmt.setString(2, _Data.PW);
			pstmt.setString(3, _Data.NAME);
			pstmt.setString(4, _Data.BIRTH);
			pstmt.setNString(5, _Data.GENDER);
			// query 업데이트 
			pstmt.executeUpdate();

			response.sendRedirect("Home.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			// sql 에 접속 연결을 끊음.
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

	public void selectLogin(HttpServletRequest request, HttpServletResponse response, insert_LoginData _Data)
			throws IOException {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;

		try {
			stmt = conn.createStatement();
			String sql = "select _ID, _PW , _Master from User_Info where _ID = '" + _Data.ID + "'";
//			String sql = "select User_ID, User_PW ,Admin_chk from join_info where User_ID = '" + _Data.ID + "'";

			res = stmt.executeQuery(sql);
			boolean idExist = false;
			while (res.next()) {
				String ID_ = res.getString("_ID");
				String PW_ = res.getString("_PW");
				int MASTER_ = res.getInt("_Master");
//				int _Ad = res.getInt("Admin_chk");

				if (_Data.ID.equals(ID_)) {
					idExist = true;
					if (PW_.equals(_Data.PW)) {
						System.out.println("로그인 되었습니다.");
						System.out.println(ID_);

						HttpSession session = request.getSession();
						session.setAttribute("user_id", _Data.ID);
						session.setAttribute("user_pw", _Data.PW);
						session.setAttribute("master", MASTER_);
		
						// 페이지 이동
						response.sendRedirect("Home.jsp");
					} else {
						System.out.println("아이디 또는 비밀번호를 확인해주세요");
						response.sendRedirect("Login.jsp");
					}
				}
			}
			if (!idExist) {
				response.sendRedirect("Login.jsp");
			}
		} catch (Exception e) {
			response.sendRedirect("Login.jsp");
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void delete_UserData(HttpServletRequest request, HttpServletResponse response, insert_LoginData _Data)
			throws IOException {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;

		try {
			PreparedStatement pstmt = null; // SQL실행객체

			System.out.println(_Data.ID);
			String sql = "delete from User_Info where _ID = '" + _Data.ID + "'";
//			String sql = "select User_ID, User_PW ,Admin_chk from join_info where User_ID = '" + _Data.ID + "'";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			response.sendRedirect("logout.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public void findid_UserData(HttpServletRequest request, HttpServletResponse response, insert_LoginData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;


		try {
			stmt = conn.createStatement();
			String sql = "select _ID from User_Info where _Name = '" + _Data.NAME + "'";
//			String sql = "select User_ID, User_PW ,Admin_chk from join_info where User_ID = '" + _Data.ID + "'";

			res = stmt.executeQuery(sql);
			while (res.next()) {
				String ID_ = res.getString("_ID");

				HttpSession session = request.getSession();
				session.setAttribute("user_id", ID_);

				response.sendRedirect("find.jsp");
//				int _Ad = res.getInt("Admin_chk");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
public void findpw_UserData(HttpServletRequest request, HttpServletResponse response, insert_LoginData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;

		try {
			stmt = conn.createStatement();
			String sql = "select _PW from User_Info where _ID = '" + _Data.ID + "' AND _Name = '" + _Data.NAME + "'";
//			String sql = "select User_ID, User_PW ,Admin_chk from join_info where User_ID = '" + _Data.ID + "'";

			res = stmt.executeQuery(sql);
			while (res.next()) {
				String PW_ = res.getString("_PW");

				HttpSession session = request.getSession();
				session.setAttribute("user_pw", PW_);

				response.sendRedirect("find.jsp");
//				int _Ad = res.getInt("Admin_chk");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	public CarData findDetail(String userid) {
		ResultSet res = null;
		try {
			String sql = "select A._TYPE, A._MODEL,A._YEAR,A._PRICE,A._MILEAGE,A._MAKE,A._URL, B._ACCIDENT,B._FUELTYPE,B._mpg FROM car_info AS A LEFT JOIN car_detail AS B ON A._CARID = B._CARID where A._CARID = ?" ;
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			res= pstmt.executeQuery();
			if(res.next()) {
				CarData dt = new CarData();
				dt.setTYPE(res.getString(1));
				dt.setMODEL(res.getString(2));
				dt.setYEAR(res.getInt(3));
				dt.setPRICE(res.getInt(4));
				dt.setMILEAGE(res.getInt(5));
				dt.setMAKE(res.getString(6));
				dt.setURL(res.getString(7));
				dt.setACCIDENT(res.getString(8));
				dt.setFUELTYPE(res.getString(9));
				dt.setMPG(res.getString(10));
				return dt;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}  public void findcar_CarData(HttpServletRequest request, HttpServletResponse response, CarData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;
		List<CarData> carList = new ArrayList<CarData>();

		try {
			stmt = conn.createStatement();
			String sql = "select _CARID ,_TYPE ,_YEAR , _PRICE , _MILEAGE ,_MAKE , _URL from car_info where _TYPE = '" + _Data.TYPE + "' AND _YEAR >= " + _Data.MIN_YEAR + " AND _YEAR <=" + _Data.MAX_YEAR + " AND _PRICE >= " + _Data.MIN_PRICE + " AND _PRICE <= " + _Data.MAX_PRICE + " AND _MILEAGE >= " + _Data.MIN_MILEAGE + " AND _MILEAGE <=" + _Data.MAX_MILEAGE + "";
//			String sql = "select User_ID, User_PW ,Admin_chk from join_info where User_ID = '" + _Data.ID + "'";
			res = stmt.executeQuery(sql);
			while (res.next()) {
				CarData car = new CarData();
				car.CAR_ID = res.getString("_CARID");
				car.TYPE = res.getString("_TYPE");
//		        car.MODEL = res.getString("_MODEL");
				car.YEAR = res.getInt("_YEAR");
		        car.PRICE = res.getInt("_PRICE");
		        car.MILEAGE = res.getInt("_MILEAGE");
		        car.MAKE = res.getString("_MAKE");
		        car.URL = res.getNString("_URL");
		        carList.add(car);
				
				
//				int _Ad = res.getInt("Admin_chk");
			}
			HttpSession session = request.getSession();
			session.setAttribute("car_List", carList);
			System.out.println(carList.get(0).PRICE);

			
			response.sendRedirect("Findcar.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}

