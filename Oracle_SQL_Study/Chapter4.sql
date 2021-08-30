DESC EMP;

--EMP ���̺� ��ü �� ��ȸ
SELECT * FROM EMP;

--���� ��ǥ�� �����Ͽ� ����ϱ�
SELECT EMPNO, ENAME, DEPTNO
    FROM EMP;
        
--���� �ߺ� �����ϱ�(���� �� ��)
SELECT DISTINCT DEPTNO
    FROM EMP;
    
--���� �ߺ� �����ϱ�(���� ������)
SELECT DISTINCT JOB, DEPTNO
    FROM EMP;

--�ߺ��Ǵ� �� ���� ���� �״�� ���    
SELECT ALL JOB, DEPTNO
    FROM EMP;
    
--���� ������� ����Ͽ� ���
SELECT ENAME, SAL, SAL*12+COMM, COMM
    FROM EMP;
    
--��Ī ����Ͽ� ����� ���� �� ���� ���    
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
    FROM EMP;

--EMP ���̺��� ��� ���� �޿� �������� �������� �����ϱ�
SELECT *
    FROM EMP
    ORDER BY SAL;
    
--EMP ���̺��� ��� ���� �޿� �������� �������� �����ϱ�
SELECT *
    FROM EMP
    ORDER BY SAL DESC;
    
--EMP ���̺��� ��ü ���� �μ� ��ȣ(��������), �޿�(��������) ����
SELECT *
    FROM EMP
    ORDER BY DEPTNO ASC, SAL DESC;
    

SELECT
    EMPNO AS EMPLOYEE_NO,
    ENAME AS EMPLOYEE_NAME,
    MGR AS MANAGER,
    SAL AS SALARY,
    COMM AS COMMISSION,
    DEPTNO AS DEPARTMENT_NO
    FROM EMP
    ORDER BY DEPTNO DESC, ENAME ASC;














    