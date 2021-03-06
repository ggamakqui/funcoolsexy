--카테고리
DROP TABLE C_CATEGORY;
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

INSERT INTO C_CATEGORY (CNO, CNAME)
VALUES (11, 'JACKET');
INSERT INTO C_CATEGORY (CNO, CNAME)
VALUES (12, 'CARDIGAN');
INSERT INTO C_CATEGORY (CNO, CNAME)
VALUES (13, 'KNIT');
INSERT INTO C_CATEGORY (CNO, CNAME)
VALUES (14, 'SHIRTS');
INSERT INTO C_CATEGORY (CNO, CNAME)
VALUES (15, 'JUMPER');
INSERT INTO C_CATEGORY (CNO, CNAME)
VALUES (16, 'PANTS');
INSERT INTO C_CATEGORY (CNO, CNAME)
VALUES (21, 'KNIT');
INSERT INTO C_CATEGORY (CNO, CNAME)
VALUES (22, 'PANTS');
INSERT INTO C_CATEGORY (CNO, CNAME)
VALUES (23, 'BLOUSE');
INSERT INTO C_CATEGORY (CNO, CNAME)
VALUES (24, 'DRESS');
INSERT INTO C_CATEGORY (CNO, CNAME)
VALUES (25, 'JACKET');
INSERT INTO C_CATEGORY (CNO, CNAME)
VALUES (26, 'SKIRTS');
INSERT INTO C_CATEGORY (CNO, CNAME)
VALUES (31, 'BELT');
INSERT INTO C_CATEGORY (CNO, CNAME)
VALUES (32, 'BAG');
INSERT INTO C_CATEGORY (CNO, CNAME)
VALUES (33, 'SHOES');