package com.koreait.fcs.command.cart;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.CartDAO;

public class CartquantityDownCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));
		String mId = request.getParameter("mId");
		
		try {
			if(cartQuantity <= 1) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('�ּ� �ֹ� ������ 1���Դϴ�.')");
				out.println("location.href='cartListPage?mId=" + mId + "&pStock=" + request.getParameter("pStock") + "'");
				out.println("</script>");
				out.close();
			} else {
				CartDAO cDAO = sqlSession.getMapper(CartDAO.class);
				cDAO.quantityDown(cartNo);
				model.addAttribute("mId", mId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
