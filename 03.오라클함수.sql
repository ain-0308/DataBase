-- CHAPTER 03. ����Ŭ �Լ� --

-- �Լ��� (Function)
-- �Է°��� �־ Ư���� ����� ���� ��� ���� ���
-- ����� ���� �Լ� : ����ڰ� �ʿ信 ���� ���� ������ �Լ�
-- ���� �Լ� : ����Ŭ���� �̸� ����� ���� �Լ�, �ʿ��� ������ ȣ���Ͽ� ���
-- ������, ������, ��¥��, ����ȯ��, NULLó�� �Լ�, �����Լ�
-- �Լ��̸�()
--  => �Լ��� ������ �� ����ϴ� �Է� �� : ���� ��, �Ű�����

-- [ ������ �Լ� ]
-- UPPER() : ��ȣ �� ���� �����͸� ��� �빮�ڷ� ��ȯ�Ͽ� ���
-- LOWER() : ��ȣ �� ���� �����͸� ��� �ҹ��ڷ� ��ȯ�Ͽ� ���
SELECT UPPER('abcde123@@')
FROM DUAL;

-- DUAL ���̺��̶�?
-- ����Ŭ�ְ������(SYS) ������ ���̺�
-- �ӽ� �����̳� �Լ��� ��� �� Ȯ�� �뵵�� ����ϴ� �׽�Ʈ�� ���̺��̴�.

-- �������̺� -> FIRST_NAME, EMAIL ���� ���
SELECT UPPER(FIRST_NAME), LOWER(EMAIL)
FROM EMPLOYEES ;

-- LENGTH() : ��ȣ �� ���� �������� ���̸� ���ϴ� �Լ�
SELECT LENGTH('HELLO WORLD')
FROM DUAL;

-- ���� ���̺� -> ������ �̸�, �̸��� ���� ���
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
FROM EMPLOYEES;

-- �̸��� ���̰� 5�̻��� ������ ID, �̸� ���
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) >= 5 ;

-- SUBSRT() : ���ڿ��� �����ϴ� �Լ�
-- 1) SUBSTR( �Է°�, ������ġ, ������� )
--  > ���ڿ� �������� ���� ��ġ���� ���� ���̸�ŭ ���
-- 2) SUBSTR( �Է°�, ������ġ) ������� ����
--  > ���� ���� ���� �� ���ڿ� �������� ������ġ���� ������ ���
SELECT SUBSTR('�ΰ����ɻ���б�JS_B', 5, 4 ) 
        ,  SUBSTR('�ΰ����ɻ���б�JS_B', 1, 4 )
        ,  SUBSTR('�������ְ���', 4, 2 ) -- ������̱��� �Է�
        ,  SUBSTR('�ΰ����ɻ���б�JS_B' , 9) -- ���� ���� ���� �� ���
        ,  SUBSTR('�ΰ����ɻ���б�JS_B' , 3)
FROM DUAL;

-- �Ի� ��¥�� ����, ��, �� ���� ���
SELECT SUBSTR(HIRE_DATE, 1,2) "����"
        ,  SUBSTR(HIRE_DATE, 4,2) "��"
        ,  SUBSTR(HIRE_DATE, 7) "��"
FROM EMPLOYEES ;

-- REPLACE() : Ư�� ���ڸ� �ٸ� ���ڷ� �ٲپ� �ִ� �Լ�
-- 1) REPLACE(���ڿ� ������, �ٲٰ� ���� ����, �ٲ���� ����)
-- 2) REPLACE(���ڿ�������, �ٲٰ� ���� ����)
--  > �ٲ���� ���ڸ� ������ �ٲٰ� ���� ���ڴ� ���ڿ� �����Ϳ��� ������ �ȴ�.
SELECT REPLACE('�ΰ�����#����б�', '#', '_')
        ,  REPLACE('�ΰ�����#����б�', '#')
FROM DUAL;

-- �������̺� -> �Ի糯¥ ��� : / ���ڿ� - ���������� �ٲ� ��� / ���� ���
SELECT HIRE_DATE 
        ,  REPLACE(HIRE_DATE, '/', '-')
        ,  REPLACE(HIRE_DATE, '/')
FROM EMPLOYEES ;

-- CONCAT() : �� ���ڿ� �����͸� ��ġ�� �Լ�!!
-- ���ڰ����� �ΰ��� �� �� �ִ�. 
-- ' | | ' : �ռ������� => �ռ� �����ڸ� �̿��ϸ� ���ڿ��� ���Ѵ�� ������ �����ϴ�. 
-- SELECT CONCAT('JS_B��', '�ְ�'||'�Դϴ�.')
SELECT  CONCAT('JS_B��', '�ְ�') || '�Դϴ�.'
FROM DUAL;

-- TRIM() : �Է� ���� ������ �������� �� ���� ������ �������ִ� �Լ�
SELECT  '       A         '
FROM DUAL;
SELECT  TRIM('       A         ')
FROM DUAL;
SELECT  TRIM('       A   B   C      ')
FROM DUAL;
-- �������� �߰� ������ ���� ����.
-- REPLACE()�Լ��� Ȱ���Ͽ� ��� ������ �����ϴ� ���
SELECT  REPLACE(TRIM('       A   B   C      '),' ' )
        ,   REPLACE('       A   B   C      ',' ')
FROM DUAL;

-- [ ������ �Լ� ]
-- ROUND() : Ư�� ��ġ���� �ݿø��ϴ� �Լ�
-- 1) ROUND(�ݿø��� ����, �ݿø� ��ġ)
-- 2) ROUND(�ݿø��� ����)
--  > �ݿø� ��ġ ������ �Ҽ��� ù°�ڸ����� ������ �ݿø� ����
SELECT ROUND(1234.56789, 2)
        ,  ROUND(1234.56789)
        ,  ROUND(1234.56789, 3)
FROM DUAL;

-- TRUNC() : Ư�� ��ġ���� ������ �Լ�
-- TRUNC(������ ����, ���� ��ġ)
SELECT TRUNC(1234.56789, 2)
        ,  TRUNC(1234.56789)
FROM DUAL;

-- MOD() : ���ڸ� ���� ������ ���� ���ϴ� �Լ�
--  > Ȧ�� , ¦���� ������ �� �����ϰ� ����Ѵ�.
-- MOD( ������ �� ����, ���� ����)
SELECT MOD( 10, 2 )
        ,  MOD(10 , 3)
        ,  MOD(15 , 6)
FROM DUAL ;

-- [ ��¥�� �Լ� ]
-- SYSDATE : ���� ��¥�� �ð��� ������ִ� �Լ�
-- �Է½� �ٷ� ��µǸ�, ���� �ð��� �� �������� ��� �����ϴ�.
-- ��¥�� �����ʹ� ������ ����
-- ��¥�� ������ ������ ������ �Ұ����ϴ�

SELECT SYSDATE
FROM DUAL ;
-- ��¥ ���� ����
-- ���� > ȯ�漳�� > �����ͺ��̽� > NLS > ��¥���� > YYYY-MM-DD-HH24:MI:SS

SELECT SYSDATE "���糯¥"
        ,   SYSDATE +1 "������"
        ,   SYSDATE -1 "����"
--        ,   SYSDATE + SYSDATE --��¥ �����ͳ����� ������ �Ұ����ϴ�
FROM DUAL ;

-- ��¥������ Ȱ�� (�ǹ�)
SELECT SYSDATE "����"
        ,   SYSDATE + 1 "�Ϸ� ����"
        ,   SYSDATE  + 1/24 "�ѽð� ����"
        ,   SYSDATE  + 1/24/60 "�Ϻ� ����"
        ,   SYSDATE  + 1/24/60/60 "���� ����"
FROM DUAL;

-- ADD_MONTHS() : ��� ���� ��¥�� ���ϴ� �Լ�
-- ADD_MONTHS(��¥������, ���ϰų� �� ������)
SELECT SYSDATE "����" 
        ,  ADD_MONTHS(SYSDATE,  -1) "1���� ��"
        ,  ADD_MONTHS(SYSDATE,  +3) "3���� ��"
FROM DUAL;

-- [ �� ��ȯ �Լ� ]
-- �� ��ȯ ���� ����
-- �Ͻ��� �� ��ȯ : ������ ���̽��� �ڵ����� �� ��ȯ ���ִ� ��
SELECT SALARY
FROM EMPLOYEES ;

-- ����� �� ��ȯ : ������ ��ȯ �� �Լ��� ����ؼ� ����ڰ� ���� �ڷ����� ���� ���ִ� ��
-- TO_CHAR() : ��¥, ���� �����͸� ���� �����ͷ� ��ȯ ���ִ� �Լ�
-- TO_CHAR(��ȯ �� ������ , ��� ����)
SELECT SALARY
        ,  TO_CHAR(SALARY, '$999,999')
FROM EMPLOYEES ;

SELECT TO_CHAR(SYSDATE, 'YY/MM/DD/DAY')
FROM DUAL ;

-- TO_NUMBER() : ���� �����͸� ���� �����ͷ� ��ȯ�ϴ� �Լ�
-- TO_NUMBER(���ڿ� ������, �ν� �� ���� ����)
SELECT '1000' + 500 -- �Ͻ��� ����ȯ���� ���������� ������ �ȴ�.
FROM DUAL ;

SELECT TO_NUMBER('1,000', '999,999') + 500 "TO_NUMBER" 
-- 1,000 �������� �������� �ǹ����� ���� �Ұ���
-- �̶� TO_NUMBER() �Լ��� ����Ͽ� ����ȯ ���ش�
FROM DUAL ;

-- TO_DATE() : ���� �����͸� ��¥ �����ͷ� ��ȯ�ϴ� �Լ�
-- TO_DATE(���ڿ� ������, �ν� �� ��¥ ����)
SELECT TO_DATE('24/06/26', 'YY-MM-DD')
FROM DUAL ;

-- [ NULL ó�� �Լ� ]
-- NVL / NVL2 : NULL���� ��ü �� �� �ִ� �Լ�
-- 1) NVL ( NULL ���θ� �˻��� ������, NULL�� ��� ��ȯ�� ������ )
-- 2) NVL2( NULL ���θ� �˻��� ������ [ 1 ] , [ 1 ] �� ���� NULL�� �ƴ� ��� ��ȯ�� ������ [ 2 ], [ 1 ] �� ���� NULL�� ��� ��ȯ �� ������ [ 3 ] )

SELECT DEPARTMENT_ID, FIRST_NAME
        ,  NVL(DEPARTMENT_ID, 0) NVL -- NVL
        ,  NVL2(DEPARTMENT_ID, 1, 0) NVL2 -- NVL2
FROM EMPLOYEES ;

-- NVL
-- ���ʽ��� ���� �������� ���� 0���� ��ü�ؼ� ���
SELECT FIRST_NAME, COMMISSION_PCT, NVL( COMMISSION_PCT, 0 ) ���ʽ� 
FROM EMPLOYEES ;

-- NVL2
-- �������̵�, �̸�, �Ŵ��� ���̵� ���
-- �Ŵ����� �ִ� ������ ���� ���� ������ '��ǥ' ���
SELECT EMPLOYEE_ID ���, FIRST_NAME �̸�, MANAGER_ID, NVL2( MANAGER_ID, '����' , '��ǥ' ) ����
FROM EMPLOYEES ;

-- [ ���� �Լ� ]
-- DECODE() : ��Ȳ�� ���� �޴� �����͸� ��ȯ�ϴ� �Լ�
-- > �˻� ����� ���ؼ� ������ ���� ��ȯ
-- DECODE(�˻����� �� �÷� �Ǵ� ������ (����) <1> , <1> �� �� ��<2>, ��ġ �� ��ȯ�� ��<3>,��ġ���� ���� �� ��ȯ ��<������>  )

-- �������̵�,�̸�,�Ŵ������̵� ���
-- �� �Ŵ����� �ִ� ������ �������� , ���� ������ ��ǥ�� ���
SELECT EMPLOYEE_ID ���, FIRST_NAME �̸�
        ,   MANAGER_ID ���Ŵ���
        ,   DECODE( MANAGER_ID, NULL , '��ǥ' , '����' ) ����
FROM EMPLOYEES ;

SELECT EMPLOYEE_ID ���, FIRST_NAME �̸�, MANAGER_ID
          -- , DECODE( MANAGER_ID , NULL , '����' , 100 , '�����̻�' , 101 , '���̻�' , 102 , '����' , '����') ����
          , DECODE(EMPLOYEE_ID , 100 , '����' , 101 , '�����̻�' , 102 , '���̻�' , 103 , '����' , '����' ) ����
FROM EMPLOYEES ;