package com.douzone.bookmall.vo;

public class BookVo {

	private int no;
	private String title;
	private int money;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	@Override
	public String toString() {
		return "BookVo [no=" + no + ", title=" + title + ", money=" + money + "]";
	}
}
