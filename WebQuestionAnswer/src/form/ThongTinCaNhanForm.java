package form;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import model.bean.Account;

public class ThongTinCaNhanForm extends ActionForm {

	private int accountID = 0;
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
	private int totalVote;
	private int reputationPoint;
	private int stt;// Status
	private Date lastSeen;
	private Date lockDate;
	private Account account;
	private String submit;
	private int type = 0;
	private FormFile file;
	private String img;
	private ArrayList<Object> listQuestion = null;

	public ArrayList<Object> getListQuestion() {
		return listQuestion;
	}

	public void setListQuestion(ArrayList<Object> listQuestion) {
		this.listQuestion = listQuestion;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public FormFile getFile() {
		return file;
	}

	public void setFile(FormFile file) {
		this.file = file;
	}

	public String getSubmit() {
		return submit;
	}

	public void setSubmit(String submit) {
		this.submit = submit;
	}

	public int getTotalQuestion() {
		return totalQuestion;
	}

	public void setTotalQuestion(int totalQuestion) {
		this.totalQuestion = totalQuestion;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public int getTotalAnswer() {
		return totalAnswer;
	}

	public void setTotalAnswer(int totalAnswer) {
		this.totalAnswer = totalAnswer;
	}

	public int getTotalView() {
		return totalView;
	}

	public void setTotalView(int totalView) {
		this.totalView = totalView;
	}

	public int getTotalTag() {
		return totalTag;
	}

	public void setTotalTag(int totalTag) {
		this.totalTag = totalTag;
	}

	public int getTotalVote() {
		return totalVote;
	}

	public void setTotalVote(int totalVote) {
		this.totalVote = totalVote;
	}

	public int getReputationPoint() {
		return reputationPoint;
	}

	public void setReputationPoint(int reputationPoint) {
		this.reputationPoint = reputationPoint;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getStt() {
		return stt;
	}

	public void setStt(int stt) {
		this.stt = stt;
	}

	public Date getLastSeen() {
		return lastSeen;
	}

	public void setLastSeen(Date lastSeen) {
		this.lastSeen = lastSeen;
	}

	public Date getLockDate() {
		return lockDate;
	}

	public void setLockDate(Date lockDate) {
		this.lockDate = lockDate;
	}

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
