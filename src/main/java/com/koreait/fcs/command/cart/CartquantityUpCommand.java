package com.koreait.fcs.command.cart;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.CartDAO;

public class CartquantityUpCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));
		int pStock1 = Integer.parseInt(request.getParameter("pStock1"));
		int pStock2 = Integer.parseInt(request.getParameter("pStock2"));
		int pStock3 = Integer.parseInt(request.getParameter("pStock3"));
		String cSize = request.getParameter("cSize");
		String mId = request.getParameter("mId");
		System.out.println(mId);

		
		try {
			
			if(cSize.equals("S")) {
				if(cartQuantity >= pStock1) {
					response.setContentType("text/html; charset=utf-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('��� �����մϴ�.')");
					out.println("location.href='cartListPage?mId=" + mId + "'");
					out.println("</script>");
					out.close();
				}else {
					CartDAO cDAO = sqlSession.getMapper(CartDAO.class);
					cDAO.quantityUp(cartNo);
					model.addAttribute("mId", mId);
				}
			} else if (cSize.equals("M")) {
				if(cartQuantity >= pStock2) {
					response.setContentType("text/html; charset=utf-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('��� �����մϴ�.')");
					out.println("location.href='cartListPage?mId=" + mId + "'");
					out.println("</script>");
					out.close();
				}else {
					CartDAO cDAO = sqlSession.getMapper(CartDAO.class);
					cDAO.quantityUp(cartNo);
					model.addAttribute("mId", mId);
				}
			} else {
				if(cartQuantity >= pStock3) {
					response.setContentType("text/html; charset=utf-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('��� �����մϴ�.')");
					out.println("location.href='cartListPage?mId=" + mId + "'");
					out.println("</script>");
					out.close();
				}else {
					CartDAO cDAO = sqlSession.getMapper(CartDAO.class);
					cDAO.quantityUp(cartNo);
					model.addAttribute("mId", mId);
				}
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
