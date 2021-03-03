package alarm.vo;

public class AlarmVO {
	private String cont;
	private String receiver;
	private String sender;
	private String sender_pic;
	private int type;
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
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
	public String getSender_pic() {
		return sender_pic;
	}
	public void setSender_pic(String sender_pic) {
		this.sender_pic = sender_pic;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getChk() {
		return chk;
	}
	public void setChk(int chk) {
		this.chk = chk;
	}
	private int chk;
	
	
}
