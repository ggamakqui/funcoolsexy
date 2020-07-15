package com.koreait.fcs.command.order;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.OrderDAO;
import com.koreait.fcs.dto.MemberDTO;
import com.koreait.fcs.dto.OrderListDTO;

public class SelectMyOrderListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		// request 불러오기
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
				
		// session에서 로그인 정보를 받아온다. 
		HttpSession session = request.getSession();
		MemberDTO loginDTO = (MemberDTO)session.getAttribute("loginDTO");  // loginDTO 로그인 정보가 저장되어 있을 경우 session에서 해당 정보 불러옴
		// loginDTO 로그인 정보가 저장되어 있을 경우 session에서 해당 정보 불러옴
		String mId = loginDTO.getmId();
		// 주문한 상품 정보를 불러오기 위해 mId 전달. 
		OrderDAO oDAO = sqlSession.getMapper(OrderDAO.class);
		ArrayList<OrderListDTO> oList =  oDAO.selectMyOrderList(mId);
		model.addAttribute("oList", oList);
		
		// 주문일자만 불러오고, 해당 주문일에 대한 갯수 불러오기
		

	}

}
