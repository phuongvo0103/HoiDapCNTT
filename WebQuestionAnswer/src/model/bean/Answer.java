package model.bean;

import java.sql.Date;

public class Answer {
	private int answerID;
	private int questionID;
	private int accountID;
	private String answerBody;
	private Date postDate;
	private int totalVote;
	private int totalVoteUp;
	private int totalVoteDown;
	private int isViewed;
	private int stt;
	private Date creationDate;
	private String accountName;
	private int vote = 0;

	public int getVote() {
		return vote;
	}

	public void setVote(int vote) {
		this.vote = vote;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public int getStt() {
		return stt;
	}

	public void setStt(int stt) {
		this.stt = stt;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public int getTotalVoteUp() {
		return totalVoteUp;
	}

	public void setTotalVoteUp(int totalVoteUp) {
		this.totalVoteUp = totalVoteUp;
	}

	public int getTotalVoteDown() {
		return totalVoteDown;
	}

	public void setTotalVoteDown(int totalVoteDown) {
		this.totalVoteDown = totalVoteDown;
	}

	public Answer() {

		isViewed = 0;
		totalVote = 0;
	}

	public Answer(int questionID, int accountID, int answerID, String answerBody, Date postDate, int totalVote,
			int isViewed) {
		super();
		this.questionID = questionID;
		this.accountID = accountID;
		this.answerID = answerID;
		this.answerBody = answerBody;
		this.postDate = postDate;
		this.totalVote = totalVote;
		this.isViewed = isViewed;
	}

	public int getQuestionID() {
		return questionID;
	}

	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}

	public int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}

	public int getAnswerID() {
		return answerID;
	}

	public void setAnswerID(int answerID) {
		this.answerID = answerID;
	}

	public String getAnswerBody() {
		return answerBody;
	}

	public void setAnswerBody(String answerBody) {
		this.answerBody = answerBody;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public int getTotalVote() {
		return totalVote;
	}

	public void setTotalVote(int totalVote) {
		this.totalVote = totalVote;
	}

	public int getIsViewed() {
		return isViewed;
	}

	public void setIsViewed(int isViewed) {
		this.isViewed = isViewed;
	}

}
