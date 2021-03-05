package login.vo;

public class ProfileVO {
	private String user_id;
	private String user_nickname;
	private String classname1;
	private String classname2;
	private String user_bio;
	private String class_id;
	private String user_pic;
	private int following;
	private int follower;
	private int allfeed;
	
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
	public String getClassname1() {
		return classname1;
	}
	public void setClassname1(String classname1) {
		this.classname1 = classname1;
	}
	public String getClassname2() {
		return classname2;
	}
	public void setClassname2(String classname2) {
		this.classname2 = classname2;
	}
	public String getUser_bio() {
		return user_bio;
	}
	public void setUser_bio(String user_bio) {
		this.user_bio = user_bio;
	}
	public int getFollowing() {
		return following;
	}
	public void setFollowing(int following) {
		this.following = following;
	}
	public int getFollower() {
		return follower;
	}
	public void setFollower(int follower) {
		this.follower = follower;
	}
	public int getAllfeed() {
		return allfeed;
	}
	public void setAllfeed(int allfeed) {
		this.allfeed = allfeed;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getUser_pic() {
		return user_pic;
	}
	public void setUser_pic(String user_pic) {
		this.user_pic = user_pic;
	}

}
