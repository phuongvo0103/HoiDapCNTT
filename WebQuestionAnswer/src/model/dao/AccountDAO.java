package model.dao;

import java.util.ArrayList;

import model.bean.Account;

public class AccountDAO {

	BasicDAO basicDAO = new BasicDAO();
	private SearchDAO searchDAO = new SearchDAO();
	private int numPage;
	private int pageStart, pageEnd;
	private ArrayList<String> listPage;
	private int page;

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

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public ArrayList<Account> getListAccount(String txtSearch, int typeSearch, int type, int order, int page,
			int numRowOnPage) {
		ArrayList<Account> listAccount = searchDAO.searchAccount(txtSearch, typeSearch, type, order, page,
				numRowOnPage);
		this.page = searchDAO.getPage();
		this.numPage = searchDAO.getNumPage();
		this.listPage = searchDAO.getListPage();
		this.pageStart = searchDAO.getPageStart();
		this.pageEnd = searchDAO.getPageEnd();
		return listAccount;
	}

	public Account getAccountDetails(int accountID) {
		return basicDAO.getAccount(accountID);
	}

	public boolean deleteAccount(int accountID) {
		return basicDAO.lockAccount(accountID, -1);
	}

	public boolean lockAccount(int accountID, int stt) {
		return basicDAO.lockAccount(accountID, stt);
	}
}
