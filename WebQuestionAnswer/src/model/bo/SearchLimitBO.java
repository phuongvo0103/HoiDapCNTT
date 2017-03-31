package model.bo;

import java.util.ArrayList;

import model.dao.SearchLimitDAO;

public class SearchLimitBO {
	private SearchLimitDAO searchLimitDAO = new SearchLimitDAO();
	private ArrayList<String> listPage;
	private int page;
	private int numPage;
	private int pageStart, pageEnd;

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

	public int getPage() {
		return page;
	}

	private void setPage() {
		this.page = searchLimitDAO.getPage();
		this.numPage = searchLimitDAO.getNumPage();
		this.pageStart = searchLimitDAO.getPageStart();
		this.pageEnd = searchLimitDAO.getPageEnd();
		this.listPage = searchLimitDAO.getListPage();
	}

	public ArrayList<Object> getListPost(int accountID) {
		return searchLimitDAO.getListPost(accountID);
	}

	public ArrayList<Object> searchQuestion(String txtSearch, int limit, int page, int numRowOnPage) {
		ArrayList<Object> listQuestion = searchLimitDAO.searchQuestion(txtSearch, limit, page, numRowOnPage);
		setPage();
		return listQuestion;
	}

	public ArrayList<Object> searchQuestion(String txtSearch, int typeSearch, int limitQuestion, int limitTag, int type,
			int order, int page, int numRowOnPage) {
		ArrayList<Object> listQuestion = searchLimitDAO.searchQuestion(txtSearch, typeSearch, limitQuestion, limitTag,
				type, order, page, numRowOnPage);
		setPage();
		return listQuestion;
	}

	public ArrayList<Object> searchTag(String txtSearch, int limit, int type, int order, int page, int numRowOnPage) {
		ArrayList<Object> listTag = searchLimitDAO.searchTag(txtSearch, limit, type, order, page, numRowOnPage);
		setPage();
		return listTag;
	}

	public ArrayList<Object> searchAccount(String txtSearch, int typeSearch, int limit, int type, int order, int page,
			int numRowOnPage) {
		ArrayList<Object> listAccount = searchLimitDAO.searchAccount(txtSearch, typeSearch, limit, type, order, page,
				numRowOnPage);
		setPage();
		return listAccount;
	}
}
