package message.vo;

public class MessageVO {
	private String receiver;
	private String sender;
	private String content;
	private String sentdate;
	private String senderProfile;
	private String sender_id;
	private int isMine;
	
	public int getIsMine() {
		return isMine;
	}
	public void setIsMine(int isMine) {
		this.isMine = isMine;
	}
	public String getSenderProfile() {
		return senderProfile;
	}
	public void setSenderProfile(String senderProfile) {
		this.senderProfile = senderProfile;
	}
	public String getSender_id() {
		return sender_id;
	}
	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}
	
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSentdate() {
		return sentdate;
	}
	public void setSentdate(String sentdate) {
		this.sentdate = sentdate;
	}

}
