package model.bo;

import model.bean.Answer;
import model.dao.AnswerDAO;

public class AnswerBO {
	private AnswerDAO answerDAO = new AnswerDAO();

	public boolean voteAnswer(int answerID, int accountID, int voted) {
		return answerDAO.voteAnswer(answerID, accountID, voted);
	}

	public boolean insertAnswer(Answer answer) {
		return answerDAO.insertAnswer(answer);
	}
}
