--NOT NULL
CREATE TABLE TABLE_NOTNULL(
    LOGIN_ID    VARCHAR2(20) NOT NULL,
    LOGIN_PWD   VARCHAR2(20) NOT NULL,
    TEL         VARCHAR2(20)
);

DESC TABLE_NOTNULL;

--제약 조건이 없는 TEL 열에 NULL 값 입력 가능
INSERT INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PWD)
    VALUES('TEST_ID_01','1234');
    
SELECT * FROM TABLE_NOTNULL;

--제약 조건 살펴보기
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS;
    
--제약 조건 이름 지정
CREATE TABLE TABLE_NOTNULL2(
    LOGIN_ID    VARCHAR(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL,
    LOGIN_PWD   VARCHAR(20) CONSTRAINT TBLNN2_LGNPW_NN NOT NULL,
    TEL         VARCHAR(20)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS;
    
--제약조건 추가하기
ALTER TABLE TABLE_NOTNULL
    MODIFY(TEL NOT NULL);
SELECT * FROM TABLE_NOTNULL;
--데이터에 널 값이 있어서 제약조건 추가 불가능
--TEL 열 데이터 수정하기
UPDATE TABLE_NOTNULL
    SET TEL = '010-1234-5678'
    WHERE LOGIN_ID = 'TEST_ID_01';
    
SELECT * FROM TABLE_NOTNULL;

ALTER TABLE TABLE_NOTNULL
    MODIFY(TEL NOT NULL);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS;
    
--제약 조건에 이름 지정해서 추가하기
ALTER TABLE TABLE_NOTNULL2
    MODIFY(TEL CONSTRAINT TBLNN_TEL_NN NOT NULL);

DESC TABLE_NOTNULL2;

--이미 생성된 제약 조건의 이름 변경하기
ALTER TABLE TABLE_NOTNULL2
    RENAME CONSTRAINT TBLNN_TEL_NN TO TBLNN2_TEL_NN;
    
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS;
    
--제약 조건 삭제
ALTER TABLE TABLE_NOTNULL2
    DROP CONSTRAINT TBLNN2_TEL_NN;

DESC TABLE_NOTNULL2;

--중복되지 않는 값 UNIQUE
CREATE TABLE TABLE_UNIQUE(
    LOGIN_ID    VARCHAR2(20) UNIQUE,
    LOGIN_PWD   VARCHAR2(20) NOT NULL,
    TEL         VARCHAR2(20)
);

DESC TABLE_UNIQUE;

--제약 조건 확인
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME = 'TABLE_UNIQUE';
    
--중복을 허락하지 않은 UNIQUE
INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
    VALUES('TEST_ID_01', 'PWD01', '010-1234-5678');

SELECT * FROM TABLE_UNIQUE;
--LOGIN_ID 열에 중복되는 데이터 넣기 -> 불가능
INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
    VALUES('TEST_ID_02', 'PWD01', '010-1234-5678');

SELECT * FROM TABLE_UNIQUE;

--UNIQUE 제약 조건이 지정된 열에 NULL 값 입력하기 (중복가능)
INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
    VALUES(NULL, 'PWD01', '010-2345-6789');
 
SELECT * FROM TABLE_UNIQUE;

--테이블을 생성하며 제약 조건 이름 직접 지정
CREATE TABLE TABLE_UNIQUE2(
    LOGIN_ID    VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNID_UNQ UNIQUE,
    LOGIN_PWD   VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNPW_NN NOT NULL,
    TEL         VARCHAR2(20)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';

--이미 생성한 테이블 열에 UNIQUE 제약 조건 추가하기
UPDATE TABLE_UNIQUE
    SET TEL = NULL;

ALTER TABLE TABLE_UNIQUE
    MODIFY(TEL UNIQUE);
    
--생성한 테이블에 제약 조건 이름 직접 지정하거나 바꾸기
ALTER TABLE TABLE_UNIQUE2
    MODIFY(TEL CONSTRAINT TBLUNQ_TEL_UNQ UNIQUE);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';
    
--유일하게 하나만 있는 값 PRIMARY KEY
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

--다른 테이블과 관계를 맺는 FOREIGN KEY
--EMP 테이블과 DEPT 테이블의 제약 조건 살펴보기
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, 
    TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME IN ('EMP', 'DEPT');
    
--FOREIGN KEY가 참조하는 열에 존재하지 않는 데이터 입력하기
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES(9999, 'MH', 'CLERK', '7788', TO_DATE('2017/04/30', 'YYYY/MM/DD'),
            1200, NULL, 50); --오류발생 부모 키 50이 존재하지 않음
            
--FOREIGN KEY 지정하기
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

--데이터 형태와 범위를 정하는 CHECK
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
    
--기본값을 정하는 DEFAULT
CREATE TABLE TABLE_DEFAULT(
    LOGIN_ID    VARCHAR2(20) CONSTRAINT TBLCK2_LOGINID_PK PRIMARY KEY,
    LOGIN_PWD   VARCHAR2(20) DEFAULT '1234',
    TEL         VARCHAR2(20)
);
DESC TABLE_DEFAULT;

INSERT INTO TABLE_DEFAULT VALUES ('TEST_ID', NULL, '010-1234-5678');

INSERT INTO TABLE_DEFAULT (LOGIN_ID, TEL) VALUES ('TEST_ID2', '010-1234-5678');

SELECT * FROM TABLE_DEFAULT;