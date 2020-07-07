package com.koreait.fcs.command.productDetail;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.category.MainCommand;
import com.koreait.fcs.dao.ProductDAO;
import com.koreait.fcs.dto.ProductDTO;

public class SelectProductDetailCommand implements MainCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String , Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		
		ProductDAO pDAO = sqlSession.getMapper(ProductDAO.class);
		ProductDTO pDTO = pDAO.selectProductDetail(pNo);
		model.addAttribute("pDTO", pDTO);
		
		
	}

}
