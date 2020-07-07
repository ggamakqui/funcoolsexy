package com.koreait.fcs.command.product;

import java.io.File;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.fcs.dao.ProductDAO;

public class ProductInsertCommand implements ProductCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) map.get("mr");
		
		String pName = mr.getParameter("pName");
		int pPrice = Integer.parseInt(mr.getParameter("pPrice"));
		String pSize = mr.getParameter("pSize");
		int pCategory = Integer.parseInt(mr.getParameter("pCategory"));
		int pGender = Integer.parseInt(mr.getParameter("pGender"));
		int pStock = Integer.parseInt(mr.getParameter("pStock"));
		String pCompany = mr.getParameter("pCompany");
		String pDescription = mr.getParameter("pDescription");
		MultipartFile pThumbnail = mr.getFile("pThumbnail");	// 썸네일
		MultipartFile pFilename = mr.getFile("pFilename");		// 상세이미지
		
		// 업로드 할 파일의 이름 / 확장자 분리하기
		// 동일한 이름을 가진 파일이 업로드 되지 않도록 직접 파일 이름을 수정해서 올린다
		
		// 업로드 된 원래 파일명(확장자 포함)
		String originpThumbnail = pThumbnail.getOriginalFilename();
		String originpFilename = pFilename.getOriginalFilename();
		
		// originFileName 에서 확장자 분리
		String extName1 = originpThumbnail.substring(originpThumbnail.lastIndexOf('.') + 1);	// 썸네일 이미지 확장자
		String extName2 = originpFilename.substring(originpFilename.lastIndexOf('.') + 1);	// 상세이미지 확장자
		
		// 저장할 파일 이름 만들기 / 업로드 / 파일이름 DB에 저장
		String saveFilename1 = null;	// 썸네일
		String saveFilename2 = null;	// 상세이미지
		try {
			
			// 1) 저장할 파일 이름 만들기
			// 파일명 중복 방지 대책으로 서버에 저장할 파일의 이름에 업로드 시간을 추가한다.
			// 서버에 저장될 파일명 : 원래파일명_업로드시간.확장자
			// 원래파일명 : originFilename.substring(0, originFileName.lastIndexOf('.'))
			// 업로드시간 : System.currentTimeMillis()
			saveFilename1 = originpThumbnail.substring(0, originpThumbnail.lastIndexOf('.')) + "_" + System.currentTimeMillis() + "." + extName1;
			saveFilename2 = originpFilename.substring(0, originpFilename.lastIndexOf('.')) + "_" + System.currentTimeMillis() + "." + extName2;
			
			// 2) 업로드
			// 2-1) 파일이 저장될 서버 내 경로(/resources/storage)를 알아낸다.
			
			String realPath = mr.getSession().getServletContext().getRealPath("/resources/storage");
			
			// 2-2) /resources/storage 경로가 존재하지 않으면 필요한 경로(디렉토리)를 만든다.
			// new File(경로) : 경로로 디렉토리만 사용되면 디렉토리로 인식한다.
			File directory = new File(realPath);
			if(!directory.exists()) {
				directory.mkdirs();	// mkdirs : 하위 디렉토리를 모두 만든다
			}
			
			// 2-3) 서버에 저장할 파일을 만든다.
			File saveFile1 = new File(realPath, saveFilename1);	// 썸네일
			File saveFile2 = new File(realPath, saveFilename2);	// 상세이미지
			
			// 2-4) 업로드한다.
			pThumbnail.transferTo(saveFile1);
			pFilename.transferTo(saveFile2);
			
			// 3) DB에 저장하기
			// iWriter, iTitle, iContent, saveFilename
			ProductDAO pDAO = sqlSession.getMapper(ProductDAO.class);
			pDAO.insertProduct(pName, pPrice, pSize, pCategory, pGender, pCompany, saveFilename1, saveFilename2, pDescription, pStock);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		

	}

}
