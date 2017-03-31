package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.VisitorForm;
import model.bean.Account;
import model.bo.History;
import model.bo.QuestionBO;
import model.bo.SearchLimitBO;
import model.bo.TagBO;

public class VisitorAction extends Action {
	private SearchLimitBO searchLimitBO = new SearchLimitBO();
	private TagBO tagBO = new TagBO();
	private QuestionBO questionBO = new QuestionBO();

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		VisitorForm visitorForm = (VisitorForm) form;
		// --------------------------------------------------------------
		HttpSession session = (HttpSession) request.getSession(true);
		Account account = (Account) session.getAttribute("Account");
		visitorForm.setAccount(account);
		History history = (History) session.getAttribute("History");
		String urlBefore = "";
		String txtSearch = visitorForm.getTxtSearch();
		String txtSearchHistory = txtSearch;
		int postOK = 0;
		if (session.getAttribute("PostSuccess") != null) {
			postOK = (int) session.getAttribute("PostSuccess");
			session.removeAttribute("PostSuccess");
		}
		visitorForm.setPostOK(postOK);
		if (history != null) {
			history.setUrlBefore(urlBefore);
			urlBefore = history.getUrlBefore();
			if (!"".equals(txtSearch))
				history.setTxtSearch(txtSearch);
			else
				txtSearchHistory = history.getTxtSearch();
			session.setAttribute("History", history);
		} else {
			history = new History();
			history.setTxtSearch(txtSearch);
			history.setUrlBefore(request.getRequestURI());
			session.setAttribute("History", history);
		}
		if (!"".equals(txtSearchHistory)) {
			visitorForm.setListQuestionSam(questionBO.getListQuestionSam(txtSearchHistory));
		}
		System.out.println("s:" + txtSearch);

		visitorForm.setListQuestionTop(questionBO.getListQuestionTop());
		visitorForm.setListTagTop(tagBO.getTagTop());
		// -----------------------------------------------------------
		int typePage = visitorForm.getTypePage();
		int type = visitorForm.getType();
		int order = visitorForm.getOrder();
		int page = visitorForm.getPage();
		int numRowOnPage = 10;

		int typeSearch = visitorForm.getTypeSearch();
		int c = visitorForm.getC();
		int o = visitorForm.getO();
		if (0 == o)
			page++;
		else if (1 == o)
			page--;
		visitorForm.setPage(page);
		visitorForm.setO(2);
		if (1 == c) {
			if (order == 1)
				order = 0;
			else
				order = 1;
			visitorForm.setOrder(order);
			visitorForm.setC(0);
		}
		ArrayList<Object> listObject = null;
		String txtSearchSub = visitorForm.getTxtSearchSub();
		if (typePage == 0)// trang tag
		{
			listObject = searchLimitBO.searchTag(txtSearchSub, -1, type, order, page, numRowOnPage);

		} else if (typePage == 1)// trang account
		{
			if (typeSearch < 0 || typeSearch > 2)
				typeSearch = 0;
			listObject = searchLimitBO.searchAccount(txtSearchSub, typeSearch, -1, type, order, page, numRowOnPage);
		} else if (typePage == 2)// trang question
		{
			if (typeSearch < 0 || typeSearch > 3)
				typeSearch = 0;
			if (txtSearch == null || "".equals(txtSearch) || (typeSearch >= 0 && typeSearch <= 2))
				listObject = searchLimitBO.searchQuestion(txtSearch, typeSearch, -1, -1, type, order, page,
						numRowOnPage);
			else
				listObject = searchLimitBO.searchQuestion(txtSearch, -1, page, numRowOnPage);
		} else
			listObject = new ArrayList<>();
		visitorForm.setListObject(listObject);
		visitorForm.setPage(searchLimitBO.getPage());
		visitorForm.setNumPage(searchLimitBO.getNumPage());
		visitorForm.setPageStart(searchLimitBO.getPageStart());
		visitorForm.setPageEnd(searchLimitBO.getPageEnd());
		visitorForm.setListPage(searchLimitBO.getListPage());
		return mapping.findForward("toVisitor");
	}
}
