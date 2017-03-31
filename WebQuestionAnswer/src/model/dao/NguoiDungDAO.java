package model.dao;

import model.bean.Account;

/**
 * NguoiDungDAO.java
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

public class NguoiDungDAO {
	BasicDAO basicDAO = new BasicDAO();

	public Account checkLogin(String username, String pass) {
		return basicDAO.getAccount(username, pass);
	}

}
