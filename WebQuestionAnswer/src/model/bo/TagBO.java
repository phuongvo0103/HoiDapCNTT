package model.bo;

import java.util.ArrayList;

import model.bean.Tag;
import model.dao.SearchLimitDAO;
import model.dao.TagDAO;

public class TagBO {
	private TagDAO tagDAO = new TagDAO();
	private SearchLimitDAO searchLimitDAO = new SearchLimitDAO();
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
		ArrayList<Tag> listTag = tagDAO.getListTag(txtSearch, type, order, page, numRowOnPage);
		this.listPage = tagDAO.getListPage();
		this.page = tagDAO.getPage();
		this.numPage = tagDAO.getNumPage();
		this.pageStart = tagDAO.getPageStart();
		this.pageEnd = tagDAO.getPageEnd();
		return listTag;
	}

	public Tag getTag(int tagID) {
		return tagDAO.getTag(tagID);
	}

	public boolean updateTag(Tag tag) {
		return tagDAO.updateTag(tag);
	}

	public boolean limitTag(int tagID, int stt) {
		return tagDAO.limitTag(tagID, stt);
	}

	public ArrayList<Object> getTagTop() {
		return searchLimitDAO.searchTag("", -1, 2, 1, 1, 5);
	}
}
