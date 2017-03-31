package common;

public class AString {
	private String s;
	private String sUn;

	public String getS() {
		return s;
	}

	public void setS(String s) {
		this.s = s;
	}

	public String getsUn() {
		return sUn;
	}

	public void setsUn(String sUn) {
		this.sUn = sUn;
	}

	public AString() {

	}

	public AString(String s, String sUn) {
		super();
		this.s = s;
		this.sUn = sUn;
	}

}