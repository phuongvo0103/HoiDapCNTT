package model.bo;

import java.util.ArrayList;

import model.bean.Account;
import model.dao.AccountDAO;

public class AccountBO {
	AccountDAO accountDAO = new AccountDAO();
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
		ArrayList<Account> listAccount = accountDAO.getListAccount(txtSearch, typeSearch, type, order, page,
				numRowOnPage);
		this.page = accountDAO.getPage();
		this.numPage = accountDAO.getNumPage();
		this.listPage = accountDAO.getListPage();
		this.pageStart = accountDAO.getPageStart();
		this.pageEnd = accountDAO.getPageEnd();
		return listAccount;
	}

	public boolean deleteAccount(int accountID) {
		return accountDAO.deleteAccount(accountID);
	}

	public boolean lockAccount(int accountID, int stt) {
		return accountDAO.lockAccount(accountID, stt);
	}

	public Account getAccountDetails(int accountID) {
		return accountDAO.getAccountDetails(accountID);
	}

}
