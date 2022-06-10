CREATE TABLE surveyInfo(
    sino NUMBER(4)
        CONSTRAINT SI_NO_PK PRIMARY KEY,
    sititle VARCHAR(50 CHAR)
        CONSTRAINT SI_TITLE_NN NOT NULL,
    sistart DATE,
    siend DATE
);

CREATE TABLE surveyQuest(
    sqno NUMBER(6)
        CONSTRAINT SQ_NO_PK PRIMARY KEY,
    sbody VARCHAR(50 CHAR)
        CONSTRAINT SQ_BODY_NN NOT NULL,
    squpno NUMBER(6),
    sq_sino NUMBER(4)
        CONSTRAINT SQ_SINO_FK REFERENCES surveyInfo(sino)
        CONSTRAINT SQ_SINO_NN NOT NULL
);

CREATE TABLE servey(
    svno NUMBER(6)
        CONSTRAINT SV_NO_PK PRIMARY KEY,
    smno NUMBER(4)
        CONSTRAINT SV_MNO_FK REFERENCES member(mno)
        CONSTRAINT SV_MNO_NN NOT NULL,
    sv_sqno NUMBER(6)
        CONSTRAINT SV_QNO_FK REFERENCES surveyQuest(sqno)
        CONSTRAINT SV_QNO_NN NOT NULL,
    svdate DATE DEFAULT sysdate
        CONSTRAINT SV_DATE_NN NOT NULL
);


------------------------------------1������-----------------------------------


INSERT INTO
    surveyInfo
VALUES(
    1001, '2022�⵵ ��ݱ� ���̵� ��ȣ�� ����', '2022/06/10', '2022/06/16'
);

INSERT INTO
    surveyQuest
VALUES(
    100001, '���� �����ϴ� ���� ���̵� �׷��� �����ϼ���', null, 1001
);

INSERT INTO
    surveyQuest
VALUES(
    100002, '����ũ', 100001, 1001
);

INSERT INTO
    surveyQuest
VALUES(
    100003, '������', 100001, 1001
);

INSERT INTO
    surveyQuest
VALUES(
    100004, '���̺�', 100001, 1001
);


INSERT INTO
    surveyQuest
VALUES(
    100005, '������ũ', 100001, 1001
);

------------------------------------2������-----------------------------------


INSERT INTO
    surveyQuest
VALUES(
   (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyQuest), '���� �����ϴ� ���� ���̵� �׷��� �����ϼ���', null, 1001
);

INSERT INTO
    surveyQuest
VALUES(
     (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyquest), '���̴�', 100006, 1001
);

INSERT INTO
    surveyQuest
VALUES(
     (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyQuest), '����', 100006, 1001
);

INSERT INTO
    surveyQuest
VALUES(
     (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyQuest), 'BTS', 100006, 1001
);


INSERT INTO
    surveyQuest
VALUES(
     (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyQuest), '����ű�', 100006, 1001
);

------------------------------------3������-----------------------------------


INSERT INTO
    surveyQuest
VALUES(
   (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyQuest), '���� �����ϴ� ���� ���̵� ����� �����ϼ���', null, 1001
);

INSERT INTO
    surveyQuest
VALUES(
     (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyQuest), 'RM', 100011, 1001
);

INSERT INTO
    surveyQuest
VALUES(
     (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyQuest), '������ȣ', 100011, 1001
);

INSERT INTO
    surveyQuest
VALUES(
     (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyQuest), '������', 100011, 1001
);


INSERT INTO
    surveyQuest
VALUES(
     (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyQuest), '����', 100011, 1001
);


------------------------------------4������-----------------------------------


INSERT INTO
    surveyQuest
VALUES(
   (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyQuest), '���� �����ϴ� ���� ���̵� ����� �����ϼ���', null, 1001
);

INSERT INTO
    surveyQuest
VALUES(
     (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyquest), '�¿�', 100016, 1001
);

INSERT INTO
    surveyQuest
VALUES(
     (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyquest), '����', 100016, 1001
);

INSERT INTO
    surveyQuest
VALUES(
     (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyquest), '�ճ���', 100016, 1001
);


INSERT INTO
    surveyQuest
VALUES(
     (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyquest), '����', 100016, 1001
);

------------------------------------5������-----------------------------------


INSERT INTO
    surveyQuest
VALUES(
   (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyQuest), '���� �����ϴ� ����ũ ����� �����ϼ���', null, 1001
);

INSERT INTO
    surveyQuest
VALUES(
     (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyquest), '����', 100021, 1001
);

INSERT INTO
    surveyQuest
VALUES(
     (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyquest), '����', 100021, 1001
);

INSERT INTO
    surveyQuest
VALUES(
     (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyquest), '����', 100021, 1001
);


INSERT INTO
    surveyQuest
VALUES(
     (SELECT NVL(MAX(SQNO) + 1, 100001) FROM surveyquest), '����', 100021, 1001
);

commit;
    
-- �������� �������� �̱�
SELECT 
    sbody
FROM
    surveyQuest
WHERE
   sq_sino IN (
        SELECT
            sino
        FROM
            surveyinfo
        WHERE
            SYSDATE BETWEEN sistart AND siend
    )
    AND squpno IS NULL
;
        
        
-- ���� ���ѻ��
SELECT 
    count(smno) �������� 
FROM
    servey
WHERE
  sv_sqno IN
  (
      SELECT
        sqno
      FROM
        surveyQuest
      WHERE
        (
        sq_sino IN (
            SELECT
                sino
            FROM
                surveyinfo
            WHERE
                SYSDATE BETWEEN sistart AND siend
        )
        AND squpno  IS NOT NULL
        )
    )
;

SELECT
    COUNT(*)
FROM
    surveyInfo
WHERE
    SYSDATE BETWEEN sistart AND siend
    AND sino NOT IN(
        SELECT
            DISTINCT sq_sino
        FROM
            survey, surveyquest, member
        WHERE
            sv_sqno = sqno
            AND smno = mno
            AND id = 'euns'
        )
    ;


INSERT INTO
    survey(svno, smno, sv_sqno)
VALUES(
    (SELECT NVL(MAX(svno) + 1 , 100001) FROM survey),
    1000, 100002
);

INSERT INTO
    survey(svno, smno, sv_sqno)
VALUES(
    (SELECT NVL(MAX(svno) + 1 , 100001) FROM survey),
    1000, 100009
);

INSERT INTO
    survey(svno, smno, sv_sqno)
VALUES(
    (SELECT NVL(MAX(svno) + 1 , 100001) FROM survey),
    1000, 100014
);

INSERT INTO
    survey(svno, smno, sv_sqno)
VALUES(
    (SELECT NVL(MAX(svno) + 1 , 100001) FROM survey),
    1000, 100018
);

INSERT INTO
    survey(svno, smno, sv_sqno)
VALUES(
    (SELECT NVL(MAX(svno) + 1 , 100001) FROM survey),
    1000, 100022
);

-- �������� ���� ����Ʈ ��������(����Ƚ��)
SELECT
    
        sino, sititle title,
        NVL(
            (SELECT
                 COUNT(DISTINCT sq_sino)
            FROM
                survey, surveyQuest, member
            WHERE
                sv_sqno = sqno
                AND smno = mno
                AND id = 'euns'
            GROUP BY
                sq_sino
            HAVING
                sq_sino = sino), 0)  cnt
FROM
    surveyInfo
WHERE
    sysdate  BETWEEN sistart AND siend
;

-- ����� ���� ����Ʈ �������� ���Ǹ��

SELECT
    sino, sititle title
FROM
    surveyInfo
WHERE
    siend < sysdate
;