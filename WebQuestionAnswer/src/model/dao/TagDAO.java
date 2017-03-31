package model.dao;

import java.util.ArrayList;

import model.bean.Tag;

public class TagDAO {

	private BasicDAO basicDAO = new BasicDAO();
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

	public ArrayList<Tag> getListTag(String txtSearch, int type, int order, int page, int numRowOnPage) {
		ArrayList<Tag> listTag = searchDAO.searchTag(txtSearch, type, order, page, numRowOnPage);
		this.listPage = searchDAO.getListPage();
		this.page = searchDAO.getPage();
		this.numPage = searchDAO.getNumPage();
		this.pageStart = searchDAO.getPageStart();
		this.pageEnd = searchDAO.getPageEnd();
		return listTag;
	}

	public boolean updateTag(Tag tag) {
		return basicDAO.updateTag(tag);
	}

	public Tag getTag(int tagID) {
		return basicDAO.getTag(tagID);
	}

	public boolean limitTag(int tagID, int stt) {
		return basicDAO.limitTag(tagID, stt);
	}

}
