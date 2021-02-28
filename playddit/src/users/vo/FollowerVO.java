package users.vo;

public class FollowerVO {
	private String id;
	private String nickname;
	private String department;
	private String profile;
	private int followback;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getFollowback() {
		return followback;
	}
	public void setFollowback(int followback) {
		this.followback = followback;
	}
}
