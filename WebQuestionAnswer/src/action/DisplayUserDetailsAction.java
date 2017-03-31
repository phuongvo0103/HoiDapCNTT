package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.AccountDetailsForm;
import model.bean.Account;
import model.bo.SearchLimitBO;
import model.bo.ThongTinCaNhanBO;

public class DisplayUserDetailsAction extends Action {
	private SearchLimitBO searchLimitBO = new SearchLimitBO();

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("sfsfsfs");
		AccountDetailsForm accountDetailsForm = (AccountDetailsForm) form;
		ThongTinCaNhanBO thongTinCaNhanBO = new ThongTinCaNhanBO();
		int accountID = accountDetailsForm.getAccountID();
		Account account = thongTinCaNhanBO.getAccount(accountID);
		System.out.println("accountID" + accountID);
		ArrayList<Object> listQuestion = searchLimitBO.getListPost(accountID);
		accountDetailsForm.setListQuestion(listQuestion);
		accountDetailsForm.setDisplayName(account.getDisplayName());
		accountDetailsForm.setEmail(account.getEmail());
		accountDetailsForm.setCareer(account.getCareer());
		accountDetailsForm.setAboutMe(account.getAboutMe());
		accountDetailsForm.setTotalAnswer(account.getTotalAnswer());
		accountDetailsForm.setTotalQuestion(account.getTotalQuestion());
		accountDetailsForm.setReputationPoint(account.getReputationPoint());
		accountDetailsForm.setTotalView(account.getTotalView());
		accountDetailsForm.setLocation(account.getLocation());
		accountDetailsForm.setLastSeen(account.getLastSeen());
		if (account.getImg() != null)
			accountDetailsForm.setImg(account.getImg());
		return mapping.findForward("accountInfo");
	}
}
