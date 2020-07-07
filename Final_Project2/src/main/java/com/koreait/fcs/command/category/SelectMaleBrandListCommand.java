package com.koreait.fcs.command.category;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.dao.CategoryDAO;
import com.koreait.fcs.dto.ProductDTO;

public class SelectMaleBrandListCommand implements MainCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		CategoryDAO cDAO = sqlSession.getMapper(CategoryDAO.class);
		ArrayList<ProductDTO> list = cDAO.selectMaleBrandList();
		model.addAttribute("list1", list);
		
		
	}

}
