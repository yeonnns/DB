/*
    문제 1 ]
        직급이 MANAGER 인 사원의
        사원이름, 직급, 입사일, 급여, 부서이름을 조회하세요.
*/

SELECT
    ename 사원이름, job 직급, hiredate 입사일, sal 급여, dname 부서이름
FROM
     emp e, dept d
WHERE

    e.deptno = d.deptno
    AND job = 'MANAGER'
;



/*
    문제 2 ]
        사원이름이 5글자인 사원들의
        사원이름, 직급, 입사일, 급여, 급여등급을 조회하세요.
*/


SELECT
    ename 사원이름, job 직급, sal 급여, grade 급여등급
FROM
    emp, salgrade
WHERE
    sal BETWEEN losal AND hisal
    AND ename LIKE '_____'
    ;

/*
    문제 3 ]
        입사일이 81년이고
        직급이 MANAGER인 사원들의
            사원이름, 직급, 입사일, 급여, 급여등급, 부서이름, 부서위치를 조회하세요.
*/

SELECT
    ename 사원이름, job 직급, hiredate 입사일, sal 급여, grade 급여등급, dname 부서이름, loc 부서위치
FROM
    emp e,  dept d, salgrade 
WHERE
     e.deptno = d.deptno              -- 조인조건       
     AND sal BETWEEN losal AND hisal  -- 조인조건
     AND TO_CHAR(hiredate, 'YY') = '81'
     AND job = 'MANAGER'       
    ;
/*
    문제 4 ]
        사원들의
        사원이름, 직급, 급여, 급여등급, 상사이름
        을 조회하세요.
*/

SELECT
     e.ename 사원이름, e.job 직급, e.sal 급여, grade 급여등급,  NVL(s.ename,'상사없음') 상사이름
     
FROM
    emp e, salgrade, emp s 
WHERE
    e.mgr = s.empno(+)
    AND e.sal BETWEEN losal AND hisal
    
;





/*
    문제 5 ]
        사원들의
        사원이름, 직급, 급여, 상사이름, 부서이름, 급여등급을 조회하세요.
*/

SELECT
    e.ename 사원이름, e.job 직급, e.sal 급여, NVL(s.ename,'상사없음') 상사이름, dname 부서이름, grade 급여등급
FROM
    emp e,  emp s ,salgrade, dept d
WHERE
    e.mgr = s.empno(+)
    AND e.sal BETWEEN losal AND hisal
    AND e.deptno = d.deptno
    
;