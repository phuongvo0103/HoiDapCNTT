package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.QuanLyBaiVietForm;
import model.bean.Account;
import model.bean.Question;
import model.bean.Tag;
import model.bo.QuanLyBaiVietBO;

public class QuanLyBaiVietAction extends Action {
	QuanLyBaiVietBO quanLyBaiVietBO = new QuanLyBaiVietBO();

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		QuanLyBaiVietForm quanLyBaiVietForm = (QuanLyBaiVietForm) form;
		HttpSession session = request.getSession(true);
		Account account = (Account) session.getAttribute("Account");
		quanLyBaiVietForm.setAccount(account);
		if (account != null)
			modifyQuestion(quanLyBaiVietForm);
		int type = quanLyBaiVietForm.getType();
		int order = quanLyBaiVietForm.getOrder();
		String txtSearch = quanLyBaiVietForm.getTxtSearch();
		int page = quanLyBaiVietForm.getPage();
		int typeSearch = quanLyBaiVietForm.getTypeSearch();
		int numRowsOnPage = 5;
		int c = quanLyBaiVietForm.getC();
		int o = quanLyBaiVietForm.getO();
		if (0 == o)
			page++;
		else if (1 == o)
			page--;
		quanLyBaiVietForm.setO(2);
		quanLyBaiVietForm.setPage(page);
		if (1 == c) {
			if (order == 1)
				order = 0;
			else
				order = 1;
			quanLyBaiVietForm.setOrder(order);
			quanLyBaiVietForm.setC(0);
		}
		ArrayList<Question> listQuestion = quanLyBaiVietBO.getListQuestion(txtSearch, typeSearch, type, order, page,
				numRowsOnPage);
		quanLyBaiVietForm.setListQuestion(listQuestion);
		quanLyBaiVietForm.setListPage(quanLyBaiVietBO.getListPage());
		quanLyBaiVietForm.setPage(quanLyBaiVietBO.getPage());
		quanLyBaiVietForm.setNumPage(quanLyBaiVietBO.getNumPage());
		quanLyBaiVietForm.setPageStart(quanLyBaiVietBO.getPageStart());
		quanLyBaiVietForm.setPageEnd(quanLyBaiVietBO.getPageEnd());
		return mapping.findForward("dsPost");
	}

	private boolean modifyQuestion(QuanLyBaiVietForm quanLyBaiVietForm) {
		boolean e = false;
		if (quanLyBaiVietForm != null) {
			int typeExe = quanLyBaiVietForm.getTypeExe();
			int questionID = quanLyBaiVietForm.getQuestionID();
			int isLock = quanLyBaiVietForm.getIsLock();
			if (questionID > 0) {
				String s = quanLyBaiVietForm.getSubmit();
				if (typeExe < 0 || typeExe > 3)
					typeExe = 0;
				if (isLock < -1 || isLock > 1)
					isLock = 0;
				if (s != null && !"".equals(s)) {

					if (typeExe == 3) {
						String title = quanLyBaiVietForm.getTitle();
						String questionBody = quanLyBaiVietForm.getQuestionBody();
						int accountID = quanLyBaiVietForm.getAccountID();
						if (title != null && questionBody != null && accountID > 0) {
							title = title.trim();
							questionBody = questionBody.trim();
							if (!"".equals(title) && !"".equals(questionBody)) {
								Question question = new Question();
								question.setQuestionID(questionID);
								question.setAccountID(accountID);
								question.setTitle(title);
								question.setQuestionBody(questionBody);
								question.setIsLock(isLock);
								System.out.println("islock:" + isLock);
								e = quanLyBaiVietBO.updateQuestion(question);
							}
						}
					}
				} else if (typeExe == 1 || typeExe == 2) {
					e = quanLyBaiVietBO.limitQuestion(questionID, isLock);
				} else if (typeExe == 3) {
					Question question = quanLyBaiVietBO.getQuestion(questionID);
					if (question != null) {
						quanLyBaiVietForm.setQuestionID(question.getQuestionID());
						quanLyBaiVietForm.setAccountID(question.getAccountID());
						quanLyBaiVietForm.setTitle(question.getTitle());
						quanLyBaiVietForm.setQuestionBody(question.getQuestionBody());
						String tags = "";
						isLock = question.getIsLock();
						int c = 0;
						ArrayList<Tag> listTag = quanLyBaiVietBO.getTags(question.getQuestionID());
						for (Tag tag : listTag) {
							if (c == 0) {
								tags += tag.getTagName();
								c++;
							} else
								tags += "," + tag.getTagName();
						}
						quanLyBaiVietForm.setTags(tags);
						e = true;
					}
				}
			}
			quanLyBaiVietForm.setIsLock(isLock);
			quanLyBaiVietForm.setTypeExe(0);
		}
		return e;
	}
}
