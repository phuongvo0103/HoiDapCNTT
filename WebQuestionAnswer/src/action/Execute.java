package action;

import model.bean.Account;
import model.dao.BasicDAO;

public class Execute {
	public static void main(String[] args) {
		BasicDAO basicDAO = new BasicDAO();
		Account account = new Account();
		account.setUserName("diepdn124423235");
		account.setPass("123");
		account.setEmail("diep@gmail.com");
		basicDAO.insertAccount(account);
	}
}
