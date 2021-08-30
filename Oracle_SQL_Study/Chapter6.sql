--��, �ҹ��ڸ� �ٲ� �ִ� �Լ�
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
    FROM EMP;
    
--��� �̸��� SCOTT�� ������ ã��
SELECT *
    FROM EMP
    WHERE UPPER(ENAME) = UPPER('scott');
    
--��� �̸��� SCOTT�� ������ ������ ã��
SELECT *
    FROM EMP
    WHERE UPPER(ENAME) LIKE UPPER('%scott%');
    
--��� �̸��� ���̰� 5 �̻��� �� ���
SELECT ENAME, LENGTH(ENAME) 
    FROM EMP
    WHERE LENGTH(ENAME) >= 5;
    
--LENGTHB�� ����Ʈ�� �� ��ȯ
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�')
    FROM DUAL;
    
--���ڿ� �Ϻ� ���� SUBSTR
SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5)
    FROM EMP;
    
--SUBSTR ����
SELECT JOB,
    SUBSTR(JOB,-LENGTH(JOB)),
    SUBSTR(JOB,-LENGTH(JOB),2),
    SUBSTR(JOB,-3)
    FROM EMP;
    
--���ڿ� ������ �ȿ��� Ư�� ���� ��ġ ã�� INSTR
SELECT INSTR('HELLO, ORACLE','L'),
       INSTR('HELLO, ORACLE','L',5),
       INSTR('HELLO, ORACLE','L',2,2)
       FROM DUAL;
       
--LIKE�� ����ϰ� INSTR ����
SELECT * FROM EMP
    WHERE INSTR(ENAME,'S') > 0;
    
--Ư�� ���ڸ� �ٸ� ���ڷ� �ٲٴ� REPLACE
SELECT '010-2427-2487' AS REPLACE_BEFORE,
    REPLACE('010-2427-2487','-',' ') AS REPLACE_1,
    REPLACE('010-2427-2487','-') AS REPLACE_2
    FROM DUAL;
    
--�������� �� ������ Ư�� ���ڷ� ä��� LPAD, RPAD
SELECT 'Oracle',
    LPAD('Oracle',10,'*') AS LPAD_1,
    RPAD('Oracle',10,'*') AS RPAD_1,
    LPAD('Oracle',10) AS LPAD_2,
    RPAD('Oracle',10) AS RPAD_2
    FROM DUAL;
    
--�������� ���ڸ� ������
SELECT
    RPAD('950306-',14,'*') AS JMNO,
    RPAD('010-2427-',13,'*') AS PHONE
    FROM DUAL;
    
--�� ���ڿ� �����͸� ��ġ�� CONCAT
SELECT
    CONCAT(EMPNO, ENAME),
    CONCAT(EMPNO, CONCAT(' : ', ENAME))
    FROM EMP
    WHERE ENAME = 'SCOTT';
    
SELECT
    EMPNO || ENAME,
    EMPNO || ' : ' || ENAME
    FROM EMP
    WHERE ENAME = 'SCOTT';
    
--Ư�� ���ڸ� ����� �Լ���


--�ݿø� �Լ� ROUND
SELECT 
    ROUND(1234.5678) AS ROUND,
    ROUND(1234.5678, 0) AS ROUND_0,
    ROUND(1234.5678, 1) AS ROUND_1,
    ROUND(1234.5678, 2) AS ROUND_2,
    ROUND(1234.5678, -1) AS ROUND_MINUS1,
    ROUND(1234.5678, -2) AS ROUND_MINUS2
    FROM DUAL;
    
--���� �Լ� TRUNC
SELECT 
    TRUNC(1234.5678) AS TRUNC,
    TRUNC(1234.5678, 0) AS TRUNC_0,
    TRUNC(1234.5678, 1) AS TRUNC_1,
    TRUNC(1234.5678, 2) AS TRUNC_2,
    TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
    TRUNC(1234.5678, -2) AS TRUNC_MINUS2
    FROM DUAL;
    
--������ ���ڿ� ����� ������ ã�� �Լ� CEIL, FLOOR
--CEIL�� ū ����, FLOOR�� ���� ����
SELECT 
    CEIL(3.14),
    FLOOR(3.14),
    CEIL(-3.14),
    FLOOR(-3.14)
    FROM DUAL;

--���ڸ� ���� ������ ���� ���ϴ� �Լ� MOD
SELECT
    MOD(15, 6),
    MOD(10, 2),
    MOD(11, 2)
    FROM DUAL;


--��¥ �����͸� �ٷ�� ��¥ �Լ� SYSDATE
SELECT 
    SYSDATE AS NOW,
    SYSDATE-1 AS YESTERDAY,
    SYSDATE+1 AS TOMORROW
    FROM DUAL;

--�� ���� ���� ��¥�� ���ϴ� �Լ� ADD_MONTHS
SELECT
    SYSDATE,
    ADD_MONTHS(SYSDATE, 3) AS THREE_MONTHS_LATER
    FROM DUAL;

--�Ի� 10�ֳ� �Ǵ� ��� ������ ����
SELECT EMPNO, ENAME, HIREDATE,
    ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
    FROM EMP;

--�� ��¥ ���� ���� �� ���̸� ���ϴ� �Լ� MONTHS_BETWEEN
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
    MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1,
    MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
    FROM EMP;

--���ƿ��� ������ ���ϴ� �Լ� NEXT_DAY
SELECT SYSDATE,
    NEXT_DAY(SYSDATE, '������')
    FROM DUAL;

--���� ������ ���� ���ϴ� �Լ� LAST_DAY
SELECT SYSDATE,
    LAST_DAY(SYSDATE)
    FROM DUAL;

--��¥, ���� �����͸� ���� �����ͷ� ��ȭ�ϴ� �Լ� TO_CHAR
SELECT
    SYSDATE,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð�
    FROM DUAL;

--���� ������ �پ��� �������� ����ϱ�
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'MM') AS MM,
    TO_CHAR(SYSDATE, 'MON') AS MON,
    TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
    TO_CHAR(SYSDATE, 'DD') AS DD,
    TO_CHAR(SYSDATE, 'DY') AS DY,
    TO_CHAR(SYSDATE, 'DAY') AS DAY
    FROM DUAL;

--���� ���� ��¥(��) ����ϱ�
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'MM') AS MM,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MON_KOR,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE' ) AS MON_JPN,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MON_ENGLISH,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MONTH_KOR,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE' ) AS MONTH_JPN,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MONTH_ENGLISH
    FROM DUAL;
    
--���� ���� ��¥(����) ����ϱ�
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'MM') AS MM,
    TO_CHAR(SYSDATE, 'DD') AS DD,
    TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = KOREAN' ) AS DY_KOR,
    TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = JAPANESE' ) AS DY_JPN,
    TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS DY_ENGLISH,
    TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = KOREAN' ) AS DAY_KOR,
    TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE' ) AS DAY_JPN,
    TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS DAY_ENGLISH
    FROM DUAL;

--�ð� ���� �����Ͽ� ���
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
    TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HH12MISS_AM,
    TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM
    FROM DUAL;

--���� ���� ���� ������ ����Ͽ� �޿� ����ϱ�
SELECT SAL,
    TO_CHAR(SAL, '$999,999') AS SAL_$,
    TO_CHAR(SAL, 'L999,999') AS SAL_L,
    TO_CHAR(SAL, '999,999.00') AS SAL_1,
    TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
    TO_CHAR(SAL, '000999999.99') AS SAL_3,
    TO_CHAR(SAL, '999,999,00') AS SAL_4
    FROM EMP;

--���� �����͸� ���� �����ͷ� ��ȯ�ϴ� �Լ� TO_NUMBER
SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,100', '999,999')
    FROM DUAL;

--���� �����͸� ��¥ �����ͷ� ��ȭ�ϴ� �Լ� TO_DATE
SELECT 
    TO_DATE('2021-06-29', 'YYYY-MM-DD') AS TODATE1,
    TO_DATE('20210629', 'YYYY-MM-DD') AS TODATE2
    FROM DUAL;

--1981�� 6�� 1�� ���Ŀ� �Ի��� ��� ���� ���
SELECT * FROM EMP
    WHERE HIREDATE > TO_DATE('1981-06-01', 'YYYY/MM/DD');
    
--NULL ó���Լ� NVL
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,
    NVL(COMM, 0),
    SAL+NVL(COMM, 0)
    FROM EMP;

SELECT EMPNO, ENAME, COMM,
    NVL2(COMM, 'O', 'X'),
    SAL+NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL
    FROM EMP;    

--��Ȳ�� ���� �ٸ� �����͸� ��ȯ�ϴ� �Լ� DECODE, CASE
SELECT EMPNO, ENAME, JOB, SAL,
    DECODE(JOB,
            'MANAGER', SAL*1.1,
            'SALESMAN', SAL*1.05,
            'ANALYST', SAL,
            SAL*1.03) AS UPSAL
    FROM EMP;

SELECT EMPNO, ENAME, JOB, SAL,
    CASE JOB
        WHEN 'MANAGER' THEN SAL*1.1
        WHEN 'SALESMAN' THEN SAL*1.05
        WHEN 'ANALYST' THEN SAL
        ELSE SAL*1.03
    END AS UPSAL
    FROM EMP;