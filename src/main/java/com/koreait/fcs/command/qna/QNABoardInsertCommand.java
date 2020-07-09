package com.koreait.fcs.command.qna;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.QNABoardDAO;

public class QNABoardInsertCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		String qTitle = request.getParameter("qTitle");
		String qPw = request.getParameter("qPw");
		String qContent = request.getParameter("qContent");
		String mId = request.getParameter("mId");
		String page = request.getParameter("page");
		QNABoardDAO qDAO = sqlSession.getMapper(QNABoardDAO.class);
		int result = qDAO.qnaBoardInsert(pNo, qTitle, qPw, qContent, mId);
		model.addAttribute("pNo",pNo);
		model.addAttribute("page",page);		
		if (result > 0) {
		} else {
			try {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out;
				out = response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('게시글이 등록되지 않았습니다.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}

}
