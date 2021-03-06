package login.vo;

import java.util.List;

import join.vo.ClassVO;

public class PlayVO {
	private String user_id;
	private String user_nickname;
	private String class_id;
	private List<ClassVO> classList;
	private List<ProfileVO> followList;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public List<ClassVO> getClassList() {
		return classList;
	}
	public void setClassList(List<ClassVO> classList) {
		this.classList = classList;
	}
	public List<ProfileVO> getFollowList() {
		return followList;
	}
	public void setFollowList(List<ProfileVO> followList) {
		this.followList = followList;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	

}
