package form;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import model.bean.Account;
import model.bean.Question;

public class QuanLyBaiVietForm extends ActionForm {

	private int questionID = 0;
	private int accountID = 0;
	private int page = 0;
	private int type = 0, order = 0, typeSearch = 0;
	private String txtSearch = "";
	private ArrayList<String> listPage = new ArrayList<String>();
	private int pageStart = 0, pageEnd = 0, o = 2, c = 0;
	private int numPage = 0;
	private String title = "";
	private String questionBody = "";
	private String tags = "";
	private int isLock;
	private ArrayList<Question> listQuestion = new ArrayList<Question>();
	private int typeExe = 0;
	private String submit;
	private Account account = null;

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getSubmit() {
		return submit;
	}

	public void setSubmit(String submit) {
		this.submit = submit;
	}

	public int getTypeExe() {
		return typeExe;
	}

	public void setTypeExe(int typeExe) {
		this.typeExe = typeExe;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public int getTypeSearch() {
		return typeSearch;
	}

	public void setTypeSearch(int typeSearch) {
		this.typeSearch = typeSearch;
	}

	public int getO() {
		return o;
	}

	public void setO(int o) {
		this.o = o;
	}

	public int getC() {
		return c;
	}

	public void setC(int c) {
		this.c = c;
	}

	public int getIsLock() {
		return isLock;
	}

	public void setIsLock(int isLock) {
		this.isLock = isLock;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public String getTxtSearch() {
		return txtSearch;
	}

	public void setTxtSearch(String txtSearch) {
		this.txtSearch = txtSearch;
	}

	public int getPageStart() {
		return pageStart;
	}

	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getNumPage() {
		return numPage;
	}

	public void setNumPage(int numPage) {
		this.numPage = numPage;
	}

	public String getTitle() {
		return title;
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

	public int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
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
	 * @return the listQuestion
	 */
	public ArrayList<Question> getListQuestion() {
		return listQuestion;
	}

	/**
	 * @param listQuestion
	 *            the listQuestion to set
	 */
	public void setListQuestion(ArrayList<Question> listQuestion) {
		this.listQuestion = listQuestion;
	}

	/**
	 * @return the listPage
	 */
	public ArrayList<String> getListPage() {
		return listPage;
	}

	/**
	 * @param listPage
	 *            the listPage to set
	 */
	public void setListPage(ArrayList<String> listPage) {
		this.listPage = listPage;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.apache.struts.action.ActionForm#reset(org.apache.struts.action.
	 * ActionMapping, javax.servlet.http.HttpServletRequest)
	 */

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
