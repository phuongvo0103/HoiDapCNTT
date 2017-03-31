package model.bean;

import java.sql.Date;
import java.util.ArrayList;

public class Question {
	private int questionID;
	private int accountID;
	private String title;
	private String questionBody;
	private Date editDate;
	private int totalVote;
	private int totalAnswer;
	private int totalView;
	private int isLock;
	private int isViewed;
	private Date creationDate;
	private ArrayList<Answer> listAnswer;
	private ArrayList<Tag> listTag;
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

	public ArrayList<Tag> getListTag() {
		return listTag;
	}

	public void setListTag(ArrayList<Tag> listTag) {
		this.listTag = listTag;
	}

	public ArrayList<Answer> getListAnswer() {
		return listAnswer;
	}

	public void setListAnswer(ArrayList<Answer> listAnswer) {
		this.listAnswer = listAnswer;
	}

	/**
	 * @return the isLock
	 */
	public int getIsLock() {
		return isLock;
	}

	/**
	 * @param isLock
	 *            the isLock to set
	 */
	public void setIsLock(int isLock) {
		this.isLock = isLock;
	}

	/**
	 * @return the questionID
	 */
	public int getQuestionID() {
		return questionID;
	}

	/**
	 * @param questionID
	 *            the questionID to set
	 */
	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}

	/**
	 * @return the accountID
	 */
	public int getAccountID() {
		return accountID;
	}

	/**
	 * @param accountID
	 *            the accountID to set
	 */
	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title
	 *            the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the questionBody
	 */
	public String getQuestionBody() {
		return questionBody;
	}

	/**
	 * @param questionBody
	 *            the questionBody to set
	 */
	public void setQuestionBody(String questionBody) {
		this.questionBody = questionBody;
	}

	/**
	 * @return the editDate
	 */
	public Date getEditDate() {
		return editDate;
	}

	/**
	 * @param editDate
	 *            the editDate to set
	 */
	public void setEditDate(Date editDate) {
		this.editDate = editDate;
	}

	/**
	 * @return the totalVote
	 */
	public int getTotalVote() {
		return totalVote;
	}

	/**
	 * @param totalVote
	 *            the totalVote to set
	 */
	public void setTotalVote(int totalVote) {
		this.totalVote = totalVote;
	}

	/**
	 * @return the totalAnswer
	 */
	public int getTotalAnswer() {
		return totalAnswer;
	}

	/**
	 * @param totalAnswer
	 *            the totalAnswer to set
	 */
	public void setTotalAnswer(int totalAnswer) {
		this.totalAnswer = totalAnswer;
	}

	/**
	 * @return the totalView
	 */
	public int getTotalView() {
		return totalView;
	}

	/**
	 * @param totalView
	 *            the totalView to set
	 */
	public void setTotalView(int totalView) {
		this.totalView = totalView;
	}

	/**
	 * @return the isViewed
	 */
	public int getIsViewed() {
		return isViewed;
	}

	/**
	 * @param isViewed
	 *            the isViewed to set
	 */
	public void setIsViewed(int isViewed) {
		this.isViewed = isViewed;
	}

	/**
	 * @return the creationDate
	 */
	public Date getCreationDate() {
		return creationDate;
	}

	/**
	 * @param creationDate
	 *            the creationDate to set
	 */
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

}
