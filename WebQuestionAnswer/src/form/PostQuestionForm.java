package form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import model.bean.Account;

public class PostQuestionForm extends ActionForm {
	/**
	 * 
	 */
	private int accountID = 0;
	private String title = "";
	private String questionBody = "";
	private String message = "";
	private String tags = "";
	private Account account = null;
	private int errTitle = 0, errBody = 0, errTag = 0;
	private int postFail = 0;

	public int getPostFail() {
		return postFail;
	}

	public void setPostFail(int postFail) {
		this.postFail = postFail;
	}

	public int getErrTitle() {
		return errTitle;
	}

	public void setErrTitle(int errTitle) {
		this.errTitle = errTitle;
	}

	public int getErrBody() {
		return errBody;
	}

	public void setErrBody(int errBody) {
		this.errBody = errBody;
	}

	public int getErrTag() {
		return errTag;
	}

	public void setErrTag(int errTag) {
		this.errTag = errTag;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	/**
	 * @return the tags
	 */
	public String getTags() {
		return tags;
	}

	/**
	 * @param tags
	 *            the tags to set
	 */
	public void setTags(String tags) {
		this.tags = tags;
	}

	private String submit = null;

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
	 * @return the submit
	 */
	public String getSubmit() {
		return submit;
	}

	/**
	 * @param submit
	 *            the submit to set
	 */
	public void setSubmit(String submit) {
		this.submit = submit;
	}

	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message
	 *            the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
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
