--�������� ����
SELECT *
    FROM EMP
    WHERE SAL > (SELECT SAL
                    FROM EMP
                    WHERE ENAME = 'JONES');
                    
--��¥�� ������ ������ ��������
SELECT *
    FROM EMP
    WHERE HIREDATE < (SELECT HIREDATE
                        FROM EMP
                        WHERE ENAME = 'SCOTT');
                        
--20�� �μ��� ���� ��� �� ��ü ��� ��� �޿����� 
--���� �޿��� �޴� ��� ������ �ҼӺμ� ���� ��ȸ
SELECT 
    E.EMPNO, E.ENAME, E.JOB, E.SAL,
    D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND E.DEPTNO = 20
    AND E.SAL > (SELECT AVG(SAL) FROM EMP);
    
--������ ��������
--IN
SELECT *
    FROM EMP
    WHERE DEPTNO IN (20,30);
    
--�� �μ��� �ְ� �޿��� ������ �޿��� �޴� ��� ���� ���
SELECT *
    FROM EMP
    WHERE SAL IN (SELECT MAX(SAL)
                        FROM EMP
                        GROUP BY DEPTNO);

--ANY, SOME ������
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
    
--ALL ������
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
                        
--���߿� ��������
SELECT *
    FROM EMP
    WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
                                FROM EMP
                                GROUP BY DEPTNO);
                                
--FROM���� ����ϴ� ��������
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
    FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
        (SELECT * FROM DEPT) D
    WHERE E10.DEPTNO = D.DEPTNO;
    
--WITH�� ����ϱ�
WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D   AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
    FROM E10, D
    WHERE E10.DEPTNO = D.DEPTNO;

--SELECT���� ����ϴ� ��������
SELECT EMPNO, ENAME, JOB, SAL,
    (SELECT GRADE
        FROM SALGRADE
        WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
    DEPTNO,
    (SELECT DNAME
        FROM DEPT
        WHERE E.DEPTNO = DEPT. DEPTNO) AS DNAME
    FROM EMP E;