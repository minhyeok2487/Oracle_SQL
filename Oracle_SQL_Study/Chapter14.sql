--NOT NULL
CREATE TABLE TABLE_NOTNULL(
    LOGIN_ID    VARCHAR2(20) NOT NULL,
    LOGIN_PWD   VARCHAR2(20) NOT NULL,
    TEL         VARCHAR2(20)
);

DESC TABLE_NOTNULL;

--���� ������ ���� TEL ���� NULL �� �Է� ����
INSERT INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PWD)
    VALUES('TEST_ID_01','1234');
    
SELECT * FROM TABLE_NOTNULL;

--���� ���� ���캸��
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS;
    
--���� ���� �̸� ����
CREATE TABLE TABLE_NOTNULL2(
    LOGIN_ID    VARCHAR(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL,
    LOGIN_PWD   VARCHAR(20) CONSTRAINT TBLNN2_LGNPW_NN NOT NULL,
    TEL         VARCHAR(20)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS;
    
--�������� �߰��ϱ�
ALTER TABLE TABLE_NOTNULL
    MODIFY(TEL NOT NULL);
SELECT * FROM TABLE_NOTNULL;
--�����Ϳ� �� ���� �־ �������� �߰� �Ұ���
--TEL �� ������ �����ϱ�
UPDATE TABLE_NOTNULL
    SET TEL = '010-1234-5678'
    WHERE LOGIN_ID = 'TEST_ID_01';
    
SELECT * FROM TABLE_NOTNULL;

ALTER TABLE TABLE_NOTNULL
    MODIFY(TEL NOT NULL);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS;
    
--���� ���ǿ� �̸� �����ؼ� �߰��ϱ�
ALTER TABLE TABLE_NOTNULL2
    MODIFY(TEL CONSTRAINT TBLNN_TEL_NN NOT NULL);

DESC TABLE_NOTNULL2;

--�̹� ������ ���� ������ �̸� �����ϱ�
ALTER TABLE TABLE_NOTNULL2
    RENAME CONSTRAINT TBLNN_TEL_NN TO TBLNN2_TEL_NN;
    
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS;
    
--���� ���� ����
ALTER TABLE TABLE_NOTNULL2
    DROP CONSTRAINT TBLNN2_TEL_NN;

DESC TABLE_NOTNULL2;

--�ߺ����� �ʴ� �� UNIQUE
CREATE TABLE TABLE_UNIQUE(
    LOGIN_ID    VARCHAR2(20) UNIQUE,
    LOGIN_PWD   VARCHAR2(20) NOT NULL,
    TEL         VARCHAR2(20)
);

DESC TABLE_UNIQUE;

--���� ���� Ȯ��
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME = 'TABLE_UNIQUE';
    
--�ߺ��� ������� ���� UNIQUE
INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
    VALUES('TEST_ID_01', 'PWD01', '010-1234-5678');

SELECT * FROM TABLE_UNIQUE;
--LOGIN_ID ���� �ߺ��Ǵ� ������ �ֱ� -> �Ұ���
INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
    VALUES('TEST_ID_02', 'PWD01', '010-1234-5678');

SELECT * FROM TABLE_UNIQUE;

--UNIQUE ���� ������ ������ ���� NULL �� �Է��ϱ� (�ߺ�����)
INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
    VALUES(NULL, 'PWD01', '010-2345-6789');
 
SELECT * FROM TABLE_UNIQUE;

--���̺��� �����ϸ� ���� ���� �̸� ���� ����
CREATE TABLE TABLE_UNIQUE2(
    LOGIN_ID    VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNID_UNQ UNIQUE,
    LOGIN_PWD   VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNPW_NN NOT NULL,
    TEL         VARCHAR2(20)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';

--�̹� ������ ���̺� ���� UNIQUE ���� ���� �߰��ϱ�
UPDATE TABLE_UNIQUE
    SET TEL = NULL;

ALTER TABLE TABLE_UNIQUE
    MODIFY(TEL UNIQUE);
    
--������ ���̺��� ���� ���� �̸� ���� �����ϰų� �ٲٱ�
ALTER TABLE TABLE_UNIQUE2
    MODIFY(TEL CONSTRAINT TBLUNQ_TEL_UNQ UNIQUE);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';
    
--�����ϰ� �ϳ��� �ִ� �� PRIMARY KEY
CREATE TABLE TABLE_PK(
    LOGIN_ID    VARCHAR2(20) PRIMARY KEY,
    LOGIN_PWD   VARCHAR2(20) NOT NULL,
    TEL         VARCHAR2(20)
);

DESC TABLE_PK;

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME LIKE 'TABLE_PK%';
    
SELECT INDEX_NAME, TABLE_OWNER, TABLE_NAME
    FROM USER_INDEXES
    WHERE TABLE_NAME LIKE 'TABLE_PK%';
    
CREATE TABLE TABLE_PK2(
    LOGIN_ID    VARCHAR2(20) CONSTRAINT TBLPK2_LGNID_PK PRIMARY KEY,
    LOGIN_PWD   VARCHAR2(20) CONSTRAINT TBLPK2_LGNPW_NN NOT NULL,
    TEL         VARCHAR2(20)
);

DESC TABLE_PK2;

INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL)
    VALUES('TEST_ID_01', 'PWD01', '010-1234-5678');

SELECT * FROM TABLE_PK;

--�ٸ� ���̺��� ���踦 �δ� FOREIGN KEY
--EMP ���̺��� DEPT ���̺��� ���� ���� ���캸��
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, 
    TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME IN ('EMP', 'DEPT');
    
--FOREIGN KEY�� �����ϴ� ���� �������� �ʴ� ������ �Է��ϱ�
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES(9999, 'MH', 'CLERK', '7788', TO_DATE('2017/04/30', 'YYYY/MM/DD'),
            1200, NULL, 50); --�����߻� �θ� Ű 50�� �������� ����
            
--FOREIGN KEY �����ϱ�
CREATE TABLE DEPT_FK(
    DEPTNO  NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
    DNAME   VARCHAR2(14),
    LOC     VARCHAR2(13)
);

DESC DEPT_FK;

CREATE TABLE EMP_FK(
    EMPNO    NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME    VARCHAR2(10),
    JOB      VARCHAR2(9),
    MGR      NUMBER(4),
    HIREDATE DATE,
    SAL      NUMBER(7,2),
    COMM     NUMBER(7,2),
    DEPTNO   NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK (DEPTNO)
);

DESC EMP_FK;

--������ ���¿� ������ ���ϴ� CHECK
CREATE TABLE TABLE_CHECK(
    LOGIN_ID    VARCHAR2(20) CONSTRAINT TBLCK_LGNID_PK PRIMARY KEY,
    LOGIN_PWD   VARCHAR2(20) CONSTRAINT TBLCK_LOGINPW_CK CHECK (LENGTH(LOGIN_PWD) > 3),
    TEL         VARCHAR2(20)
);

DESC TABLE_CHECK;

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, 
    TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME LIKE 'TABLE_CHECK';
    
--�⺻���� ���ϴ� DEFAULT
CREATE TABLE TABLE_DEFAULT(
    LOGIN_ID    VARCHAR2(20) CONSTRAINT TBLCK2_LOGINID_PK PRIMARY KEY,
    LOGIN_PWD   VARCHAR2(20) DEFAULT '1234',
    TEL         VARCHAR2(20)
);
DESC TABLE_DEFAULT;

INSERT INTO TABLE_DEFAULT VALUES ('TEST_ID', NULL, '010-1234-5678');

INSERT INTO TABLE_DEFAULT (LOGIN_ID, TEL) VALUES ('TEST_ID2', '010-1234-5678');

SELECT * FROM TABLE_DEFAULT;