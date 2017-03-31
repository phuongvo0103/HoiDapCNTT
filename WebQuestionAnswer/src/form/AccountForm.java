package form;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import model.bean.Account;

public class AccountForm extends ActionForm {
	private int accountID = 0;
	private String userName;
	private String email;
	private String displayName;
	private int stt = 0;
	private String submit = null;
	private int typeSearch = 0;
	private String txtSearch = "";
	private ArrayList<Account> listAccount;
	private int page, numPage, pageStart, pageEnd;
	private ArrayList<String> listPage;
	private int type = 0, order = 0, typeExe = 0;
	private int c = 0, o = 2;
	private int status = 0;
	private Account account = null;

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getTypeExe() {
		return typeExe;
	}

	public void setTypeExe(int typeExe) {
		this.typeExe = typeExe;
	}

	public int getStt() {
		return stt;
	}

	public void setStt(int stt) {
		this.stt = stt;
	}

	public String getSubmit() {
		return submit;
	}

	public void setSubmit(String submit) {
		this.submit = submit;
	}

	public int getTypeSearch() {
		return typeSearch;
	}

	public void setTypeSearch(int typeSearch) {
		this.typeSearch = typeSearch;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getNumPage() {
		return numPage;
	}

	public void setNumPage(int numPage) {
		this.numPage = numPage;
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

	public ArrayList<String> getListPage() {
		return listPage;
	}

	public void setListPage(ArrayList<String> listPage) {
		this.listPage = listPage;
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

	public int getC() {
		return c;
	}

	public void setC(int c) {
		this.c = c;
	}

	public int getO() {
		return o;
	}

	public void setO(int o) {
		this.o = o;
	}

	public String getTxtSearch() {
		return txtSearch;
	}

	public void setTxtSearch(String txtSearch) {
		this.txtSearch = txtSearch;
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
	 * @return the listAccount
	 */
	public ArrayList<Account> getListAccount() {
		return listAccount;
	}

	/**
	 * @param listAccount
	 *            the listAccount to set
	 */
	public void setListAccount(ArrayList<Account> listAccount) {
		this.listAccount = listAccount;
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
