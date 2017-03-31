package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BaseDAO {
	private String StrConnection;
	private Connection con;
	private Statement stmt;
	private CallableStatement calstmt = null;
	private PreparedStatement pstmt = null;

	public BaseDAO() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			StrConnection = "jdbc:sqlserver://10.133.228.216:1433;databaseName=MockProjectSE20_3;user=sa;password=12345678";

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public boolean connect() {
		try {
			if (con == null || con.isClosed()) {

				con = DriverManager.getConnection(StrConnection);
				System.out.println("ok");
				stmt = con.createStatement();
			}

			if (con != null && !con.isClosed())
				return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public boolean disConnect() {
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

	public boolean sqlExePrepareStatement(String sql) {
		try {
			pstmt = con.prepareStatement(sql);
			if (pstmt.executeUpdate() > 0)
				return true;

		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public ResultSet sqlExeProcedure(String sql) {
		try {
			calstmt = con.prepareCall(sql);
			if (calstmt != null)
				return calstmt.executeQuery();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public ResultSet sqlExeQUERY(String sql)// danh cho cau lenh select
	{
		try {
			return stmt.executeQuery(sql);
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public boolean sqlExeUPDATE(String sql)// danh cho cau lenh
											// insert,update,delete
	{
		try {
			if (stmt.executeUpdate(sql) > 0)
				return true;
			return false;
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return false;
	}
}