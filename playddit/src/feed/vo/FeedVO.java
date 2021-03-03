package feed.vo;

import java.util.List;

public class FeedVO {
	
	private int feedno;
	private String id;
	private String profile;
	private String feedpic;
	private String nickname;
	private String classname;
	private int islike;
	private int countlike;
	private int reportcount;
	private int isreport;
	@Override
	public String toString() {
		return "FeedVO [feedno=" + feedno + ", id=" + id + ", profile=" + profile + ", feedpic=" + feedpic
				+ ", nickname=" + nickname + ", classname=" + classname + ", islike=" + islike + ", countlike="
				+ countlike + ", reportcount=" + reportcount + ", isreport=" + isreport + ", cont=" + cont
				+ ", comcount=" + comcount + ", replyList=" + replyList + ", ismine=" + ismine + "]";
	}


	private String cont;
	private int comcount;
	private List<ComVO> replyList;
	private String ismine;
	
	
	
	
	
	public String getIsmine() {
		return ismine;
	}


	public void setIsmine(String ismine) {
		this.ismine = ismine;
	}


	public List<ComVO> getReplyList() {
		return replyList;
	}


	public void setReplyList(List<ComVO> replyList) {
		this.replyList = replyList;
	}


	public int getComcount() {
		return comcount;
	}


	public void setComcount(int comcount) {
		this.comcount = comcount;
	}


	public String getCont() {
		return cont;
	}


	public void setCont(String cont) {
		this.cont = cont;
	}


	public int getFeedno() {
		return feedno;
	}


	public void setFeedno(int feedno) {
		this.feedno = feedno;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}


	public String getFeedpic() {
		return feedpic;
	}


	public void setFeedpic(String feedpic) {
		this.feedpic = feedpic;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getClassname() {
		return classname;
	}


	public void setClassname(String classname) {
		this.classname = classname;
	}


	public int getIslike() {
		return islike;
	}


	public void setIslike(int islike) {
		this.islike = islike;
	}


	public int getCountlike() {
		return countlike;
	}


	public void setCountlike(int countlike) {
		this.countlike = countlike;
	}


	public int getReportcount() {
		return reportcount;
	}


	public void setReportcount(int reportcount) {
		this.reportcount = reportcount;
	}


	public int getIsreport() {
		return isreport;
	}


	public void setIsreport(int isreport) {
		this.isreport = isreport;
	}


	
	
}              