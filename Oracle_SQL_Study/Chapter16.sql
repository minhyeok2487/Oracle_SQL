SET SERVEROUTPUT ON;

DECLARE
    V_NUMBER NUMBER := 14;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('V_NUMBER�� Ȧ���Դϴ�!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('V_NUMBER�� ¦���Դϴ�!');
    END IF;
END;
/

DECLARE
    V_SCORE NUMBER := 60;
BEGIN
    IF V_SCORE >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('A����');
    ELSIF V_SCORE >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('B����');
    ELSIF V_SCORE >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('C����');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F����');
    END IF;
END;
/

DECLARE
    V_SCORE NUMBER := 87;
BEGIN
    CASE TRUNC(V_SCORE/10)
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A����');
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('A����');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('B����');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('C����');
        WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('D����');
        ELSE DBMS_OUTPUT.PUT_LINE('F����');
    END CASE;
END;
/

DECLARE
    V_NUM NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
        V_NUM := V_NUM +1;
        EXIT WHEN V_NUM > 4;
    END LOOP;
END;
/