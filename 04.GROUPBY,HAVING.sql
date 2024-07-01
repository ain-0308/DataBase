-- CHAPTER 04. GROUP BY / HAVING --
-- [ 내장함수의 종류 ]
-- 단일행 함수 : 입력된 하나의 행당 결과가 하나씩 나오는 함수
-- 다중행 함수 : 여러 행을 입력받아 하나의 결과 값으로 출력되는 함수
--   > 다중행 함수를 집계함수 라고 부른다.

-- 다중행 함수 (집계 함수) 특징 
--  1. 집계 함수는 NULL값을 제외하는 특성을 가지고 있다.
--  2. 집계 함수는 그룹화(GROUP BY) 가 되어 있는 상태에서만 사용이 가능하다.

-- [ 집계함수의 종류 ]
-- COUNT() : 지정한 데이터의 개수를 반환(NULL값 포함) / [ * ] <- 전체 검색도 할 수 있다.
-- SUM() : 지정한 데이터의 합을 반환
-- MAX() : 지정한 데이터중 최대 값을 반환
-- MIN() : 지정한 데이터중 최소 값을 반환
-- AVG() : 지정한 데이터의 평균 값 반환

-- 직원 테이블 -> 직원 아이디 행의 개수
SELECT COUNT(EMPLOYEE_ID) 사원수
FROM EMPLOYEES 
GROUP BY() ; -- 직원 테이블을 하나의 그룹으로 묶은걸로 인식해서 그룹바이가 된다.

-- 부서테이블 부서ID 행의 개수 조회
SELECT COUNT(DEPARTMENT_ID)
FROM DEPARTMENTS;

-- 직원테이블 부서ID 행의 개수 조회
SELECT COUNT(DEPARTMENT_ID)
FROM EMPLOYEES ;

-- COUNT함수는 * <- 를 쓸 수 있는 특징을 가지고 있음
-- NULL 값까지 포함하여 결과 값을 반환
SELECT COUNT(*) -- NULL값까지 포함하여 결과 값을 출력해줌
FROM EMPLOYEES ;

-- 직원급여의 총 합계
SELECT SUM(SALARY) 합계
FROM EMPLOYEES ;

-- 직원들의 최대 급여와 초소 급여를 출력
SELECT MAX(SALARY) MAX, MIN(SALARY) MIN
FROM EMPLOYEES ;

-- 부서아이디가 100인 직원의 평균 급여를 출력
SELECT ROUND(AVG(SALARY), 1) AVG
FROM EMPLOYEES 
WHERE DEPARTMENT_ID = 100 ;

SELECT *
FROM 성적표 ;

SELECT *
FROM 수강생정보 ;

-- SQL 작성순서 / 실행순서
/*                    실행 순서
 1. SELECT              5                  
 2. FROM               1
 3. WHERE              2
 4. GROUP BY         3 
 5. HAVING            4
 6. ORDER BY          6
*/

-- GROUP BY : 특정 컬럼을 기준으로 그룹화(묶음)
-- [ GROUP BY  사용 법 / 실행 순서 ]
-- 4. SELECT
-- 1. FROM
-- 2. WHERE
-- 3. GROUP BY

-- 사용시 유의 사항
-- 1. GROUP BY 에 특정 컬럼을 사용하는 순간 행의 개소가 감소하기 때문에 GROUP BY보다 늦게 실행되는 절은
-- SQL 실행 순서에 의해서 [HAVING, SELECT, ORDER BY] 에는 출력할 수 있는 행이 제한이 걸린다.

-- 수강생정보 소속반 별 학생의 인원 수 조회
SELECT 소속반, COUNT(학생ID) 학생수
FROM 수강생정보
GROUP BY 소속반 ;
-- 학생 이름 출력하고 싶을 때
SELECT 소속반, COUNT(학생ID) 학생수, 학생이름
FROM 수강생정보
GROUP BY 소속반, 학생이름 ;

-- 성적표 테이블 각 과목별 최고 성적과 최저 성적을 출력
SELECT 과목, MAX(성적) 최고점수, MIN(성적) 최저점수
FROM 성적표
GROUP BY 과목 ;

-- 성적표테이블 학생별 평균 점수
SELECT 학생ID, ROUND(AVG(성적), 1) 평균점수
FROM 성적표
GROUP BY 학생ID;

SELECT *
FROM 성적표;
-- 성적표 테이블 학생별 JAVA, DATABASE과목 성적 합 출력
SELECT 학생ID, SUM(성적)
FROM 성적표
WHERE 과목 IN ('JAVA', 'DATABASE')
GROUP BY 학생ID;

-- HAVING 절은 GROUP BY 절이 존재 할 때만 사용할 수있다.
-- 집계가 완료된 대상을 -> 조건을 통해 필터링하는 문법 (조건절)
-- 조건이 참인 결과만 출력이 된다는 점에서는 WHERE 절과 비슷하지만
-- HAVING 절은 그룹화(GROUP BY)된 대상에서 출력이 된다는 점에서 다르다.
/* 실행 순서
    5. SELECT        
    1. FROM         데이터를 가져올 테이블
    2. WHERE        조건
    3. GROUP BY   그룹화
    4. HAVING      그룹화 상태에서 데이터 조건지정
    6. ORDER BY    특정 컬럼으로 정렬
*/
-- 성적표테이블 -> 학생별 평균 성적 
-- 평균 성적이 75 이하인 출력
SELECT *
FROM 성적표 ;

SELECT 학생ID , ROUND( AVG(성적), 1) 평균성적
FROM 성적표
GROUP BY 학생ID 
HAVING AVG(성적) <= 75 ;

-- 수강생정보 테이블 -> 소속반 별 인원수 3명이상인 반만 출력
SELECT 소속반, COUNT(학생ID)
FROM 수강생정보
GROUP BY 소속반
HAVING COUNT(학생ID) >= 3 ;

-- 성적표테이블 -> 학생별 평균 성적을 구하되, 평균 성적이 NULL이 아닌 값만 출력 단, 소수점 1의자리까지만
SELECT 학생ID, ROUND( AVG(성적), 1 ) 평균성적
FROM 성적표
GROUP BY 학생ID
HAVING AVG(성적) IS NOT NULL ;

-- 부서별 최고 연봉이 10만 이상인 부서만 출력
SELECT department_id 부서, MAX(salary*12) 연봉
FROM    employees
GROUP BY department_id
HAVING  MAX( salary * 12 ) >= 100000 
ORDER BY MAX( salary * 12 ) DESC ;

-- 직업별 최고 급여 출력
SELECT job_id, MAX( salary )
FROM employees
GROUP BY job_id
ORDER BY MAX( salary ) DESC ;

-- 직업중 'IT_PROG','AD_PRES' 가 아닌 직업별 최고 연봉이 150,000 이상인 최고 연봉과 JOB_ID 출력
SELECT job_id, MAX( salary * 12 )
FROM employees
WHERE job_id NOT IN ( 'IT_PROG' , 'AD_PRES' )
GROUP BY job_id
HAVING MAX( salary * 12 ) IS NOT NULL AND MAX( salary * 12 ) >= 150000
ORDER BY MAX( salary * 12 ) DESC ;
































