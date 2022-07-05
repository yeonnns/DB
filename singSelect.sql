CREATE TABLE singerType(
    no NUMBER(2)
        CONSTRAINT SINGERTYPE_NO_PK PRIMARY KEY,
    a_time VARCHAR2(2 CHAR)
        CONSTRAINT SINGERTYPE_TIME_CK CHECK (a_time IN('현재', '과거'))
        CONSTRAINT SINGERTYYPE_TIME_NN NOT NULL,
    s_gen VARCHAR2(2 CHAR)
         CONSTRAINT SINGERTYPE_GEN_CK CHECK (s_gen IN('남자','여자'))
         CONSTRAINT SINGERTYPE_GEN_NN NOT NULL
)   
;

CREATE TABLE singer(
    num NUMBER(4)
        CONSTRAINT SINGER_NUM_PK PRIMARY KEY,
    s_type NUMBER(2)
        CONSTRAINT SINGER_TYPE_KF REFERENCES sigerType(no)
        CONSTRAINT SINGER_TYPE_NN NOT NULL,
    name VARCHAR2(50 CHAR)
        CONSTRAINT SINGER_NAME_NN NOT NULL,
    scode CHAR(1)
        CONSTRAINT SINGER_CODE_CK CHECK (scode IN('G', 'M', 'S'))
        CONSTRAINT SINGER_CODE_NN NOT NULL,
    gno NUMBER(4)
)
;

CREATE TABLE photo(
    pno NUMBER(6)
        CONSTRAINT PHOTO_NO_PK PRIMARY KEY,
    P_num NUMBER(4)
        CONSTRAINT PHOTO_SNUM_FK REFERENCES singer(num)
        CONSTRAINT PHOTO_SNUM_NN NOT NULL,
    sname VARCHAR2(200CHAR)
        CONSTRAINT PHOTO_SNAME_NN NOT NULL
        CONSTRAINT PHOTO_SNAME_UK UNIQUE,
    dir VARCHAR2(200 CHAR) 
        CONSTRAINT PHOTO_DIR_NN NOT NULL,
    len NUMBER
        CONSTRAINT PHOTO_LEN_NN NOT NULL,
    show CHAR(1) DEFAULT 'Y'
        CONSTRAINT PHOTO_SHOW_CK ChECK (show IN('C', 'Y', 'N'))
        CONSTRAINT PHOTO_SHOW_NN NOT NULL
     );
     
     
INSERT INTO
    singerType
VALUES(
(SELECT NVL(MAX(no)+1, 11) FROM singerType), '현재', '남자'
)
;

INSERT INTO
    singerType
VALUES(
(SELECT NVL(MAX(no)+1, 11) FROM singerType), '현재', '여자'
)
;

INSERT INTO
    singerType
VALUES(
(SELECT NVL(MAX(no)+1, 11) FROM singerType), '과거', '남자'
)
;

INSERT INTO
    singerType
VALUES(
(SELECT NVL(MAX(no)+1, 11) FROM singerType), '과거', '여자'
)
;


INSERT INTO
    singer
VALUES(
(SELECT NVL(MAX(num)+1, 1001) FROM singer) , 12 ,'블랙핑크', 'G' , null
)
;

INSERT INTO
    singer
VALUES(
(SELECT NVL(MAX(num)+1, 11) FROM singer) , 12 ,'리사', 'G' , 1001
)
;

INSERT INTO
    singer
VALUES(
(SELECT NVL(MAX(num)+1, 11) FROM singer) , 12 ,'로제', 'G' , 1001
)
;

INSERT INTO
    singer
VALUES(
(SELECT NVL(MAX(num)+1, 11) FROM singer) , 12 ,'지수', 'G' , 1001
)
;

INSERT INTO
    singer
VALUES(
(SELECT NVL(MAX(num)+1, 11) FROM singer) , 12 ,'제니', 'G' , 1001
)
;

INSERT INTO
    singer
VALUES(
(SELECT NVL(MAX(num)+1, 1001) FROM singer) , 12 ,'소방차', 'G' , null
)
;

INSERT INTO
    singer
VALUES(
(SELECT NVL(MAX(num)+1, 11) FROM singer) , 12 ,'김태형', 'M' , 1006
)
;

INSERT INTO
    singer
VALUES(
(SELECT NVL(MAX(num)+1, 11) FROM singer) , 12 ,'이상원', 'M' , 1006
)
;

INSERT INTO
    singer
VALUES(
(SELECT NVL(MAX(num)+1, 11) FROM singer) , 12 ,'정원관', 'M' , 1006
)
;

INSERT INTO
    singer
VALUES(
(SELECT NVL(MAX(num)+1, 1001) FROM singer) , 12 ,'아이유', 'S' , null
)
;

------------------------------------------------------------------
INSERT INTO
    photo
VALUES(
    (SELECT NVL(MAX(pno) + 1, 100001)FROM photo),
    1002, 'jennie.jpg', '/img/photo/', 55950, 'C'
);

INSERT INTO
    photo
VALUES(
    (SELECT NVL(MAX(pno) + 1, 100001)FROM photo),
    1003, 'lisa.jpg','/img/photo/', 1215856, 'C'
);

INSERT INTO
    photo
VALUES(
    (SELECT NVL(MAX(pno) + 1, 100001)FROM photo),
    1004, 'rose.jpg','/img/photo/', 156162, 'C'
);

INSERT INTO
    photo
VALUES(
    (SELECT NVL(MAX(pno) + 1, 100001)FROM photo),
    1005, 'jisoo.jpg', '/img/photo/', 52360, 'C'
);


INSERT INTO
    photo
VALUES(
    (SELECT NVL(MAX(pno) + 1, 100001)FROM photo),
    1010, 'iu.jpg', '/img/photo/', 5239, 'C'
);
commit;


SELECT
    name, s_type
FROM
    singer , singertype
WHERE
    gno is null
    AND no = s_type
    AND scode = 'G'
    AND a_time = '현재'
    AND s_gen = '여자'
;


SELECT
    name, num
FROM
    singer
WHERE
    gno = 1001
;


SELECT
    name, num
FROM
    singer
WHERE
    gno = 
    {
    NVL(1010, num)   
    }

;

drop table ardudata;

CREATE TABLE ardudata(
    ano NUMBER(4)
        CONSTRAINT ARDU_NO_PK PRIMARY KEY,
    ddate NUMBER(7, 4)
        CONSTRAINT ARDU_DATA_NN NOT NULL,
    wdate DATE DEFAULT sysdate
        CONSTRAINT ARDU_DATE_NN NOT NULL
);

INSERT INTO
    ardudata(ano, ddate)
VALUES(
    (SELECT NVL(MAX(ano)+1, 1001) FROM ardudata),
    150.00
);


SELECT

FROM
    singer, singertype, photo
WHERE
    no = s_type
    AND num = s_num
;


SELECT
    s_num num, sname
FROM
    photo
WHERE
    s_num = 1002
    AND show ='C'
;


