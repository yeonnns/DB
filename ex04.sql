/*
    ���� 1 ]
        ������ MANAGER �� �����
        ����̸�, ����, �Ի���, �޿�, �μ��̸��� ��ȸ�ϼ���.
*/

SELECT
    ename ����̸�, job ����, hiredate �Ի���, sal �޿�, dname �μ��̸�
FROM
     emp e, dept d
WHERE

    e.deptno = d.deptno
    AND job = 'MANAGER'
;



/*
    ���� 2 ]
        ����̸��� 5������ �������
        ����̸�, ����, �Ի���, �޿�, �޿������ ��ȸ�ϼ���.
*/


SELECT
    ename ����̸�, job ����, sal �޿�, grade �޿����
FROM
    emp, salgrade
WHERE
    sal BETWEEN losal AND hisal
    AND ename LIKE '_____'
    ;

/*
    ���� 3 ]
        �Ի����� 81���̰�
        ������ MANAGER�� �������
            ����̸�, ����, �Ի���, �޿�, �޿����, �μ��̸�, �μ���ġ�� ��ȸ�ϼ���.
*/

SELECT
    ename ����̸�, job ����, hiredate �Ի���, sal �޿�, grade �޿����, dname �μ��̸�, loc �μ���ġ
FROM
    emp e,  dept d, salgrade 
WHERE
     e.deptno = d.deptno              -- ��������       
     AND sal BETWEEN losal AND hisal  -- ��������
     AND TO_CHAR(hiredate, 'YY') = '81'
     AND job = 'MANAGER'       
    ;
/*
    ���� 4 ]
        �������
        ����̸�, ����, �޿�, �޿����, ����̸�
        �� ��ȸ�ϼ���.
*/

SELECT
     e.ename ����̸�, e.job ����, e.sal �޿�, grade �޿����,  NVL(s.ename,'������') ����̸�
     
FROM
    emp e, salgrade, emp s 
WHERE
    e.mgr = s.empno(+)
    AND e.sal BETWEEN losal AND hisal
    
;





/*
    ���� 5 ]
        �������
        ����̸�, ����, �޿�, ����̸�, �μ��̸�, �޿������ ��ȸ�ϼ���.
*/

SELECT
    e.ename ����̸�, e.job ����, e.sal �޿�, NVL(s.ename,'������') ����̸�, dname �μ��̸�, grade �޿����
FROM
    emp e,  emp s ,salgrade, dept d
WHERE
    e.mgr = s.empno(+)
    AND e.sal BETWEEN losal AND hisal
    AND e.deptno = d.deptno
    
;