-- CHAPTER 03. 오라클 함수 --

-- 함수란 (Function)
-- 입력값을 넣어서 특정한 기능을 통해 결과 값을 출력
-- 사용자 정의 함수 : 사용자가 필요에 의해 직접 정의한 함수
-- 내장 함수 : 오라클에서 미리 만들어 놓은 함수, 필요할 때마다 호출하여 사용
-- 문자형, 숫자형, 날짜형, 형변환형, NULL처리 함수, 조건함수
-- 함수이름()
--  => 함수를 실행할 때 사용하는 입력 값 : 인자 값, 매개변수

-- [ 문자형 함수 ]
-- UPPER() : 괄호 안 문자 데이터를 모두 대문자로 변환하여 출력
-- LOWER() : 괄호 안 문자 데이터를 모두 소문자로 변환하여 출력
SELECT UPPER('abcde123@@')
FROM DUAL;

-- DUAL 테이블이란?
-- 오라클최고관리자(SYS) 소유의 테이블
-- 임시 연산이나 함수의 결과 값 확인 용도로 사용하는 테스트용 테이블이다.

-- 직원테이블 -> FIRST_NAME, EMAIL 정보 출력
SELECT UPPER(FIRST_NAME), LOWER(EMAIL)
FROM EMPLOYEES ;

-- LENGTH() : 괄호 안 문자 데이터의 길이를 구하는 함수
SELECT LENGTH('HELLO WORLD')
FROM DUAL;

-- 직원 테이블 -> 직원의 이름, 이름의 길이 출력
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
FROM EMPLOYEES;

-- 이름의 길이가 5이상인 직원의 ID, 이름 출력
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) >= 5 ;

-- SUBSRT() : 문자열을 추출하는 함수
-- 1) SUBSTR( 입력값, 시작위치, 추출길이 )
--  > 문자열 데이터의 시작 위치부터 추출 길이만큼 출력
-- 2) SUBSTR( 입력값, 시작위치) 추출길이 생략
--  > 추출 길이 생략 시 문자열 데이터의 시작위치부터 끝까지 출력
SELECT SUBSTR('인공지능사관학교JS_B', 5, 4 ) 
        ,  SUBSTR('인공지능사관학교JS_B', 1, 4 )
        ,  SUBSTR('여러분최고에요', 4, 2 ) -- 추출길이까지 입력
        ,  SUBSTR('인공지능사관학교JS_B' , 9) -- 추출 길이 생략 후 출력
        ,  SUBSTR('인공지능사관학교JS_B' , 3)
FROM DUAL;

-- 입사 날짜를 연도, 월, 일 별로 출력
SELECT SUBSTR(HIRE_DATE, 1,2) "연도"
        ,  SUBSTR(HIRE_DATE, 4,2) "월"
        ,  SUBSTR(HIRE_DATE, 7) "일"
FROM EMPLOYEES ;

-- REPLACE() : 특정 문자를 다른 문자로 바꾸어 주는 함수
-- 1) REPLACE(문자열 데이터, 바꾸고 싶은 문자, 바꿔야할 문자)
-- 2) REPLACE(문자열데이터, 바꾸고 싶은 문자)
--  > 바꿔야할 문자를 생략시 바꾸고 싶은 문자는 문자열 데이터에서 삭제가 된다.
SELECT REPLACE('인공지능#사관학교', '#', '_')
        ,  REPLACE('인공지능#사관학교', '#')
FROM DUAL;

-- 직원테이블 -> 입사날짜 출력 : / 문자열 - 하이픈으로 바꿔 출력 / 삭제 출력
SELECT HIRE_DATE 
        ,  REPLACE(HIRE_DATE, '/', '-')
        ,  REPLACE(HIRE_DATE, '/')
FROM EMPLOYEES ;

-- CONCAT() : 두 문자열 데이터를 합치는 함수!!
-- 인자값으로 두개만 들어갈 수 있다. 
-- ' | | ' : 합성연산자 => 합성 연산자를 이용하면 문자열을 무한대로 연결이 가능하다. 
-- SELECT CONCAT('JS_B반', '최고'||'입니다.')
SELECT  CONCAT('JS_B반', '최고') || '입니다.'
FROM DUAL;

-- TRIM() : 입력 받은 문자형 데이터의 양 끝의 공백을 제거해주는 함수
SELECT  '       A         '
FROM DUAL;
SELECT  TRIM('       A         ')
FROM DUAL;
SELECT  TRIM('       A   B   C      ')
FROM DUAL;
-- 데이터의 중간 공백은 제거 못함.
-- REPLACE()함수를 활용하여 가운데 공백을 제거하는 방법
SELECT  REPLACE(TRIM('       A   B   C      '),' ' )
        ,   REPLACE('       A   B   C      ',' ')
FROM DUAL;

-- [ 숫자형 함수 ]
-- ROUND() : 특정 위치에서 반올림하는 함수
-- 1) ROUND(반올림할 숫자, 반올림 위치)
-- 2) ROUND(반올림할 숫자)
--  > 반올림 위치 생략시 소수점 첫째자리에서 강제로 반올림 수행
SELECT ROUND(1234.56789, 2)
        ,  ROUND(1234.56789)
        ,  ROUND(1234.56789, 3)
FROM DUAL;

-- TRUNC() : 특정 위치에서 버리는 함수
-- TRUNC(버림할 숫자, 버림 위치)
SELECT TRUNC(1234.56789, 2)
        ,  TRUNC(1234.56789)
FROM DUAL;

-- MOD() : 숫자를 나눈 나머지 값을 구하는 함수
--  > 홀수 , 짝수를 구분할 때 유용하게 사용한다.
-- MOD( 나눗셈 될 숫자, 나눌 숫자)
SELECT MOD( 10, 2 )
        ,  MOD(10 , 3)
        ,  MOD(15 , 6)
FROM DUAL ;

-- [ 날짜형 함수 ]
-- SYSDATE : 현재 날짜와 시간을 출력해주는 함수
-- 입력시 바로 출력되며, 현재 시간을 초 단위까지 출력 가능하다.
-- 날짜형 데이터는 연산이 가능
-- 날짜형 데이터 끼리는 연산이 불가능하다

SELECT SYSDATE
FROM DUAL ;
-- 날짜 형식 셋팅
-- 도구 > 환경설정 > 데이터베이스 > NLS > 날짜형식 > YYYY-MM-DD-HH24:MI:SS

SELECT SYSDATE "현재날짜"
        ,   SYSDATE +1 "다음날"
        ,   SYSDATE -1 "어제"
--        ,   SYSDATE + SYSDATE --날짜 데이터끼리는 연산이 불가능하다
FROM DUAL ;

-- 날짜데이터 활용 (실무)
SELECT SYSDATE "현재"
        ,   SYSDATE + 1 "하루 더함"
        ,   SYSDATE  + 1/24 "한시간 더함"
        ,   SYSDATE  + 1/24/60 "일분 더함"
        ,   SYSDATE  + 1/24/60/60 "일초 더함"
FROM DUAL;

-- ADD_MONTHS() : 몇개월 이후 날짜를 구하는 함수
-- ADD_MONTHS(날짜데이터, 더하거나 뺄 개월수)
SELECT SYSDATE "현재" 
        ,  ADD_MONTHS(SYSDATE,  -1) "1개월 전"
        ,  ADD_MONTHS(SYSDATE,  +3) "3개월 뒤"
FROM DUAL;

-- [ 형 변환 함수 ]
-- 형 변환 형태 종류
-- 암시적 형 변환 : 데이터 베이스가 자동으로 형 변환 해주는 것
SELECT SALARY
FROM EMPLOYEES ;

-- 명시적 형 변환 : 데이터 변환 형 함수를 사용해서 사용자가 직접 자료형을 지정 해주는 것
-- TO_CHAR() : 날짜, 숫자 데이터를 문자 데이터로 변환 해주는 함수
-- TO_CHAR(변환 할 데이터 , 출력 형태)
SELECT SALARY
        ,  TO_CHAR(SALARY, '$999,999')
FROM EMPLOYEES ;

SELECT TO_CHAR(SYSDATE, 'YY/MM/DD/DAY')
FROM DUAL ;

-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환하는 함수
-- TO_NUMBER(문자열 데이터, 인식 될 숫자 형태)
SELECT '1000' + 500 -- 암시적 형변환으로 정상적으로 연산이 된다.
FROM DUAL ;

SELECT TO_NUMBER('1,000', '999,999') + 500 "TO_NUMBER" 
-- 1,000 형식으로 문자형이 되버리면 연산 불가능
-- 이때 TO_NUMBER() 함수를 사용하여 형변환 해준다
FROM DUAL ;

-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환하는 함수
-- TO_DATE(문자열 데이터, 인식 될 날짜 형태)
SELECT TO_DATE('24/06/26', 'YY-MM-DD')
FROM DUAL ;

-- [ NULL 처리 함수 ]
-- NVL / NVL2 : NULL값을 대체 할 수 있는 함수
-- 1) NVL ( NULL 여부를 검사할 데이터, NULL일 경우 반환할 데이터 )
-- 2) NVL2( NULL 여부를 검사할 데이터 [ 1 ] , [ 1 ] 의 값이 NULL이 아닐 경우 반환할 데이터 [ 2 ], [ 1 ] 의 값이 NULL일 경우 반환 할 데이터 [ 3 ] )

SELECT DEPARTMENT_ID, FIRST_NAME
        ,  NVL(DEPARTMENT_ID, 0) NVL -- NVL
        ,  NVL2(DEPARTMENT_ID, 1, 0) NVL2 -- NVL2
FROM EMPLOYEES ;

-- NVL
-- 보너스가 없는 직원들은 숫자 0으로 대체해서 출력
SELECT FIRST_NAME, COMMISSION_PCT, NVL( COMMISSION_PCT, 0 ) 보너스 
FROM EMPLOYEES ;

-- NVL2
-- 직원아이디, 이름, 매니저 아이디 출력
-- 매니저가 있는 직원은 직원 없는 직원은 '대표' 출력
SELECT EMPLOYEE_ID 사번, FIRST_NAME 이름, MANAGER_ID, NVL2( MANAGER_ID, '직원' , '대표' ) 직급
FROM EMPLOYEES ;

-- [ 조건 함수 ]
-- DECODE() : 상황에 따라 달느 데이터를 반환하는 함수
-- > 검사 대상을 비교해서 지정한 값을 반환
-- DECODE(검사대상이 될 컬럼 또는 데이터 (기준) <1> , <1> 의 비교 값<2>, 일치 시 반환할 값<3>,일치하지 않을 때 반환 값<마지막>  )

-- 직원아이디,이름,매니저아이디를 출력
-- 단 매니저가 있는 직원은 직원으로 , 없는 직원은 대표로 출력
SELECT EMPLOYEE_ID 사번, FIRST_NAME 이름
        ,   MANAGER_ID 담당매니저
        ,   DECODE( MANAGER_ID, NULL , '대표' , '직원' ) 직급
FROM EMPLOYEES ;

SELECT EMPLOYEE_ID 사번, FIRST_NAME 이름, MANAGER_ID
          -- , DECODE( MANAGER_ID , NULL , '사장' , 100 , '전무이사' , 101 , '상무이사' , 102 , '팀장' , '직원') 직급
          , DECODE(EMPLOYEE_ID , 100 , '사장' , 101 , '전무이사' , 102 , '상무이사' , 103 , '팀장' , '직원' ) 직급
FROM EMPLOYEES ;