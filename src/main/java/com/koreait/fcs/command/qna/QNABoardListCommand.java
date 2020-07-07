package com.koreait.fcs.command.qna;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.common.PageMaker;
import com.koreait.fcs.dao.QNABoardDAO;
import com.koreait.fcs.dto.QNABoardDTO;

public class QNABoardListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		
		String page = request.getParameter("page");
		if(page==null || page.isEmpty()) {
			page="1";
		}
		//page를 알아야 가져올 list의 begin 과 end 를 알 수 있다.
		int recordPerPage = 5; //board, bbs, guestbook, member 등 모두 
		int beginRecord = (Integer.parseInt(page)-1)*recordPerPage+1;
		int endRecord = beginRecord+recordPerPage-1;
			
		QNABoardDAO qDAO = sqlSession.getMapper(QNABoardDAO.class);
		List<QNABoardDTO> list = qDAO.qnaBoardList(beginRecord, endRecord, pNo);
		
		int totalRecord = qDAO.getTotalRecord();
		String pageView = PageMaker.getPageView("qnaList", Integer.parseInt(page), recordPerPage, totalRecord);
		
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("pageView", pageView);
		model.addAttribute("pNo", pNo);
		
		HttpSession session = request.getSession();
		session.removeAttribute("open");
		
		

	}

}

