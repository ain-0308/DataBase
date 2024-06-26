-- CHAPTER 01. SELECT


-- 주석 색깔 바꾸기 : 도구 > 환경설정 > 코드편집기 > PL/SQL주석
-- 글자 크기 키우기 : 도구 > 환경설정 > 코드편집기 > 글꼴
-- 행 숫자 넣기 : 도구 > 환경설정 > 코드편집기 > 행여백 > 행 번호 표시

-- 주석 기호 1 : -- 한줄 주석
-- 주석 기호 2 : /**/ 여러줄 주석
/*
1. SQL 문장에는 대소문자를 구분하지 않는다.
2. 띄어쓰기나 줄바꿈 또한 명령어 수행에 영향을 주지 않는다.
3. SQL 문장 끝에는 꼭 세미클론(;)을 써줘야한다.
4. SQL 실행 단축키 : Ctrl + Enter, F9
*/
DESC employees;
--DESC(DESCRIBE)>묘사하다, 명령문은 SQL에서 사용되는 데이터베이스 테이블의 구조를 확인하는 데에 쓰입니다. 
--주로 테이블의 열(컬럼)에 대한 정보를 제공하며, 
--특히 테이블이나 뷰의 구조를 조회할 때 유용합니다.


SELECT first_name FROM employees;
-- [ SELECT 절 기본 사용 방법 ]
-- SELECT   조회할 컬럼명
-- FROM     조회할 테이블 이름

SELECT first_name, email FROM employees;

-- 대문자로 작성하라고 하심
-- 직원테이블에서 부서ID, FIRST_NAME, EMAIL, SALARY, 전화번호 정보를 출력
SELECT DEPARTMENT_ID, FIRST_NAME, EMAIL, SALARY, PHONE_NUMBER
FROM EMPLOYEES ;


-- 직원테이블에서 직원ID, 전화번호, 부서ID, LAST_NAME 을 출력
SELECT employee_id
          , phone_number
          , department_id
          , last_name 
FROM employees ;

-- 직원 테이블에서 직원id, 급여, 매니저id 출력
SELECT EMPLOYEE_ID
         , SALARY
         , MANAGER_ID
FROM EMPLOYEES ;

-- 부서 테이블에서 부서ID, 부서명, LOCATION_ID를 출력
SELECT DEPARTMENT_ID
          , DEPARTMENT_NAME
          , LOCATION_ID 
FROM DEPARTMENTS ;

--  * (아스타리스크) : 전체를 의미, 전체 조회

-- 직원테이블의 모든 정보를 출력
SELECT *
FROM EMPLOYEES ;

-- 부서 테이블의 모든 정보를 출력, -- 몇개의 부서가 있는지
SELECT *
FROM DEPARTMENTS ; -- 27개의 부서

-- 직업 테이블의 모든 정보 출력
SELECT *
FROM JOBS ;


-- 직원 테이블에서 JOB_ID
SELECT JOB_ID
FROM EMPLOYEES ;

-- DISTINCT 중복 데이터 제거 
-- SELECT 절에는 [ALL, DISTINCT] - 기본값으로는 ALL 설정 , 한번만 사용가능

SELECT DISTINCT JOB_ID
FROM EMPLOYEES;

-- 직원 테이블에서 부서 ID 중복 제거하여 출력 
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES ;

-- 직원테이블에서 입사일 정보를 중복을 제거하여 출력
SELECT DISTINCT HIRE_DATE
FROM EMPLOYEES ;

-- 직원테이블에서 JOB_ID , 부서ID 중복제거 출력
SELECT DISTINCT JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES ;
-- 위와 같은 방식으로 조회를 하면 뒤에 오는 컬럼인 DEPARTMENT_ID 컬럼의 값이 제대로 중복 제거가 되지 않은 것을 확인할 수 있다.
-- DISTINCT 뒤에 2개 이상의 컬럼을 적으면, 한쪽 컬럼에 중복이 있어도 다른 쪽 컬럼의 값이 다르면 다르게 취급되서 중복제거가 정상적으로 되지않는다.
-- DISTINCT 는 첫번째 컬럼의 중복 체크 하고 그 다음 두번째 컬럼의 중복 체크를 해주는데 이때, 서로 중복 데이터라면 중복이라고 인식하고 그렇지 않으면 정상적인 데이터로 인식함

-- 컬럼의 자료형이 숫자형, 날짜형 이면 숫자 연산이 가능하다.

-- 직원ID와 이름F, 급여정보를 출력
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12 SALLARY
FROM EMPLOYEES ;

-- 별칭 사용하기
-- Alias 라고 하며 한눈에 보기 좋게 설정 할 수 있다.
-- AS 라는 키워드를 사용하여 별칭을 지정한다.

-- 별칭 사용 방법
-- 1. SELECT 컬럼이름 별칭
-- 2. SELECT 컬럼이름 "별칭"
-- 3. SELECT 컬럼이름 AS 별칭
-- 4. SELECT 컬럼이름 AS "별칭"

-- 직원테이블 - 직원이름, 급여 정보, 연봉의 정보
-- 연봉은 직원연봉이라는 별칭 사용해서 출력
SELECT FIRST_NAME, SALARY, SALARY*12 직원연봉
FROM EMPLOYEES ;

-- 직원테이블 - 직원이름, 입사일 입사일 다음날, 입사일 이튿날 을 출력
SELECT FIRST_NAME, HIRE_DATE, HIRE_DATE+1 "입사일_다음날", HIRE_DATE+2 "입사일_이튿날" 
FROM EMPLOYEES ;

-- ORDER BY 절이란?
-- 특정 컬럼을 기준으로 정렬된 상태로 출력하는데 사용한다
-- SQL 문장에서 제일 마지막에 위치하며 
-- SQL 실행 순서에서 가장 마지막에 실행 된다.
-- 별도로 정렬방식을 지정하지 않으면, 기본적으로 오름차순이 적용된다.
-- 현업에서는 사용하게 되었을 때 속도가 현저히 낮아진다고 함

-- ASC(Ascending) : 오름차순 방식
-- DESC(Descending) : 내림차순 방식

-- ORDER BY 기본 사용 방법
/*
SELECT         조회하고자 하는 컬럼이름
FROM          조회하고자 하는 테이블 이름
ORDER BY    특정 컬럼을 이용해서 정렬
*/
-- 직원의 모든 정보를 출력
-- 단 급여 기준으로 오름차순 정렬 출력
SELECT * 
FROM EMPLOYEES
ORDER BY SALARY ;

-- 최근에 입사한 날짜 기준 / 직원의 이름 입사날짜
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC ;

-- 직원테이블에서 직원ID 부서ID 이름 급여 순으로 출력 부서ID는 오름차순, 급여는 내림차순
SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC ;
-- 같은 부서에서 근무하고 있는 직원들끼리 급여가 높은 순서대로 내림차순 정렬이 된것

-- NULL 이란?
-- 데이터의 값이 완전히 비어있는 상태를 말함
-- 값이 존재하지 않거나, 정해지지 않은 것을 의미
-- 숫자 0과 빈 문자열 " " 은 NULL 값이 아님
-- NULL 과 연산을 하면 결과 값은 무조건 NULL 값이 나옴
-- NULL 을 비교하면 결과 값은 무조건 FALSE 값이 나온다

SELECT * FROM EMPLOYEES ;
-- 직원 테이블에서 직원ID 보너스, 보너스 2배 정보를 출력 AS UP_BONUS 별칭 사용 출력
SELECT EMPLOYEE_ID, COMMISSION_PCT, COMMISSION_PCT*2 "UP_BONUS"
FROM EMPLOYEES;

-- 문제 1에서 UP_BONUS 의 결과 값을 출력해보고 왜 그렇게 나왔는지 설명
-- NULL 은 연산을 할 때, 결과 값은 무조건 NULL이기 때문에.

