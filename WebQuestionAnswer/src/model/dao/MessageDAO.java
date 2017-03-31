package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Message;

public class MessageDAO {
	BaseDAO baseDAO = new BaseDAO();
	BasicDAO basicDAO = new BasicDAO();

	public ArrayList<Message> getMessage(int accountSendID, int accountReceiveID, int rowStart, int rowEnd) {
		ArrayList<Message> list = new ArrayList<>();
		String sql = String.format("exec getMessage %s,%s,%s,%s", accountSendID, accountReceiveID, rowStart, rowEnd);
		if (baseDAO.connect()) {
			ResultSet rs = baseDAO.sqlExeQUERY(sql);
			if (rs != null) {
				try {
					while (rs.next()) {
						Message msg = basicDAO.getMessage(rs);
						if (msg != null)
							list.add(msg);
					}
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			baseDAO.disConnect();
		}
		return list;
	}

	public boolean insertMessage(Message msg) {
		boolean e = false;
		if (msg != null)
			e = basicDAO.insertMessage(msg);
		return e;
	}
}
