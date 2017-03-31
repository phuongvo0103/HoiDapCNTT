package common;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * StringProcess.java
 *
 * Version 1.0
 *
 * Date: Jan 20, 2015
 *
 * Copyright
 *
 * Modification Logs: DATE AUTHOR DESCRIPTION
 * ----------------------------------------------------------------------- Jan
 * 20, 2015 DaiLV2 Create
 */

public class StringProcess {
	public static String getUTF8(String input) {
		String output = "";
		try {
			/* From ISO-8859-1 to UTF-8 */
			output = new String(input.getBytes("ISO-8859-1"), "UTF-8");

			// output = new String(input.getBytes("UTF-8"), "ISO-8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return output;
	}

	/**
	 * Ham tra ve gioi tinh: 1=Nam, 0=Nu
	 * 
	 * @param val
	 * @return String
	 */
	public static String gioiTinh(String val) {
		if ("0".equals(val)) {
			return "Nữ";
		}
		return "Nam";
	}

	/**
	 * Ham in ra mot xau, null in ra xau rong
	 * 
	 * @param s
	 * @return String
	 */
	public static String getVaildString(String s) {
		if (s == null)
			return "";
		return s;
	}

	/**
	 * Ham kiem tra xau rong hay khong
	 * 
	 * @param s
	 * @return boolean
	 */
	public static boolean notVaild(String s) {
		if (s == null || s.length() == 0)
			return true;
		return false;
	}

	/**
	 * Ham kiem tra xem xau co bao gom chi chu so hay khong
	 * 
	 * @param s
	 * @return boolean
	 */
	public static boolean notVaildNumber(String s) {
		if (notVaild(s))
			return true;
		String regex = "[0-9]+";
		if (s.matches(regex))
			return false;

		return true;
	}

	public static Date convertStringToDate(String s) {
		DateFormat df;
		if (s.indexOf("-") > 0)
			df = new SimpleDateFormat("yyyy-MM-dd");
		else
			df = new SimpleDateFormat("yyyy/MM/dd");
		Date startDate;
		try {
			startDate = df.parse(s);
			System.out.println("chuoi ngay-->:" + s);
			return startDate;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String dateToString(Date d, String format) {
		DateFormat df = new SimpleDateFormat(format);
		String ds = df.format(d);
		return ds;
	}

}
