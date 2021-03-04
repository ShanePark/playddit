package feed.vo;

import java.util.List;

public class ComVO {
			private int comno;
			private String id;
			private String comcont;
			private String nickname;
			private String time;
			private String profile;
			
			private int repcount;
			private List<ComVO> replyList;
			
			public int getComno() {
				return comno;
			}
			public void setComno(int comno) {
				this.comno = comno;
			}
			public String getId() {
				return id;
			}
			public void setId(String id) {
				this.id = id;
			}
			public String getComcont() {
				return comcont;
			}
			public void setComcont(String comcont) {
				this.comcont = comcont;
			}
			public String getNickname() {
				return nickname;
			}
			public void setNickname(String nickname) {
				this.nickname = nickname;
			}
			public String getTime() {
				return time;
			}
			public void setTime(String time) {
				this.time = time;
			}
			public int getRepcount() {
				return repcount;
			}
			public void setRepcount(int repcount) {
				this.repcount = repcount;
			}
			public String getProfile() {
				return profile;
			}
			public void setProfile(String profile) {
				this.profile = profile;
			}
			public List<ComVO> getReplyList() {
				return replyList;
			}
			public void setReplyList(List<ComVO> replyList) {
				this.replyList = replyList;
			}
			
			
			
}
