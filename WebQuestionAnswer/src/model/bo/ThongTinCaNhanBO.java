package model.bo;

import java.sql.Date;

import model.bean.Account;
import model.dao.ThongTinCaNhanDAO;

public class ThongTinCaNhanBO {
	ThongTinCaNhanDAO thongTinCaNhanDAO = new ThongTinCaNhanDAO();

	public Account getAccount(int accountID) {
		return thongTinCaNhanDAO.getAccount(accountID);
	}

	public boolean suaThongTinCaNhan(String img, String displayName, String email, Date birthDate, String location,
			String aboutMe, String career, String companyName, int accountID) {
		return thongTinCaNhanDAO.suaThongTinCaNhan(img, displayName, email, birthDate, location, aboutMe, career,
				companyName, accountID);
	}

	public void themThongTinCaNhan(String UserName, String Pass, String Email) {
		thongTinCaNhanDAO.themThongTinCaNhan(UserName, Pass, Email);
	}
}
