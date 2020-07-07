package com.koreait.fcs.dao;

import java.util.List;

import com.koreait.fcs.dto.QNABoardDTO;

public interface QNABoardDAO {
	public List<QNABoardDTO> qnaBoardList(int beginRecord, int endRecord, int pNo);
	
	public int getTotalRecord();
}
