package alarm.vo;

public class AlarmVO {
	private int alarm_no;
	private String cont;
	private String receiver;
	private String sender;
	private String sender_pic;
	private int type;
	private int chk;
	
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
	public int getAlarm_no() {
		return alarm_no;
	}
	public void setAlarm_no(int alarm_no) {
		this.alarm_no = alarm_no;
	}
	
	
}
