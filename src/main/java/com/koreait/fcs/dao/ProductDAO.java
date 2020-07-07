package com.koreait.fcs.dao;

import java.util.ArrayList;

import com.koreait.fcs.dto.ProductDTO;

public interface ProductDAO {
	
	// 카테고리별 product 목록 불러오기
	public ArrayList<ProductDTO> selectProductListByCategory(int cNo);
	
	// 번호별 product 불러오기
	public ProductDTO selectProductBypNo(int pNo);
	
	// product 추가하기
	public int insertProduct(int pNo, String pName, int pPrice, String pSize, int pCategory, int pGender, String pCompany, String saveFilename1, String saveFilename2, String pDescription, int pStock);
	
	// product 수정하기
	public int updateProduct(String pName, int pPrice, String pSize, int pCategory, int pGender, String pCompany, String saveFilename1, String saveFilename2, String pDescription, int pStock, int pNo);
	
	// product 삭제하기
	public int deleteProduct(int pNo);
}
