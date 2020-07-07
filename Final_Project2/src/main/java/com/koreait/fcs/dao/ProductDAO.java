package com.koreait.fcs.dao;

import com.koreait.fcs.dto.ProductDTO;

public interface ProductDAO {
	
	
	// 1. 상품 상세 정보 불러오기
	public ProductDTO selectProductDetail(int pNo);
	
	
	
}
