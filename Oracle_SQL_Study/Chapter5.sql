--�μ� ��ȣ�� 30�� �����͸� ����ϱ�
SELECT *
    FROM EMP
    WHERE DEPTNO = 30;
    
--�μ� ��ȣ�� 30, ������ SALESMAN�� ��츸 ����ϱ�
SELECT *
    FROM EMP
    WHERE DEPTNO = 30
    AND JOB = 'SALESMAN';
    
--�μ� ��ȣ�� 30�̰ų� ������ CLERK�� ��츸 ����ϱ�
SELECT *
    FROM EMP
    WHERE DEPTNO = 30
    OR JOB = 'CLERK';
    
--���� ��� �����ڸ� ����� ��
SELECT *
    FROM EMP
    WHERE SAL * 12 = 36000;
    
--��� �� �����ڸ� ����� ��
SELECT *
    FROM EMP
    WHERE SAL >= 3000;
    
--���ڸ� ��� �� �����ڷ� ���ϱ�
SELECT * FROM EMP
    WHERE ENAME >= 'F'; --ù���� F~Z

SELECT * FROM EMP
    WHERE ENAME <= 'FORZ';
    
--� �� ������(�� �� ����� ����)
SELECT * FROM EMP
    WHERE SAL != 3000;
SELECT * FROM EMP
    WHERE SAL <> 3000;
SELECT * FROM EMP
    WHERE SAL ^= 3000;

--�� ���� ������
SELECT * FROM EMP
    WHERE NOT SAL = 3000;
    
--IN ������ ���
SELECT * FROM EMP
    WHERE JOB IN ('MANAGER','SALESMAN','CLERK');
    
--IN�� �� ���� ������ ���� ���
SELECT * FROM EMP
    WHERE JOB NOT IN ('MANAGER','SALESMAN','CLERK');
    
--BETWEEN ������
SELECT * FROM EMP
    WHERE SAL BETWEEN 2000 AND 3000;

SELECT * FROM EMP
    WHERE SAL NOT BETWEEN 2000 AND 3000;
    
--�Ϻ� ���ڿ� ���� ������ LIKE
SELECT * FROM EMP
    WHERE ENAME LIKE 'S%';
    
--��� �̸��� �� ��° ���ڰ� L�� ����� ����ϱ�
SELECT * FROM EMP
    WHERE ENAME LIKE '_L%';
    
--��� �̸��� AM�� ���ԵǾ� �ִ� ��� �����͸� ����ϱ�
SELECT * FROM EMP
    WHERE ENAME LIKE '%AM%';
    
--��� �̸��� AM�� ���ԵǾ� ���� ���� ��� �����͸� ����ϱ�
SELECT * FROM EMP
    WHERE ENAME NOT LIKE '%AM%';

--NULL�� ã��
SELECT * FROM EMP
    WHERE COMM IS NULL;
    
--���� ����� �ִ� ��� �����͸� ���
SELECT * FROM EMP
    WHERE MGR IS NOT NULL;
    
--���� ������ UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION    
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 20;
    
--UNION ALL�� �ߺ� ����
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION ALL   
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    
--������ ������ MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
MINUS   
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;

--������ ������ INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
INTERSECT   
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    
--Q1
SELECT * FROM EMP
    WHERE ENAME LIKE '%S';

--Q2
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 30
    AND JOB = 'SALESMAN';
    
--Q3
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO >= 20
    AND SAL > 2000;
    
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO >= 20
INTERSECT
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE SAL > 2000;  

--Q4
SELECT * FROM EMP
    WHERE SAL <= 2000
    OR SAL >= 3000;
    
--Q5
SELECT ENAME, EMPNO, SAL, DEPTNO
    FROM EMP
    WHERE SAL NOT BETWEEN 1000 AND 2000
    AND DEPTNO = 30
    AND ENAME LIKE '%E%';
    
--Q6
SELECT * FROM EMP
    WHERE COMM IS NULL
    AND JOB IN ('MANAGER','CLERK')
    AND ENAME NOT LIKE '_L%'