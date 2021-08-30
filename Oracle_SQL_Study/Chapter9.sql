--서브쿼리 예제
SELECT *
    FROM EMP
    WHERE SAL > (SELECT SAL
                    FROM EMP
                    WHERE ENAME = 'JONES');
                    
--날짜형 데이터 단일형 서브쿼리
SELECT *
    FROM EMP
    WHERE HIREDATE < (SELECT HIREDATE
                        FROM EMP
                        WHERE ENAME = 'SCOTT');
                        
--20번 부서에 속한 사원 중 전체 사원 평균 급여보다 
--높은 급여를 받는 사원 정보와 소속부서 정보 조회
SELECT 
    E.EMPNO, E.ENAME, E.JOB, E.SAL,
    D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND E.DEPTNO = 20
    AND E.SAL > (SELECT AVG(SAL) FROM EMP);
    
--다중행 서브쿼리
--IN
SELECT *
    FROM EMP
    WHERE DEPTNO IN (20,30);
    
--각 부서별 최고 급여와 동일한 급여를 받는 사원 정보 출력
SELECT *
    FROM EMP
    WHERE SAL IN (SELECT MAX(SAL)
                        FROM EMP
                        GROUP BY DEPTNO);

--ANY, SOME 연산자
SELECT *
    FROM EMP
    WHERE SAL = ANY (SELECT MAX(SAL)
                        FROM EMP
                        GROUP BY DEPTNO);

SELECT *
    FROM EMP
    WHERE SAL = SOME (SELECT MAX(SAL)
                        FROM EMP
                        GROUP BY DEPTNO);
                        
SELECT * 
    FROM EMP
    WHERE SAL < ANY (SELECT SAL
                        FROM EMP
                        WHERE DEPTNO = 30)
    ORDER BY SAL, EMPNO;       
    
SELECT * 
    FROM EMP
    WHERE SAL > ANY (SELECT SAL
                        FROM EMP
                        WHERE DEPTNO = 30)
    ORDER BY SAL, EMPNO;
    
--ALL 연산자
SELECT *
    FROM EMP
    WHERE SAL < ALL (SELECT SAL
                        FROM EMP
                        WHERE DEPTNO = 30);

SELECT *
    FROM EMP
    WHERE SAL > ALL (SELECT SAL
                        FROM EMP
                        WHERE DEPTNO = 30);
                        
--다중열 서브쿼리
SELECT *
    FROM EMP
    WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
                                FROM EMP
                                GROUP BY DEPTNO);
                                
--FROM절에 사용하는 서브쿼리
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
    FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
        (SELECT * FROM DEPT) D
    WHERE E10.DEPTNO = D.DEPTNO;
    
--WITH절 사용하기
WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D   AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
    FROM E10, D
    WHERE E10.DEPTNO = D.DEPTNO;

--SELECT절에 사용하는 서브쿼리
SELECT EMPNO, ENAME, JOB, SAL,
    (SELECT GRADE
        FROM SALGRADE
        WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
    DEPTNO,
    (SELECT DNAME
        FROM DEPT
        WHERE E.DEPTNO = DEPT. DEPTNO) AS DNAME
    FROM EMP E;