package Board;

public class boarder {
			 int seq;
			 String title;
			 String content;
			 String user_id;
			 String regdate ;
			 int availiable; // 1=게시  0 = 삭제된거 
		
			public int getSeq() {
				return seq;
			}
			public void setSeq(int seq) {
				this.seq = seq;
			}
			public String getTitle() {
				return title;
			}
			public void setTitle(String title) {
				this.title = title;
			}
			public String getContent() {
				return content;
			}
			public void setContent(String content) {
				this.content = content;
			}
			public String getUser_id() {
				return user_id;
			}
			public void setUser_id(String user_id) {
				this.user_id = user_id;
			}
			public String getRegdate() {
				return regdate;
			}
			public void setRegdate(String regdate) {
				this.regdate = regdate;
			}
			public int getAvailiable() {
				return availiable;
			}
			public void setAvailiable(int availiable) {
				this.availiable = availiable;
			}
			
		}


