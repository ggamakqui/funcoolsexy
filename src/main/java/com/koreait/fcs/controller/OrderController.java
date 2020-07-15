package com.koreait.fcs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.command.member.LoginMemberCommand;
import com.koreait.fcs.command.order.SelectMyOrderListCommand;
import com.koreait.fcs.command.order.SelectOrderProductCommand;
import com.koreait.fcs.command.order.SelectOrderProductFromCartCommand;
import com.koreait.fcs.command.order.SubmitOrderCommand;
import com.koreait.fcs.command.order.SubmitOrderFromCartCommand;

@Controller
public class OrderController {
	
	@Autowired
	private SqlSession sqlSession;
	private Command command;
	
	@RequestMapping("orderPage")
	public String goOrderPage(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		model.addAttribute("request", request);
		SelectOrderProductCommand command = new SelectOrderProductCommand();
		command.execute(sqlSession, response, model);
		return "order/orderPage";
	} 
	
	@RequestMapping("orderPageFromCart")
	public String goOrderPageFromCart(HttpServletRequest request, Model model){
		model.addAttribute("request", request);
		command = new SelectOrderProductFromCartCommand();
		command.execute(sqlSession, model);
		return "order/orderPageFromCart";
	}
	
	@RequestMapping(value="submitOrder", method=RequestMethod.POST)
	public String submitOrder(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new SubmitOrderCommand();
		command.execute(sqlSession, model);
		return "order/orderFinishPage"; // 결제 완료 페이지로 이동, 마이페이지에서 보는 주문내역과는 별도로 생성
	}
	
	@RequestMapping(value="submitOrderFromCart", method=RequestMethod.POST)
	public String submitOrderFromCart(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new SubmitOrderFromCartCommand();
		command.execute(sqlSession, model);
		return "order/orderFinishPage"; // 결제 완료 페이지로 이동, 마이페이지에서 보는 주문내역과는 별도로 생성
	}
	
	@RequestMapping("selectMyOrderList")
	public String selectMyOrderList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new SelectMyOrderListCommand();
		command.execute(sqlSession, model);
		return "member/selectMyOrderListPage";
	}
	
	@RequestMapping("loginPage")
	public String goLoginPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		return "member/login";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new LoginMemberCommand();
		command.execute(sqlSession, model);
		return "redirect:selectProductDetail?pNo=" + request.getParameter("pNo");
	}
	
	
	
}
