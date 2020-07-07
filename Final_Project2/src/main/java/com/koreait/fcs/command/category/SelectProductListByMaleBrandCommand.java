package com.koreait.fcs.command.category;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.common.PageVO;
import com.koreait.fcs.dao.CategoryDAO;
import com.koreait.fcs.dto.ProductDTO;

public class SelectProductListByMaleBrandCommand implements MainCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		// index 에서 어느 브랜드 선택했는지(cCompany) 가져오기
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String pCompany = request.getParameter("pCompany");
		
		// cDAO 먼저 생성
		CategoryDAO cDAO = sqlSession.getMapper(CategoryDAO.class);

		
		// ↓↓↓↓↓↓↓↓ 페이징 시작  ↓↓↓↓↓↓↓↓
		// 1. PageVO 객체 생성
		PageVO pVO = new PageVO();
		
		// 2. 전체 레코드 개수 구하기
		// mapper 및 dao 두개씩으로 나눠야 한다. 
		// 1) 전체 리스트의 갯수 가져오기 
		// 2) beginRecord 와 endRecord로 분류한 레코드 가져오기
		ArrayList<ProductDTO> list = cDAO.selectProductListByMaleBrandCommand1(pCompany);
		// 상품 리스트 왼쪽 상단에 보여줄 전체 리스트의 갯수를 위해 위의 list를 먼저 model 에 넣어준다. 
		model.addAttribute("totalCount", list.size());
		pVO.setTotalRecord(list.size());
						
		// 3. 전체 페이지 개수 구하기
		pVO.setTotalPage();  // 전체 레코드 개수로 계산하는 공식이 PageVO 내부에 구현되어 있다.
		
		// 4. 현재 페이지 번호 구하기
		// PageVO 클래스에 page = 1 로 되어 있다. (파라미터가 없으면 1 페이지를 현재 페이지 번호로 사용한다.)
		// 파라미터가 있으면 전달된 파라미터가 페이지 번호가 된다.
		String page = request.getParameter("page");
		if ( page != null && !page.isEmpty() ) {
			pVO.setPage(Integer.parseInt(page));
		}
		
		// 5. 현재 페이지 번호에 따른 beginRecord, endRecord 구하기
		// recordPerPage = 3 에 의해서 계산된다.
		// page = 1,   beginRecord = 1   endRecord = 3
		// page = 2,   beginRecord = 4   endRecord = 6
		pVO.setBeginRecord( (pVO.getPage() - 1) * pVO.getRecordPerPage() + 1 );
		pVO.setEndRecord( pVO.getBeginRecord() + pVO.getRecordPerPage() - 1 );
		
		// 6. beginRecord ~ endRecord 사이의 list 만 가져오기
		int beginRecord = pVO.getBeginRecord();
		int endRecord = pVO.getEndRecord();
		list = cDAO.selectProductListByMaleBrandCommand2(pCompany, beginRecord, endRecord);
		
		// 7. beginBlock, endBlock 구하기
		// page = 1    beginBlock = 1    endBlock = 3 인데,
		// totalPage = 1 이라면 endBlock = 3 이 아니라, endBlock = 1(totalPage) 이어야 한다.
		pVO.setBeginBlock( ((pVO.getPage() - 1) / pVO.getPagePerBlock()) * pVO.getPagePerBlock() + 1 );
		pVO.setEndBlock( pVO.getBeginBlock() + pVO.getPagePerBlock() - 1 );
		
		// 8. endBlock 보정하기
		if ( pVO.getEndBlock() > pVO.getTotalPage() ) {
			pVO.setEndBlock( pVO.getTotalPage() );
		}
		
		// beginRecord와 endRecord 로 분류된 list를 model에 담아준다.
		model.addAttribute("list", list);
		// 다음 페이지로 넘어갈 때 어떤 제조회사인지를 확인하기 위해 pCompany를 모델에 넣어준다. 
		model.addAttribute("pCompany", pCompany);
		// 페이징 model에 넣어주기
		model.addAttribute("pVO", pVO);
		// 어떤 mapping으로 가야할지를 각각 다르게 넣어준다. 
		model.addAttribute("selectList", "selectProductByMaleBrand");
		
	}

}
