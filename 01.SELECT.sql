-- CHAPTER 01. SELECT


-- �ּ� ���� �ٲٱ� : ���� > ȯ�漳�� > �ڵ������� > PL/SQL�ּ�
-- ���� ũ�� Ű��� : ���� > ȯ�漳�� > �ڵ������� > �۲�
-- �� ���� �ֱ� : ���� > ȯ�漳�� > �ڵ������� > �࿩�� > �� ��ȣ ǥ��

-- �ּ� ��ȣ 1 : -- ���� �ּ�
-- �ּ� ��ȣ 2 : /**/ ������ �ּ�
/*
1. SQL ���忡�� ��ҹ��ڸ� �������� �ʴ´�.
2. ���⳪ �ٹٲ� ���� ��ɾ� ���࿡ ������ ���� �ʴ´�.
3. SQL ���� ������ �� ����Ŭ��(;)�� ������Ѵ�.
4. SQL ���� ����Ű : Ctrl + Enter, F9
*/
DESC employees;
--DESC(DESCRIBE)>�����ϴ�, ��ɹ��� SQL���� ���Ǵ� �����ͺ��̽� ���̺��� ������ Ȯ���ϴ� ���� ���Դϴ�. 
--�ַ� ���̺��� ��(�÷�)�� ���� ������ �����ϸ�, 
--Ư�� ���̺��̳� ���� ������ ��ȸ�� �� �����մϴ�.


SELECT first_name FROM employees;
-- [ SELECT �� �⺻ ��� ��� ]
-- SELECT   ��ȸ�� �÷���
-- FROM     ��ȸ�� ���̺� �̸�

SELECT first_name, email FROM employees;

-- �빮�ڷ� �ۼ��϶�� �Ͻ�
-- �������̺��� �μ�ID, FIRST_NAME, EMAIL, SALARY, ��ȭ��ȣ ������ ���
SELECT DEPARTMENT_ID, FIRST_NAME, EMAIL, SALARY, PHONE_NUMBER
FROM EMPLOYEES ;


-- �������̺��� ����ID, ��ȭ��ȣ, �μ�ID, LAST_NAME �� ���
SELECT employee_id
          , phone_number
          , department_id
          , last_name 
FROM employees ;

-- ���� ���̺��� ����id, �޿�, �Ŵ���id ���
SELECT EMPLOYEE_ID
         , SALARY
         , MANAGER_ID
FROM EMPLOYEES ;

-- �μ� ���̺��� �μ�ID, �μ���, LOCATION_ID�� ���
SELECT DEPARTMENT_ID
          , DEPARTMENT_NAME
          , LOCATION_ID 
FROM DEPARTMENTS ;

--  * (�ƽ�Ÿ����ũ) : ��ü�� �ǹ�, ��ü ��ȸ

-- �������̺��� ��� ������ ���
SELECT *
FROM EMPLOYEES ;

-- �μ� ���̺��� ��� ������ ���, -- ��� �μ��� �ִ���
SELECT *
FROM DEPARTMENTS ; -- 27���� �μ�

-- ���� ���̺��� ��� ���� ���
SELECT *
FROM JOBS ;


-- ���� ���̺��� JOB_ID
SELECT JOB_ID
FROM EMPLOYEES ;

-- DISTINCT �ߺ� ������ ���� 
-- SELECT ������ [ALL, DISTINCT] - �⺻�����δ� ALL ���� , �ѹ��� ��밡��

SELECT DISTINCT JOB_ID
FROM EMPLOYEES;

-- ���� ���̺��� �μ� ID �ߺ� �����Ͽ� ��� 
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES ;

-- �������̺��� �Ի��� ������ �ߺ��� �����Ͽ� ���
SELECT DISTINCT HIRE_DATE
FROM EMPLOYEES ;

-- �������̺��� JOB_ID , �μ�ID �ߺ����� ���
SELECT DISTINCT JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES ;
-- ���� ���� ������� ��ȸ�� �ϸ� �ڿ� ���� �÷��� DEPARTMENT_ID �÷��� ���� ����� �ߺ� ���Ű� ���� ���� ���� Ȯ���� �� �ִ�.
-- DISTINCT �ڿ� 2�� �̻��� �÷��� ������, ���� �÷��� �ߺ��� �־ �ٸ� �� �÷��� ���� �ٸ��� �ٸ��� ��޵Ǽ� �ߺ����Ű� ���������� �����ʴ´�.
-- DISTINCT �� ù��° �÷��� �ߺ� üũ �ϰ� �� ���� �ι�° �÷��� �ߺ� üũ�� ���ִµ� �̶�, ���� �ߺ� �����Ͷ�� �ߺ��̶�� �ν��ϰ� �׷��� ������ �������� �����ͷ� �ν���

-- �÷��� �ڷ����� ������, ��¥�� �̸� ���� ������ �����ϴ�.

-- ����ID�� �̸�F, �޿������� ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12 SALLARY
FROM EMPLOYEES ;

-- ��Ī ����ϱ�
-- Alias ��� �ϸ� �Ѵ��� ���� ���� ���� �� �� �ִ�.
-- AS ��� Ű���带 ����Ͽ� ��Ī�� �����Ѵ�.

-- ��Ī ��� ���
-- 1. SELECT �÷��̸� ��Ī
-- 2. SELECT �÷��̸� "��Ī"
-- 3. SELECT �÷��̸� AS ��Ī
-- 4. SELECT �÷��̸� AS "��Ī"

-- �������̺� - �����̸�, �޿� ����, ������ ����
-- ������ ���������̶�� ��Ī ����ؼ� ���
SELECT FIRST_NAME, SALARY, SALARY*12 ��������
FROM EMPLOYEES ;

-- �������̺� - �����̸�, �Ի��� �Ի��� ������, �Ի��� ��Ʊ�� �� ���
SELECT FIRST_NAME, HIRE_DATE, HIRE_DATE+1 "�Ի���_������", HIRE_DATE+2 "�Ի���_��Ʊ��" 
FROM EMPLOYEES ;

-- ORDER BY ���̶�?
-- Ư�� �÷��� �������� ���ĵ� ���·� ����ϴµ� ����Ѵ�
-- SQL ���忡�� ���� �������� ��ġ�ϸ� 
-- SQL ���� �������� ���� �������� ���� �ȴ�.
-- ������ ���Ĺ���� �������� ������, �⺻������ ���������� ����ȴ�.
-- ���������� ����ϰ� �Ǿ��� �� �ӵ��� ������ �������ٰ� ��

-- ASC(Ascending) : �������� ���
-- DESC(Descending) : �������� ���

-- ORDER BY �⺻ ��� ���
/*
SELECT         ��ȸ�ϰ��� �ϴ� �÷��̸�
FROM          ��ȸ�ϰ��� �ϴ� ���̺� �̸�
ORDER BY    Ư�� �÷��� �̿��ؼ� ����
*/
-- ������ ��� ������ ���
-- �� �޿� �������� �������� ���� ���
SELECT * 
FROM EMPLOYEES
ORDER BY SALARY ;

-- �ֱٿ� �Ի��� ��¥ ���� / ������ �̸� �Ի糯¥
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC ;

-- �������̺��� ����ID �μ�ID �̸� �޿� ������ ��� �μ�ID�� ��������, �޿��� ��������
SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC ;
-- ���� �μ����� �ٹ��ϰ� �ִ� �����鳢�� �޿��� ���� ������� �������� ������ �Ȱ�

-- NULL �̶�?
-- �������� ���� ������ ����ִ� ���¸� ����
-- ���� �������� �ʰų�, �������� ���� ���� �ǹ�
-- ���� 0�� �� ���ڿ� " " �� NULL ���� �ƴ�
-- NULL �� ������ �ϸ� ��� ���� ������ NULL ���� ����
-- NULL �� ���ϸ� ��� ���� ������ FALSE ���� ���´�

SELECT * FROM EMPLOYEES ;
-- ���� ���̺��� ����ID ���ʽ�, ���ʽ� 2�� ������ ��� AS UP_BONUS ��Ī ��� ���
SELECT EMPLOYEE_ID, COMMISSION_PCT, COMMISSION_PCT*2 "UP_BONUS"
FROM EMPLOYEES;

-- ���� 1���� UP_BONUS �� ��� ���� ����غ��� �� �׷��� ���Դ��� ����
-- NULL �� ������ �� ��, ��� ���� ������ NULL�̱� ������.

