package common;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * 
 * @author Đinh Ngọc Điệp
 * @see Lớp này chịu trách nhiệm đọc ghi đối tượng với cơ sở dữ liệu. Ban đầu
 *      phải vào file Database.java để cấu hình chuỗi kết nối cho hợp lý Sau khi
 *      cấu hình thì ta có thể sử dụng các phương thức trong ManagementObject để
 *      dùng cho tiện, mỗi phương thức sẽ được chú thích cách sử dụng
 */
public class ManagementObject {
	private Database db;
	private int totalRows;
	private int rowsOnPage = 10;

	public int getTotalRows() {
		return totalRows;
	}

	public boolean exeUpdate(String sql) {
		if (db.Connect()) {
			boolean e = db.SQLExeUPDATE(sql);
			db.DisConnect();
			return e;
		}
		return false;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public ManagementObject() {
		totalRows = 0;
		db = new Database();
	}

	/**
	 * 
	 * @param object
	 *            :đối tượng cần insert vào cơ sở dữ liệu
	 * @param sAutoIncreament:tên
	 *            trường tăng tự động (trong trường hợp không có trường tăng tự
	 *            động trong cơ sở dữ liệu thì để sAutoIncreament="" hoặc
	 *            sAutoIncreament=null, trường hợp có trường tăng tự động thì
	 *            sAutoIncreament="tên_trường")
	 * @return
	 */
	public boolean insert(Object object, String sAutoIncreament) {
		if (object != null && db.Connect()) {
			boolean e = db.SQLExeUPDATE(DatabaseToObject.getSQLInsertFromObject(object, sAutoIncreament));
			db.DisConnect();
			return e;
		}
		return false;
	}

	/**
	 * Phương thức này tương tự phương thức insert ở trên nhưng khác là phương
	 * thức này sẽ insert một danh sách đối tượng
	 * 
	 * @param list:danh
	 *            sách chứa các đối tượng cần insert
	 * @param sAutoIncreament:tên
	 *            trường tăng tự động (trong trường hợp không có trường tăng tự
	 *            động trong cơ sở dữ liệu thì để sAutoIncreament="" hoặc
	 *            sAutoIncreament=null, trường hợp có trường tăng tự động thì
	 *            sAutoIncreament="tên_trường")
	 * @return :true nếu insert thành công, false thì có thể do list=null hoặc
	 *         kết nối cơ sở dữ liệu không thành công
	 */
	public boolean insert(ArrayList<Object> list, String sAutoIncreament) {
		if (list != null && db.Connect()) {
			for (Object object : list) {
				db.SQLExeUPDATE(DatabaseToObject.getSQLInsertFromObject(object, sAutoIncreament));
			}
			db.DisConnect();
			return true;
		}
		return false;
	}

	/**
	 * phương thức cập nhật đối tượng vào trong cơ sở dữ liệu theo khóa chính
	 * 
	 * @param object
	 *            :đối tượng cần cập nhật
	 * @param keys:mảng
	 *            tên trường là khóa chính của đối tượng
	 *            (keys={"k1","k2",...,"kn"};
	 * @return :true nếu update thành công,false nếu update thất bại
	 */
	public boolean update(Object object, String[] keys) {
		if (object != null && db.Connect()) {
			boolean e = db.SQLExeUPDATE(DatabaseToObject.getSQLUpdateFromObject(object, keys));
			db.DisConnect();
			return e;
		}
		return false;
	}

	/**
	 * phương thức cập nhật danh sách đối tượng vào trong cơ sở dữ liệu theo
	 * khóa chính
	 * 
	 * @param list
	 *            :danh sách đối tượng cần cập nhật
	 * @param keys:mảng
	 *            tên trường là khóa chính của đối tượng
	 *            (keys={"k1","k2",...,"kn"};
	 * @return :true nếu update thành công,false nếu update thất bại
	 */
	public boolean update(ArrayList<Object> list, String[] keys) {
		if (list != null && db.Connect()) {
			for (Object object : list) {
				db.SQLExeUPDATE(DatabaseToObject.getSQLUpdateFromObject(object, keys));

			}
			db.DisConnect();
			return true;
		}
		return false;
	}

	/**
	 * phương thức lấy danh sách các đối tượng từ CSDL
	 * 
	 * @param sql:
	 *            chuỗi truy vấn select lấy từ 1 bảng dữ liệu
	 * @param objTemplate:đối
	 *            tượng mẫu để phương thức sẽ lấy dữ liệu theo đối tượng mẫu
	 *            (hiểu đơn giản nếu muốn lấy từ bảng sinhvien thì đối phải tạo
	 *            1 đối tượng mẫu từ lớp sinhvien)
	 * @return :danh sách các đối tượng lấy từ chuỗi truy vấn select
	 */
	public ArrayList<Object> getData(String sql, Object objTemplate) {
		ArrayList<Object> list = new ArrayList<>();
		if (objTemplate != null && db.Connect()) {
			ResultSet rs = db.SQLExeQUERY(sql);
			if (rs != null) {
				try {
					while (rs.next()) {
						list.add(DatabaseToObject.getObject(objTemplate, rs));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			db.DisConnect();
		}
		return list;
	}

	/**
	 * phương thức lấy danh sách các đối tượng từ CSDL
	 * 
	 * @param sql:
	 *            chuỗi truy vấn select lấy từ 1 bảng dữ liệu
	 * @param objTemplate:đối
	 *            tượng mẫu để phương thức sẽ lấy dữ liệu theo đối tượng mẫu
	 *            (hiểu đơn giản nếu muốn lấy từ bảng sinhvien thì đối phải tạo
	 *            1 đối tượng mẫu từ lớp sinhvien)
	 * @param dateFormat
	 *            :định dạng ngày tháng năm của đối tượng lấy được
	 * @return :danh sách các đối tượng lấy từ chuỗi truy vấn select
	 */
	public ArrayList<Object> getData(String sql, Object objTemplate, String dateFormat) {
		ArrayList<Object> list = new ArrayList<>();
		if (objTemplate != null && db.Connect()) {
			ResultSet rs = db.SQLExeQUERY(sql);
			if (rs != null) {
				try {
					while (rs.next()) {
						list.add(DatabaseToObject.getObject(objTemplate, rs, dateFormat));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			db.DisConnect();
		}
		return list;
	}

	/**
	 * Phương thức này cũng lấy danh sách các đối tượng từ chuỗi truy vấn sql
	 * (chuỗi truy vấn select) phương thức này không cần đối tượng mẫu vì ,các
	 * giá trị của trường dữ liệu được chuyển sang kiểu String và lưu vào một
	 * đối tượng kiểu DatabaseObject
	 * 
	 * @param sql:chuỗi
	 *            truy vấn select
	 * @return: danh sách đối tượng kiểu DatabaseObject
	 */
	public ArrayList<Object> getData(String sql) {
		ArrayList<Object> list = new ArrayList<>();
		if (sql != null && !"".equals(sql) && db.Connect()) {
			ResultSet rs = db.SQLExeQUERY(sql);
			if (rs != null) {

				try {
					ResultSetMetaData metadata = rs.getMetaData();
					int columnCount = metadata.getColumnCount();
					int i = 0;
					while (rs.next()) {
						DatabaseObject obj = new DatabaseObject();
						for (i = 1; i <= columnCount; i++) {
							String v = rs.getString(i);
							obj.add(v);
						}
						list.add(obj);
					}

				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			db.DisConnect();
		}
		return list;

	}

	/**
	 * Phương thức này cũng lấy danh sách các đối tượng từ chuỗi truy vấn sql
	 * (chuỗi truy vấn select) phương thức này không cần đối tượng mẫu vì ,các
	 * giá trị của trường dữ liệu được chuyển sang kiểu String và lưu vào một
	 * đối tượng kiểu DatabaseObject
	 * 
	 * @param sql:chuỗi
	 *            truy vấn select
	 * @param dateFormat:định
	 *            dạng ngày tháng năm trong danh sách đối tượng trả về
	 * @return: danh sách đối tượng kiểu DatabaseObject
	 */
	public ArrayList<Object> getData(String sql, String dateFormat) {
		ArrayList<Object> list = new ArrayList<>();
		if (sql != null && !"".equals(sql) && db.Connect()) {
			ResultSet rs = db.SQLExeQUERY(sql);
			String v;
			if (rs != null) {

				try {
					ResultSetMetaData metadata = rs.getMetaData();
					int columnCount = metadata.getColumnCount();
					int i = 0;
					while (rs.next()) {
						DatabaseObject obj = new DatabaseObject();
						for (i = 1; i <= columnCount; i++) {
							if (metadata.getColumnTypeName(i).toLowerCase().indexOf("date") == 0) {
								java.sql.Date d = (java.sql.Date) rs.getDate(i);
								Date date = new Date(d.getYear(), d.getMonth(), d.getDate());
								v = convertDateToString(date, dateFormat);
							} else
								v = rs.getString(i);
							obj.add(v);
						}
						list.add(obj);
					}

				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			db.DisConnect();
		}
		return list;

	}

	/**
	 * Phương thức này cũng lấy danh sách các đối tượng từ chuỗi truy vấn sql
	 * (chuỗi truy vấn select) phương thức này không cần đối tượng mẫu vì ,các
	 * giá trị của trường dữ liệu được chuyển sang kiểu String và lưu vào một
	 * đối tượng kiểu DatabaseObject
	 * 
	 * @param sql:chuỗi
	 *            truy vấn select
	 * @param dateFormat:định
	 *            dạng ngày tháng năm trong danh sách đối tượng trả về
	 * @param page:
	 *            trang hiện tại muốn lấy ,page =1 or 2 ,or 3...n
	 * @param rowsOfPage:số
	 *            dòng của một trang (số dòng trên một trang)
	 * @return: danh sách đối tượng kiểu DatabaseObject
	 */
	public ArrayList<Object> getData(String sql, String dateFormat, int page, int rowsOfPage) {
		ArrayList<Object> list = new ArrayList<>();
		if (sql != null && !"".equals(sql) && db.Connect()) {
			ResultSet rs = db.SQLExeQUERY(sql);
			totalRows = 0;
			String v;
			int rowStart = 0, c = 0;
			if (page <= 0)
				page = 0;
			else
				page--;
			if (rowsOfPage <= 0)
				rowsOfPage = rowsOnPage;// mặc định
			rowStart = page * rowsOfPage;
			if (rs != null) {

				try {
					ResultSetMetaData metadata = rs.getMetaData();
					int columnCount = metadata.getColumnCount();
					int i = 0;
					c = 0;
					while (rs.next()) {
						if (totalRows >= rowStart) {
							DatabaseObject obj = new DatabaseObject();
							for (i = 1; i <= columnCount; i++) {
								if (metadata.getColumnTypeName(i).toLowerCase().indexOf("date") == 0) {
									java.sql.Date d = (java.sql.Date) rs.getDate(i);
									Date date = new Date(d.getYear(), d.getMonth(), d.getDate());
									v = convertDateToString(date, dateFormat);
								} else
									v = rs.getString(i);
								obj.add(v);
							}
							list.add(obj);
							c++;
							if (c >= rowsOfPage)
								break;
						}
						totalRows++;
					}

				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			db.DisConnect();
		}
		return list;

	}

	public ArrayList<String> getPageList(int _totalRows, int rowsOfPage) {
		ArrayList<String> list = new ArrayList<>();
		int i = 0;
		int pages = 0;
		if (_totalRows <= 0)
			_totalRows = 0;
		if (rowsOfPage <= 0)
			rowsOfPage = rowsOnPage;
		pages = _totalRows / rowsOfPage;
		if (_totalRows % rowsOfPage > 0)
			pages++;
		for (i = 1; i <= pages; i++) {
			list.add(i + "");
		}
		return list;
	}

	/**
	 * tạo bảng dữ liệu
	 * 
	 * @param objKey
	 * @param keys
	 * @param sAutoIncreament
	 * @param objForeign
	 * @return
	 */
	public boolean createTable(Object objKey, String[] keys, String sAutoIncreament, ArrayList<Object> objForeign) {
		boolean eb = false;
		if (db.Connect()) {
			eb = db.SQLExeUPDATE(DatabaseToObject.createTable(objKey, keys, sAutoIncreament, objForeign));
			db.DisConnect();
		}
		return eb;
	}

	public String convertDateToString(Date date, String format) {
		String dateStr = null;
		DateFormat df = new SimpleDateFormat(format);
		if (date == null)
			return "";
		try {
			dateStr = df.format(date);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return dateStr;
	}
}
