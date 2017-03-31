package model.bean;

/**
 * NguoiDung.java
 *
 * Version 1.0
 *
 * Date: Jan 21, 2015
 *
 * Copyright 
 *
 * Modification Logs:
 * DATE                 AUTHOR          DESCRIPTION
 * -----------------------------------------------------------------------
 * Jan 21, 2015        	DaiLV2          Create
 */

public class NguoiDung {
	private String TenDangNhap;
	private String MatKhau;
	
	public String getTenDangNhap() {
		return TenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		TenDangNhap = tenDangNhap;
	}
	public String getMatKhau() {
		return MatKhau;
	}
	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}
}

