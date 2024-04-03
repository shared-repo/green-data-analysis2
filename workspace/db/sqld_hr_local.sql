-- 문자열 결합

SELECT 'S' || 'Q' || 'L' || ' ' || 'Developer' FROM DUAL;

-- CHR 함수

SELECT CHR(65) UPPER_A, CHR(97) LOWER_A FROM DUAL;

-- LOWER, UPPER

SELECT LOWER('hElLo sQl'), UPPER('hElLo sQl') FROM DUAL;

-- LTRIM, RTRIM, TRIM

SELECT LTRIM('   홍길동') FROM DUAL;
SELECT LTRIM('홍길동', '홍') FROM DUAL;
SELECT LTRIM('홍길동', '홍길') FROM DUAL;
SELECT LTRIM('홍길동', '홍동') FROM DUAL;
SELECT LTRIM('홍길동', '동홍') FROM DUAL;

SELECT RTRIM('아이유    ') FROM DUAL;
SELECT RTRIM('아이유', '유') FROM DUAL;
SELECT RTRIM('아이유', '유이아') FROM DUAL;
-- SELECT RTRIM('홍길동', '길홍동') FROM DUAL;
SELECT RTRIM('아이유', '유이') FROM DUAL;
SELECT RTRIM('아이유', '이유') FROM DUAL;
SELECT RTRIM('아이유', '아유') FROM DUAL;

SELECT TRIM('아이유     ') FROM DUAL;
SELECT TRIM(TRAILING '유' FROM '아이유') FROM DUAL;
-- SELECT TRIM(TRAILING '이유' FROM '아이유') FROM DUAL; --오류 : 1개 문자만 처리 가능
SELECT TRIM(LEADING '아' FROM '아이유') FROM DUAL;
SELECT TRIM(BOTH '아' FROM '아이유이아') FROM DUAL;

SELECT SUBSTR('민중님은 아이유님 팬입니다', 6) FROM DUAL;
SELECT SUBSTR('민중님은 아이유님 팬입니다', 6, 5) FROM DUAL;

SELECT LENGTH('민중님은 아이유님 팬입니다') FROM DUAL;
SELECT REPLACE('민중님은 아이유님 팬입니다', '아이유님', '이지은님') FROM DUAL;
SELECT REPLACE('민중님은 아이유님 팬입니다', '아이유님') FROM DUAL;

SELECT LPAD('테스트', 10, '$') FROM DUAL;
SELECT RPAD('테스트', 10, '$') FROM DUAL;

SELECT ABS(10), ABS(-10) FROM DUAL;

SELECT SIGN(10), SIGN(-10), SIGN(0) FROM DUAL;

SELECT ROUND(12345.6789) FROM DUAL;
SELECT ROUND(12345.6789, 0) FROM DUAL;
SELECT ROUND(12345.6789, 2) FROM DUAL;
SELECT ROUND(12345.6789, -2) FROM DUAL;

SELECT TRUNC(12345.6789) FROM DUAL;
SELECT TRUNC(12345.6789, 0) FROM DUAL;
SELECT TRUNC(12345.6789, 2) FROM DUAL;
SELECT TRUNC(12345.6789, -2) FROM DUAL;

SELECT CEIL(12345.12345) FROM DUAL;
SELECT FLOOR(12345.6789) FROM DUAL;
SELECT CEIL(-12.34) FROM DUAL;
SELECT FLOOR(-12.34) FROM DUAL;

SELECT MOD(10, 3) FROM DUAL;
SELECT MOD(10, -3) FROM DUAL;
SELECT MOD(-10, 3) FROM DUAL;
SELECT MOD(10, 0) FROM DUAL;

SELECT SYSDATE FROM DUAL;
SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL;
-- SELECT EXTRACT(MINUTE FROM SYSDATE) FROM DUAL;
SELECT TIMESTAMP '2023-02-26 11:11:11' FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT CAST(SYSDATE AS TIMESTAMP) FROM DUAL;
SELECT EXTRACT(MINUTE FROM TIMESTAMP '2023-02-26 11:11:11') FROM DUAL;
SELECT EXTRACT(MINUTE FROM CAST(SYSDATE AS TIMESTAMP)) FROM DUAL;

SELECT ADD_MONTHS(SYSDATE, 1) FROM DUAL;
SELECT ADD_MONTHS('2024-03-30', 1) FROM DUAL;

SELECT '22' + '11' FROM DUAL;
SELECT TO_NUMBER('22') + TO_NUMBER('11') FROM DUAL;
SELECT TO_NUMBER(11) FROM DUAL;

SELECT TO_CHAR(11) FROM DUAL;
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;

SELECT * FROM TAB;
SELECT * FROM EMPLOYEES;
SELECT COMMISSION_PCT FROM EMPLOYEES;
SELECT NVL(COMMISSION_PCT, 0) FROM EMPLOYEES;
SELECT NVL2(COMMISSION_PCT, '영업직', '비영업직') FROM EMPLOYEES;

SELECT NULLIF('ABC', 'ABC'), NULLIF('ABC', 'DEF') FROM DUAL;
-- SELECT NULLIF(컬럼이름, 0) FROM DUAL;

SELECT COALESCE(NULL, NULL, 1) FROM DUAL;
SELECT COALESCE(NULL, NULL, NULL) FROM DUAL;
-- SELECT COALESCE(휴대전화번호컬럼, 집전화번호컬럼, 이메일컬럼) FROM 테이블이름;


SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID < 40;

SELECT 
    CASE WHEN DEPARTMENT_ID = 10 THEN '관리'
         WHEN DEPARTMENT_ID = 20 THEN '마케팅'
         WHEN DEPARTMENT_ID = 30 THEN '구매'
    END AS 한국어부서명,
    CASE DEPARTMENT_ID
         WHEN 10 THEN '관리'
         WHEN 20 THEN '마케팅'
         WHEN 30 THEN '구매'
    END AS 한국어부서명2
FROM DEPARTMENTS 
WHERE DEPARTMENT_ID < 40;

SELECT DECODE(DEPARTMENT_ID, 10, '관리', 20, '마케팅', 30, '구매') 부서명
FROM DEPARTMENTS 
WHERE DEPARTMENT_ID < 40;


SELECT * 
FROM DEPARTMENTS
-- WHERE MANAGER_ID != NULL;
-- WHERE MANAGER_ID IS NULL;
WHERE MANAGER_ID IS NOT NULL;

SELECT * FROM EMPLOYEES;

SELECT 
    NVL(E.DEPARTMENT_ID, 0), 
    NVL(D.DEPARTMENT_NAME, '부서없음'), 
    COUNT(*) 사원수
FROM EMPLOYEES E, DEPARTMENTS D
WHERE 
    E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
    -- AND COUNT(*) >= 10
GROUP BY E.DEPARTMENT_ID, D.DEPARTMENT_NAME
HAVING COUNT(*) >= 10;

SELECT * FROM DEPARTMENTS;

-- 

CREATE TABLE DEPARTMENTS2
AS SELECT * FROM DEPARTMENTS;

UPDATE DEPARTMENTS2
SET MANAGER_ID = 10000
WHERE DEPARTMENT_ID < 50;
COMMIT;

SELECT * FROM DEPARTMENTS2;

SELECT *
FROM DEPARTMENTS D1 NATURAL JOIN DEPARTMENTS2 D2;

SELECT *
FROM DEPARTMENTS D1 JOIN DEPARTMENTS2 D2
USING (DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID);

SELECT * FROM EMPLOYEES;

CREATE OR REPLACE VIEW SMALL_EMPLOYEES 
AS
    SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, DEPARTMENT_NAME
    FROM EMPLOYEES E, DEPARTMENTS D
    WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);
    
SELECT * FROM SMALL_EMPLOYEES;

SELECT * FROM
(
    SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, DEPARTMENT_NAME
    FROM EMPLOYEES E, DEPARTMENTS D
    WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
);

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, J.JOB_ID, JOB_TITLE 
FROM JOBS J
INNER JOIN (
                SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID
                FROM EMPLOYEES E, DEPARTMENTS D
                WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
            ) SE
ON J.JOB_ID = SE.JOB_ID;

SELECT E.EMPLOYEE_ID, 
       E.FIRST_NAME, E.LAST_NAME, 
       E.JOB_ID,
       (SELECT J.JOB_TITLE FROM JOBS J WHERE E.JOB_ID = J.JOB_ID) JOB_TITLE
       -- (SELECT J.JOB_TITLE FROM JOBS J) JOB_TITLE -- 다중 값 사용 X
       -- (SELECT J.JOB_TITLE, J.MIN_SALARY FROM JOBS J) --다중 값 사용 X
FROM EMPLOYEES E;

SELECT * FROM EMPLOYEES;

SELECT E1.EMPLOYEE_ID, E1.SALARY, 
       ROUND((SELECT AVG(E2.SALARY) FROM EMPLOYEES E2)) MEAN_SALARY
FROM EMPLOYEES E1
WHERE E1.SALARY > (SELECT AVG(E2.SALARY) FROM EMPLOYEES E2)
ORDER BY E1.SALARY ASC;

SELECT E1.EMPLOYEE_ID, E1.DEPARTMENT_ID, E1.SALARY, 
       ROUND((SELECT AVG(E2.SALARY) 
              FROM EMPLOYEES E2 
              WHERE E2.DEPARTMENT_ID = E1.DEPARTMENT_ID)) MEAN_DEPT_SALARY
FROM EMPLOYEES E1
WHERE E1.SALARY > (SELECT AVG(E2.SALARY) 
                   FROM EMPLOYEES E2 
                   WHERE E2.DEPARTMENT_ID = E1.DEPARTMENT_ID)
ORDER BY E1.DEPARTMENT_ID, E1.SALARY ASC;

--
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID BETWEEN 0 AND 60
UNION ALL
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID BETWEEN 40 AND 100;

SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID BETWEEN 0 AND 60
UNION
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID BETWEEN 40 AND 100
UNION
SELECT 1000, 'ABC', 123, 1111 FROM DUAL;

SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID BETWEEN 0 AND 60
INTERSECT
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID BETWEEN 40 AND 100;

SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID BETWEEN 0 AND 60
MINUS
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID BETWEEN 40 AND 100;

SELECT E.DEPARTMENT_ID, 
       MIN(E.SALARY), MAX(E.SALARY), ROUND(AVG(E.SALARY))
FROM EMPLOYEES E
GROUP BY E.DEPARTMENT_ID
ORDER BY E.DEPARTMENT_ID;

SELECT E.DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES E
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY ROLLUP(E.DEPARTMENT_ID)
ORDER BY E.DEPARTMENT_ID;

SELECT COUNT(*) FROM EMPLOYEES WHERE DEPARTMENT_ID IS NOT NULL;

SELECT E.DEPARTMENT_ID, JOB_ID, COUNT(*)
FROM EMPLOYEES E
WHERE DEPARTMENT_ID IS NOT NULL
-- GROUP BY ROLLUP(E.DEPARTMENT_ID, E.JOB_ID)
GROUP BY ROLLUP( (E.DEPARTMENT_ID, E.JOB_ID) )
ORDER BY E.DEPARTMENT_ID, E.JOB_ID;

SELECT E.DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES E
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY CUBE(E.DEPARTMENT_ID)
ORDER BY E.DEPARTMENT_ID;

SELECT E.DEPARTMENT_ID, JOB_ID, COUNT(*)
FROM EMPLOYEES E
WHERE DEPARTMENT_ID IS NOT NULL
-- GROUP BY CUBE(E.DEPARTMENT_ID, E.JOB_ID)
GROUP BY CUBE( (E.DEPARTMENT_ID, E.JOB_ID) )
ORDER BY E.DEPARTMENT_ID, E.JOB_ID;

SELECT E.DEPARTMENT_ID, JOB_ID, COUNT(*)
FROM EMPLOYEES E
WHERE DEPARTMENT_ID IS NOT NULL
-- GROUP BY GROUPING SETS(E.DEPARTMENT_ID, E.JOB_ID)
-- GROUP BY GROUPING SETS(E.DEPARTMENT_ID, E.JOB_ID, ())
GROUP BY GROUPING SETS(E.DEPARTMENT_ID, ROLLUP(E.JOB_ID))
ORDER BY E.DEPARTMENT_ID, E.JOB_ID;

SELECT E.DEPARTMENT_ID, JOB_ID, COUNT(*),
       GROUPING(E.DEPARTMENT_ID),
       GROUPING(E.JOB_ID)
FROM EMPLOYEES E
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY ROLLUP(E.DEPARTMENT_ID, E.JOB_ID)
ORDER BY E.DEPARTMENT_ID, E.JOB_ID;

SELECT CASE GROUPING(E.DEPARTMENT_ID)
            WHEN 1 THEN 'TOTAL'
            ELSE TO_CHAR(E.DEPARTMENT_ID)
       END DEPARTMENT_ID, 
       CASE GROUPING(E.JOB_ID) 
            WHEN 1 THEN 'TOTAL' 
            ELSE E.JOB_ID 
       END JOB_ID, 
       COUNT(*)
FROM EMPLOYEES E
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY ROLLUP(E.DEPARTMENT_ID, E.JOB_ID)
ORDER BY E.DEPARTMENT_ID, E.JOB_ID;

SELECT DECODE(GROUPING(E.DEPARTMENT_ID), 
              1, 'TOTAL', TO_CHAR(E.DEPARTMENT_ID)) DEPARTMENT_ID, 
       DECODE(GROUPING(E.JOB_ID), 1, 'TOTAL', E.JOB_ID ) JOB_ID, 
       COUNT(*)
FROM EMPLOYEES E
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY ROLLUP(E.DEPARTMENT_ID, E.JOB_ID)
ORDER BY E.DEPARTMENT_ID, E.JOB_ID;

---------------------

SELECT EMPLOYEE_ID, EMAIL, 
       SALARY,
       RANK() OVER(ORDER BY SALARY DESC) AS RANK,
       DENSE_RANK() OVER(ORDER BY SALARY DESC) AS DENSE_RANK,
       ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS ROW_NUMBER
FROM EMPLOYEES;

SELECT EMPLOYEE_ID, EMAIL, 
       DEPARTMENT_ID,
       SALARY,       
       RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) AS RANK,
       DENSE_RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) AS DENSE_RANK,
       ROW_NUMBER() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) AS ROW_NUMBER
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;

SELECT EMPLOYEE_ID, EMAIL, 
       DEPARTMENT_ID,
       SALARY,       
       SUM(SALARY) OVER(PARTITION BY DEPARTMENT_ID) AS SUM,
       MAX(SALARY) OVER(PARTITION BY DEPARTMENT_ID) AS MAX,
       MIN(SALARY) OVER(PARTITION BY DEPARTMENT_ID) AS MIN,
       ROUND(AVG(SALARY) OVER(PARTITION BY DEPARTMENT_ID)) AS AVG,
       COUNT(SALARY) OVER(PARTITION BY DEPARTMENT_ID) AS COUNT
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;

SELECT EMPLOYEE_ID, EMAIL, 
       DEPARTMENT_ID,
       SALARY,       
       SUM(SALARY) OVER(PARTITION BY DEPARTMENT_ID) AS SUM1,
       SUM(SALARY) OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY) AS SUM2,
--       MAX(SALARY) OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY) AS MAX,
--       MIN(SALARY) OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY) AS MIN,
--       ROUND(AVG(SALARY) OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY)) AS AVG,
       COUNT(SALARY) OVER(PARTITION BY DEPARTMENT_ID) AS COUNT1,
       COUNT(SALARY) OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY) AS COUNT2
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;

SELECT EMPLOYEE_ID, EMAIL,
       SALARY,       
       SUM(SALARY) OVER(ORDER BY SALARY) AS SUM1,
       SUM(SALARY) OVER(ORDER BY SALARY RANGE UNBOUNDED PRECEDING) AS SUM2
FROM EMPLOYEES
ORDER BY SALARY;


SELECT EMPLOYEE_ID, EMAIL,
       SALARY,       
       FIRST_VALUE(SALARY) OVER(ORDER BY SALARY) AS FIRST_VALUE,
       LAST_VALUE(SALARY) OVER(ORDER BY SALARY) AS LAST_VALUE,
       FIRST_VALUE(SALARY) OVER(ORDER BY SALARY DESC) AS FIRST_VALUE2,
       LAST_VALUE(SALARY) OVER(ORDER BY SALARY DESC) AS LAST_VALUE2 
FROM EMPLOYEES
ORDER BY SALARY;

SELECT EMPLOYEE_ID, EMAIL,
       SALARY,       
       FIRST_VALUE(SALARY) 
       OVER(ORDER BY SALARY RANGE BETWEEN UNBOUNDED PRECEDING AND 
                            UNBOUNDED FOLLOWING) AS FIRST_VALUE,
       LAST_VALUE(SALARY) 
       OVER(ORDER BY SALARY RANGE BETWEEN UNBOUNDED PRECEDING AND 
                            UNBOUNDED FOLLOWING) AS LAST_VALUE
FROM EMPLOYEES
ORDER BY SALARY;

SELECT EMPLOYEE_ID, EMAIL,
       SALARY,       
       LAG(SALARY, 3) 
       OVER(ORDER BY SALARY) AS LAG_VALUE,
       LEAD(SALARY, 3) 
       OVER(ORDER BY SALARY) AS LEAD_VALUE
FROM EMPLOYEES
ORDER BY SALARY;

SELECT EMPLOYEE_ID, EMAIL, DEPARTMENT_ID,
       SALARY,       
       LAG(SALARY, 2) 
       OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY) AS LAG_VALUE2,
       LEAD(SALARY, 2) 
       OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY) AS LEAD_VALUE2
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;

------------------------

SELECT EMPLOYEE_ID, EMAIL, DEPARTMENT_ID,
       SALARY,
       ROUND(RATIO_TO_REPORT(SALARY) OVER(), 5) AS RATIO_TO_REPORT,
       ROUND(PERCENT_RANK() OVER(ORDER BY SALARY), 2) AS PERCENT_RANK,
       CUME_DIST() OVER(ORDER BY SALARY) AS CUME_DIST,
       NTILE(3) OVER(ORDER BY SALARY) AS NTILE3,
       NTILE(5) OVER(ORDER BY SALARY) AS NTILE5
FROM EMPLOYEES
ORDER BY SALARY;

SELECT SUM(SALARY) FROM EMPLOYEES; --691416
SELECT 2100/691416 FROM DUAL;
SELECT COUNT(SALARY) FROM EMPLOYEES; -- 107

SELECT 1/107, 107/107 FROM DUAL;
SELECT (1-1)/(107-1), (107-1)/(107-1) FROM DUAL;

SELECT 1/107, 3/107 FROM DUAL;

SELECT ROWNUM,
       EMPLOYEE_ID, EMAIL, SALARY
FROM EMPLOYEES
WHERE ROWNUM <= 10;

SELECT ROWNUM,
       EMPLOYEE_ID, EMAIL, SALARY
FROM EMPLOYEES
WHERE ROWNUM <= 10
ORDER BY SALARY DESC;

SELECT ROWNUM, EMPLOYEE_ID, EMAIL, SALARY
FROM
(
    SELECT EMPLOYEE_ID, EMAIL, SALARY
    FROM EMPLOYEES
    ORDER BY SALARY DESC
) E
WHERE ROWNUM <= 10;

SELECT *
FROM
(
    SELECT ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS RN,
           EMPLOYEE_ID, EMAIL, SALARY
    FROM EMPLOYEES
) E
WHERE E.RN <= 10;


SELECT E1.EMPLOYEE_ID, E1.EMAIL, E1.MANAGER_ID, E2.EMAIL MANAGER_EMAIL
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID(+)
ORDER BY E1.EMPLOYEE_ID;

SELECT LEVEL, -- 계층구조에서 순위 번호
       EMPLOYEE_ID, EMAIL, MANAGER_ID,
       SYS_CONNECT_BY_PATH('[' || EMPLOYEE_ID || '/' || EMAIL || ']', '-') PATH
FROM EMPLOYEES E
START WITH MANAGER_ID IS NULL
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID;

SELECT * FROM DEPARTMENTS2;

UPDATE DEPARTMENTS2
SET DEPARTMENT_NAME = '관리팀'
WHERE DEPARTMENT_ID = 10;

SELECT * FROM DEPARTMENTS2;

ROLLBACK;

---

UPDATE DEPARTMENTS2
SET DEPARTMENT_NAME = '관리팀'
WHERE DEPARTMENT_ID = 10;

SAVEPOINT A;

UPDATE DEPARTMENTS2
SET DEPARTMENT_NAME = '마케팅팀'
WHERE DEPARTMENT_ID = 20;

ROLLBACK TO A;

SELECT * FROM departments2;

CREATE TABLE DEPARTMENTS3
AS SELECT * FROM DEPARTMENTS;
SELECT * FROM DEPARTMENTS;



















