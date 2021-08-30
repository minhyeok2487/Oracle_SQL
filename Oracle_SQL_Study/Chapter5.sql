--부서 번호가 30인 데이터만 출력하기
SELECT *
    FROM EMP
    WHERE DEPTNO = 30;
    
--부서 번호가 30, 직업이 SALESMAN인 경우만 출력하기
SELECT *
    FROM EMP
    WHERE DEPTNO = 30
    AND JOB = 'SALESMAN';
    
--부서 번호가 30이거나 직업이 CLERK인 경우만 출력하기
SELECT *
    FROM EMP
    WHERE DEPTNO = 30
    OR JOB = 'CLERK';
    
--곱셈 산술 연산자를 사용한 예
SELECT *
    FROM EMP
    WHERE SAL * 12 = 36000;
    
--대소 비교 연산자를 사용한 예
SELECT *
    FROM EMP
    WHERE SAL >= 3000;
    
--문자를 대소 비교 연산자로 비교하기
SELECT * FROM EMP
    WHERE ENAME >= 'F'; --첫글자 F~Z

SELECT * FROM EMP
    WHERE ENAME <= 'FORZ';
    
--등가 비교 연산자(세 개 결과가 같음)
SELECT * FROM EMP
    WHERE SAL != 3000;
SELECT * FROM EMP
    WHERE SAL <> 3000;
SELECT * FROM EMP
    WHERE SAL ^= 3000;

--논리 부정 연산자
SELECT * FROM EMP
    WHERE NOT SAL = 3000;
    
--IN 연산자 사용
SELECT * FROM EMP
    WHERE JOB IN ('MANAGER','SALESMAN','CLERK');
    
--IN과 논리 부정 연산자 동시 사용
SELECT * FROM EMP
    WHERE JOB NOT IN ('MANAGER','SALESMAN','CLERK');
    
--BETWEEN 연산자
SELECT * FROM EMP
    WHERE SAL BETWEEN 2000 AND 3000;

SELECT * FROM EMP
    WHERE SAL NOT BETWEEN 2000 AND 3000;
    
--일부 문자열 포함 연산자 LIKE
SELECT * FROM EMP
    WHERE ENAME LIKE 'S%';
    
--사원 이름의 두 번째 글자가 L인 사원만 출력하기
SELECT * FROM EMP
    WHERE ENAME LIKE '_L%';
    
--사원 이름의 AM이 포함되어 있는 사원 데이터만 출력하기
SELECT * FROM EMP
    WHERE ENAME LIKE '%AM%';
    
--사원 이름의 AM이 포함되어 있지 않은 사원 데이터만 출력하기
SELECT * FROM EMP
    WHERE ENAME NOT LIKE '%AM%';

--NULL값 찾기
SELECT * FROM EMP
    WHERE COMM IS NULL;
    
--직속 상관이 있는 사원 데이터만 출력
SELECT * FROM EMP
    WHERE MGR IS NOT NULL;
    
--집합 연산자 UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION    
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 20;
    
--UNION ALL은 중복 포함
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION ALL   
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    
--차집합 연산자 MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
MINUS   
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;

--교집합 연산자 INTERSECT
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