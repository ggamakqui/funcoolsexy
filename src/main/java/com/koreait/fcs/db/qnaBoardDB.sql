CREATE TABLE C_QNA(
    QNO NUMBER PRIMARY KEY,
    QTITLE VARCHAR2(100) NOT NULL,
    QCONTENT VARCHAR2(1000),
    QCATEGORY VARCHAR2(100),
    QPW VARCHAR2(50),
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