package com.product_order_master.model;

import java.sql.Date;

public class Order_master_VO {

	private String order_master_id;
	private String member_id;
	private String product_order_state;
	private String payment;
	private String location;//門市資訊
	private Date create_time;
	@Override
	public String toString() {
		return "Order_master_VO [Order_master_id=" + order_master_id + ", Member_id=" + member_id
				+ ", Product_order_state=" + product_order_state + ", Payment=" + payment + ", Location=" + location
				+ ", Create_time=" + create_time + "]";
	}
	public String getOrder_master_id() {
		return order_master_id;
	}
	public void setOrder_master_id(String order_master_id) {
		this.order_master_id = order_master_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getProduct_order_state() {
		return product_order_state;
	}
	public void setProduct_order_state(String product_order_state) {
		this.product_order_state = product_order_state;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date creat_time) {
		this.create_time = creat_time;
	}
	
	
}
