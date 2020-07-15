package com.koreait.fcs.command.cart;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.CartDAO;

public class CartInsertCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String mId = request.getParameter("mId");
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		String cSize = request.getParameter("cSize");
		int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));
		
		
		CartDAO cDAO = sqlSession.getMapper(CartDAO.class);
		cDAO.cartInsert(mId, pNo, cSize, cartQuantity);
		model.addAttribute("mId", mId);	
	}

}
