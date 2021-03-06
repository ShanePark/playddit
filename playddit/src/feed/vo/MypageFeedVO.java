package feed.vo;

public class MypageFeedVO {
	private int feed_no;
	private int likes;
	private int comments;
	private String content;
	
	public int getFeed_no() {
		return feed_no;
	}
	public void setFeed_no(int feed_no) {
		this.feed_no = feed_no;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getComments() {
		return comments;
	}
	public void setComments(int comments) {
		this.comments = comments;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	private String pic;
	
	
}              