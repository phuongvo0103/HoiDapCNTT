package model.bo;

import java.util.ArrayList;

import model.bean.Question;
import model.dao.BasicDAO;
import model.dao.QuestionDAO;
import model.dao.SearchLimitDAO;

public class QuestionBO {
	private QuestionDAO questionDAO = new QuestionDAO();
	private SearchLimitDAO searchLimitDAO = new SearchLimitDAO();
	private BasicDAO basicDAO = new BasicDAO();

	public boolean viewQuestion(int questionID) {
		return questionDAO.viewQuestion(questionID);
	}

	public Question getQuestion(int questionID) {
		return questionDAO.getQuestion(questionID);
	}

	public int insertQuestion(Question question) {// da co thu tuc cho thu
		return questionDAO.insertQuestion(question);
	}

	public Question getQuestionFull(int questionID, int accountID) {
		return questionDAO.getQuestionFull(questionID, accountID);
	}

	public boolean voteQuestion(int questionID, int accountID, int voted) {
		return questionDAO.voteQuestion(questionID, accountID, voted);
	}

	public ArrayList<Object> getListQuestionSam(String title) {
		return searchLimitDAO.searchQuestion(title, -1, 1, 5);
	}

	public ArrayList<Object> getListQuestionTop() {
		return searchLimitDAO.searchQuestion("", 0, -1, -1, 3, 1, 1, 5);
	}

	public String getQuestionTitle(int questionID) {
		return basicDAO.getQuestionTitle(questionID);
	}
}
