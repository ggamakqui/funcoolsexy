package com.koreait.fcs.dao;

import java.util.ArrayList;

import com.koreait.fcs.dto.CategoryDTO;
import com.koreait.fcs.dto.ProductDTO;

public interface CategoryDAO {
	
	// 관리자 - 카테고리 삽입
	public int insertCategory(int cNo, String cName);
	
	// 관리자 - 카테고리 수정
	public int updateCategory(int cNo, String cName);
	
	// 관리자 - 카테고리 삭제
	public int deleteCategory(int cNo);
	
	// 관리자 - 카테고리 목록 불러오기
	public ArrayList<CategoryDTO> selectCategoryList();
	
	// 1. 브랜드별 남성 의류 리스트 불러오기
	public ArrayList<ProductDTO> selectProductListByMaleBrandCommand1(String pCompany);
	public ArrayList<ProductDTO> selectProductListByMaleBrandCommand2(String pCompany, int beginRecord, int endRecord);
	
	// 2. 브랜드별 여성 의류 리스트 불러오기
	public ArrayList<ProductDTO> selectProductListByFemaleBrandCommand1(String pCompany);
	public ArrayList<ProductDTO> selectProductListByFemaleBrandCommand2(String pCompany, int beginRecord, int endRecord);
	
	// 3. 카테고리별 남성 의류 리스트 불러오기 
	public ArrayList<ProductDTO> selectProductByMaleCategory1(int pCategory);
	public ArrayList<ProductDTO> selectProductByMaleCategory2(int pCategory, int beginRecord, int endRecord);
	
	// 4. 카테고리별 여성 의류 리스트 불러오기 
	public ArrayList<ProductDTO> selectProductByFemaleCategory1(int pCategory);
	public ArrayList<ProductDTO> selectProductByFemaleCategory2(int pCategory, int beginRecord, int endRecord);
	
	// 5. 잡화 리스트 불러오기 
	public ArrayList<ProductDTO> selectProductEtc1(int pCategory);
	public ArrayList<ProductDTO> selectProductEtc2(int pCategory, int beginRecord, int endRecord);
	
	// 6. 남성 브랜드 목록 불러오기
	public ArrayList<ProductDTO> selectMaleBrandList();
	
	// 6. 여성 브랜드 목록 불러오기
	public ArrayList<ProductDTO> selectFemaleBrandList();
	
	// 7. 남성 카테고리 목록 불러오기
	public ArrayList<CategoryDTO> selectMaleCategoryList();
	
	// 8. 여성 카테고리 목록 불러오기
	public ArrayList<CategoryDTO> selectFemaleCategoryList();
		
	// 9. 잡화 카테고리 목록 불러오기
	public ArrayList<CategoryDTO> selectEtcCategoryList();
	
	// 10. 상품 상세 정보 불러오기
	public ProductDTO selectProductDetail(int pNo);
	
	// 11. 컨트롤러 변경 버젼
	public ArrayList<ProductDTO> selectProductList1(String var, String value1, int value2, int pGender);
	public ArrayList<ProductDTO> selectProductList2(String var, String value1, int value2, int pGender, int beginRecord, int endRecord);

}
