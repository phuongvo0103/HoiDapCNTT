package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.TagDetailsForm;
import model.bean.Account;
import model.bo.History;
import model.bo.QuestionBO;
import model.bo.TagBO;

public class TagDetailsAction extends Action {
	private QuestionBO questionBO = new QuestionBO();
	private TagBO tagBO = new TagBO();

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		TagDetailsForm tagDetailsForm = (TagDetailsForm) form;
		HttpSession session = (HttpSession) request.getSession(true);
		Account account = (Account) session.getAttribute("Account");
		tagDetailsForm.setAccount(account);
		History history = (History) session.getAttribute("History");
		String urlBefore = request.getRequestURI();
		String txtSearch = "";
		int tagID = tagDetailsForm.getTagID();
		if (history != null) {
			history.setUrlBefore(urlBefore);
			txtSearch = history.getTxtSearch();
			if (!"".equals(txtSearch)) {
				tagDetailsForm.setListQuestionSam(questionBO.getListQuestionSam(txtSearch));
			}
		}
		tagDetailsForm.setTag(tagBO.getTag(tagID));
		tagDetailsForm.setListQuestionTop(questionBO.getListQuestionTop());
		tagDetailsForm.setListTagTop(tagBO.getTagTop());
		System.out.println("s:" + request.getRequestURI());
		return mapping.findForward("success");
	}
}
