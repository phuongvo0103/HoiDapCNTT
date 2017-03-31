package model.dao;

import model.bean.Question;

public class QuestionDAO {
	BasicDAO basicDAO = new BasicDAO();
	BaseDAO baseDAO = new BaseDAO();

	public int insertQuestion(Question question) {// da co thu tuc cho thu
		// tuc
		return basicDAO.insertQuestion(question);
	}

	public boolean deleteQuestion(int questionID) {
		return basicDAO.limitQuestion(questionID, -1);
	}

	public boolean lockQuestion(int questionID) {
		return basicDAO.limitQuestion(questionID, 1);
	}

	public Question getQuestionFull(int questionID, int accountID) {
		return basicDAO.getFullQuestion(questionID, accountID);
	}

	public Question getQuestion(int questionID) {
		return basicDAO.getQuestion(questionID);
	}

	public boolean voteQuestion(int questionID, int accountID, int voted) {
		return basicDAO.voteQuestion(questionID, accountID, voted);
	}

	public boolean viewQuestion(int questionID) {
		boolean e = false;
		if (baseDAO.connect()) {
			String sql = "update tblQuestion set TotalView=TotalView+1 where QuestionID=" + questionID;
			e = baseDAO.sqlExeUPDATE(sql);
			baseDAO.disConnect();
		}
		return e;
	}

}
