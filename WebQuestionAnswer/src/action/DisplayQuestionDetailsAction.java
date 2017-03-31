package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.DisplayQuestionDetailsForm;
import model.bean.Account;
import model.bean.Answer;
import model.bean.Question;
import model.bo.AnswerBO;
import model.bo.History;
import model.bo.QuestionBO;
import model.bo.TagBO;

public class DisplayQuestionDetailsAction extends Action {
	private QuestionBO questionBO = new QuestionBO();
	private AnswerBO answerBO = new AnswerBO();
	private TagBO tagBO = new TagBO();

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		DisplayQuestionDetailsForm questionDetailsForm = (DisplayQuestionDetailsForm) form;
		int questionID = questionDetailsForm.getQuestionID();
		HttpSession session = (HttpSession) request.getSession(true);
		Account account = (Account) session.getAttribute("Account");
		questionDetailsForm.setAccount(account);
		History history = (History) session.getAttribute("History");
		String urlBefore = request.getRequestURI();
		String txtSearch = "";
		questionDetailsForm.setVoteOK(0);
		if (history != null) {
			history.setUrlBefore(urlBefore);
			if ("".equals(txtSearch) && questionID > 0) {
				txtSearch = questionBO.getQuestionTitle(questionID);
				history.setTxtSearch(txtSearch);
			} else
				txtSearch = history.getTxtSearch();
			if (!"".equals(txtSearch)) {
				questionDetailsForm.setListQuestionSam(questionBO.getListQuestionSam(txtSearch));
			}
		} else {
			history = new History();
			if ("".equals(txtSearch) && questionID > 0) {
				txtSearch = questionBO.getQuestionTitle(questionID);
				history.setTxtSearch(txtSearch);
			}
			session.setAttribute("History", history);
			questionDetailsForm.setListQuestionSam(questionBO.getListQuestionSam(txtSearch));
		}
		questionDetailsForm.setListQuestionTop(questionBO.getListQuestionTop());
		questionDetailsForm.setListTagTop(tagBO.getTagTop());

		if (questionID > 0) {
			questionBO.viewQuestion(questionID);
			int vote = questionDetailsForm.getVote();
			int accountID = 0;
			int type = questionDetailsForm.getType();
			if (account != null)
				accountID = account.getAccountID();
			if (accountID > 0) {
				if (type == 0) {
					if (vote == 1 || vote == -1) {
						if (!questionBO.voteQuestion(questionID, accountID, vote))
							questionDetailsForm.setVoteOK(1);
					}
				} else if (type == 1) {
					int answerID = questionDetailsForm.getAnswerID();
					if (answerID > 0 && (vote == 1 || vote == -1)) {
						if (!answerBO.voteAnswer(answerID, accountID, vote))
							questionDetailsForm.setVoteOK(0);
					}
				} else if (type == 12321) {
					String submit = questionDetailsForm.getSubmit();
					if (submit != null && submit.indexOf("Tr") >= 0) {
						String answerBody = questionDetailsForm.getAnswerBody();
						System.out.println("aaa:" + answerBody);
						if (answerBody != null) {
							answerBody = answerBody.trim();
							Answer answer = new Answer();
							answer.setAccountID(accountID);
							answer.setAnswerBody(answerBody);
							answer.setQuestionID(questionID);
							answerBO.insertAnswer(answer);
						}
					}
				}
			}

			Question question = questionBO.getQuestionFull(questionID, accountID);
			questionDetailsForm.setQuestion(question);
		}
		System.out.println("s:" + request.getRequestURI());
		return mapping.findForward("success");
	}
}
