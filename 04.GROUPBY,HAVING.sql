-- CHAPTER 04. GROUP BY / HAVING --
-- [ �����Լ��� ���� ]
-- ������ �Լ� : �Էµ� �ϳ��� ��� ����� �ϳ��� ������ �Լ�
-- ������ �Լ� : ���� ���� �Է¹޾� �ϳ��� ��� ������ ��µǴ� �Լ�
--   > ������ �Լ��� �����Լ� ��� �θ���.

-- ������ �Լ� (���� �Լ�) Ư¡ 
--  1. ���� �Լ��� NULL���� �����ϴ� Ư���� ������ �ִ�.
--  2. ���� �Լ��� �׷�ȭ(GROUP BY) �� �Ǿ� �ִ� ���¿����� ����� �����ϴ�.

-- [ �����Լ��� ���� ]
-- COUNT() : ������ �������� ������ ��ȯ(NULL�� ����) / [ * ] <- ��ü �˻��� �� �� �ִ�.
-- SUM() : ������ �������� ���� ��ȯ
-- MAX() : ������ �������� �ִ� ���� ��ȯ
-- MIN() : ������ �������� �ּ� ���� ��ȯ
-- AVG() : ������ �������� ��� �� ��ȯ

-- ���� ���̺� -> ���� ���̵� ���� ����
SELECT COUNT(EMPLOYEE_ID) �����
FROM EMPLOYEES 
GROUP BY() ; -- ���� ���̺��� �ϳ��� �׷����� �����ɷ� �ν��ؼ� �׷���̰� �ȴ�.

-- �μ����̺� �μ�ID ���� ���� ��ȸ
SELECT COUNT(DEPARTMENT_ID)
FROM DEPARTMENTS;

-- �������̺� �μ�ID ���� ���� ��ȸ
SELECT COUNT(DEPARTMENT_ID)
FROM EMPLOYEES ;

-- COUNT�Լ��� * <- �� �� �� �ִ� Ư¡�� ������ ����
-- NULL ������ �����Ͽ� ��� ���� ��ȯ
SELECT COUNT(*) -- NULL������ �����Ͽ� ��� ���� �������
FROM EMPLOYEES ;

-- �����޿��� �� �հ�
SELECT SUM(SALARY) �հ�
FROM EMPLOYEES ;

-- �������� �ִ� �޿��� �ʼ� �޿��� ���
SELECT MAX(SALARY) MAX, MIN(SALARY) MIN
FROM EMPLOYEES ;

-- �μ����̵� 100�� ������ ��� �޿��� ���
SELECT ROUND(AVG(SALARY), 1) AVG
FROM EMPLOYEES 
WHERE DEPARTMENT_ID = 100 ;

SELECT *
FROM ����ǥ ;

SELECT *
FROM ���������� ;

-- SQL �ۼ����� / �������
/*                    ���� ����
 1. SELECT              5                  
 2. FROM               1
 3. WHERE              2
 4. GROUP BY         3 
 5. HAVING            4
 6. ORDER BY          6
*/

-- GROUP BY : Ư�� �÷��� �������� �׷�ȭ(����)
-- [ GROUP BY  ��� �� / ���� ���� ]
-- 4. SELECT
-- 1. FROM
-- 2. WHERE
-- 3. GROUP BY

-- ���� ���� ����
-- 1. GROUP BY �� Ư�� �÷��� ����ϴ� ���� ���� ���Ұ� �����ϱ� ������ GROUP BY���� �ʰ� ����Ǵ� ����
-- SQL ���� ������ ���ؼ� [HAVING, SELECT, ORDER BY] ���� ����� �� �ִ� ���� ������ �ɸ���.

-- ���������� �Ҽӹ� �� �л��� �ο� �� ��ȸ
SELECT �Ҽӹ�, COUNT(�л�ID) �л���
FROM ����������
GROUP BY �Ҽӹ� ;
-- �л� �̸� ����ϰ� ���� ��
SELECT �Ҽӹ�, COUNT(�л�ID) �л���, �л��̸�
FROM ����������
GROUP BY �Ҽӹ�, �л��̸� ;

-- ����ǥ ���̺� �� ���� �ְ� ������ ���� ������ ���
SELECT ����, MAX(����) �ְ�����, MIN(����) ��������
FROM ����ǥ
GROUP BY ���� ;

-- ����ǥ���̺� �л��� ��� ����
SELECT �л�ID, ROUND(AVG(����), 1) �������
FROM ����ǥ
GROUP BY �л�ID;

SELECT *
FROM ����ǥ;
-- ����ǥ ���̺� �л��� JAVA, DATABASE���� ���� �� ���
SELECT �л�ID, SUM(����)
FROM ����ǥ
WHERE ���� IN ('JAVA', 'DATABASE')
GROUP BY �л�ID;

-- HAVING ���� GROUP BY ���� ���� �� ���� ����� ���ִ�.
-- ���谡 �Ϸ�� ����� -> ������ ���� ���͸��ϴ� ���� (������)
-- ������ ���� ����� ����� �ȴٴ� �������� WHERE ���� ���������
-- HAVING ���� �׷�ȭ(GROUP BY)�� ��󿡼� ����� �ȴٴ� ������ �ٸ���.
/* ���� ����
    5. SELECT        
    1. FROM         �����͸� ������ ���̺�
    2. WHERE        ����
    3. GROUP BY   �׷�ȭ
    4. HAVING      �׷�ȭ ���¿��� ������ ��������
    6. ORDER BY    Ư�� �÷����� ����
*/
-- ����ǥ���̺� -> �л��� ��� ���� 
-- ��� ������ 75 ������ ���
SELECT *
FROM ����ǥ ;

SELECT �л�ID , ROUND( AVG(����), 1) ��ռ���
FROM ����ǥ
GROUP BY �л�ID 
HAVING AVG(����) <= 75 ;

-- ���������� ���̺� -> �Ҽӹ� �� �ο��� 3���̻��� �ݸ� ���
SELECT �Ҽӹ�, COUNT(�л�ID)
FROM ����������
GROUP BY �Ҽӹ�
HAVING COUNT(�л�ID) >= 3 ;

-- ����ǥ���̺� -> �л��� ��� ������ ���ϵ�, ��� ������ NULL�� �ƴ� ���� ��� ��, �Ҽ��� 1���ڸ�������
SELECT �л�ID, ROUND( AVG(����), 1 ) ��ռ���
FROM ����ǥ
GROUP BY �л�ID
HAVING AVG(����) IS NOT NULL ;

-- �μ��� �ְ� ������ 10�� �̻��� �μ��� ���
SELECT department_id �μ�, MAX(salary*12) ����
FROM    employees
GROUP BY department_id
HAVING  MAX( salary * 12 ) >= 100000 
ORDER BY MAX( salary * 12 ) DESC ;

-- ������ �ְ� �޿� ���
SELECT job_id, MAX( salary )
FROM employees
GROUP BY job_id
ORDER BY MAX( salary ) DESC ;

-- ������ 'IT_PROG','AD_PRES' �� �ƴ� ������ �ְ� ������ 150,000 �̻��� �ְ� ������ JOB_ID ���
SELECT job_id, MAX( salary * 12 )
FROM employees
WHERE job_id NOT IN ( 'IT_PROG' , 'AD_PRES' )
GROUP BY job_id
HAVING MAX( salary * 12 ) IS NOT NULL AND MAX( salary * 12 ) >= 150000
ORDER BY MAX( salary * 12 ) DESC ;
































