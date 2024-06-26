-- CHAPTER 02. WHERE 
/*
SELECT   컬럼
FROM    테이블이름
WHERE   원하는 행을 선별하기 위한 조건식 ;
*/
-- 직원 테이블 직원ID가 105인 직원의 이름 을 출력
SELECT FIRST_NAME, LAST_NAME, EMPLOYEE_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 105;

-- 부서테이블 매니저ID 100인 부서이름, 부서 ID 출력
SELECT DEPARTMENT_NAME, DEPARTMENT_ID
FROM DEPARTMENTS
WHERE MANAGER_ID = 100 ;

-- 급여 9000 받는 직원이름 직원아이디 부서아이디 급여 정보 출력
SELECT FIRST_NAME, EMPLOYEE_ID, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE SALARY = 9000 ;

-- 직원 테이블에서 직원아이디가 100인 직원의 JOB_ID와 급여정보를 출력
SELECT JOB_ID, SALARY
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 100 ;

-- 자료형이 숫자형이나 날짜형이면 산술 연산이 가능
DESC EMPLOYEES ;

-- 자료형과 리터럴
-- NUMBER    :   숫자형 -> 123, 1.12
-- VARCHAR2 :   문자형 -> 'ABCD' (따옴표로 감싸줘야 함)
-- DATE         :   날짜형 -> '24/06/25' (따옴표로 감싸줘야 함)

-- 산술연산자 : ( +, -, *, / )
SELECT SALARY * 12 AS 연봉
FROM EMPLOYEES ;

SELECT HIRE_DATE, HIRE_DATE + 1 AS 다음날
FROM EMPLOYEES ;

-- 비교연산자 ( >, <, >= , <=, = )
-- A > B   :  크다, 초과
-- A >= B :  크거나 같다, 이상
-- A < B   :  작다, 미만
-- A <= B :  작거나 같다, 이하

-- 직원테이블 - > 급여가 5000 이하인 직원의 FIRST_NAME, SALARY 정보를 출력
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY <= 5000 ;

-- 직원 테이블 -> 연봉이 10만 이상인 직원의 이름과 급여, 연봉의 정보를 출력
SELECT FIRST_NAME, SALARY, SALARY*12 연봉
FROM EMPLOYEES
WHERE (SALARY*12) >= 100000 ; 

-- 등가 비교 연산자 ( =, != )
-- 같다       : =
-- 같지않다 : !=, <>, ^=
-- 같지않다(부정비교연산자) : NOT A = B

-- 직원테이블 -> 직업아이디가 IT_PROG 가 아닌 직원의 정보 출력
-- FIRST_NAME, JOB_ID
SELECT FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID != 'IT_PROG' ;

-- 직원테이블 -> EMAIL 정보가 SKING인 직원의 모든 정보를 출력
SELECT * 
FROM EMPLOYEES 
WHERE EMAIL = 'SKING' ;

-- 직원테이블 -> 입사날짜 06/03/07 에 입사한 직원의 직원 아이디, 이름의 정보
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE HIRE_DATE = '06/03/07' ;

-- JOB_ID 가 'ST_MAN' 인 직원의 수는 몇 명인가?
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = 'ST_MAN' ;

-- 논리 연산자 ( True or False )
--   2개 이상의 조건을 이어주는 연산자
--   AND : 조건을 모두 만족하는 경우 TRUE 반환
--   OR   : 하나의 조건이라도 만족하는 경우 TRUE 반환
-- 우선순위
--   AND > OR 
-- 우선순위에 따라 결과값이 완전히 달라질 수 있다
--  OR 조건을 선실행하고 싶다면 () 소괄호로 묶어 선실행하게 해준다 

-- AND 조건
-- TRUE   AND  TRUE = TRUE
-- TRUE   AND  FALSE = FALSE
-- FALSE  AND  FALSE = FALSE
-- FALSE  AND  FALSE = FALSE

-- OR 조건
-- TRUE OR TRUE  = TRUE
-- TRUE OR FALSE  = TRUE
-- FALSE OR FALSE = FALSE
-- FALSE OR TRUE  = TRUE

-- 논리 연산자 사용 방법 및 실행 순서
--  3.  SELECT  조회할 컬럼명
--  1.  FROM   테이블이름
--  2.  WHERE  조건1 AND/OR 조건2 AND/OR 조건3 AND/OR 조건4 ...

-- 부서 ID 가 90 급여가 5000 이상인 직원 아이디와 이름 출력 / 몇명?
-- 3명
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90 AND SALARY > 5000 ;

-- 부서ID 100, 입사일 06/02/02 이후 입사한 직원 총 몇명 
-- OR : 55명
-- AND : 2명
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100 OR HIRE_DATE > '06/02/02' ;

-- 직업이 'SA_REP' 이면서 급여가 10000 이상을 받는 직원은 총 몇명
-- 3명
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = 'SA_REP' AND SALARY > 10000 ;

-- 부서ID 100 이거나 90인 직원중에서 직원ID가 101인 직원의 직원ID, 이름, 연봉 출력 단, 연봉은 AnnSal 별칭 사용
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12 AnnSal
FROM EMPLOYEES
WHERE (DEPARTMENT_ID = 100 OR DEPARTMENT_ID = 90) AND EMPLOYEE_ID = 101 ;

-- NULL  관련 연산자
-- IS NULL          : 데이터 값이 NULL 인 값을 조회
-- IS NOT NULL   : 데이터 값이 NULL이 아닌 값을 조회

-- DEPARTMENT_ID = NULL
-- 부서 ID가 없는 직원의 이름은? 
-- Kimberely
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL ;

-- 보너스를 받고 일하는 직원의 수는 총 몇명인가
-- 35명
SELECT *
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL ;

-- SQL 연산자
-- IN, BETWEEN A AND B, LIKE

--  IN : 특정 컬럼에 포함된 데이터를 여러개 조회할 때 사용
--    = + OR 결과 값과 같은 값을 출력 
--    NULL 값을 제외하는 특징을 가지고 있음

-- NOT IN : IN 뒤의 조건에 해당되지 않는 데이터를 출력
-- NULL 값을 넣게 되면 출력자체가 되지않는다.
-- != + AND 결과 값과 같은 값을 출력된다.

--  BETWEEN A AND B :
-- 일정 범위 내의 데이터를 조회할 때 사용
-- > BETWEEN 최소값 AND 최대값
-- > 특정 열 값의 최소, 최고 범위를 지정하여 해당 범위 내의 데이터만 조회하는 것


-- 직원 테이블 -> 부서 ID 30이거나 50이거나 90인 모든 직원의 정보
-- 54명
SELECT * 
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN ( 30, 50, 90 ) ;

-- 직원테이블 -> 직업아이디가 AV_VP이거나 ST_MAN 인 직원의 이름과 직업아이디 출력 
SELECT FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN ('AV_VP', 'ST_MAN') ;

-- 
SELECT FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID NOT IN (100, 120, 121) ;

-- 직원테이블 -> 급여가 1만 이상 2만 이하의 급여를 받는 직원의 이름과 급여 정보 출력
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 10000 AND 20000 ;

-- 직원테이블 -> 05년에 입사한 직원의 이름 , 입사날짜
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31';

-- LIKE 연산자
-- 일부 문자열이 포함된 데이터를 조회할때 사용하는 것
-- %, _ _ 라는 와일드 카드를 이용해서 매칭 연산을 진행하는 것
-- % : 길이와 상관없이 모든 문자 데이터를 의미
-- __ : 어떤 값이든 상관없이 한개의 문자 데이터를 의미

-- 핸드폰번호가 650으로 시작하는 직원의 폰번 찾기
SELECT PHONE_NUMBER
FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE '650%' ;

-- 직원테이블-> 이름이 S로 시작하고 N으로 끝나는 직원의 이름 찾기
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%n' ; 

-- 직원테이블 -> 이름이 IT로 끝나고 총 4글자인 직원의 이름 찾기
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__it' ;

-- 직원테이블-> 이름 두번째글자가 E인 직원의 이름 찾기
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_e%' ;

-- 직원 테이블에서 01월에 입사한 직원의 입사날짜 찾기
SELECT HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '__/01/__' ;



