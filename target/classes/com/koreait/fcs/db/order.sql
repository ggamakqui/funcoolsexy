--주문
DROP TABLE C_ORDER;
CREATE TABLE C_ORDER(
    ONO NUMBER PRIMARY KEY,
    MID VARCHAR2(20),
    ONAME VARCHAR2(100),
    OMOBILE1 CHAR(3),
    OMOBILE2 CHAR(4),
    OMOBILE3 CHAR(4),
    OEMAIL VARCHAR2(50),
    OPOST VARCHAR2(20),
    OADDR1 VARCHAR2(100),
    OADDR2 VARCHAR2(100),
    OADDR3 VARCHAR2(100),
    ODATE DATE,
    CARTNO NUMBER,
    CONSTRAINT ORDER_CART_FK FOREIGN KEY (CARTNO) REFERENCES C_CART (CARTNO),
    CONSTRAINT ORDER_MEMBER_FK FOREIGN KEY (MID) REFERENCES C_MEMBER (MID)
);


DROP SEQUENCE C_ORDER_SEQ;
CREATE SEQUENCE C_ORDER_SEQ
START WITH 10000
INCREMENT BY 1
MAXVALUE 999999
NOCACHE
NOCYCLE;