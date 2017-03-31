package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.AccountForm;
import model.bean.Account;
import model.bo.AccountBO;

public class QuanLyAccountAction extends Action {
	AccountBO accountBO = new AccountBO();

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		AccountForm accountForm = (AccountForm) form;
		String txtSearch = accountForm.getTxtSearch();
		System.out.println("chuỗi tìm kiếm:" + txtSearch);
		int c = accountForm.getC();
		int o = accountForm.getO();
		int type = accountForm.getType();
		int order = accountForm.getOrder();
		int page = accountForm.getPage();
		int numRowsOnPage = 5;
		int typeSearch = accountForm.getTypeSearch();
		if (0 == o)
			page++;
		else if (1 == o)
			page--;
		accountForm.setPage(page);
		accountForm.setO(2);
		if (c == 1) {
			if (order == 1)
				order = 0;
			else
				order = 1;
			accountForm.setOrder(order);
			accountForm.setC(0);
		}
		HttpSession session = request.getSession(true);
		Account account = (Account) session.getAttribute("Account");
		accountForm.setAccount(account);
		if (account != null)
			modifyAccount(accountForm);

		ArrayList<Account> listAccount = accountBO.getListAccount(txtSearch, typeSearch, type, order, page,
				numRowsOnPage);
		accountForm.setListAccount(listAccount);
		accountForm.setPage(accountBO.getPage());
		accountForm.setNumPage(accountBO.getNumPage());
		accountForm.setPageStart(accountBO.getPageStart());
		accountForm.setPageEnd(accountBO.getPageEnd());
		accountForm.setListPage(accountBO.getListPage());

		return mapping.findForward("dsAccount");
	}

	private boolean modifyAccount(AccountForm accountForm) {
		boolean e = false;
		if (accountForm != null) {
			int accountID = accountForm.getAccountID();
			String s = accountForm.getSubmit();
			int typeExe = accountForm.getTypeExe();
			if (typeExe < 0 && typeExe > 2)
				typeExe = 0;
			accountForm.setTypeExe(typeExe);
			if (accountID > 0) {
				int stt = accountForm.getStt();
				if (s != null && !"".equals(s)) {
					if (typeExe > 0) {
						int status = accountForm.getStatus();
						if (status == -1)
							stt = -1;
						else if (status == 0) {
							if (stt < 0)
								stt = 7;
							else if (stt > 60)
								stt = 60;
							if (stt != 7 && stt != 15 && stt != 30 && stt != 60)
								stt = 7;

						} else {
							stt = 1;
							status = 1;
						}

						e = accountBO.lockAccount(accountID, stt);
						if (e)
							accountForm.setType(0);
					}
				} else if (typeExe > 1) {
					if (typeExe == 2)
						stt = 0;
					else if (typeExe == 3)
						stt = -1;
					e = accountBO.lockAccount(accountID, stt);
					if (e)
						accountForm.setType(0);
				} else {
					Account account = accountBO.getAccountDetails(accountID);
					if (account != null) {
						accountForm.setAccountID(accountID);
						accountForm.setUserName(account.getUserName());
						accountForm.setDisplayName(account.getDisplayName());
						accountForm.setEmail(account.getEmail());
						accountForm.setStatus(getStatus(account.getStt()));
						accountForm.setStt(account.getStt());
						accountForm.equals(1);
						e = true;
					}
				}
			}
		}
		return e;
	}

	private int getStatus(int stt) {
		if (stt < 0)
			return -1;
		else if (stt == 1)
			return 1;
		else
			return 0;
	}
}
