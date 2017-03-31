package model.bean;

import java.sql.Date;

public class Account {
	private int accountID;
	private String userName;
	private String pass;
	private String email;
	private String displayName;
	private Date startDate;
	private Date birthDate;
	private String location;
	private String aboutMe;
	private String career;
	private String companyName;
	private int totalAnswer;
	private int totalQuestion;
	private int totalView;
	private int totalTag;
	private int reputationPoint;
	private String img;
	private int stt;// Status
	private Date lastSeen;
	private Date lockDate;

	public int getTotalQuestion() {
		return totalQuestion;
	}

	public void setTotalQuestion(int totalQuestion) {
		this.totalQuestion = totalQuestion;
	}

	public Account() {
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
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName
	 *            the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the pass
	 */
	public String getPass() {
		return pass;
	}

	/**
	 * @param pass
	 *            the pass to set
	 */
	public void setPass(String pass) {
		this.pass = pass;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the displayName
	 */
	public String getDisplayName() {
		return displayName;
	}

	/**
	 * @param displayName
	 *            the displayName to set
	 */
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	/**
	 * @return the startDate
	 */
	public Date getStartDate() {
		return startDate;
	}

	/**
	 * @param startDate
	 *            the startDate to set
	 */
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	/**
	 * @return the birthDate
	 */
	public Date getBirthDate() {
		return birthDate;
	}

	/**
	 * @param birthDate
	 *            the birthDate to set
	 */
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	/**
	 * @return the location
	 */
	public String getLocation() {
		return location;
	}

	/**
	 * @param location
	 *            the location to set
	 */
	public void setLocation(String location) {
		this.location = location;
	}

	/**
	 * @return the aboutMe
	 */
	public String getAboutMe() {
		return aboutMe;
	}

	/**
	 * @param aboutMe
	 *            the aboutMe to set
	 */
	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	/**
	 * @return the career
	 */
	public String getCareer() {
		return career;
	}

	/**
	 * @param career
	 *            the career to set
	 */
	public void setCareer(String career) {
		this.career = career;
	}

	/**
	 * @return the companyName
	 */
	public String getCompanyName() {
		return companyName;
	}

	/**
	 * @param companyName
	 *            the companyName to set
	 */
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	/**
	 * @return the stt
	 */
	public int getStt() {
		return stt;
	}

	/**
	 * @param stt
	 *            the stt to set
	 */
	public void setStt(int stt) {
		this.stt = stt;
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
	 * @return the totalTag
	 */
	public int getTotalTag() {
		return totalTag;
	}

	/**
	 * @param totalTag
	 *            the totalTag to set
	 */
	public void setTotalTag(int totalTag) {
		this.totalTag = totalTag;
	}

	/**
	 * @return the lockDate
	 */
	public Date getLockDate() {
		return lockDate;
	}

	/**
	 * @param lockDate
	 *            the lockDate to set
	 */
	public void setLockDate(Date lockDate) {
		this.lockDate = lockDate;
	}

	public int getReputationPoint() {
		return reputationPoint;
	}

	public void setReputationPoint(int reputationPoint) {
		this.reputationPoint = reputationPoint;
	}

	/**
	 * @return the img
	 */
	public String getImg() {
		return img;
	}

	/**
	 * @param img
	 *            the img to set
	 */
	public void setImg(String img) {
		this.img = img;
	}

	/**
	 * @return the lastSeen
	 */
	public Date getLastSeen() {
		return lastSeen;
	}

	/**
	 * @param lastSeen
	 *            the lastSeen to set
	 */
	public void setLastSeen(Date lastSeen) {
		this.lastSeen = lastSeen;
	}

}
