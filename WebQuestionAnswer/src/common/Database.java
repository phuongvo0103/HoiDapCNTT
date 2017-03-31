package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Database {
	private String StrConnection;
	private Connection con;
	private Statement cmd;
	private boolean status;

	public boolean getStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Database() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			StrConnection = "jdbc:sqlserver://localhost;databaseName=MVC;user=sa;password=123";
			status = true;
		} catch (Exception ex) {
			status = false;
		}
	}

	public boolean Connect() {
		try {
			if (con == null || con.isClosed()) {

				con = DriverManager.getConnection(StrConnection);
				System.out.println("ok");
				cmd = con.createStatement();

			}

			if (con != null && !con.isClosed())
				return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public boolean DisConnect() {
		try {
			if (con != null)
				con.close();
			if (con.isClosed())
				return true;
			else
				return false;
		} catch (SQLException ex) {
		}
		return false;
	}

	public ResultSet SQLExeQUERY(String sql)// danh cho cau lenh select
	{
		try {
			return cmd.executeQuery(sql);
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public boolean SQLExeUPDATE(String sql)// danh cho cau lenh
											// insert,update,delete
	{
		try {
			if (cmd.executeUpdate(sql) > 0)
				return true;
			return false;
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return false;
	}
}