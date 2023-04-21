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

import Board.boarder;
import DataClass.CarData;
import DataClass.insert_LoginData;

// DB 연결
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

//	 회원가입시 입력한 유저데이터 DB저장
	public void Insert_UserData(HttpServletRequest request, HttpServletResponse response, insert_LoginData _Data)
			throws IOException {
		// Connection conn = null; // DB접속 객체
		PreparedStatement pstmt = null; // SQL실행객체

		try {
//			회원가입 정보  insert 쿼리 
			String sql = "insert into User_Info(_ID, _PW, _Name, _Birth, _Gender)" + "values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, _Data.ID);
			pstmt.setString(2, _Data.PW);
			pstmt.setString(3, _Data.NAME);
			pstmt.setString(4, _Data.BIRTH);
			pstmt.setNString(5, _Data.GENDER);
			// query 업데이트
			pstmt.executeUpdate();
// 홈화면으로 리다이렉트 
			response.sendRedirect("Home.jsp");
		} catch (Exception e) {
			e.printStackTrace();
//			아이디 중복시 예외처리
//			세션객체 사용해서 저장 
			HttpSession session = request.getSession();
			session.setAttribute("chk", "1");
			response.sendRedirect("Signup.jsp");

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

// 해당하는 계정 로그인 
	public void selectLogin(HttpServletRequest request, HttpServletResponse response, insert_LoginData _Data)
			throws IOException {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;

		try {
			stmt = conn.createStatement();
//			 ID,PW, 관리자인지 여부 확인 
			String sql = "select _ID, _PW , _Master from User_Info where _ID = '" + _Data.ID + "'";

			res = stmt.executeQuery(sql);
			boolean idExist = false;
//			res.next() 존재하는 정보 순차적으로 뿌려줌
			while (res.next()) {
				String ID_ = res.getString("_ID");
				String PW_ = res.getString("_PW");
				int MASTER_ = res.getInt("_Master");

				if (_Data.ID.equals(ID_)) {
					idExist = true;
					if (PW_.equals(_Data.PW)) {
						System.out.println("로그인 되었습니다.");
						System.out.println(ID_);
//						세션객체 사용해서 저장 
						HttpSession session = request.getSession();
						session.setAttribute("user_id", _Data.ID);
						session.setAttribute("user_pw", _Data.PW);
						session.setAttribute("master", MASTER_);
//		로그인 성공시 홈화면으로 이동
						response.sendRedirect("Home.jsp");
					} else {
//						비밀번호 불일치로 실패시 로그인화면으로 다시 리로딩
						HttpSession session = request.getSession();
						session.setAttribute("chk", "2");
						response.sendRedirect("Login.jsp");
					}
				}
			}
//			아이디 불일치로 실패시 예외
			if (!idExist) {
				HttpSession session = request.getSession();
				session.setAttribute("chk", "1");
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

//	회원 탈퇴 
	public void delete_UserData(HttpServletRequest request, HttpServletResponse response, insert_LoginData _Data)
			throws IOException {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;

		try {
			PreparedStatement pstmt = null; // SQL실행객체
//			해당 아이디를 찾아 삭제   (ID 기본키 중복불가)
			String sql = "delete from User_Info where _ID = '" + _Data.ID + "'";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			response.sendRedirect("Logout.jsp");
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

//	아이디 찾기 
	public void findid_UserData(HttpServletRequest request, HttpServletResponse response, insert_LoginData _Data)
			throws IOException {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;

		try {
			stmt = conn.createStatement();
//			이름과 성별, 생년월일로 정보찾는 쿼리 
			String sql = "select _ID from User_Info where _Name = '" + _Data.NAME + "' AND _Birth = '" + _Data.BIRTH
					+ "' AND _Gender = '" + _Data.GENDER + "'";

			res = stmt.executeQuery(sql);
			while (res.next()) {
				String ID_ = res.getString("_ID");
//				세션객체 사용해서 저장 
				HttpSession session = request.getSession();
				session.setAttribute("user_id", ID_);

				response.sendRedirect("findid.jsp");
			}
			// 해당 쿼리 결과가 없을 경우 페이지 리로딩
			response.sendRedirect("findid.jsp");
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

	// 비밀번호 찾기
	public void findpw_UserData(HttpServletRequest request, HttpServletResponse response, insert_LoginData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;

		try {
			stmt = conn.createStatement();
//			아이디,이름,생년월일,성별로 정보찾는 쿼리
			String sql = "select _PW from User_Info where _ID = '" + _Data.ID + "' AND _Name = '" + _Data.NAME
					+ "' AND _Birth = '" + _Data.BIRTH + "' AND _Gender = '" + _Data.GENDER + "'";

			res = stmt.executeQuery(sql);
			while (res.next()) {
				String PW_ = res.getString("_PW");

//				세션객체 사용해서 저장 
				HttpSession session = request.getSession();
				session.setAttribute("user_pw", PW_);
//  			pw찾기 성공시 (찾은 정보를 가지고 )리다이렉션 
				response.sendRedirect("findpw.jsp");
			}
			// 해당 쿼리 결과가 없을 경우 페이지 리로딩
			response.sendRedirect("findpw.jsp");
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

// 선택한 차량의 아이디를 이용해 차량 상세정보 가져오기  ( car_detail 페이지에서 표시)
	public CarData findDetail(String userid) {
		ResultSet res = null;
		try {
//			차량 데이터와 차량디테일 데이터 조인후 정보가져오는 쿼리 
			String sql = "select A._TYPE, A._MODEL,A._YEAR,A._PRICE,A._MILEAGE,A._MAKE,A._URL, B._ACCIDENT,B._FUELTYPE,B._mpg FROM car_info AS A LEFT JOIN car_detail AS B ON A._CARID = B._CARID where A._CARID = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			res = pstmt.executeQuery();
	
			if (res.next()) {
//				조회 차량 정보 객체에 담아서 리턴 
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
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
//	공지 삭제
	public void delete_Notice(HttpServletRequest request, HttpServletResponse response, String[] chk)
			throws IOException {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;
		try {
			PreparedStatement pstmt = null; // SQL실행객체
//			공지사항 여러개 삭제 가능하게하기위한 반복문
			String params="";
			for(int i=0; i<chk.length;i++) {
				params+=chk[i];
				if(i<chk.length-1) {
					params +=", ";
				}
			}
//			params에 해당하는 정보 삭제 쿼리 
			String sql = "DELETE FROM notice WHERE _AVAILABLE = 1 and _seq IN ("+params+")";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
//			삭제후 다시 공지리스트 페이지로 리다이렉트 
			response.sendRedirect("notice_h.jsp");
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
//	차량 검색 조회 
	public void findcar_CarData(HttpServletRequest request, HttpServletResponse response, CarData _Data) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet res = null;
		List<CarData> carList = new ArrayList<CarData>();

		try {
			stmt = conn.createStatement();
//			정보에맞는 차량 모두 조회 
			String sql = "select _CARID ,_TYPE ,_YEAR , _PRICE , _MILEAGE ,_MAKE , _URL from car_info where _MAKE ='"
					+ _Data.MAKE + "' AND _TYPE ='" + _Data.TYPE + "' AND _YEAR >= " + _Data.MIN_YEAR + " AND _YEAR <="
					+ _Data.MAX_YEAR + " AND _PRICE >= " + _Data.MIN_PRICE + " AND _PRICE <= " + _Data.MAX_PRICE
					+ " AND _MILEAGE >= " + _Data.MIN_MILEAGE + " AND _MILEAGE <=" + _Data.MAX_MILEAGE + "";
			res = stmt.executeQuery(sql);
			if (res.next()) {
				while (res.next()) {
					CarData car = new CarData();
					car.CAR_ID = res.getString("_CARID");
					car.TYPE = res.getString("_TYPE");
					car.YEAR = res.getInt("_YEAR");
					car.PRICE = res.getInt("_PRICE");
					car.MILEAGE = res.getInt("_MILEAGE");
					car.MAKE = res.getString("_MAKE");
					car.URL = res.getNString("_URL");
//		        조회한 결과 객체에담고 리스트에 추가 
					carList.add(car);

				}
				HttpSession session = request.getSession();
				session.setAttribute("car_List", carList);
				response.sendRedirect("Findcar.jsp");
			} else {
				response.sendRedirect("findNone.jsp");
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
}
