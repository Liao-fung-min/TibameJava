package com.shopping_cart.model;

import java.util.List;


public interface Cart_DAO_interface {

	public void insert(Cart_VO cart_VO);

	public void update(Cart_VO cart_VO);

	public void delete(String Shooping_cart_id);

	public List<Cart_VO> findBymember_id(String memeber_id);
	
	public List<Cart_VO> findByshopping_id(String Shooping_cart_id);
	
	public List<Cart_VO> getAll();

}
