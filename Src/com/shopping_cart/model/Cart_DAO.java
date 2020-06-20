package com.shopping_cart.model;

import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Cart_DAO implements Cart_DAO_interface{

	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
			private static DataSource ds = null;
			static {
				try {
					Context ctx = new InitialContext();
					ds = (DataSource) ctx.lookup("java:comp/env/jdbc/petbox");
				} catch (NamingException e) {
					e.printStackTrace();
				}
			}
	@Override
	public void insert(Cart_VO cart_VO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Cart_VO cart_VO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String Shooping_cart_id) {
		// TODO Auto-generated method stub	
	}

	

	@Override
	public List<Cart_VO> findBymember_id(String memeber_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Cart_VO> findByshopping_id(String Shooping_cart_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Cart_VO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
	
}
