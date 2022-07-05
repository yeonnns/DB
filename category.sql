

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