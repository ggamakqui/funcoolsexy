package com.koreait.fcs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.command.cart.CartDeleteCommand;
import com.koreait.fcs.command.cart.CartInsertCommand;
import com.koreait.fcs.command.cart.CartListCommand;
import com.koreait.fcs.command.cart.CartquantityDownCommand;
import com.koreait.fcs.command.cart.CartquantityUpCommand;

@Controller
public class CartController {
	
	// Field
	@Autowired
	private SqlSession sqlSession;
	private Command cartCommand;

	/*
	 * @RequestMapping("/") public String goIndex() { return "index"; }
	 */
	// List
	@RequestMapping("cartListPage")
	public String cartListPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		cartCommand = new CartListCommand();
		cartCommand.execute(sqlSession, model);
		return "cart/cartListPage";
	}
	 
	// Delete
	@RequestMapping("cartDelete")
	public String cartDelete(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		cartCommand = new CartDeleteCommand();
		cartCommand.execute(sqlSession, model);
		return "redirect:cartListPage";
	}
	
	// quantityUp
	@RequestMapping("quantityUp")
	public String quantityUp(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		cartCommand = new CartquantityUpCommand();
		cartCommand.execute(sqlSession, model);
		return "redirect:cartListPage";
	}

	// quantityDown
	@RequestMapping("quantityDown")
	public String quantityDown(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		cartCommand = new CartquantityDownCommand();
		cartCommand.execute(sqlSession, model);
		return "redirect:cartListPage";
	}
	
	// cartInsert
	@RequestMapping("cartInsert")
	public String cartInsert(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		cartCommand = new CartInsertCommand();
		cartCommand.execute(sqlSession, model);
		return "redirect:cartListPage";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
