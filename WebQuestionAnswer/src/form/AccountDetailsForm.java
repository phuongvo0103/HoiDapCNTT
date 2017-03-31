package form;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import model.bean.Account;

public class AccountDetailsForm extends ActionForm {
	private int accountID = 0;
	private String displayName;
	private String email;
	private String career;
	private String companyName;
	private String aboutMe;
	private int totalAnswer;
	private int totalQuestion;
	private String location;
	private int totalView;
	private Date lastSeen;
	private Account account = null;
	private String img = "";
	private int reputationPoint;
	private ArrayList<Object> listQuestion = null;

	public ArrayList<Object> getListQuestion() {
		return listQuestion;
	}

	public void setListQuestion(ArrayList<Object> listQuestion) {
		this.listQuestion = listQuestion;
	}

	/**
	 * @return the reputationPoint
	 */
	public int getReputationPoint() {
		return reputationPoint;
	}

	/**
	 * @param reputationPoint
	 *            the reputationPoint to set
	 */
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
	 * @return the account
	 */
	public Account getAccount() {
		return account;
	}

	/**
	 * @param account
	 *            the account to set
	 */
	public void setAccount(Account account) {
		this.account = account;
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
	 * @return the totalQuestion
	 */
	public int getTotalQuestion() {
		return totalQuestion;
	}

	/**
	 * @param totalQuestion
	 *            the totalQuestion to set
	 */
	public void setTotalQuestion(int totalQuestion) {
		this.totalQuestion = totalQuestion;
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

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
