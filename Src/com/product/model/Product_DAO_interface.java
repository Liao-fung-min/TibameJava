package com.product.model;

import java.util.List;
import java.util.Map;

public interface Product_DAO_interface {

	public void insert(Product_VO product_VO);

	public void update(Product_VO product_VO);

	public void delete(String Product_id);

	public Product_VO findByPrimaryKey(String Product_id);

//最新日期
	public List<Product_VO> getAll();

//萬用查詢
	public List<Product_VO> getAll(Map<String, String[]> map);

//價錢最高
	public List<Product_VO> highPrice();

//價錢最低
	public List<Product_VO> lowPrice();

//最高評分
	public List<Product_VO> highScore();

}
