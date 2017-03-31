package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.ThongKeForm;

public class ThongKeAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ThongKeForm thongKeForm = (ThongKeForm) form;
		// Lấy ds tag, account, question
		// ArrayList<ThongKe> thongKe;
		return super.execute(mapping, form, request, response);
	}

}
