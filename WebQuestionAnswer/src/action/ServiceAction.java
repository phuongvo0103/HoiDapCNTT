package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.ServiceForm;
import model.bo.ServiceBO;

public class ServiceAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ServiceForm serviceForm = (ServiceForm) form;
		if (serviceForm.getRequestService() != null && !"".equals(serviceForm.getRequestService())) {
			if (response.getWriter() != null) {
				ServiceBO serviceBO = new ServiceBO();
				HttpSession session = request.getSession(true);
				try {
					int accountID = 0;
					if (session.getAttribute("AccountID") != null)
						accountID = (int) session.getAttribute("AccountID");
					serviceBO.setAccountID(accountID);
					response.getWriter().println(serviceBO.exe(serviceForm.getRequestService()));
				} catch (Exception e) {
					response.getWriter().println("ERROR_EXCEPTION");
				}
			}
		} else if (response.getWriter() != null)
			response.getWriter().println("ERROR_");
		return super.execute(mapping, form, request, response);
	}
}
