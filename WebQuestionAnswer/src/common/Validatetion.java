package common;

import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validatetion {

	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

	public static boolean isValidDate(String stime, String dateFormat) {
		Date dateof = DateObject.of(stime, dateFormat);
		String sm = "";
		if (dateof != null)
			sm = DateObject.convertDateToString(dateof, dateFormat);
		if (sm.equals(stime))
			return true;
		return false;

	}

	public static boolean isValidEmail(String email) {
		Pattern pattern = Pattern.compile(EMAIL_PATTERN);
		Matcher matcher = pattern.matcher(email);
		return matcher.matches();
	}

	public static boolean isValidPhone(String phone) {
		String sPrefix = "0123456789";
		int numMax = 11;
		int i = 0;
		if (phone == null || phone.length() != numMax)
			return false;
		for (i = 0; i < phone.length(); i++) {
			if (sPrefix.indexOf(phone.charAt(i) + "") < 0)
				return false;
		}
		return true;
	}

	public static boolean isValidNumber(String snumber, int min, int max) {
		try {
			int sn = Integer.parseInt(snumber);
			if (sn >= min && sn <= max)
				return true;
		} catch (Exception e) {

		}
		return false;
	}
}
