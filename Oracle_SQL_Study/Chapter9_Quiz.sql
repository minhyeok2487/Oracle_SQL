--Q1
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME
    FROM EMP E, DEPT D
    WHERE JOB = (SELECT JOB
                    FROM EMP
                    WHERE ENAME = 'ALLEN')
    AND E.DEPTNO = D.DEPTNO;
    
--Q2
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
    FROM EMP E, DEPT D, SALGRADE S
    WHERE E.SAL > (SELECT AVG(SAL)
                    FROM EMP)
    AND E.DEPTNO = D.DEPTNO
    AND E.SAL BETWEEN S.LOSAL AND S.HISAL
    ORDER BY E.SAL DESC, E.EMPNO;
    
--Q3
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND E.DEPTNO = 10
    AND JOB NOT IN (SELECT JOB
                    FROM EMP
                    WHERE DEPTNO = 30);
                    
--Q4
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
  FROM EMP E, SALGRADE S
 WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
   AND SAL > (SELECT MAX(SAL)
                FROM EMP
               WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO; 