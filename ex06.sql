-- DML (INSERT, UPDATE, DELETE)

/*
        ���� 1 ]
        epm1 ���̺� ���� �����͸� �Է��ϼ���.
        �̸�  : �Ѹ�
        ����  : �ӽ�
        �޿�  : 10
        �Ի��� : ����ð�
*/


INSERT INTO
    emp1(empno, ename, job, sal, hiredate)
VALUES(
    1005, '�Ѹ�', '�ӽ�', 10, sysdate
);

/*
    ���� 2 ]
    emp1 ���̺� ���������͸� �Է��ϼ���.
    
    �̸�   : ��浿
    ����   : ���� --> �ֿϵ���
    �Ի��� : 2022�� 03�� 21��
*/


ALTER TABLE emp1
MODIFY job VARCHAR2(10 CHAR);


ALTER TABLE emp1
MODIFY ename VARCHAR2(10 CHAR);

INSERT INTO
    emp1(empno, ename, job, hiredate)
VALUES(
    1006, '��浿', '����', '2022/03/21'
);

UPDATE
    emp1
SET
    job = '�ֿϵ���'
WHERE
    ename = '��浿'
;

/*
    ���� 3 ]
        emp1 ���̺� ���� �����͸� �Է��ϼ���.

        �̸� : ����
        ���� : ����
        �޿� : NULL
        �Ի��� : 2022�� 01�� 01��
    
*/

INSERT INTO
    emp1(empno, ename, job, sal, hiredate)
VALUES(
    1007, '����', '����', NULL, '2022/01/01'
);

UPDATE
    emp1
SET
    job = '����'
WHERE
    ename = '����'
;
commit;

-- ������ ����

/*
    ���� 4 ]
        emp1 ���̺��� ���� �����͸� �����ϼ���.
        ����, ����, ����, ����
        ����� �̸��� �̸��տ� 'Ms.' �ٿ���
        �̸��� ��������� �����ϼ���
        ������ ������� �̸� �տ� 'Mr.'�� �ٿ���
        �����ϼ���.
*/

UPDATE
    emp1
SET
    ename = DECODE(ename, '����', 'Miss.' || ename,
                          '����', 'Miss.' || ename,
                          '����', 'Miss.' || ename,
                          '����', 'Miss.' || ename,
                          'Mr.' || ename
    )
;

/
/*
    ���� 5 ]
        emp1 ���̺��� 
        �Ի�⵵�� 81�⵵�� �����
        �޿��� 25% �λ��ϴµ� 10���� ���ϴ�
        �������� ó���ϼ���.
*/
UPDATE
    emp1
SET
    sal = TRUNC(sal*1.25,-1)
WHERE
    TO_CHAR(hiredate,'YY') = '81'
;
-- �ٸ� ���̺��� ������ ����


/*  
    ���� 6 ]
        emp ���̺��� 'SMITH' ����� �����͸� �����ؼ�
        emp1 ���̺� �Է��ϼ���.

*/

INSERT INTO
    emp1
(
    SELECT
        *
    FROM
        emp
    WHERE
        ename = 'SMITH'
)
;
    

-- ������ ����

/*
    ���� 7 ]
        emp1 ���̺��� �μ���ȣ�� 10���� ����� �����ϼ���.
*/
DELETE 
    FROM 
        emp1
ROLLBACK;
 
DELETE 
    FROM 
        emp1   
    WHERE
        deptno = 10
;


commit;
/*
    ���� 8 ]
        emp1 ���̺��� �̸��� 'H' �� ������ ����� �����ϼ���.
*/

DELETE 
    FROM 
        emp1   
    WHERE
        ename = '%H'
;
commit;