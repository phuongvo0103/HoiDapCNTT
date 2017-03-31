package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.ThongTinCaNhanForm;
import model.bean.Account;
import model.bo.SearchLimitBO;
import model.bo.ThongTinCaNhanBO;

public class ThongTinCaNhanAction extends Action {
	private SearchLimitBO searchLimitBO = new SearchLimitBO();

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ThongTinCaNhanForm thongTinCaNhanForm = (ThongTinCaNhanForm) form;
		ThongTinCaNhanBO thongTinCaNhanBO = new ThongTinCaNhanBO();

		HttpSession session = request.getSession(true);
		Account account = (Account) session.getAttribute("Account");
		int accountID = 0;
		int type = thongTinCaNhanForm.getType();

		if (account == null) {
			accountID = thongTinCaNhanForm.getAccountID();

		} else {
			if (type == 1) {
				accountID = thongTinCaNhanForm.getAccountID();

			} else
				accountID = account.getAccountID();
		}
		account = thongTinCaNhanBO.getAccount(accountID);
		ArrayList<Object> listQuestion = searchLimitBO.getListPost(accountID);
		thongTinCaNhanForm.setListQuestion(listQuestion);
		return mapping.findForward("thongTinCaNhan");
	}

}
