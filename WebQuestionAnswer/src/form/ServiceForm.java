package form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class ServiceForm extends ActionForm {
	private String requestService;

	public String getRequestService() {
		return requestService;
	}

	public void setRequestService(String requestService) {
		this.requestService = requestService;
	}

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {

		return super.validate(mapping, request);
	}

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
