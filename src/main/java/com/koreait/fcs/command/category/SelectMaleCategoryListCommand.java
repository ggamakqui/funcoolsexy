package com.koreait.fcs.command.category;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.CategoryDAO;
import com.koreait.fcs.dto.CategoryDTO;

public class SelectMaleCategoryListCommand implements Command{

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		CategoryDAO cDAO = sqlSession.getMapper(CategoryDAO.class);
		ArrayList<CategoryDTO> list = cDAO.selectMaleCategoryList();
		model.addAttribute("list3", list);
		
		
	}

}
