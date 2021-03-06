CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;
    
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
    VALUES (50, 'DATABASE', 'SEOUL');
    
SELECT * FROM  DEPT_TEMP;

--INSERT문에 열 지정 없이 데이터 추가하기
INSERT INTO DEPT_TEMP
    VALUES(60, 'NETWORK', 'BUSAN');
    
--테이블의 NULL 입력하기
--NULL을 지정하여 입력하기
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
    VALUES (70, 'WEB', NULL);
    
--빈공백 문자열로 NULL 입력하기
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
    VALUES (80, 'MOBILE', '');
    
--열 데이터를 넣지 않는 방식으로 NULL 입력하기
INSERT INTO DEPT_TEMP (DEPTNO, LOC)
    VALUES (90, 'INCHEON');
    
--테이블에 날짜 데이터 입력하기
--열 구조만 복사해서 테이블 만들기
CREATE TABLE EMP_TEMP
    AS SELECT * FROM EMP
    WHERE 1<>1;

SELECT * FROM EMP_TEMP;

--날짜 데이터 입력
INSERT INTO EMP_TEMP(
    EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (9999, '홍길도', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);
   
INSERT INTO EMP_TEMP(
    EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (1111, '성춘향', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20); 

--가능하면 TO_DATE 이용
INSERT INTO EMP_TEMP(
    EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (2222, '이순신', 'MANAGER', 9999,TO_DATE('07/01/2001', 'DD/MM/YYYY'),
    4000, NULL, 20);
    
--현재 날짜 입력 STSDATE
INSERT INTO EMP_TEMP(
    EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (3111, '심청이', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30); 
    
--서브쿼리를 사용하여 한 번에 여러 데이터 추가하기
INSERT INTO 
    EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
        FROM EMP E, SALGRADE S
        WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
        AND S.GRADE = 1;
        
--테이블에 있는 데이터 수정하기
SELECT * FROM DEPT_TEMP;
ROLLBACK;
UPDATE DEPT_TEMP
    SET LOC = 'SEOUL';
    
UPDATE DEPT_TEMP
    SET DNAME = 'DATABASE',
        LOC = 'SEOUL'
    WHERE DEPTNO = 40;
    
--서브쿼리를 사용하여 데이터 수정하기
UPDATE DEPT_TEMP
    SET (DNAME, LOC) = (SELECT DNAME, LOC
                        FROM DEPT
                        WHERE DEPTNO = 40)
    WHERE DEPTNO = 40;
    
--테이블에 있는 데이터 삭제하기
--EMP 테이블을 복사해서 EMP_TEMP2 테이블 만들기
CREATE TABLE EMP_TEMP2
    AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2;

--WHERE절을 사용하여 데이터 일부분만 삭제하기
DELETE FROM EMP_TEMP2
    WHERE JOB = 'MANAGER';

--WHERE절에 서브쿼리를 사용하여 데이터 일부만 삭제하기
DELETE FROM EMP_TEMP2
    WHERE EMPNO IN (SELECT E.EMPNO  FROM EMP_TEMP2 E, SALGRADE S
                    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                    AND S.GRADE = 3
                    AND DEPTNO = 30);