select salary
from employees
where last_name = 'Abel';

--��
select * from employees where last_name ='Abel';

--��
select * from employees
where salary > 11000;

--��+�� (���������� �ٲ�)
select * from employees 
where salary > any (select salary from employees where last_name in('Abel'));

select * from employees e join departments d
on e.department_id = d.department_id
where d.department_name = 'IT';

--���� �ִ� �� ���������� �ٲ�
select * from employees where department_id = (
select department_id from departments where department_name ='IT');

select * from employees;
select * from departments;

--50�� �μ��� ���� �޿����� ���� �μ��� ���� �޿� �˻�
select min(salary)
from employees 
where department_id= 50;

select department_id, min(salary)
from employees 
where department_id is not null
group by department_id 
having min(salary) > (
    select min(salary) from employees  where department_id= 50
);

select last_name, salary from employees where salary > (
select salary from employees
where last_name = 'Abel'
);

--�μ��� �޿� ���(1) ���� ���� �μ� �˻�(2->���������� �Ѿ)
--���������� �ۼ��ϱ� ���� ���� (����)
select department_id, AVG(salary)  from employees where department_id is not null group by department_id;

select MAX(AVG(salary))  from employees group by department_id;

select department_id
from employees
group by department_id
having AVG(salary) = (select MAX(AVG(salary)) from employees group by department_id);

-- �޿� ��� �� ���� ���� �μ��� �̸�
select department_name
from departments
where department_id = (
    select department_id
    from employees
    group by department_id
    having AVG(salary) = (select MAX(AVG(salary)) from employees group by department_id)
);

--���� ���� - ���� �� ���� ���� 
--select �÷� from ���̺� where �÷� < ���� �� ������ > (select ****);
--in, any -> ������ �� �ϳ�(or), all�� �̿��Ѵ�.

-- �� �μ��� �����޿��� ������ ����� �˻�
select * from employees a where a.salary in (
    select min(salary) from employees group by department_id
) order by a.salary desc;

-- 20�� �μ��� �ٹ��ϴ� ����� ������ ��ȣ -> 100,201
select manager_id, employee_id, first_name, salary, department_id from employees
where manager_id in (
    select manager_id from employees where department_id IN (20,80)
) and department_id not in (20,80);

--�����ڵ尡 'st_man'�� ����� �޿����� ���� �޿��� �޴� ��� �˻�
select employee_id from employees
where salary <  any (
    select salary from employees where job_id = 'ST_MAN'
) and job_id <> 'st_man';