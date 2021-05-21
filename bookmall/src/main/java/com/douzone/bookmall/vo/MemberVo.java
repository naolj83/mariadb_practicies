package com.douzone.bookmall.vo;

public class MemberVo {
	private int no;
	private String name;
	private String email;
	private String pwd;
	private String phoneNo;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	@Override
	public String toString() {
		return "MemberVo [no=" + no + ", name=" + name + ", email=" + email + ", pwd=" + pwd + ", phoneNo=" + phoneNo
				+ "]";
	}
}
