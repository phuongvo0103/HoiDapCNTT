package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Account;
import model.bean.Question;
import model.bean.Tag;

public class SearchDAO {
	BaseDAO baseDAO = new BaseDAO();
	private ArrayList<String> listPage;
	private int page;
	private int totalRow;
	private int fixPageShow = 3;
	BasicDAO basicDAO = new BasicDAO();
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

	public SearchDAO() {
		listPage = new ArrayList<>();
		page = 0;
		totalRow = 0;
	}

	public ArrayList<String> getListPage() {
		return listPage;
	}

	public int getPage() {
		return page;
	}

	public int getTotalRow() {
		return totalRow;
	}

	int rowStart = 0;
	int rowEnd = 0;

	private void setPage(int page, int numRowOnPage) {
		listPage.clear();
		rowStart = (page - 1) * numRowOnPage + 1;
		if (rowStart > totalRow)
			rowStart = totalRow - numRowOnPage + 1;
		if (rowStart <= 0)
			rowStart = 1;
		rowEnd = rowStart + numRowOnPage - 1;
		if (rowStart % numRowOnPage != 0)
			this.page = rowStart / numRowOnPage + 1;
		else
			this.page = rowStart / numRowOnPage;
		numPage = totalRow / numRowOnPage;
		if (totalRow % numRowOnPage != 0)
			numPage++;
		int i;
		pageStart = this.page - this.fixPageShow;
		pageEnd = this.page + this.fixPageShow;
		if (pageStart <= 0)
			pageStart = 1;
		if (pageEnd > numPage)
			pageEnd = numPage;
		for (i = pageStart; i <= pageEnd; i++)
			listPage.add(i + "");
	}

	public ArrayList<Question> searchQuestion(String txtSearch, int page, int numRowOnPage) {
		ArrayList<Question> listQuestion = new ArrayList<>();
		totalRow = 0;
		this.page = 0;
		listPage.clear();
		if (baseDAO.connect()) {
			// sp_countSearchPost
			String sql = "";
			if (txtSearch != null && !"".equals(txtSearch)) {
				sql = String.format("exec sp_countSearchPost N'%s'", txtSearch);
				ResultSet rs = baseDAO.sqlExeQUERY(sql);
				if (rs != null) {
					try {
						while (rs.next()) {
							totalRow = rs.getInt("totalRow");
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			setPage(page, numRowOnPage);
			if (totalRow > 0) {
				sql = String.format("exec searchPost N'%s',%s,%s", txtSearch, rowStart, rowEnd);
				ResultSet rs = baseDAO.sqlExeQUERY(sql);
				if (rs != null) {
					try {
						while (rs.next()) {
							Question q = basicDAO.getQuestion(rs);
							if (q != null) {
								listQuestion.add(q);
								if (q.getQuestionBody() != null) {
									int len = q.getQuestionBody().length();
									if (len > 100)
										len = 100;
									q.setQuestionBody(q.getQuestionBody().substring(0, len) + "...");
								}
							}
						}
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}

				}
			}
			baseDAO.disConnect();
		}
		return listQuestion;
	}

	public ArrayList<Tag> searchTag(int top, String tagName) {
		ArrayList<Tag> tagList = new ArrayList<>();
		if (baseDAO.connect()) {
			String sql = "select * from tblTag where TagName=N'" + tagName + "'";
			// System.out.println("-->" + sql);
			ResultSet rs = baseDAO.sqlExeQUERY(sql);
			Tag tg = null;
			int c = 0;
			if (rs != null) {
				try {
					while (rs.next()) {
						tg = basicDAO.getTag_(rs);
						if (tg != null)
							tagList.add(tg);
						c++;
					}
					rs.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			sql = "select top " + top + " *  from tblTag where TagName like N'%" + tagName
					+ "%' order by TagPoint desc";
			rs = baseDAO.sqlExeQUERY(sql);
			if (rs != null) {
				try {
					while (rs.next()) {
						Tag tag = basicDAO.getTag_(rs);
						if (tag != null) {
							if (c != 0) {
								if (tg.getTagID() != tag.getTagID())
									tagList.add(tag);
							} else
								tagList.add(tag);
						}
					}
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			baseDAO.disConnect();
		}
		return tagList;
	}

	// typeSearch=0 tim kiem theo tieu de,=1 tim kiem theo noi dung,=2 tim kiem
	// theo tag
	// theo tag
	public ArrayList<Question> searchQuestion(String txtSearch, int typeSearch, int type, int order, int page,
			int numRowOnPage) {
		ArrayList<Question> list = new ArrayList<>();
		totalRow = 0;
		listPage.clear();
		if (baseDAO.connect()) {
			String sql = "select count(QuestionID) as 'totalRow' from tblQuestion";
			if (txtSearch != null && !"".equals(txtSearch)) {
				if (typeSearch == 0)// tim theo tieu de
					sql = String.format("exec sp_countSearchQuestionTitle N'%s'", txtSearch);
				else if (typeSearch == 1)// tim theo noi dung
					sql = String.format("exec sp_countsearchQuestionBody N'%s'", txtSearch);
				else if (typeSearch == 2)// tim theo tag
					sql = String.format("exec sp_countSearchTag %s", txtSearch);
			}
			System.out.println("sql:" + sql);
			ResultSet rs = baseDAO.sqlExeQUERY(sql);
			if (rs != null) {
				try {
					while (rs.next()) {
						totalRow = rs.getInt("totalRow");
					}
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}
			if (totalRow > 0) {
				setPage(page, numRowOnPage);
				String sorts = null;
				if (type == 0)
					sorts = " CreationDate";
				else if (type == 1)
					sorts = " TotalVote";
				else if (type == 2)
					sorts = " TotalAnswer";
				else if (type == 3)
					sorts = " TotalView";
				if (order == 0)
					sorts += " asc";
				else
					sorts += " desc";
				if (txtSearch == null || "".equals(txtSearch) || typeSearch < 0 || typeSearch > 2)
					sql = "select * from (select *,ROW_NUMBER() OVER (Order by " + sorts
							+ ") AS RowNumber from tblQuestion) as tblOut where tblOut.RowNumber between " + rowStart
							+ " and " + rowEnd;
				else {
					if (typeSearch == 0)// tim theo tieu de
						sql = String.format("exec sp_searchQuestionTitle N'%s',%s,%s,%s,%s", txtSearch, type, order,
								rowStart, rowEnd);
					else if (typeSearch == 1)// tim theo noi dung
						sql = String.format("exec sp_searchQuestionBody N'%s',%s,%s,%s,%s", txtSearch, type, order,
								rowStart, rowEnd);
					else if (typeSearch == 2)// tim theo tag
						sql = "select * from (select *,ROW_NUMBER() over(order by " + sorts
								+ ") as RowNumber from func_searchTagNameQuestion(" + txtSearch
								+ ") as tblOut inner join tblQuestion on tblOut.ID=tblQuestion.QuestionID) as tblOut1 where tblOut1.RowNumber  between "
								+ rowStart + " and " + rowEnd;
				}
				rs = baseDAO.sqlExeQUERY(sql);
				if (rs != null) {
					try {
						while (rs.next()) {
							Question q = basicDAO.getQuestion(rs);
							if (q != null) {
								list.add(q);
								if (q.getQuestionBody() != null) {
									int len = q.getQuestionBody().length();
									if (len > 100)
										len = 100;
									q.setQuestionBody(q.getQuestionBody().substring(0, len) + "...");
								}
							}
						}
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			for (Question question : list) {
				question.setListTag(basicDAO.getListTag(question.getQuestionID()));
			}
			baseDAO.disConnect();
		}
		return list;
	}

	public ArrayList<Tag> searchTag(String txtSearch, int type, int order, int page, int numRowOnPage) {
		ArrayList<Tag> list = new ArrayList<>();
		totalRow = 0;
		this.page = 0;
		listPage.clear();
		if (baseDAO.connect()) {
			String sql = "select count(TagID) as 'totalRow' from tblTag";
			if (txtSearch != null && !"".equals(txtSearch))
				sql += " where TagName like N'%" + txtSearch + "%'";

			ResultSet rs = baseDAO.sqlExeQUERY(sql);
			if (rs != null) {
				try {
					while (rs.next()) {
						totalRow = rs.getInt("totalRow");
					}
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			if (totalRow > 0) {
				setPage(page, numRowOnPage);
				String sorts = null;
				if (type < 0)
					type = 0;
				else if (type > 3)
					type = 3;
				if (type == 0)
					sorts = " TagName";
				else if (type == 1)
					sorts = " CreationDate";
				else if (type == 2)
					sorts = " TagPoint";
				else if (type == 3)
					sorts = " totalUse";
				if (order == 0)
					sorts += " asc";
				else
					sorts += " desc";
				if (txtSearch != null && !"".equals(txtSearch))

					sql = "select * from (select *,ROW_NUMBER() OVER (Order by " + sorts
							+ ") AS RowNumber from tblTag where TagName like N'%" + txtSearch
							+ "%')  as tblOut1 where tblOut1.RowNumber between " + rowStart + " and " + rowEnd;
				else
					sql = "select * from (select * ,ROW_NUMBER() OVER (Order by " + sorts
							+ ") AS RowNumber from tblTag) as  tblOut1 where tblOut1.RowNumber between " + rowStart
							+ " and " + rowEnd;
				System.out.println("sql->" + sql);
				rs = baseDAO.sqlExeQUERY(sql);
				if (rs != null) {
					try {
						while (rs.next()) {
							Tag tag = basicDAO.getTag_(rs);
							if (tag != null) {
								list.add(tag);
								if (tag.getDescriptionDetails() != null) {
									int len = tag.getDescriptionDetails().length();
									if (len > 100)
										len = 100;
									tag.setDescriptionDetails(tag.getDescriptionDetails().substring(0, len) + "...");
								}
							}
						}
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}

			}
			baseDAO.disConnect();
		}
		return list;
	}

	public ArrayList<Account> searchAccount(String txtSearch, int typeSearch, int type, int order, int page,
			int numRowOnPage) {
		ArrayList<Account> list = new ArrayList<>();
		totalRow = 0;
		this.page = 0;
		listPage.clear();
		if (baseDAO.connect()) {
			String sql = "select count(AccountID) as 'totalRow' from tblAccount";
			String ss = "";
			if (typeSearch < 0)
				typeSearch = 0;
			else if (typeSearch > 2)
				typeSearch = 2;
			if (txtSearch != null && !"".equals(txtSearch)) {
				if (typeSearch == 0)// tim theo ten dang nhap
					ss = " where UserName like N'%" + txtSearch + "%'";
				else if (typeSearch == 1)
					ss = " where DisplayName like N'%" + txtSearch + "%'";
				else if (typeSearch == 2)
					ss = " where Email like N'%" + txtSearch + "%'";
				sql += ss;
			}
			ResultSet rs = baseDAO.sqlExeQUERY(sql);
			if (rs != null) {
				try {
					while (rs.next()) {
						totalRow = rs.getInt("totalRow");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (totalRow > 0) {
				setPage(page, numRowOnPage);
				String sorts = "";
				if (type == 0)
					sorts = " UserName";
				else if (type == 1)
					sorts = " DisplayName";
				else if (type == 2)
					sorts = " Email";
				else if (type == 3)
					sorts = " TotalAnswer";
				else if (type == 4)
					sorts = " TotalQuestion";
				else if (type == 5)
					sorts = " ReputationPoint";
				else if (type == 6)
					sorts = " LastSeen";
				else if (type == 7)
					sorts = " StartDate";

				if (order == 0)
					sorts += " asc";
				else
					sorts += " desc";
				sql = "select * from (select *,ROW_NUMBER() OVER (Order by " + sorts + ") AS RowNumber from tblAccount "
						+ ss + " ) as tblOut where tblOut.RowNumber between " + rowStart + " and " + rowEnd;
				rs = baseDAO.sqlExeQUERY(sql);
				if (rs != null) {
					try {
						while (rs.next()) {
							Account acc = basicDAO.getAccount(rs);
							if (acc != null) {
								list.add(acc);
							}
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			baseDAO.disConnect();
		}
		return list;
	}
}
