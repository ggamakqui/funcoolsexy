
DROP TABLE C_NOTICE;
DROP TABLE C_BOARD;
DROP TABLE C_QNA;
DROP TABLE C_ORDER;
DROP TABLE C_CART;
DROP TABLE C_PRODUCT;
DROP TABLE C_MEMBER;
DROP TABLE C_CATEGORY;
--멤버
CREATE TABLE C_MEMBER(
    MNO NUMBER PRIMARY KEY,
    MID VARCHAR2(20) UNIQUE NOT NULL,
    MNAME VARCHAR2(100),
    MPW VARCHAR2(50) NOT NULL,
    MMOBILE1 CHAR(3),
    MMOBILE2 CHAR(4),
    MMOBILE3 CHAR(4),
    MTEL CHAR(15),
    MEMAIL VARCHAR2(50) UNIQUE NOT NULL,
    MBIRTH CHAR(6),
    MADDR VARCHAR2(100),
    MREGDATE DATE
);

DROP SEQUENCE C_MEMBER_SEQ;
CREATE SEQUENCE C_MEMBER_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCACHE
NOCYCLE;


--카테고리
CREATE TABLE C_CATEGORY(
    CNO NUMBER PRIMARY KEY,
    CNAME VARCHAR2(100) NOT NULL
);

DROP SEQUENCE C_CATEGORY_SEQ;
CREATE SEQUENCE C_CATEGORY_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 9999
NOCACHE
NOCYCLE;

--상품

CREATE TABLE C_PRODUCT(
    PNO NUMBER PRIMARY KEY,
    PNAME VARCHAR2(100) NOT NULL,
    PPRICE NUMBER NOT NULL,
    PSIZE VARCHAR2(10), --옷사이즈
    PCATEGORY NUMBER, --외래키
    PGENDER NUMBER NOT NULL,
    PCOMPANY VARCHAR2(100),
    PTHUMBNAIL VARCHAR2(1000), -- 이미지 파일명
    PDESCRIPTION VARCHAR2(2000),
    PSTOCK NUMBER NOT NULL,
    PREGDATE DATE,
    CONSTRAINT PRODUCT_CATEGORY_FK FOREIGN KEY (PCATEGORY) REFERENCES C_CATEGORY (CNO)
);

DROP SEQUENCE C_PRODUCT_SEQ;
CREATE SEQUENCE C_PRODUCT_SEQ
START WITH 10000
INCREMENT BY 1
MAXVALUE 999999
NOCACHE
NOCYCLE;

--공지
CREATE TABLE C_NOTICE(
    NNO NUMBER PRIMARY KEY,
    NTITLE VARCHAR2(100) NOT NULL,
    NCONTENT VARCHAR2(1000),
    MNO NUMBER,
    NREGDATE DATE,
    NHIT NUMBER,
    CONSTRAINT NOTICE_MEMBER_FK FOREIGN KEY (MNO) REFERENCES C_MEMBER (MNO) 
);

DROP SEQUENCE C_NOTICE_SEQ;
CREATE SEQUENCE C_NOTICE_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCACHE
NOCYCLE;

--게시판
CREATE TABLE C_BOARD(
    BNO NUMBER PRIMARY KEY,
    MID VARCHAR2(20),
    PNO NUMBER,
    BTITLE VARCHAR2(100),
    BCONTENT VARCHAR2(1000),
    BFILENAME VARCHAR2 (1000),
    BSCORE NUMBER,
    BREGDATE DATE,
    CONSTRAINT BOARD_MEMBER_FK FOREIGN KEY (MID) REFERENCES C_MEMBER (MID),
    CONSTRAINT BOARD_PRODUCT_FK FOREIGN KEY (PNO) REFERENCES C_PRODUCT (PNO)
);

DROP SEQUENCE C_BOARD_SEQ;
CREATE SEQUENCE C_BOARD_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCACHE
NOCYCLE;


--QNA
CREATE TABLE C_QNA(
    QNO NUMBER PRIMARY KEY,
    QTITLE VARCHAR2(100) NOT NULL,
    QCONTENT VARCHAR2(1000),
    QCATEGORY VARCHAR2(100),
    QPW VARCHAR2(50),
    QHIT NUMBER, 
    QREF NUMBER, 
    QSTEP NUMBER, 
    QDEPTH NUMBER, 
    QDELETE NUMBER,
    MID VARCHAR2(20),
    PNO NUMBER,
    CONSTRAINT QNA_MEMBER_FK FOREIGN KEY (MID) REFERENCES C_MEMBER (MID),
    CONSTRAINT QNA_PRODUCT_FK FOREIGN KEY (PNO) REFERENCES C_PRODUCT (PNO)
);

DROP SEQUENCE C_QNA_SEQ;
CREATE SEQUENCE C_QNA_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCACHE
NOCYCLE;

--주문
CREATE TABLE C_ORDER(
    ONO NUMBER PRIMARY KEY,
    MID VARCHAR2(20),
    ONAME VARCHAR2(100),
    OMOBILE1 CHAR(3),
    OMOBILE2 CHAR(4),
    OMOBILE3 CHAR(4),
    OTEL VARCHAR2(20),
    OEMAIL VARCHAR2(50),
    OPOST VARCHAR2(20),
    OADDR VARCHAR2(200),
    ODATE DATE,
    CONSTRAINT ORDER_MEMBER_FK FOREIGN KEY (MID) REFERENCES C_MEMBER (MID)
);


DROP SEQUENCE C_ORDER_SEQ;
CREATE SEQUENCE C_ORDER_SEQ
START WITH 10000
INCREMENT BY 1
MAXVALUE 999999
NOCACHE
NOCYCLE;

--장바구니

CREATE TABLE C_CART(
    CARTNO NUMBER PRIMARY KEY,
    MID VARCHAR2(20),
    CARTSTATE NUMBER DEFAULT '1', -- 생성1 삭제0
    PNO NUMBER,
    CARTQUANTITY NUMBER,
    CONSTRAINT CART_MEMBER_FK FOREIGN KEY (MID) REFERENCES C_MEMBER (MID),
    CONSTRAINT CART_PRODUCT_FK FOREIGN KEY (PNO) REFERENCES C_PRODUCT (PNO)
);