-- CHAPTER 02. WHERE 
/*
SELECT   �÷�
FROM    ���̺��̸�
WHERE   ���ϴ� ���� �����ϱ� ���� ���ǽ� ;
*/
-- ���� ���̺� ����ID�� 105�� ������ �̸� �� ���
SELECT FIRST_NAME, LAST_NAME, EMPLOYEE_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 105;

-- �μ����̺� �Ŵ���ID 100�� �μ��̸�, �μ� ID ���
SELECT DEPARTMENT_NAME, DEPARTMENT_ID
FROM DEPARTMENTS
WHERE MANAGER_ID = 100 ;

-- �޿� 9000 �޴� �����̸� �������̵� �μ����̵� �޿� ���� ���
SELECT FIRST_NAME, EMPLOYEE_ID, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE SALARY = 9000 ;

-- ���� ���̺��� �������̵� 100�� ������ JOB_ID�� �޿������� ���
SELECT JOB_ID, SALARY
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 100 ;

-- �ڷ����� �������̳� ��¥���̸� ��� ������ ����
DESC EMPLOYEES ;

-- �ڷ����� ���ͷ�
-- NUMBER    :   ������ -> 123, 1.12
-- VARCHAR2 :   ������ -> 'ABCD' (����ǥ�� ������� ��)
-- DATE         :   ��¥�� -> '24/06/25' (����ǥ�� ������� ��)

-- ��������� : ( +, -, *, / )
SELECT SALARY * 12 AS ����
FROM EMPLOYEES ;

SELECT HIRE_DATE, HIRE_DATE + 1 AS ������
FROM EMPLOYEES ;

-- �񱳿����� ( >, <, >= , <=, = )
-- A > B   :  ũ��, �ʰ�
-- A >= B :  ũ�ų� ����, �̻�
-- A < B   :  �۴�, �̸�
-- A <= B :  �۰ų� ����, ����

-- �������̺� - > �޿��� 5000 ������ ������ FIRST_NAME, SALARY ������ ���
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY <= 5000 ;

-- ���� ���̺� -> ������ 10�� �̻��� ������ �̸��� �޿�, ������ ������ ���
SELECT FIRST_NAME, SALARY, SALARY*12 ����
FROM EMPLOYEES
WHERE (SALARY*12) >= 100000 ; 

-- � �� ������ ( =, != )
-- ����       : =
-- �����ʴ� : !=, <>, ^=
-- �����ʴ�(�����񱳿�����) : NOT A = B

-- �������̺� -> �������̵� IT_PROG �� �ƴ� ������ ���� ���
-- FIRST_NAME, JOB_ID
SELECT FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID != 'IT_PROG' ;

-- �������̺� -> EMAIL ������ SKING�� ������ ��� ������ ���
SELECT * 
FROM EMPLOYEES 
WHERE EMAIL = 'SKING' ;

-- �������̺� -> �Ի糯¥ 06/03/07 �� �Ի��� ������ ���� ���̵�, �̸��� ����
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE HIRE_DATE = '06/03/07' ;

-- JOB_ID �� 'ST_MAN' �� ������ ���� �� ���ΰ�?
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = 'ST_MAN' ;

-- �� ������ ( True or False )
--   2�� �̻��� ������ �̾��ִ� ������
--   AND : ������ ��� �����ϴ� ��� TRUE ��ȯ
--   OR   : �ϳ��� �����̶� �����ϴ� ��� TRUE ��ȯ
-- �켱����
--   AND > OR 
-- �켱������ ���� ������� ������ �޶��� �� �ִ�
--  OR ������ �������ϰ� �ʹٸ� () �Ұ�ȣ�� ���� �������ϰ� ���ش� 

-- AND ����
-- TRUE   AND  TRUE = TRUE
-- TRUE   AND  FALSE = FALSE
-- FALSE  AND  FALSE = FALSE
-- FALSE  AND  FALSE = FALSE

-- OR ����
-- TRUE OR TRUE  = TRUE
-- TRUE OR FALSE  = TRUE
-- FALSE OR FALSE = FALSE
-- FALSE OR TRUE  = TRUE

-- �� ������ ��� ��� �� ���� ����
--  3.  SELECT  ��ȸ�� �÷���
--  1.  FROM   ���̺��̸�
--  2.  WHERE  ����1 AND/OR ����2 AND/OR ����3 AND/OR ����4 ...

-- �μ� ID �� 90 �޿��� 5000 �̻��� ���� ���̵�� �̸� ��� / ���?
-- 3��
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90 AND SALARY > 5000 ;

-- �μ�ID 100, �Ի��� 06/02/02 ���� �Ի��� ���� �� ��� 
-- OR : 55��
-- AND : 2��
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100 OR HIRE_DATE > '06/02/02' ;

-- ������ 'SA_REP' �̸鼭 �޿��� 10000 �̻��� �޴� ������ �� ���
-- 3��
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = 'SA_REP' AND SALARY > 10000 ;

-- �μ�ID 100 �̰ų� 90�� �����߿��� ����ID�� 101�� ������ ����ID, �̸�, ���� ��� ��, ������ AnnSal ��Ī ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12 AnnSal
FROM EMPLOYEES
WHERE (DEPARTMENT_ID = 100 OR DEPARTMENT_ID = 90) AND EMPLOYEE_ID = 101 ;

-- NULL  ���� ������
-- IS NULL          : ������ ���� NULL �� ���� ��ȸ
-- IS NOT NULL   : ������ ���� NULL�� �ƴ� ���� ��ȸ

-- DEPARTMENT_ID = NULL
-- �μ� ID�� ���� ������ �̸���? 
-- Kimberely
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL ;

-- ���ʽ��� �ް� ���ϴ� ������ ���� �� ����ΰ�
-- 35��
SELECT *
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL ;

-- SQL ������
-- IN, BETWEEN A AND B, LIKE

--  IN : Ư�� �÷��� ���Ե� �����͸� ������ ��ȸ�� �� ���
--    = + OR ��� ���� ���� ���� ��� 
--    NULL ���� �����ϴ� Ư¡�� ������ ����

-- NOT IN : IN ���� ���ǿ� �ش���� �ʴ� �����͸� ���
-- NULL ���� �ְ� �Ǹ� �����ü�� �����ʴ´�.
-- != + AND ��� ���� ���� ���� ��µȴ�.

--  BETWEEN A AND B :
-- ���� ���� ���� �����͸� ��ȸ�� �� ���
-- > BETWEEN �ּҰ� AND �ִ밪
-- > Ư�� �� ���� �ּ�, �ְ� ������ �����Ͽ� �ش� ���� ���� �����͸� ��ȸ�ϴ� ��


-- ���� ���̺� -> �μ� ID 30�̰ų� 50�̰ų� 90�� ��� ������ ����
-- 54��
SELECT * 
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN ( 30, 50, 90 ) ;

-- �������̺� -> �������̵� AV_VP�̰ų� ST_MAN �� ������ �̸��� �������̵� ��� 
SELECT FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN ('AV_VP', 'ST_MAN') ;

-- 
SELECT FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID NOT IN (100, 120, 121) ;

-- �������̺� -> �޿��� 1�� �̻� 2�� ������ �޿��� �޴� ������ �̸��� �޿� ���� ���
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 10000 AND 20000 ;

-- �������̺� -> 05�⿡ �Ի��� ������ �̸� , �Ի糯¥
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31';

-- LIKE ������
-- �Ϻ� ���ڿ��� ���Ե� �����͸� ��ȸ�Ҷ� ����ϴ� ��
-- %, _ _ ��� ���ϵ� ī�带 �̿��ؼ� ��Ī ������ �����ϴ� ��
-- % : ���̿� ������� ��� ���� �����͸� �ǹ�
-- __ : � ���̵� ������� �Ѱ��� ���� �����͸� �ǹ�

-- �ڵ�����ȣ�� 650���� �����ϴ� ������ ���� ã��
SELECT PHONE_NUMBER
FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE '650%' ;

-- �������̺�-> �̸��� S�� �����ϰ� N���� ������ ������ �̸� ã��
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%n' ; 

-- �������̺� -> �̸��� IT�� ������ �� 4������ ������ �̸� ã��
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__it' ;

-- �������̺�-> �̸� �ι�°���ڰ� E�� ������ �̸� ã��
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_e%' ;

-- ���� ���̺��� 01���� �Ի��� ������ �Ի糯¥ ã��
SELECT HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '__/01/__' ;



