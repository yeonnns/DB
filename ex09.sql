INSERT INTO
    member(mno, name, id, pw, mail, tel, gen, avt)
VALUES(
    MEMBSEQ.nextval, 'yuna', 'yuna', '12345', 'yuna@githrd.com', '010-6464-6464', 'F', 14
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, gen, avt)
VALUES(
    MEMBSEQ.nextval, 'seora', 'seora', '12345', 'seora@githrd.com', '010-3434-3434', 'F', 15
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, gen, avt)
VALUES(
    MEMBSEQ.nextval, '백서진', 'sjin', '12345', 'sjin@githrd.com', '010-3737-3737', 'F', 16
);


UPDATE
    member
SET
    name = '정유나'
WHERE
    name = 'yuna'
;

UPDATE
    member
SET
    name = '한서라'
WHERE
    name = 'seora'
;

commit;



CREATE VIEW MEMB
AS
    SELECT
        mno,   
    FROM
    
;

CREATE OR REPLACE VIEW buddy
AS
    SELECT
        mno, name, id, gen
    FROM
        member   
;

SELECT
    *
FROM
    buddy
;


SELECT
    *
FROM
    scott.emp
;


CREATE SYNONYM jemp
FOR scett.emp; -- 오타

SELECT
    *
FROM
    jemp
;

CREATE PUBLIC SYNONYM pemp
FOR scott.emp;

CREATE OR REPLACE VIEW TVIEW
AS
     SELECT
        mno, name, id
    FROM
        member
;

CREATE PUBLIC SYNONYM tmp
FOR tview
;
