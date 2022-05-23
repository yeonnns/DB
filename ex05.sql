/*
    ���� 1 ]
        �̸��� SMITH�� ����� ������ ������ ���� ������� ������ ����ϼ���.
*/

SELECT
     ename ����̸�, job ����, deptno �μ���ȣ
FROM    
    emp
WHERE
    job in(
            SELECT
                job    
            FROM
                emp
            WHERE
                ename = 'SMITH'
    )
;

/*
    ���� 2 ]
        ȸ�� ��� �޿����� �޿��� ���� �޴� �������
        ����̸�, ����, �޿�[, ȸ����ձ޿�]
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, sal �޿�, 
    (       SELECT
                ROUND(AVG(sal))
            FROM    
                emp) ȸ����ձ޿�
FROM
    emp
WHERE
    sal < ALL (
            SELECT
                ROUND(AVG(sal))
            FROM    
                emp
        
    )
;    

/*
    ���� 3 ]
        ������� �޿��� ���� ���� �����
        ����̸�, ����, �޿�[, �ְ�޿�]
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, sal �޿�, 
    (
       SELECT
            MAX(sal)
        FROM 
            emp
    ) �ְ�޿�
FROM
    emp
WHERE
    sal >= All(
    
        SELECT
            MAX(sal)
        FROM 
            emp
    )
;

/*
    ���� 4 ]
        KING ������� ���Ŀ� �Ի��� �������
        ����̸�, ����, �Ի���[, KING����Ի���]
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, hiredate �Ի���,
    (   
        SELECT
            hiredate
        FROM 
            emp
        WHERE
            ename = 'KING'
    )  ŷ����Ի���
FROM
    emp
WHERE
    hiredate > ANY (
                SELECT
                    hiredate
                FROM
                    emp
                WHERE
                    ename = 'KING'
             )
;

/*
    ���� 5 ]
        �� ����� �޿��� ȸ����ձ޿��� ���� ����ϼ���.
        ��ȸ������
            ����̸�, �޿�, �޿��� ��, ȸ����ձ޿�
        �� ��ȸ�ϼ���.
*/

SELECT
    ename ����̸�, sal �޿� ,  
    (sal-(
        SELECT
            ROUND(AVG(sal))
        FROM
            emp
    )) �޿�����
    ,(
        SELECT
            ROUND(AVG(sal))
        FROM
            emp
    ) ȸ����ձ޿�
FROM
    emp

;    


/*
    ���� 6 ]
        �μ��� �޿��� ���� ���� ���� �μ� �������
        ����̸�, ����, �μ���ȣ, �μ��̸�, �μ��޿��հ�, �μ�����
        �� ��ȸ�ϼ���.
  
        
*/


-- �޿��� ���� ���� ���� �μ�
SELECT
    deptno
FROM
    emp
GROUP BY
    deptno
HAVING
    SUM(sal) =
                 (       
                        SELECT
                            max(SUM(sal))
                        FROM
                            EMP
                        GROUP BY
                            DEPTNO
                    )
;


SELECT
    ename ����̸�, job ����, dno �μ���ȣ, dname �μ��̸�, 
    sum �μ��޿��հ�, cnt �μ�����
FROM
    emp e,
    dept d,
    (
        SELECT
            deptno dno, COUNT(*) cnt, SUM(sal) sum
        FROM
            emp
        GROUP BY
            deptno        
    )
WHERE
    e.deptno = dno
    AND e.deptno = d.deptno
    AND e.deptno = (
                        SELECT
                            deptno
                        FROM
                            emp
                        GROUP BY
                            deptno
                        HAVING
                            SUM(sal) >= ALL
                                         (       
                                                SELECT
                                                    SUM(sal)
                                                FROM
                                                    EMP
                                                GROUP BY
                                                    DEPTNO
                                            )
;
/*
    ���� 7 ]
        Ŀ�̼��� �޴� ����� �Ѹ��̶� �ִ� �μ��� �������
        ����̸�, ����, �μ���ȣ, Ŀ�̼�
        �� ��ȸ�ϼ���.
*/
SELECT
    ename, job, deptno, comm
FROM
    emp 
WHERE
   deptno IN(
        SELECT
            deptno
        FROM
            emp
        where
            comm is not null
   )
;
   
    

    

/*
    ���� 8 ]
        ȸ�� ��ձ޿����� ���� 
        �̸��� 4, 5������ �������
        ����̸�, �޿�, �̸����ڱ���[, ȸ����ձ޿�]
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, sal �޿�, LENGTH(ename) �̸����ڱ���, 
    (
            SELECT
              ROUND(avg(sal))
            FROM
              emp
    ) ȸ����ձ޿�
FROM
    emp
WHERE
    LENGTH(ename) IN ('4','5')
    AND sal > ALL(
                SELECT
                    ROUND(avg(sal))
                FROM
                    emp
                    )
;
/*
    ���� 9 ]
        ����̸��� ���ڼ��� 4������ ����� ���� ������ ���� �������
        ����̸�, ����, �޿�
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, sal �޿�
FROM
    emp
WHERE
    job IN (
        SELECT  
            job
        FROM
            emp
        WHERE
            LENGTH(ename) = '4'
                )        
;


/*
    ���� 10 ]
        �Ի�⵵�� 81���� �ƴ� ����� ���� �μ��� �ִ� �������
        ����̸�, ����, �޿�, �Ի���, �μ���ȣ
        �� ��ȸ�ϼ���.
*/

SELECT
    ename ����̸�, job ����, sal �޿�, hiredate �Ի���, deptno �μ���ȣ
FROM
    emp
WHERE
    deptno NOT IN (
        SELECT 
            deptno
        FROM
            emp
        WHERE
            TO_CHAR(hiredate, 'YY') = '81'
        
        )
;

/*
    ���� 11 ]
        ���޺� ��ձ޿����� �� �����̶� �޿��� ���� �޴� �����
        ����̸�, ����, �޿�, �Ի���
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, sal �޿�, hiredate �Ի���
FROM
    emp
WHERE
    sal > ANY(
        SELECT
            AVG(sal)
        FROM
            emp
        GROUP BY
            job
            
    )
;


/*
    ���� 12 ]
        ��� �⵵�� �Ի����� ��� �޿����� ���� �޴� �������
        ����̸�, ����, �޿�, �Ի�⵵
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, sal �޿�, hiredate �Ի���
FROM
    emp
WHERE
    sal > ALL(
        SELECT
            AVG(sal)
        FROM
            emp
        GROUP BY
            TO_CHAR(hiredate, 'YY')
    )
;

/*
    ���� 13 ]
        �ְ�޿����� �̸� ���ڼ��� ���� ���ڼ��� ������ �����ϸ�
        ��� ����� ����̸�, �̸����ڼ�, ����, �޿� �� ��ȸ�ϰ�
        �������� ������ �������������.
*/

SELECT
    ename ����̸�, LENGTH(ename) �̸����ڼ�, job ����, sal �޿�
FROM
    emp
WHERE
    LENGTH(ename) = (
        SELECT
            LENGTH(ename)
        FROM
            emp
        WHERE 
           sal = (
           
           SELECT
            MAX(sal)
           FROM
            emp
                )
       )
    ;
       