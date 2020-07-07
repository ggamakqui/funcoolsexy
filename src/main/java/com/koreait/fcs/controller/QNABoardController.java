package com.koreait.fcs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.command.qna.QNABoardListCommand;

@Controller
public class QNABoardController {
   @Autowired
   private SqlSession sqlSession;
   private Command qnaBoardCommand; //@Autowired로 처리되는 대상이 아니다
   
   @RequestMapping("qnaList")
   public String qnaList(HttpServletRequest request, HttpServletResponse response, Model model) {
      model.addAttribute("request", request);   
      model.addAttribute("response", response);
      qnaBoardCommand = new QNABoardListCommand();
      qnaBoardCommand.execute(sqlSession, model);
      return "qna/qnaBoardList";
   }
}
