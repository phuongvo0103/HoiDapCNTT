package common;

import java.text.Normalizer;
import java.util.regex.Pattern;

public class StringUtils {
	public static String getUns(String s) {
		String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		return pattern.matcher(temp).replaceAll("").replaceAll("Đ", "D").replaceAll("đ", "d");
	}

	public static int countChar(String s, char c) {
		int i = 0;
		int count = 0;
		i = s.indexOf(c, i);
		while (i >= 0) {
			count++;
			i = s.indexOf(c, i + 1);

		}
		return count;
	}

	public static boolean check(String s) {
		String sc = ".,\\/;'-+*.-()&^%$#@!~ ";
		if ("".equals(s.trim()))
			return false;
		int len = sc.length();
		int count = 0;
		for (int i = 0; i < len; i++) {
			count += countChar(s, sc.charAt(i));
		}
		if (len > 0) {
			double a = (1.0 * count) / len;
			if (a > 0.4)
				return false;
		}
		return true;
	}
}
