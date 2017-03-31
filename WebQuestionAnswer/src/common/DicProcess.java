package common;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class DicProcess {
	private static ArrayString listA = new ArrayString();
	private static ArrayString listDic = new ArrayString();
	private static FileReader fileR;
	private static boolean eload = false;

	public static void loadDic(ArrayString list, String filename) {
		try {
			fileR = new FileReader(filename);
			BufferedReader buff = new BufferedReader(fileR);
			String temp;
			try {
				while ((temp = buff.readLine()) != null) {
					String s = temp.trim().toLowerCase();
					AString aString = new AString();
					aString.setS(s);
					aString.setsUn(StringUtils.getUns(s));
					list.add(aString);
					System.out.println("dic:" + s);
				}
				buff.close();
				fileR.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (

		FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static void load() {
		if (!eload) {
			loadDic(listA, "D:\\dic.txt");
			loadDic(listDic, "D:\\wordlist.txt");
			eload = true;
		}
	}

	public static boolean checkString(String s) {
		boolean e = false;
		load();
		s = s.trim();
		String[] temps = s.split("\\.");
		int len = temps.length;
		int i = 0;
		int countError = 0, tughep = 0;
		int countE = 0;
		for (i = 0; i < len; i++) {
			String sg = temps[i].trim();
			if (!"".equals(sg)) {
				sg = sg.replaceAll(",", " ");
				sg = sg.replaceAll("-", " ");
				sg = sg.replaceAll(":", " ");
				String[] sgtemp = sg.split(" ");
				int lensg = sgtemp.length;
				int j = 0, k = 0;
				int c = 0;
				for (k = 0; k < lensg; k++) {
					System.out.println("mon:" + sgtemp[k]);
					if (!"".equals(sgtemp[k])) {
						StringBuilder sghep = new StringBuilder(sgtemp[k]);
						String ssign = sghep.toString();
						int rank = listDic.sokhop(ssign);
						if (rank > 0 && rank < Integer.MAX_VALUE) {
							System.out.println("tu:" + listDic.getaReturn().getS());
							if (!ssign.equals(listDic.getaReturn().getS())) {
								countError++;
							}
							tughep++;
						}
						int rankE = listA.getRank(ssign);
						if (rankE < ssign.length())
							countE++;
						c = 1;
						for (j = k + 1; j < lensg; j++) {
							if (!sgtemp[j].equals("")) {
								sghep.append(" ");
								sghep.append(sgtemp[j]);
								ssign = sghep.toString();
								rankE = listA.getRank(ssign);
								if (rankE < ssign.length())
									countE++;
								rank = listDic.sokhop(ssign);
								if (rank > 0 && rank < Integer.MAX_VALUE) {
									if (!ssign.equals(listDic.getaReturn().getS()))
										countError++;
									tughep++;
								}
								c++;
								if (c >= 4)
									break;
							}
						}
					}
				}
			}
		}
		System.out.println("count:" + countE + ":" + countError + " tughep:" + tughep);
		if (countE <= 0) {
			if (tughep > 0) {
				double check = (1.0 * countError) / tughep;
				if (check < 0.6)
					e = true;
			} else if (countError <= 0)
				e = true;
		}
		return e;
	}

	public static void main(String[] args) {
		String ss = "khong la gi cua nhau";
		boolean e = checkString(ss);
		System.out.println("chuoi:" + e);
	}
}
