package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.NguoiDungForm;
import model.bean.Account;
import model.bo.NguoiDungBO;

/**
 * NguoiDungAction.java
 *
 * Version 1.0
 *
 * Date: Jan 21, 2015
 *
 * Copyright
 *
 * Modification Logs: DATE AUTHOR DESCRIPTION
 * ----------------------------------------------------------------------- Jan
 * 21, 2015 DaiLV2 Create
 */

public class NguoiDungAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		NguoiDungForm nguoiDungForm = (NguoiDungForm) form;
		NguoiDungBO nguoiDungBO = new NguoiDungBO();
		String userName = nguoiDungForm.getUserName();
		String pass = nguoiDungForm.getPass();
		Account account = nguoiDungBO.checkLogin(userName, pass);
		if (account != null) {
			HttpSession session = request.getSession(true);
			session.setAttribute("Account", account);
			return mapping.findForward("thanhCong");
		} else { // neu khong chinh xac
			nguoiDungForm.setThongBao("Đăng nhập không thành công");
			return mapping.findForward("thatBai");
		}
	}
}
