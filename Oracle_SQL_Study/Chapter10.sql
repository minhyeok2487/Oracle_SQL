CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;
    
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
    VALUES (50, 'DATABASE', 'SEOUL');
    
SELECT * FROM  DEPT_TEMP;

--INSERT���� �� ���� ���� ������ �߰��ϱ�
INSERT INTO DEPT_TEMP
    VALUES(60, 'NETWORK', 'BUSAN');
    
--���̺��� NULL �Է��ϱ�
--NULL�� �����Ͽ� �Է��ϱ�
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
    VALUES (70, 'WEB', NULL);
    
--����� ���ڿ��� NULL �Է��ϱ�
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
    VALUES (80, 'MOBILE', '');
    
--�� �����͸� ���� �ʴ� ������� NULL �Է��ϱ�
INSERT INTO DEPT_TEMP (DEPTNO, LOC)
    VALUES (90, 'INCHEON');
    
--���̺� ��¥ ������ �Է��ϱ�
--�� ������ �����ؼ� ���̺� �����
CREATE TABLE EMP_TEMP
    AS SELECT * FROM EMP
    WHERE 1<>1;

SELECT * FROM EMP_TEMP;

--��¥ ������ �Է�
INSERT INTO EMP_TEMP(
    EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (9999, 'ȫ�浵', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);
   
INSERT INTO EMP_TEMP(
    EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (1111, '������', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20); 

--�����ϸ� TO_DATE �̿�
INSERT INTO EMP_TEMP(
    EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (2222, '�̼���', 'MANAGER', 9999,TO_DATE('07/01/2001', 'DD/MM/YYYY'),
    4000, NULL, 20);
    
--���� ��¥ �Է� STSDATE
INSERT INTO EMP_TEMP(
    EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (3111, '��û��', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30); 
    
--���������� ����Ͽ� �� ���� ���� ������ �߰��ϱ�
INSERT INTO 
    EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
        FROM EMP E, SALGRADE S
        WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
        AND S.GRADE = 1;
        
--���̺� �ִ� ������ �����ϱ�
SELECT * FROM DEPT_TEMP;
ROLLBACK;
UPDATE DEPT_TEMP
    SET LOC = 'SEOUL';
    
UPDATE DEPT_TEMP
    SET DNAME = 'DATABASE',
        LOC = 'SEOUL'
    WHERE DEPTNO = 40;
    
--���������� ����Ͽ� ������ �����ϱ�
UPDATE DEPT_TEMP
    SET (DNAME, LOC) = (SELECT DNAME, LOC
                        FROM DEPT
                        WHERE DEPTNO = 40)
    WHERE DEPTNO = 40;
    
--���̺� �ִ� ������ �����ϱ�
--EMP ���̺��� �����ؼ� EMP_TEMP2 ���̺� �����
CREATE TABLE EMP_TEMP2
    AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2;

--WHERE���� ����Ͽ� ������ �Ϻκи� �����ϱ�
DELETE FROM EMP_TEMP2
    WHERE JOB = 'MANAGER';

--WHERE���� ���������� ����Ͽ� ������ �Ϻθ� �����ϱ�
DELETE FROM EMP_TEMP2
    WHERE EMPNO IN (SELECT E.EMPNO  FROM EMP_TEMP2 E, SALGRADE S
                    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                    AND S.GRADE = 3
                    AND DEPTNO = 30);