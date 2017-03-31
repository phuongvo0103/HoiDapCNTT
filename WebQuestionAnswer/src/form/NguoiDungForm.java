package form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import common.StringProcess;
import model.bean.Account;

/**
 * NguoiDungForm
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

public class NguoiDungForm extends ActionForm {
	private String userName;
	private String pass;
	private String displayName;
	private String thongBao;
	private int accountID;
	private Account account = null;

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getThongBao() {
		return thongBao;
	}

	public void setThongBao(String thongBao) {
		this.thongBao = thongBao;
	}

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		ActionErrors actionErrors = new ActionErrors();
		if (StringProcess.notVaild(userName)) {

			actionErrors.add("tenDangNhapError", new ActionMessage("error.tenDangNhap"));
		}
		if (StringProcess.notVaild(pass)) {
			actionErrors.add("matKhauError", new ActionMessage("error.matKhau"));
		}
		return actionErrors;
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
