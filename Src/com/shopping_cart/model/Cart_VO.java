package com.shopping_cart.model;

import java.sql.Date;

public class Cart_VO implements java.io.Serializable {

	private String Shoping_cart_id;
	private String product_version_id;
	private String member_id;
	private Integer quantity;
	private String name;
	private Integer price;
	private Date create_time;
	@Override
	public String toString() {
		return "Cart_VO [Shoping_cart_id=" + Shoping_cart_id + ", product_version_id=" + product_version_id
				+ ", member_id=" + member_id + ", quantity=" + quantity + ", name=" + name + ", price=" + price
				+ ", create_time=" + create_time + "]";
	}
	public String getShoping_cart_id() {
		return Shoping_cart_id;
	}
	public void setShoping_cart_id(String shoping_cart_id) {
		Shoping_cart_id = shoping_cart_id;
	}
	public String getProduct_version_id() {
		return product_version_id;
	}
	public void setProduct_version_id(String product_version_id) {
		this.product_version_id = product_version_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	
}
