DESC EMP;

--EMP 테이블 전체 열 조회
SELECT * FROM EMP;

--열을 쉼표로 구분하여 출력하기
SELECT EMPNO, ENAME, DEPTNO
    FROM EMP;
        
--열의 중복 제거하기(열이 한 개)
SELECT DISTINCT DEPTNO
    FROM EMP;
    
--열의 중복 제거하기(열이 여러개)
SELECT DISTINCT JOB, DEPTNO
    FROM EMP;

--중복되는 열 제거 없이 그대로 출력    
SELECT ALL JOB, DEPTNO
    FROM EMP;
    
--열에 연산식을 사용하여 출력
SELECT ENAME, SAL, SAL*12+COMM, COMM
    FROM EMP;
    
--별칭 사용하여 사원의 연간 총 수입 출력    
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
    FROM EMP;

--EMP 테이블의 모든 열을 급여 기준으로 오름차순 정렬하기
SELECT *
    FROM EMP
    ORDER BY SAL;
    
--EMP 테이블의 모든 열을 급여 기준으로 내림차순 정렬하기
SELECT *
    FROM EMP
    ORDER BY SAL DESC;
    
--EMP 테이블의 전체 열을 부서 번호(오름차순), 급여(내림차순) 정렬
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














    