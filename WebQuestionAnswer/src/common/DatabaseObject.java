package common;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class DatabaseObject {
	private ArrayList<String> list;

	public ArrayList<String> getList() {
		return list;
	}

	public void setList(ArrayList<String> list) {
		this.list = list;
	}

	public DatabaseObject() {
		list = new ArrayList<>();
	}

	public String get(int index) {
		return list.get(index);
	}

	public void add(String v) {
		list.add(v);
	}

	public void remove(String v) {
		list.remove(v);

	}

	public boolean set(ResultSet rs) {
		list.clear();
		if (rs != null) {

			try {
				ResultSetMetaData metadata = rs.getMetaData();
				int columnCount = metadata.getColumnCount();

				int i = 0;
				while (rs.next()) {
					for (i = 1; i <= columnCount; i++) {
						String v = rs.getString(i);
						list.add(v);
					}
				}
				return true;

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean set(ResultSet rs, String dateFormat) {
		list.clear();
		if (rs != null) {

			try {
				ResultSetMetaData metadata = rs.getMetaData();
				int columnCount = metadata.getColumnCount();
				String v;
				int i = 0;
				while (rs.next()) {
					for (i = 1; i <= columnCount; i++) {
						if (metadata.getColumnTypeName(i).toLowerCase().indexOf("date") == 0) {
							java.sql.Date d = (java.sql.Date) rs.getDate(i);
							Date date = new Date(d.getYear(), d.getMonth(), d.getDate());
							v = DateObject.convertDateToString(date, dateFormat);
						} else
							v = rs.getString(i);
						list.add(v);
					}
				}
				return true;

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
}
