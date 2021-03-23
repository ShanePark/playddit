package login.vo;

public class ProfileVO {
	private String user_id;
	private String user_nickname;
	private String classname1;
	private String classname2;
	private String user_bio;
	private String class_id;
	private String user_pic;
	private String user_name;
	private String user_tel;
	private String user_birth;
	private int following;
	private int follower;
	private int allfeed;
	@Override
	public String toString() {
		return "ProfileVO [user_id=" + user_id + ", user_nickname=" + user_nickname + ", classname1=" + classname1
				+ ", classname2=" + classname2 + ", user_bio=" + user_bio + ", class_id=" + class_id + ", user_pic="
				+ user_pic + ", user_name=" + user_name + ", user_tel=" + user_tel + ", user_birth=" + user_birth
				+ ", following=" + following + ", follower=" + follower + ", allfeed=" + allfeed + ", amIfollowing="
				+ amIfollowing + "]";
	}
	private int amIfollowing;
	
	public int getAmIfollowing() {
		return amIfollowing;
	}
	public void setAmIfollowing(int amIfollowing) {
		this.amIfollowing = amIfollowing;
	}
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
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

}
