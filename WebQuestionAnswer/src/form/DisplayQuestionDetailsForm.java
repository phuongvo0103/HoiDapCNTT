package form;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import model.bean.Account;
import model.bean.Question;

@SuppressWarnings("serial")
public class DisplayQuestionDetailsForm extends ActionForm {
	private int questionID = 0;
	private int answerID = 0;
	private int vote = 0;
	private String error = "Câu hỏi này không tồn tại";
	private int type = -1;
	private String submit = null;
	private String answerBody = "";
	private ArrayList<Object> listQuestionSam = null;
	private ArrayList<Object> listQuestionTop = null;
	private ArrayList<Object> listTagTop = null;
	private Account account = null;
	private int voteOK = 0;

	public int getVoteOK() {
		return voteOK;
	}

	public void setVoteOK(int voteOK) {
		this.voteOK = voteOK;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public ArrayList<Object> getListTagTop() {
		return listTagTop;
	}

	public void setListTagTop(ArrayList<Object> listTagTop) {
		this.listTagTop = listTagTop;
	}

	public ArrayList<Object> getListQuestionSam() {
		return listQuestionSam;
	}

	public void setListQuestionSam(ArrayList<Object> listQuestionSam) {
		this.listQuestionSam = listQuestionSam;
	}

	public ArrayList<Object> getListQuestionTop() {
		return listQuestionTop;
	}

	public void setListQuestionTop(ArrayList<Object> listQuestionTop) {
		this.listQuestionTop = listQuestionTop;
	}

	public String getAnswerBody() {
		return answerBody;
	}

	public void setAnswerBody(String answerBody) {
		this.answerBody = answerBody;
	}

	public String getSubmit() {
		return submit;
	}

	public void setSubmit(String submit) {
		this.submit = submit;
	}

	public int getAnswerID() {
		return answerID;
	}

	public void setAnswerID(int answerID) {
		this.answerID = answerID;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public int getVote() {
		return vote;
	}

	public void setVote(int vote) {
		this.vote = vote;
	}

	private Question question = null;

	/**
	 * @return the question
	 */
	public Question getQuestion() {
		return question;
	}

	/**
	 * @param question
	 *            the question to set
	 */
	public void setQuestion(Question question) {
		this.question = question;
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

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
