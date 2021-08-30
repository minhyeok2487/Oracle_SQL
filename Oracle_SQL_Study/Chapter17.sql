--17.1레코드 정의해서 사용하기
SET SERVEROUTPUT ON;

DECLARE
    TYPE REC_DEPT IS RECORD(
        deptno  NUMBER(2) NOT NULL := 99,
        dname   DEPT.DNAME%TYPE,
        loc     DEPT.LOC%TYPE
    );
    dept_rec REC_DEPT;
BEGIN
    dept_rec.deptno := 99;
    dept_rec.dname := 'DATABASE';
    dept_rec.loc := 'SEOUL';
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || dept_rec.deptno);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || dept_rec.dname);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || dept_rec.loc);
END;
/

--17.2 레코드를 사용한 INSERT
CREATE TABLE DEPT_RECORD
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_RECORD;

DECLARE
    TYPE REC_DEPT IS RECORD(
        deptno  NUMBER(2) NOT NULL := 99,
        dname   DEPT.DNAME%TYPE,
        loc     DEPT.LOC%TYPE
    );
    dept_rec REC_DEPT;
BEGIN
    dept_rec.deptno := 99;
    dept_rec.dname := 'DATABASE';
    dept_rec.loc := 'SEOUL';
    
INSERT INTO DEPT_RECORD
VALUES dept_rec;
END;
/

SELECT * FROM DEPT_RECORD;


--17.3 레코드를 사용한 UPDATE
DECLARE
    TYPE REC_DEPT IS RECORD(
        deptno  NUMBER(2) NOT NULL := 99,
        dname   DEPT.DNAME%TYPE,
        loc     DEPT.LOC%TYPE
    );
    dept_rec REC_DEPT;
BEGIN
    dept_rec.deptno := 50;
    dept_rec.dname := 'DB';
    dept_rec.loc := 'SEOUL';
    
UPDATE DEPT_RECORD
SET ROW = dept_rec
WHERE DEPTNO = 99;
END;
/

SELECT * FROM DEPT_RECORD;

--17.4 중첩 레코드(레코드를 포함하는 레코드)
DECLARE
    TYPE REC_DEPT IS RECORD(
        deptno  DEPT.DEPTNO%TYPE,
        dname   DEPT.DNAME%TYPE,
        loc     DEPT.LOC%TYPE
    );
    TYPE REC_EMP IS RECORD(
        empno   EMP.EMPNO%TYPE,
        ename   EMP.ENAME%TYPE,
        dinfo   REC_DEPT
    );
    emp_rec REC_EMP;
BEGIN
    SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
        INTO emp_rec.empno, emp_rec.ename, 
            emp_rec.dinfo.deptno,
            emp_rec.dinfo.dname,
            emp_rec.dinfo.loc
        FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND E.EMPNO = 7788;
    DBMS_OUTPUT.PUT_LINE('EMPNO : ' || emp_rec.empno);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || emp_rec.ename);
     
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || emp_rec.dinfo.deptno);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || emp_rec.dinfo.dname);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || emp_rec.dinfo.loc);
END;
/

--연관배열 사용하기
DECLARE
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20)
    INDEX BY PLS_INTEGER;
    
    text_arr ITAB_EX;
    
BEGIN
    text_arr(1) := '1st data';
    text_arr(2) := '2nd data';
    text_arr(3) := '3rd data';
    text_arr(4) := '4th data';
    
    DBMS_OUTPUT.PUT_LINE('text_arr(1) : ' || text_arr(1));
    DBMS_OUTPUT.PUT_LINE('text_arr(2) : ' || text_arr(2));
    DBMS_OUTPUT.PUT_LINE('text_arr(3) : ' || text_arr(3));
    DBMS_OUTPUT.PUT_LINE('text_arr(4) : ' || text_arr(4));
END;
/

--연관 배열 자료형에 레코드 사용하기
DECLARE
    TYPE REC_DEPT IS RECORD(
        deptno  DEPT.DEPTNO%TYPE,
        dname   DEPT.DNAME%TYPE
        );
        
    TYPE ITAB_DEPT IS TABLE OF REC_DEPT
        INDEX BY PLS_INTEGER;
    
    dept_arr ITAB_DEPT;
    idx PLS_INTEGER := 0;
    
BEGIN
    FOR i IN (SELECT DEPTNO, DNAME FROM DEPT) LOOP
        idx := idx + 1;
        dept_arr(idx).deptno := i.DEPTNO;
        DEPT_ARR(idx).dname := i.DNAME;
        
        DBMS_OUTPUT.PUT_LINE(
            dept_arr(idx).deptno || ' : ' || dept_arr(idx).dname);
    END LOOP;
END;
/

--%ROWTYPE으로 연관 배열 자료형 지정하기
DECLARE
    TYPE ITAB_DEPT IS TABLE OF DEPT%ROWTYPE
        INDEX BY PLS_INTEGER;
    
    dept_arr ITAB_DEPT;
    idx PLS_INTEGER := 0;
    
BEGIN
    FOR i IN (SELECT * FROM DEPT) LOOP
        idx := idx + 1;
        dept_arr(idx).deptno := i.DEPTNO;
        dept_arr(idx).dname := i.DNAME;
        dept_arr(idx).loc := i.LOC;
        
        DBMS_OUTPUT.PUT_LINE(
            dept_arr(idx).deptno || ' : ' ||
            dept_arr(idx).dname || ' : ' ||
            dept_arr(idx).loc);
    END LOOP;
END;
/

--컬렉션 메서드 사용하기
DECLARE
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20)
    INDEX BY PLS_INTEGER;
    
    text_arr ITAB_EX;
    
BEGIN
    text_arr(1) := '1st data';
    text_arr(2) := '2nd data';
    text_arr(3) := '3rd data';
    text_arr(50) := '50th data';
    
    DBMS_OUTPUT.PUT_LINE('text_arr.COUNT : ' || text_arr.COUNT);
    DBMS_OUTPUT.PUT_LINE('text_arr.FIRST : ' || text_arr.FIRST);
    DBMS_OUTPUT.PUT_LINE('text_arr.LAST : ' || text_arr.LAST);
    DBMS_OUTPUT.PUT_LINE('text_arr.PRIOR(50) : ' || text_arr.PRIOR(50));
    DBMS_OUTPUT.PUT_LINE('text_arr.NEXT(50) : ' || text_arr.NEXT(50));
    
END;
/