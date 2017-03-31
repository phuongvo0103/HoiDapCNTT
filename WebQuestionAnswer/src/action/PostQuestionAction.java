package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.DicProcess;
import common.StringUtils;
import form.PostQuestionForm;
import model.bean.Account;
import model.bean.Question;
import model.bean.Tag;
import model.bo.QuestionBO;

public class PostQuestionAction extends Action {
	QuestionBO questionBO = new QuestionBO();

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PostQuestionForm postQuestionForm = (PostQuestionForm) form;
		HttpSession session = request.getSession(true);
		Account account = (Account) session.getAttribute("Account");
		postQuestionForm.setAccount(account);
		System.out.println("loi--------");
		if (account != null) {
			System.out.println(postQuestionForm.getTags());
			if (null != postQuestionForm.getSubmit()) {
				Question question = new Question();
				String title = postQuestionForm.getTitle().trim();
				String body = postQuestionForm.getQuestionBody().trim();
				String tags = postQuestionForm.getTags().trim();

				question.setAccountID(account.getAccountID());
				question.setTitle(title);
				question.setQuestionBody(body);
				String[] taglist = tags.split(",");
				int countE = 0;
				ArrayList<Tag> listTag = new ArrayList<Tag>();
				for (int i = 0; i < taglist.length; i++)
					if (taglist[i] != null && !"".equals(tags)) {
						Tag t = new Tag();
						t.setTagName(taglist[i].trim());
						if (t.getTagName().length() < 25)
							listTag.add(t);
						else
							countE++;
					}

				if (listTag.size() <= 0) {
					// loi tag
					postQuestionForm.setErrTag(1);
					countE++;
				}
				System.out.println("check:" + DicProcess.checkString(title));
				if (!DicProcess.checkString(title) || !StringUtils.check(title)) {
					// loi tieu de
					postQuestionForm.setErrTitle(1);
					countE++;
				}
				if (!DicProcess.checkString(body) || !StringUtils.check(body)) {
					postQuestionForm.setErrBody(1);
					// loi body
					countE++;

				}
				if (countE > 0) {
					return mapping.findForward("failed");
				}
				question.setListTag(listTag);
				int check = questionBO.insertQuestion(question);
				System.out.println("check post:" + check);
				session.setAttribute("PostSuccess", 1);
				if (check >= 1)
					return mapping.findForward("success");
				else {
					postQuestionForm.setPostFail(1);// that bai
					return mapping.findForward("failed");
				}
			} else
				return mapping.findForward("failed");
		} else {
			System.out.println("loi--------1111111111");
			return mapping.findForward("login");
		}

	}
}
