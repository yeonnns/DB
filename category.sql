

CREATE TABLE charCate(
    cno NUMBER(6)
        CONSTRAINT CCATE_NO_PK PRIMARY KEY,
    cate_name VARCHAR2(30 CHAR)
        CONSTRAINT CCATE_NAME_NN NOT NULL,
    cate VARCHAR2(4000)
        CONSTRAINT CCATE_CATE_NN NOT NULL
);

INSERT INTO
    charcate
VALUES(
    100001, '가전/TV', '#'
);





INSERT INTO
    charcate
VALUES(
    100002, 'TV', '#100001#'
);


INSERT INTO
    charcate
VALUES(
    100003, '80인치이상', '#100001#100002#'
);

INSERT INTO
    charcate
VALUES(
    100004, '90인치이상', '#100001#100002#100003#'
);


INSERT INTO
    charcate
VALUES(
    100005, '88인치이상', '#100001#100002#100003#'
);

INSERT INTO
    charcate
VALUES(
    100006, '85인치이상', '#100001#100002#100003#'
);

INSERT INTO
    charcate
VALUES(
    100007, '83인치이상', '#100001#100002#100003#'
);


commit;


-- 소소 카테고리
SELECT
    cno, cate_name cname, cate
FROM
    charcate
WHERE
    cate =(
        SELECT
            cate || 100003 || '#'
        FROM
            charcate
        WHERE
            cno = 100003
    
    )
;


-- 대 카테고리
SELECT
    cno, cate_name cname
FROM
    charcate
WHERE
    cate = '#'
;


--------------------------------------------------------------------------------------

CREATE TABLE category(
    cno NUMBER(6)
        CONSTRAINT CATE_NO_PK PRIMARY KEY,
    cate_name VARCHAR2(30 CHAR)
        CONSTRAINT CATE_NAME_NN NOT NULL,
    upno VARCHAR2(4000)
);

INSERT INTO
    category
VALUES(
    100001, '가전/TV', NULL
);




INSERT INTO
    category
VALUES(
    100002, 'TV', 100001
);


INSERT INTO
    category
VALUES(
    100003, '80인치이상', 100002
);

INSERT INTO
    category
VALUES(
    100004, '90인치이상', 100003
);


INSERT INTO
    category
VALUES(
    100005, '88인치이상', 100003
);

INSERT INTO
    category
VALUES(
    100006, '85인치이상', 100003
);

INSERT INTO
    category
VALUES(
    100007, '83인치이상', 100003
);

commit;


--------------------------------------------------------------------------------


CREATE TABLE product(
    pno NUMBER(6)
        CONSTRAINT PRODUCT_NO_PK PRIMARY KEY,
    pname VARCHAR2(50 CHAR)
        CONSTRAINT PRODUCT_NAME_NN NOT NULL,
    cno NUMBER(6)
        CONSTRAINT PRODUCT_CNO_FK REFERENCES category(cno)
        CONSTRAINT PRODUCT_CNO_NN NOT NULL,
    price NUMBER(8)
        CONSTRAINT PRODUCT_PRICE_NN NOT NULL,
    summary VARCHAR2(4000)
        CONSTRAINT PRODUCT_SUMMARY_NN NOT NULL,
    manuf_co VARCHAR2(50 CHAR)
        CONSTRAINT PRODUCT_MANUCO_NN NOT NULL,
    reldate DATE
        CONSTRAINT PRODUCT_RDATE_NN NOT NULL,
    pisshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT PRODUCT_SHOW_CK CHECK (pisshow IN('Y', 'N'))
        CONSTRAINT PRODUCT_SHOW_NN NOT NULL
);

INSERT INTO
    product(pno, pname, cno, price, summary, manuf_co, reldate)
VALUES(
    (SELECT NVL(MAX(pno) + 1, 100001) FROM product),
    'Neo QLED K2323423HELR', 100004, 1234567, 'MINI/LED TV ~~~~~~~~~~~~',
    '삼성전자', TO_CHAR('2021/08/01', 'YYYY/MM/DD')
);

INSERT INTO
    product(pno, pname, cno, price, summary, manuf_co, reldate)
VALUES(
    (SELECT NVL(MAX(pno) + 1, 100001) FROM product),
    '울트라HD DF3346GDELR', 100005, 1234567, '크리스탈 UHD ~~~~~~~~~~~~',
    '엘지전자', TO_CHAR('2021/10/01', 'YYYY/MM/DD')
);

CREATE TABLE dailyTemp(
    no NUMBER
        CONSTRAINT DTMP_NO_PK PRIMARY KEY,
    tmp NUMBER(7,2)
        CONSTRAINT DTMP_TMP_NN NOT NULL,
    hum NUMBER(3)
        CONSTRAINT DTMP_HUM_NN NOT NULL,
    mdate DATE DEFAULT sysdate
        CONSTRAINT STMP_DATE_NN NOT NULL
);


INSERT INTO
    dailytemp(no, tmp, hum)
VALUES(
    (SELECT NVL((MAX(no) + 1, 1) FROM dailytemp),
    #{tmp}, #{hum}
)
;

