package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Board.boarder;
public class db_con {
	private Connection conn;
	
	private ResultSet res=null;
//	db연결
	public db_con() {
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
// 글쓴 시간 가져오기
	public String getDate() {
		try {
//			
			String sql  = "SELECT NOW()";
			PreparedStatement pstmt = conn.prepareStatement(sql) ;
//			쿼리문 실행결과 res에 담아주기
//			executeQuery select문에 사용
			res = pstmt.executeQuery();
			if(res.next()) {
				return res.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";// db오류
	}
//	글쓴 순서 부여 
	 public int getNext()
	    {
	        String sql = "SELECT _SEQ FROM notice ORDER BY _SEQ DESC"; // 내림차순으로 가장 마지막에 쓰인 것을 가져온다
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            res = pstmt.executeQuery();
	            if(res.next()) {
	                return res.getInt(1) + 1; // 그 다음 게시글의 번호
	            }
	            return 1; // 첫 번째 게시물인 경우
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return -1; // db오류
	    }
//	 글 게시
	public int write(String title,String content,String user_id) {
		String sql = "INSERT INTO notice VALUES(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
//			seq,title,content,user_id,date, 마지막 부여 (1 = 게시된거 or 0 삭제된거 )
			pstmt.setInt(1, getNext());
			pstmt.setString(2,title);
			pstmt.setString(3,content);
			pstmt.setString(4,user_id);
			pstmt.setString(5,getDate());
			pstmt.setInt(6,1);
//			executeUpdate select 문 제외 나머지에 사용
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;//db오류
	}
	public ArrayList<boarder> getList(int pageNum){
		String sql = "SELECT * FROM notice WHERE _SEQ< ? AND _AVAILABLE = 1 ORDER BY _SEQ LIMIT 10";
//		객체생성
		ArrayList<boarder> list = new ArrayList<boarder>();
		try {	
			PreparedStatement pstmt = conn.prepareStatement(sql);
//			
			pstmt.setInt(1, getNext()- (pageNum-1)*10);
			res=pstmt.executeQuery();
			while(res.next()) {
				boarder board = new boarder();
				board.setSeq(res.getInt(1));
				board.setTitle(res.getString(2));
				board.setContent(res.getString(3));
				board.setUser_id(res.getString(4));
				board.setRegdate(res.getString(5));
				board.setAvailiable(res.getInt(6));
//				객체 list 에  저장
				list.add(board);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
//		저장된 list 반환
		return list;
	}
//	 public boolean nextPage(int pageNum) {
//		 //게시된상태인 글 불러오기 
//	        String sql = "SELECT * FROM notice WHERE _SEQ < ? AND _AVAILABLE = 1"; 
//	        try {
//	            PreparedStatement pstmt = conn.prepareStatement(sql);
//	            pstmt.setInt(1, getNext() - (pageNum - 1 ) * 10);
//	            res = pstmt.executeQuery();
//	            if (res.next())
//	            {
//	                return true;
//	            }
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	        return false; 
//	    }
	public int countNotice() {
		String sql = "SELECT COUNT(*) FROM notice WHERE _AVAILABLE= 1 ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			res=pstmt.executeQuery();
			if(res.next()) {
				return res.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}return 1;
	}
	public int pageCount(int dataCount) {
		 if(dataCount%10 !=0) {
			 return dataCount/10 +1;
		 }else {
			 return dataCount;
		 }
		 
	 }
	 public boarder getboarder(int seq) {
//		 해당 seq 에 해당하는 글 정보 보여주기위한 쿼리
		 String sql = "SELECT * FROM notice WHERE _SEQ = ?";
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, seq);
			 
			 res = pstmt.executeQuery();
			 if(res.next()) {
//				 해당시퀀스에 해당하는 정보 담기 bbs에 
				boarder bbs = new boarder();
				bbs.setSeq(res.getInt(1));
				bbs.setTitle(res.getString(2));
				bbs.setContent(res.getString(3));
				bbs.setUser_id(res.getString(4));
				bbs.setRegdate(res.getString(5));
				bbs.setAvailiable(res.getInt(6));
//				bbs 반환
				return bbs;
				 }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 return null;
	 }
}
