package common;

public class ParameterProcess {
	public static String getValue(String obj, String key) {
		if (obj != null && key != null) {
			int vt = obj.indexOf(key);
			char c1 = '+', c2 = '-';
			if (vt > 0) {
				int vt_t = vt - 1;
				int vt_s = vt + key.length();
				c1 = obj.charAt(vt_t);
				c2 = obj.charAt(vt_s);
				if (c1 == c2 && c1 == '"') {
					int vt_ss = vt_s + 1;
					c1 = obj.charAt(vt_ss);
					if (c1 == ':') {
						int vt_sss = vt_ss + 1;
						c1 = obj.charAt(vt_sss);
						if (c1 == '"') {
							int vt_sss_t = vt_sss + 1;
							int vt_sss_s = obj.indexOf(c1, vt_sss_t);
							return obj.substring(vt_sss_t, vt_sss_s);
						}
					}
				}
			}
		}
		return "";
	}
}
