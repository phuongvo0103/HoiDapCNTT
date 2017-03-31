package model.dao;

import java.util.ArrayList;

import model.bean.Answer;

public class AnswerDAO {
	BasicDAO basicDAO = new BasicDAO();

	public boolean insertAnswer(Answer answer) {// da co thu tuc cho thu
		// tuc
		return basicDAO.insertAnswer(answer);
	}

	public boolean deleteAnswer(int answerID) {
		return basicDAO.limitAnswer(answerID, -1);
	}

	public boolean lockAnswer(int answerID) {
		return basicDAO.limitAnswer(answerID, 1);
	}

	public ArrayList<Answer> getListAnswer(int questionID) {
		return basicDAO.getListAnswer(questionID);
	}

	public boolean voteAnswer(int answerID, int accountID, int voted) {
		return basicDAO.voteAnswer(answerID, accountID, voted);
	}
}
