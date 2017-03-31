package model.dao;

import java.sql.Date;

import model.bean.Account;

public class ThongTinCaNhanDAO {
	BaseDAO bd = new BaseDAO();
	BasicDAO basicDAO = new BasicDAO();

	public Account getAccount(int accountID) {
		return basicDAO.getAccount(accountID);
	}

	// public boolean updateAccount(Account account) {
	// return basicDAO.updateAccount(account);
	// }

	public boolean suaThongTinCaNhan(String img, String displayName, String email, Date birthDate, String location,
			String aboutMe, String career, String companyName, int accountID) {
		Account account = new Account();
		account.setImg(img);
		account.setDisplayName(displayName);
		account.setEmail(email);
		account.setBirthDate(birthDate);
		account.setLocation(location);
		account.setAboutMe(aboutMe);
		account.setCareer(career);
		account.setCompanyName(companyName);
		account.setAccountID(accountID);
		return basicDAO.updateAccount(account);
	}

	// Them thong tin ca nhan
	public void themThongTinCaNhan(String UserName, String Pass, String Email) {
		if (bd.connect()) {
			String sql = String.format("insert into [dbo].[tblAccount](UserName,Pass,Email) values('%s','%s','%s')",
					UserName, Pass, Email);
			bd.sqlExeUPDATE(sql);
		}
		bd.disConnect();
	}

}
