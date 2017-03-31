package model.bo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

import model.bean.Account;
import model.bean.Message;
import model.bean.Question;
import model.bean.Tag;
import model.dao.BasicDAO;
import model.dao.MessageDAO;
import model.dao.SearchLimitDAO;

public class ServiceBO {
	BasicDAO basicDAO = new BasicDAO();
	SearchLimitDAO searchLimitDAO = new SearchLimitDAO();
	MessageDAO messageDAO = new MessageDAO();
	private int accountID;

	public int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}

	public String exe(String requestService) {
		String request = "/";
		try {
			request = URLDecoder.decode(requestService, "UTF-8");

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		JSONObject json = new JSONObject(request);
		if (json != null) {
			String method = json.getString("method");
			if (method != null && !"".equals(method)) {
				if ("getAccount".equals(method)) {
					int accountID = json.getInt("AccountID");
					if (accountID > 0) {
						Account account = basicDAO.getAccount(accountID);
						if (account != null) {
							JSONObject jsonR = new JSONObject(account);
							if (jsonR != null)
								try {
									return URLEncoder.encode(jsonR.toString(), "UTF-8");
								} catch (UnsupportedEncodingException e) {
									e.printStackTrace();
								}
						}
					}
				} else if ("getQuestion".equals(method)) {
					int questionID = json.getInt("QuestionID");
					int accountID = json.getInt("AccountID");
					int type = json.getInt("Type");

					if (questionID > 0 && type >= 0) {
						Question question = null;
						if (type == 0)
							question = basicDAO.getQuestion(questionID);
						else
							question = basicDAO.getFullQuestion(questionID, accountID);
						if (question != null) {
							JSONObject jsonR = new JSONObject(question);
							if (jsonR != null)
								try {
									return URLEncoder.encode(jsonR.toString(), "UTF-8");
								} catch (UnsupportedEncodingException e) {
									e.printStackTrace();
								}
						}
					}
				} else if ("getTag".equals(method)) {
					int tagID = json.getInt("TagID");
					if (tagID > 0) {
						Tag tag = basicDAO.getTag(tagID);
						if (tag != null) {
							JSONObject jsonR = new JSONObject(tag);
							if (jsonR != null)
								try {
									return URLEncoder.encode(jsonR.toString(), "UTF-8");
								} catch (UnsupportedEncodingException e) {
									e.printStackTrace();
								}
						}
					}

				} else if ("getMessage".equals(method)) {
					int rowStart = json.getInt("RowStart");
					int rowEnd = json.getInt("RowEnd");
					int accountReceiveID = json.getInt("AccountReceiveID");
					if (accountReceiveID > 0 && accountID > 0) {
						ArrayList<Message> listMessage = messageDAO.getMessage(accountID, accountReceiveID, rowStart,
								rowEnd);
						if (listMessage != null) {
							JSONArray jsonR = new JSONArray(listMessage);
							if (jsonR != null)
								try {
									return URLEncoder.encode(jsonR.toString(), "UTF-8");
								} catch (UnsupportedEncodingException e) {
									e.printStackTrace();
								}
						}
					}
				} else if ("searchQuestion".equals(method)) {
					String txtSearch = json.getString("TxtSearch");
					int page = json.getInt("Page");
					int numRowsOnPage = 10;
					if (txtSearch != null && !"".equals(txtSearch)) {
						// chi tim nhung cau hoi chua bi xoa va khoa
						ArrayList<Object> listQuestion = searchLimitDAO.searchQuestion(txtSearch, -1, page,
								numRowsOnPage);
						if (listQuestion != null) {
							JSONArray jsonR = new JSONArray(listQuestion);
							if (jsonR != null)
								try {
									return URLEncoder.encode(jsonR.toString(), "UTF-8");
								} catch (UnsupportedEncodingException e) {
									e.printStackTrace();
								}
						}
					}
				} else if ("searchAccount".equals(method)) {
					String txtSearch = json.getString("TxtSearch");
					int page = json.getInt("Page");
					int numRowsOnPage = 10;
					if (txtSearch != null && !"".equals(txtSearch)) {
						ArrayList<Object> listAccount = searchLimitDAO.searchAccount(txtSearch, 0, -1, 0, 0, page,
								numRowsOnPage);
						if (listAccount != null) {
							JSONArray jsonR = new JSONArray(listAccount);
							if (jsonR != null)
								try {
									return URLEncoder.encode(jsonR.toString(), "UTF-8");
								} catch (UnsupportedEncodingException e) {
									e.printStackTrace();
								}
						}
					}
				} else if ("searchTags".equals(method)) {
					String txtSearch = json.getString("TxtSearch");
					int order = json.getInt("Order");
					int page = json.getInt("Page");
					int numRowsOnPage = 10;
					if (txtSearch != null && !"".equals(txtSearch)) {
						ArrayList<Object> listTag = searchLimitDAO.searchTag(txtSearch, 0, -1, order, page,
								numRowsOnPage);
						if (listTag != null) {
							JSONArray jsonR = new JSONArray(listTag);
							if (jsonR != null)
								try {
									return URLEncoder.encode(jsonR.toString(), "UTF-8");
								} catch (UnsupportedEncodingException e) {
									e.printStackTrace();
								}
						}
					}
				} else if ("enterTag".equals(method)) {
					String txtSearch = json.getString("TagSearch");
					if (txtSearch != null && !"".equals(txtSearch)) {
						ArrayList<Tag> listTag = searchLimitDAO.searchTag(6, 1, txtSearch);
						if (listTag != null) {
							JSONArray jsonR = new JSONArray(listTag);
							if (jsonR != null)
								try {
									return URLEncoder.encode(jsonR.toString(), "UTF-8");
								} catch (UnsupportedEncodingException e) {
									e.printStackTrace();
								}
						}
					}
				} else if ("VoteQuestion".equals(method)) {
					int questionID = json.getInt("QuestionID");
					int voted = json.getInt("Voted");
					if (questionID > 0) {
						boolean e = basicDAO.voteQuestion(questionID, accountID, voted);
						if (e)
							return "SUCCESS";
						else
							return "FAIL";
					}
				} else if ("VoteAnswer".equals(method)) {
					int answerID = json.getInt("AnswerID");
					int voted = json.getInt("Voted");
					if (answerID > 0) {
						boolean e = basicDAO.voteAnswer(answerID, answerID, voted);
						if (e)
							return "SUCCESS";
						else
							return "FAIL";
					}
				}
			}
		}
		return "ERROR";

	}

}
