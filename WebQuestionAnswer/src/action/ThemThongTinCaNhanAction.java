package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.ThongTinCaNhanForm;
import model.bean.Account;
import model.bo.ThongTinCaNhanBO;

public class ThemThongTinCaNhanAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ThongTinCaNhanForm thongTinCaNhanForm = (ThongTinCaNhanForm) form;
		HttpSession session = request.getSession(true);
		Account account = (Account) session.getAttribute("Account");
		thongTinCaNhanForm.setAccount(account);
		if (account != null) {
			if ("submit".equals(thongTinCaNhanForm.getSubmit())) { // nhan nut
																	// Xac
																	// nhan o
				// trang Them account
				String userName = thongTinCaNhanForm.getUserName();

				String pass = thongTinCaNhanForm.getPass();
				String email = thongTinCaNhanForm.getEmail();

				ThongTinCaNhanBO thongTinCaNhanBO = new ThongTinCaNhanBO();
				thongTinCaNhanBO.themThongTinCaNhan(userName, pass, email);
				return mapping.findForward("themTTCNXong");
			} else {
				return mapping.findForward("themTTCN");
			}
		} else
			return mapping.findForward("themTTCN");
	}

}
