-- ��Ÿ�Լ��� ó��

/*
    ���� 1 ]
        �� ���޺��� �ѱ� �������� 
        �������
            ����̸�, ����, �ѱ�����
        �� ��ȸ�ϼ���.
        
        MANAGER     : ������
        SALESMAN    : �������
        CLERK       : ����
        ...
*/


SELECT
    ename ����̸�, job ����, DECODE(job, 'MANAGER', '������', 'SALESMAN','�������',
    'CLERK', '����', 'ANALYST', '�м���', 'PRESIDENT', '��ǥ') �ѱ�����

FROM
    emp
;


/*
    ���� 2 ]
        �� �μ����� �̹��� ���ʽ��� �ٸ��� �����Ϸ��� �Ѵ�.
        10 �� �μ��� �޿��� 10%
        20 �� �μ��� �޿��� 15%
        30 �� �μ��� �޿��� 20% �� �����ϱ�� �ߴ�.
        �׸��� �ű⿡ ������ Ŀ�̼��� ���ؼ� �޿��� �����ϱ�� �ߴ�.
        Ŀ�̼��� ���� ����� Ŀ�̼��� 0���� �ؼ� ����ؼ�
        �������
            ����̸�, �μ���ȣ, �޿�, ���ޱ޿�
        �� ��ȸ�ϼ���.
*/
      

SELECT
    ename ����̸�, deptno �μ���ȣ, sal �޿�, comm Ŀ�̼�,
    FLOOR(
    case    when deptno = 10 THEN NVL2(comm, sal*1.1+comm, sal*1.1 )
            when deptno = 20 THEN NVL2(comm, sal*1.15+comm, sal*1.15 )
            when deptno = 30 THEN NVL2(comm, sal*1.2+comm, sal*1.2 )
    END
    ) 
    ���ޱ޿�
FROM
    emp
;

/*
    ���� 3 ]
        �Ի�⵵�� �������� �ؼ�
            80�� 'A���'
            81�� 'B���'
            82�� 'C���'
            �� �̿��� �ؿ� �Ի��� ����� 'D���'
            ���� ��ȸ�ǵ��� 
            �������
                ����̸�, ����, �Ի���, ���
            �� ��ȸ�ϼ���.
*/

SELECT
     ename ����̸�, job ����, hiredate �Ի���, 
     SUBSTR(hiredate, 1, 2) �Ի�⵵,
     CASE   WHEN  SUBSTR(hiredate, 1, 2)='80' THEN 'A���'
            WHEN  SUBSTR(hiredate, 1, 2)='81' THEN 'B���'
            WHEN  SUBSTR(hiredate, 1, 2)='82' THEN 'C���'
            ELSE 'D���'
     END ���
FROM
    emp
;

/*
    ���� 4 ]
        ����̸��� ���ڼ��� 4���ڸ� 'Mr.'�� �̸��տ� ���̰�
        4���ڰ� �ƴϸ� �ڿ� ' ��'���� ��ȸ�ǵ���
        �������
            ����̸�, �̸����ڼ�, ��ȸ�̸�
        �� ��ȸ�ϼ���.
*/

SELECT
    ename ����̸�, LENGTH(ename) �̸����ڼ�, 
    CASE    WHEN    LENGTH(ename)=4 THEN 'Mr.'||ename
            ELSE   ename||' ��' 
    END ��ȸ�̸�
FROM
    emp
;    


/*
    ���� 5 ]
        �μ���ȣ�� 10 �Ǵ� 20���̸�   �޿� + Ŀ�̼����� �����ϰ�
        �� �̿��� �μ��� �޿��� �����Ϸ��� �Ѵ�.
        �������
            ����̸�, ����, �μ���ȣ, �޿�, Ŀ�̼�, ���ޱ޿�
        �� ��ȸ�ϼ���.
        ��, Ŀ�̼��� ���� ���� 0���� ����ؼ� ����ϴ� ������ �Ѵ�.
*/
SELECT
    ename ����̸�, job ����, deptno �μ���ȣ, sal �޿�, NVL(comm,0) Ŀ�̼�,
    CASE    WHEN   (deptno IN(10,20)) THEN sal+NVL(comm,0)
            ELSE    sal
    END
    ���ޱ޿�
FROM
    emp
;    
/*
    ���� 6 ]
        �Ի������ �����, �Ͽ��� �� �����
            �޿��� 20% ���ؼ� �����ϰ�
        �� �̿��� ���Ͽ� �Ի��� �����
            �޿��� 10%�� ���ؼ� �����Ϸ��� �Ѵ�.
            
        �������
            ����̸�, �޿�, �Ի���, �Ի����, ���ޱ޿�
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�,  sal �޿�, hiredate �Ի���, 
   
    CASE    WHEN ( NEXT_DAY(hiredate,'��') - hiredate ) = 7 THEN sal*1.2
            WHEN ( NEXT_DAY(hiredate,'��') - hiredate ) = 7 THEN sal*1.2
            ELSE  sal*1.1
    END ���ޱ޿�
    , ( NEXT_DAY(hiredate,'��') - hiredate ) "��7��6 ����"
  
FROM
    emp
;    

SELECT
    sysdate-1
FROM
    dual
;

/*
    ���� 7 ]
        �ٹ��������� 490���� �̻��� �����
            Ŀ�̼��� 500 �� �߰��ؼ� �����ϰ�
        �ٹ��������� 490���� �̸��� �����
            Ŀ�̼��� ����Ŀ�̼Ǹ� �����ϵ��� �� �����̴�.
        �������
            ����̸�, Ŀ�̼�, �Ի���, �ٹ�������, ����Ŀ�̼�
        �� ��ȸ�ϼ���.
        ��, Ŀ�̼��� ���� ����� 0���� ����ϴ� ������ �Ѵ�.
*/
SELECT
    ename ����̸�, NVL(comm,0) Ŀ�̼�, hiredate �Ի���, 
    ROUND(MONTHS_BETWEEN(sysdate, hiredate)) "�ٹ�������",
    CASE    WHEN (MONTHS_BETWEEN(sysdate, hiredate)) > 489 THEN (NVL(comm,0)+500)
            ELSE  NVL(comm,0)
    END ����Ŀ�̼�
 FROM
    emp
;    
/*
    ���� 8 ]
        �̸� ���ڼ��� 5���� �̻��� ����� �̸���
            3����*** �� ǥ���ϰ�(�̸����̿� ���� * �� ǥ��...)
        �̸� ���ڼ��� 4���� ������ ����� �״�� ����� �����̴�.
        �������
            ����̸�, �̸����ڼ�, ��ȸ�̸�
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, LENGTH(ename) �̸����ڼ�,
    CASE    WHEN LENGTH(ename) >= 5 THEN  RPAD(SUBSTR(ename,1,3),LENGTH(ename),'*')
            ELSE    ename  
    END ��ȸ�̸�
FROM
    emp
;    
--------------------------------------------------------------------------------
-- group by

/*
    ���� 1 ]
        �� �μ����� �ּ� �޿��� ��ȸ�Ϸ��� �Ѵ�.
        ���μ���
            �μ���ȣ, �ּұ޿�
        �� ��ȸ�ϼ���.
*/
SELECT
    deptno �μ���ȣ, MIN(sal) �ּұ޿�
FROM
    emp
GROUP BY
    deptno
;    
/*
    ���� 2 ]
        �� ���޺��� �޿��� �Ѿװ� ��ձ޿��� ���ް� �Բ� ��ȸ�ϼ���.
*/
SELECT
    job ����, SUM(sal) �޿��Ѿ�, ROUND(AVG(sal))��ձ޿� 
FROM
    emp
GROUP BY
    job
;    
/*
    ���� 3 ]
        �Ի� �⵵���� ��� �޿��� �ѱ޿��� ��ȸ�ϼ���.
*/
SELECT
    SUBSTR(hiredate,1,2) �Ի�⵵ ,AVG(sal) ��ձ޿�, SUM(sal) �ѱ޿�
FROM
    emp
GROUP BY
   SUBSTR(hiredate,1,2)
;    
/*
    ���� 4 ]
        �� �⵵���� �Ի��� ������� ��ȸ�ϼ���.
*/
SELECT
    SUBSTR(hiredate,1,2) �Ի�⵵ , COUNT(*) �����
FROM
    emp
GROUP BY
    SUBSTR(hiredate,1,2)
;    
/*
    ���� 5 ]
        ��� �̸��� ���ڼ��� �������� �׷�ȭ�ؼ� ��ȸ�Ϸ��� �Ѵ�.
        ��� �̸��� ���ڼ��� 4, 5 ������ ����� ���� ��ȸ�ϼ���.
*/
SELECT
    LENGTH(ename) ���ڼ�, COUNT(*) ����Ǽ�
FROM
    emp
GROUP BY
    LENGTH(ename)
HAVING
    LENGTH(ename) IN (4 ,5)
;    
/*
    ���� 6 ]
        81�⵵�� �Ի��� ����� ���� ���޺��� ��ȸ�ϼ���.
*/
SELECT
   SUBSTR(hiredate,1,2) �Ի�⵵, COUNT(*)
FROM
    emp
GROUP BY
    SUBSTR(hiredate,1,2)
HAVING
    SUBSTR(hiredate,1,2) = 81
;    
/*
    ���� 7 ]
        ����̸��� ���ڼ��� 4, 5������ ����� ���� �μ����� ��ȸ�ϼ���.
        ��, ������� �ѻ�� ������ �μ��� ��ȸ���� �����ϼ���.
*/
SELECT
    deptno �μ���ȣ, count(deptno) �����
FROM
    emp
WHERE 
    LENGTH(ename) in (4,5)
GROUP BY
    deptno
HAVING
    count(deptno) > 1
;    
/*
    ���� 8 ]
        81�⵵ �Ի��� ����� ��ü �޿��� ���޺��� ��ȸ�ϼ���.
        ��, ���޺� ��� �޿��� 1000 �̸��� ������ ��ȸ���� �����ϼ���.
*/
SELECT
    job ����,  SUM(sal) ��ձ޿�
FROM
    emp
WHERE
    SUBSTR(hiredate,1,2) = 81
GROUP BY
    JOB
HAVING
    SUM(sal) > 1000
;    
/*
    ���� 9 ]
        81�⵵ �Ի��� ����� �� �޿��� ����̸����ڼ� ���� �׷�ȭ�ϼ���.
        ��, �� �޿��� 2000 �̸��� ���� ��ȸ���� �����ϰ�
        �� �޿��� ���� �������� ���� ������� ��ȸ�ǰ� �ϼ���.
*/
SELECT
    LENGTH(ename) �̸����ڼ�, SUM(sal) �ѱ޿�
FROM
    emp
WHERE
    SUBSTR(hiredate,1,2) = 81
GROUP BY
    LENGTH(ename)
HAVING
    SUM(sal) >= 2000
ORDER BY
    SUM(sal) desc
;    
/*
    ���� 10 ]
        ��� �̸� ���̰� 4, 5 ������ ����� �μ��� ������� ��ȸ�ϼ���.
        ��, ������� 0�� ���� ��ȸ���� �����ϰ�
        �μ���ȣ ������� ��ȸ�ϼ���.
*/
SELECT
    deptno �μ�, COUNT(job) �����
FROM
    emp
WHERE
    LENGTH(ename) in (4,5)
GROUP BY
    deptno
HAVING 
    COUNT(LENGTH(ename)) > 0
;    