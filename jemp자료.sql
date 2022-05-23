

ALTER TABLE jemp
MODIFY hiredate DEFAULT sysdate;


INSERT INTO
    jemp(empno, ename, job, deptno)
VALUES(
    1002, 'LISA', 'ANALYST', 20
);


SELECT
   empno, ename, job, hiredate, deptno
FROM
    jemp
WHERE
    hiredate = (
        SELECT
            MAX(hiredate)
        FROM
            jemp  
        )
;

commit;

INSERT INTO jemp
    SELECT
        *
    FROM
        emp
    WHERE
        deptno = 30;
    ;
    
CREATE TABLE jbackup
AS
    SELECT
        e.*, sysdate fdate
    FROM
        jemp e
    WHERE
        1=2
    ;
    
    
ALTER TABLE jbackup
MODIFY fdate DEFAULT sysdate;

ALTER TABLE jbackup
ADD
    CONSTRAINT JBUP_NO_PK PRIMARY KEY(empno);



INSERT INTO jbackup
SELECT
    e.*, sysdate
FROM
    jemp e
WHERE
    deptno = 30
;