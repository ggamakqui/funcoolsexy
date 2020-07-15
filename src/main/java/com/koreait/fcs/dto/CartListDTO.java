package com.koreait.fcs.dto;

import java.sql.Date;

public class CartListDTO {
	
	private int cartNo, cartQuantity, cValidate, pNo, pPrice, pCategory, pGender, pStock1, pStock2, pStock3;
	private String mId, cSize, pName, pCompany, pThumbnail, pFilename, pDescription;
	private Date pRegdate;
	
	public CartListDTO() {
		// TODO Auto-generated constructor stub
	}

	public CartListDTO(int cartNo, int cartQuantity, int cValidate, int pNo, int pPrice, int pCategory, int pGender,
			int pStock1, int pStock2, int pStock3, String mId, String cSize, String pName, String pCompany,
			String pThumbnail, String pFilename, String pDescription, Date pRegdate) {
		super();
		this.cartNo = cartNo;
		this.cartQuantity = cartQuantity;
		this.cValidate = cValidate;
		this.pNo = pNo;
		this.pPrice = pPrice;
		this.pCategory = pCategory;
		this.pGender = pGender;
		this.pStock1 = pStock1;
		this.pStock2 = pStock2;
		this.pStock3 = pStock3;
		this.mId = mId;
		this.cSize = cSize;
		this.pName = pName;
		this.pCompany = pCompany;
		this.pThumbnail = pThumbnail;
		this.pFilename = pFilename;
		this.pDescription = pDescription;
		this.pRegdate = pRegdate;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getCartQuantity() {
		return cartQuantity;
	}

	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}

	public int getcValidate() {
		return cValidate;
	}

	public void setcValidate(int cValidate) {
		this.cValidate = cValidate;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpCategory() {
		return pCategory;
	}

	public void setpCategory(int pCategory) {
		this.pCategory = pCategory;
	}

	public int getpGender() {
		return pGender;
	}

	public void setpGender(int pGender) {
		this.pGender = pGender;
	}

	public int getpStock1() {
		return pStock1;
	}

	public void setpStock1(int pStock1) {
		this.pStock1 = pStock1;
	}

	public int getpStock2() {
		return pStock2;
	}

	public void setpStock2(int pStock2) {
		this.pStock2 = pStock2;
	}

	public int getpStock3() {
		return pStock3;
	}

	public void setpStock3(int pStock3) {
		this.pStock3 = pStock3;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getcSize() {
		return cSize;
	}

	public void setcSize(String cSize) {
		this.cSize = cSize;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpCompany() {
		return pCompany;
	}

	public void setpCompany(String pCompany) {
		this.pCompany = pCompany;
	}

	public String getpThumbnail() {
		return pThumbnail;
	}

	public void setpThumbnail(String pThumbnail) {
		this.pThumbnail = pThumbnail;
	}

	public String getpFilename() {
		return pFilename;
	}

	public void setpFilename(String pFilename) {
		this.pFilename = pFilename;
	}

	public String getpDescription() {
		return pDescription;
	}

	public void setpDescription(String pDescription) {
		this.pDescription = pDescription;
	}

	public Date getpRegdate() {
		return pRegdate;
	}

	public void setpRegdate(Date pRegdate) {
		this.pRegdate = pRegdate;
	}
	
	
}
