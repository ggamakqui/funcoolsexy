package com.koreait.fcs.command.qna;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.common.QNAMyPageMaker;
import com.koreait.fcs.dao.QNABoardDAO;
import com.koreait.fcs.dto.QNABoardDTO;

public class QNAMyBoardListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		String page = request.getParameter("page");
		if (page == null || page.isEmpty()) {
			page = "1";
		}
		int recordPerPage = 10;  // board, bbs, guestbook, member 등 모두 다른 값을 줄 수 있다.
		int beginRecord = (Integer.parseInt(page) - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		
		String mId = request.getParameter("mId");
		
		QNABoardDAO qDAO = sqlSession.getMapper(QNABoardDAO.class);
		List<QNABoardDTO> list = qDAO.qnaMyBoardList(beginRecord, endRecord, pNo, mId);
		int totalRecord = qDAO.getMyTotalRecord(pNo, mId);
		String pageView = QNAMyPageMaker.getPageView("myBoardListPage", Integer.parseInt(page), recordPerPage, totalRecord, pNo, mId);
		
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("pageView", pageView);
		model.addAttribute("pNo", pNo);
		
		HttpSession session = request.getSession();
		session.removeAttribute("open");
	}

}
