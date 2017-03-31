package common;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateObject {
	public static String convertDateToString(Date date, String format) {
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

	public static Date of(String stime, String format) {
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		try {

			Date date = formatter.parse(stime);
			return date;

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static Date of(String stime) {
		if (stime.indexOf("-") > 0) {
			String[] time = stime.split("-");
			if (time.length == 3) {
				try {
					if (time[0].length() == 4) {
						return of(stime, "yyyy-MM-dd");
					} else if (time[2].length() == 4)
						return of(stime, "MM-dd-yyyy");
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		} else if (stime.indexOf("/") > 0) {
			String[] time = stime.split("/");
			if (time.length == 3) {
				try {
					if (time[0].length() == 4) {
						return of(stime, "yyyy/MM/dd");
					} else if (time[2].length() == 4)
						return of(stime, "MM/dd/yyyy");
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		return null;
	}
}
