package model.bean;

public class Message {
	private int ordNumber;
	private int messageID;
	private int accountSendID;
	private int accountReceiveID;
	private String message;

	public int getOrdNumber() {
		return ordNumber;
	}

	public void setOrdNumber(int ordNumber) {
		this.ordNumber = ordNumber;
	}

	public int getMessageID() {
		return messageID;
	}

	public void setMessageID(int messageID) {
		this.messageID = messageID;
	}

	public Message(int ordNumber, int messageID, int accountSendID, int accountReceiveID, String message) {
		super();
		this.ordNumber = ordNumber;
		this.messageID = messageID;
		this.accountSendID = accountSendID;
		this.accountReceiveID = accountReceiveID;
		this.message = message;
	}

	public Message(int messageID, int accountSendID, int accountReceiveID, String message) {
		super();
		this.messageID = messageID;
		this.accountSendID = accountSendID;
		this.accountReceiveID = accountReceiveID;
		this.message = message;
	}

	public Message(int accountSendID, int accountReceiveID, String message) {
		super();
		this.accountSendID = accountSendID;
		this.accountReceiveID = accountReceiveID;
		this.message = message;
	}

	public int getAccountSendID() {
		return accountSendID;
	}

	public void setAccountSendID(int accountSendID) {
		this.accountSendID = accountSendID;
	}

	public int getAccountReceiveID() {
		return accountReceiveID;
	}

	public void setAccountReceiveID(int accountReceiveID) {
		this.accountReceiveID = accountReceiveID;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
