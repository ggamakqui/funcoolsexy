package com.koreait.fcs.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.fcs.command.category.MainCommand;
import com.koreait.fcs.command.category.SelectEtcListCommand;
import com.koreait.fcs.command.category.SelectFemaleBrandListCommand;
import com.koreait.fcs.command.category.SelectFemaleCategoryListCommand;
import com.koreait.fcs.command.category.SelectMaleBrandListCommand;
import com.koreait.fcs.command.category.SelectMaleCategoryListCommand;
import com.koreait.fcs.command.category.SelectProductByFemaleCategoryCommand;
import com.koreait.fcs.command.category.SelectProductByMaleCategoryCommand;
import com.koreait.fcs.command.category.SelectProductEtcCommand;
import com.koreait.fcs.command.category.SelectProductListByFemaleBrandCommand;
import com.koreait.fcs.command.category.SelectProductListByMaleBrandCommand;
import com.koreait.fcs.command.productDetail.SelectProductDetailCommand;

@Controller
public class CategoryController {
	
	@Autowired
	private SqlSession sqlSession;
	private MainCommand command;
	
	// index 뷰로 가자마자 command들 실행시켜서 드롭다운을 불러온다.
	@RequestMapping("/")
	public String goIndex(Model model) {
		new SelectMaleBrandListCommand().execute(sqlSession, model);
		new SelectFemaleBrandListCommand().execute(sqlSession, model);
		new SelectMaleCategoryListCommand().execute(sqlSession, model);
		new SelectFemaleCategoryListCommand().execute(sqlSession, model);
		new SelectEtcListCommand().execute(sqlSession, model);
		return "index";
	}
	
	
	// 남성 브랜드별 카테고리 가져오기
	@RequestMapping("selectProductByMaleBrand")
	public String selectProductByMaleBrand(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new SelectProductListByMaleBrandCommand();
		command.execute(sqlSession, model);
		return "product/productListPage";
	}
	
	// 여성 브랜드별 카테고리 가져오기
	@RequestMapping("selectProductByFemaleBrand")
	public String selectProductByFemaleBrand(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new SelectProductListByFemaleBrandCommand();
		command.execute(sqlSession, model);
		return "product/productListPage";
	}
	
	// 남성 의류 카테고리 가져오기
	@RequestMapping("selectProductByMaleCategory")
	public String selectProductByMaleCategory(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new SelectProductByMaleCategoryCommand();
		command.execute(sqlSession, model);
		return "product/productListPage";
	}
	
	// 여성 의류 카테고리 가져오기
	@RequestMapping("selectProductByFemaleCategory")
	public String selectProductByFemaleCategory(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new SelectProductByFemaleCategoryCommand();
		command.execute(sqlSession, model);
		return "product/productListPage";
	}
	
	// 잡화 카테고리 가져오기
	@RequestMapping("selectProductEtc")
	public String selectProductEtc(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new SelectProductEtcCommand();
		command.execute(sqlSession, model);
		return "product/productListPage";
	}
	
	@RequestMapping("selectProductDetail")
	public String selectProductDetail(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new SelectProductDetailCommand();
		command.execute(sqlSession, model);
		return "product/productViewPage";
		
	}
	
	
	
	
	
	
}
