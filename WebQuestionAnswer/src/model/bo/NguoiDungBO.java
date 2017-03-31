package model.bo;

import model.bean.Account;
import model.dao.NguoiDungDAO;

/**
 * NguoiDungBO.java
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

public class NguoiDungBO {
	NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();

	public Account checkLogin(String username, String Pass) {
		return nguoiDungDAO.checkLogin(username, Pass);
	}

}
