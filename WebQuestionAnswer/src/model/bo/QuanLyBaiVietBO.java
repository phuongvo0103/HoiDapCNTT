package model.bo;

import java.util.ArrayList;

import model.bean.Question;
import model.bean.Tag;
import model.dao.BasicDAO;
import model.dao.SearchDAO;

public class QuanLyBaiVietBO {
	SearchDAO searchDAO = new SearchDAO();
	BasicDAO basicDAO = new BasicDAO();
	private int page;
	private ArrayList<String> listPage;
	private int pageStart, pageEnd;
	private int numPage;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public ArrayList<String> getListPage() {
		return listPage;
	}

	public void setListPage(ArrayList<String> listPage) {
		this.listPage = listPage;
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

	public ArrayList<Question> getListQuestion(String txtSearch, int typeSearch, int type, int order, int page,
			int numRowOnPage) {
		if (type > 4)// search
		{
			ArrayList<Question> listQuestion = searchDAO.searchQuestion(txtSearch, page, numRowOnPage);
			this.page = searchDAO.getPage();
			this.numPage = searchDAO.getNumPage();
			this.listPage = searchDAO.getListPage();
			this.pageStart = searchDAO.getPageStart();
			this.pageEnd = searchDAO.getPageEnd();
			return listQuestion;
		} else// get list tu thong ke
		{
			if (typeSearch == 2) {
				String[] tags = txtSearch.split(",");
				int c = tags.length, i;
				txtSearch = "";
				for (i = 0; i < c; i++) {
					if (i == 0)
						txtSearch += "N'" + tags[i].trim() + "'";
					else
						txtSearch += ",N'" + tags[i].trim() + "'";
				}
				for (i = c; i < 5; i++) {
					if (i == 0)
						txtSearch += "N''";
					else
						txtSearch += ",N''";
				}
			}
			ArrayList<Question> listQuestion = searchDAO.searchQuestion(txtSearch, typeSearch, type, order, page,
					numRowOnPage);
			this.page = searchDAO.getPage();
			this.numPage = searchDAO.getNumPage();
			this.listPage = searchDAO.getListPage();
			this.pageStart = searchDAO.getPageStart();
			this.pageEnd = searchDAO.getPageEnd();
			return listQuestion;
		}
	}

	public Question getQuestion(int questionID) {
		return basicDAO.getFullQuestionSmall(questionID);
	}

	public boolean updateQuestion(Question question) {
		return basicDAO.updateQuestion(question);
	}

	public boolean limitQuestion(int questionID, int isLock) {
		return basicDAO.limitQuestion(questionID, isLock);
	}

	public ArrayList<Tag> getTags(int questionID) {
		return basicDAO.getListTag(questionID);
	}
}
