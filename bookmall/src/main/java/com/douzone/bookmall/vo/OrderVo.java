package com.douzone.bookmall.vo;

public class OrderVo {
	private int no;
	private String orderNo;
	private int money;
	private String address;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "OrderVo [no=" + no + ", orderNo=" + orderNo + ", money=" + money + ", address=" + address + "]";
	}
}
