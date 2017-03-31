package common;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.regex.Pattern;

public class ArrayString {
	private ArrayList<AString> list = new ArrayList<>();
	private AString aReturn;

	public void add(AString aStr) {
		list.add(aStr);
	}

	public AString getaReturn() {
		return aReturn;
	}

	public void setaReturn(AString aReturn) {
		this.aReturn = aReturn;
	}

	public ArrayList<AString> getList() {
		return list;
	}

	public void setList(ArrayList<AString> list) {
		this.list = list;
	}

	// chuoi dau vao ,chuoi so sanh voi ss
	public int ranking(String s, String sSign, String ss, String ssSign) {
		int i = 0, j;
		int len = s.length();
		int lenss = ss.length();
		int r = 0, minr = 0;
		int rankmin = 1;
		String[] s1 = s.split(" ");
		String[] s2 = ss.split(" ");
		if (s1.length != s2.length)
			return Integer.MAX_VALUE;
		if (!sSign.equals(ssSign)) {
			for (i = 0; i < len; i++) {
				char c = s.charAt(i);
				minr = Integer.MAX_VALUE;
				r = 0;
				for (j = 0; j < lenss; j++) {
					char css = ss.charAt(j);
					if (c == css) {
						r = Math.abs((int) sSign.charAt(i) - (int) ssSign.charAt(j));
						r += Math.abs(j - i) + 1;
						if (r < minr)
							minr = r;
					}
				}
				if (r == 0) {
					if (i < lenss)
						r = Math.abs((int) sSign.charAt(i) - (int) ssSign.charAt(i)) + 1;
					else
						r = Math.abs((int) sSign.charAt(i)) + 1;
				}
				if (minr > r)
					minr = r;
				rankmin += minr;

			}
		}
		return rankmin;
	}

	public String getUnS(String s) {
		String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		return pattern.matcher(temp).replaceAll("").replaceAll("Đ", "D").replaceAll("đ", "d");
	}

	public int getRank(String s) {
		String sUn = getUnS(s);
		int rank = 0, rank1 = 0;
		int c = 0;
		int rankmin = 0;
		for (AString aString : list) {
			rank = ranking(sUn, s, aString.getsUn(), aString.getS());
			rank1 = ranking(aString.getsUn(), aString.getS(), sUn, s);
			if (rank1 < rank)
				rank = rank1;
			if (c == 0) {
				rankmin = rank;
				aReturn = aString;
			} else {
				if (rank < rankmin) {
					rankmin = rank;
					aReturn = aString;
				}
			}
			c++;
		}

		return rankmin;
	}

	public int ranking(String sSign, String uSign, String ssSign) {
		int i = 0, j;
		int len = sSign.length();
		int lenss = ssSign.length();
		int r = 0, minr = 0;
		int rankmin = 0;
		int a, b;
		if (sSign.equals(ssSign))
			return 0;
		for (i = 0; i < len; i++) {
			char c = sSign.charAt(i);
			minr = Integer.MAX_VALUE;
			r = 0;
			for (j = 0; j < lenss; j++) {
				char css = ssSign.charAt(j);
				if (c == css) {
					a = c;
					b = css;
					r = Math.abs(a - b);
					r += Math.abs(j - i) + 1;
					if (r < minr)
						minr = r;
				}
			}
			if (r == 0) {
				a = (int) ssSign.charAt(i);
				b = (int) c;
				r = Math.abs(a - b);
			}
			if (minr > r)
				minr = r;
			rankmin += minr;

		}
		return rankmin;
	}

	public int sokhop(String s) {// thuat toan tim chuoi khop tu ghep
		String sUn = getUnS(s);
		int rank = 0;
		int rankmin = Integer.MAX_VALUE;
		aReturn = null;
		for (AString aString : list) {
			if (s.equals(aString.getS())) {
				aReturn = aString;
				return 0;
			} else if (sUn.equals(aString.getsUn())) {
				rank = ranking(s, sUn, aString.getS());
				if (rankmin > rank) {
					rankmin = rank;
					aReturn = aString;
				}
			}
		}
		return rankmin;
	}
}