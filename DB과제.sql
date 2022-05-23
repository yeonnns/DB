

-- 테이블 만들기
CREATE TABLE book(
    bno NUMBER(2) 
        CONSTRAINT BK_BNO_PK PRIMARY KEY,
    title VARCHAR2(50CHAR)
        CONSTRAINT BK_TT_NN NOT NULL,
    author VARCHAR2(30CHAR)
        CONSTRAINT BK_AUTH_NN NOT NULL,
    pub VARCHAR2(20CHAR)
        CONSTRAINT BK_PUB_NN NOT NULL,
    pubnt VARCHAR2(15CHAR)
        CONSTRAINT BK_PUBN_NN NOT NULL,
    edition NUMBER(3),
    field VARCHAR2(10CHAR)
        CONSTRAINT BK_FID_FK REFERENCES grouper(gro)
        CONSTRAINT BK_FID_NN NOT NULL,
    feddate DATE
        CONSTRAINT BK_FD_NN NOT NULL,
    eddate DATE DEFAULT feddate
       CONSTRAINT BK_ED_NN NOT NULL,
    keep CHAR(1) DEFAULT 'Y'
        CONSTRAINT BK_KP_NN NOT NULL
        CONSTRAINT BK_KP_CK CHECK (keep IN('Y','N'),
    aqdate DATE DEFAULT sysdate
        CONSTRAINT BK_AD_NN NOT NULL
);

CTEATE TABLE grouper(
    gno NUMBER(2) 
        CONSTRAINT GR_GNO_PK PRIMARY KEY,
    smgr VARCHAR2(10CHAR)
        CONSTRAINT GR_SM_NN NOT NULL,
    biggr VARCHAR2(10CHAR)
        CONSTRAINT GR_BG_NN NOT NULL
);


-- 테이블에 데이터 채우기


