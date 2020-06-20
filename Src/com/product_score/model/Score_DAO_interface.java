package com.product_score.model;

import java.util.List;



public interface Score_DAO_interface {

	public void insert (Score_VO score_VO);	
	public Score_VO findByPrimaryKey (String product_score_id);
	public List<Score_VO> getAll();
	public List<Score_VO> getByProductID(String product_id);
}
