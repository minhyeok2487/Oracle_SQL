--EMP�� ���� ���̺� �����ϱ�
CREATE TABLE EMP_DDL(
    EMPNO       NUMBER(4),
    ENAME       VARCHAR2(10),
    JOB         VARCHAR2(9),
    MGR         NUMBER(4),
    HIREDATE    DATE,
    SAL         NUMBER(7,2),
    COMM        NUMBER(7,2),
    DEPTNO      NUMBER(2)
);
DESC EMP_DDL;

--�ٸ� ���̺� �����Ͽ� ���̺� �����ϱ�
CREATE TABLE DEPT_DDL
    AS SELECT * FROM DEPT;
DESC DEPT_DDL;

--�ٸ� ���̺��� �Ϻθ� �����Ͽ� ���̺� �����ϱ�
CREATE TABLE EMP_DDL_30
    AS SELECT * FROM EMP
    WHERE DEPTNO = 30;
SELECT * FROM EMP_DDL_30;

--���� ���̺��� �� ������ �����Ͽ� �� ���̺� �����ϱ�
CREATE TABLE EMPDEPT_DDL
    AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE,
            E.SAL, E.COMM, D.DEPTNO, D.DNAME, D.LOC
        FROM EMP E, DEPT D
        WHERE 1 <> 1;
        
SELECT * FROM EMPDEPT_DDL;

--ALTER ����
CREATE TABLE EMP_ALTER
    AS SELECT * FROM EMP;
    
ALTER TABLE EMP_ALTER
    ADD HP VARCHAR2(20);

SELECT * FROM EMP_ALTER;

--���̸� ���� RENAME
ALTER TABLE EMP_ALTER
    RENAME COLUMN HP TO TEL;
    
--���� �ڷ��� ���� MODIFY
ALTER TABLE EMP_ALTER
    MODIFY EMPNO NUMBER(5);
    
--�� ���� DROP
ALTER TABLE EMP_ALTER
    DROP COLUMN TEL;
    
--���̺� �̸� ���� RENAME
RENAME EMP_ALTER TO EMP_RENAME;
DESC EMP_RENAME;

--���̺� ������ ���� TRUNCATE
TRUNCATE TABLE EMP_RENAME;
SELECT * FROM EMP_RENAME;

--���̺� ���� DROP
DROP TABLE EMP_RENAME;