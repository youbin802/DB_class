--1) �μ��� ������� ��� (�μ���ȣ, �μ���, ��� �̸� ���, �μ���ȣ ��������)
SELECT d.department_id �μ���ȣ, department_name �μ���, first_name
�����
FROM departments d, employees e
WHERE d.department_id = e.department_id ORDER BY 1 DESC; 

--2)�μ��� ������� ��� (�μ���ȣ, �μ���, ��� �̸� ��� + ��, �μ����� ����� ����)
SELECT d.department_id �μ���ȣ, department_name �μ���, first_name
�����
FROM departments d, employees e
WHERE d.department_id = e.department_id(+)
ORDER BY 1 DESC;

--3)�޿��� 10000 �̻��� ����� �� ����� ���ϴ� �μ��� �̸��� �˻��Ѵ�.
select * from employees;
select * from departments;
select * from locations;

SELECT e.first_name �����, e.salary �޿�, department_name �μ�
FROM employees e ,departments d
WHERE e.salary >= 10000 AND e.department_id = d.department_id; 

--4) �� �μ��� ��ġ�ϰ� �ִ� ������ �̸��� �˻��Ѵ�.
SELECT A.department_name �μ��̸�, B.city ����
FROM departments A, locations B
WHERE A.location_id = B.location_id;

--5) ���� ��Toronto��, ��Munich���� ��ġ�� �μ����� �̸��� �˻��Ѵ�. 
SELECT B.city ����, department_name �μ�
FROM departments A, locations B
WHERE b.city in ('Toronto','Munich') AND a.location_id = b.location_id;

--6)��� �߿��� �ڽ��� ��纸�� �޿��� ���� ����� �޿� ������ �˻��Ѵ�.
SELECT A.first_name ���, A.salary ����޿�, B.first_name ���, B.salary ���޿�
FROM employees A, employees B WHERE a.salary > b.salary;

--7)��� �߿��� �̸��� ������ �����ȣ�� �ٸ� ���������� �˻��Ѵ�.
select a.first_name ���, a.employee_id �����ȣ
from employees A, employees B WHERE A.first_name = B.first_name;


--�ڿ����� : ������ ���� ���ʿ� �ش��ϴ� �÷��� �����ָ鼭 �ڵ����� ����� �ǽ�
select employee_id �����ȣ, first_name �μ���ȣ
from employees e
NATURAL join departments d
ORDER BY department_id;



