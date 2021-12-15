-- 
select * from departments
where department_id = (select department_id from employees 
group by department_id 
having avg(salary) =
(select max(avg(salary)) from employees group by department_id)); 

--���� �� ���� ����
--�˻� ���� ���� �� �˻��ȴ�.

select * from employees A
where A.salary IN (
    select min(salary)
    from employees
    group by department_id
) order by a.salary desc;

-- 20�� �μ��� �ٹ��ϴ� ����� �����ڰ� �����ϴ� �ٸ� �μ��� ��� �˻�
select employee_id, first_name, department_id from employees where manager_id IN 
(select manager_id from employees where department_id = 20) and department_id <> 20;

-- ���� �ڵ尡 �̰��� ����� �޿� �� �ϳ����� ���� �޿��� �޴� ��� �˻�
select first_name, salary from employees where employee_id < any
(select salary from employees where job_id = 'ST_MAN');

-- ��� �� ������ -> max ���
select first_name, salary from employees where employee_id < 
(select max(salary) from employees where job_id = 'ST_MAN');

select first_name, salary from employees where employee_id < all 
(select min(salary) from employees where job_id = 'ST_MAN');

--���� �� ���� ����
-- �� ���� �ڵ庰 �����ӱ��� �޴� ����̴�.
select first_name, last_name, salary, job_id from employees where (job_id, salary) in
(select job_id, min(salary) from employees group by job_id);

--�̸��� bruce�� ����� �����ڵ�, ����ȣ�� ���� ��� �˻� (�̸��� 'brunce'�� ��� ����)
select job_id, employee_id 
from employees
where (manager_id, job_id) in 
(select manager_id, job_id from employees where first_name = 'Bruce')
and first_name <> 'Bruce';

-- �� �μ����� �ִ� �޿��� �޴� ��� �˻�
select department_id, employee_id,  first_name, salary
from employees
where (department_id, salary) in (select department_id, max(salary)
   from employees
   group by department_id);
   
-- bruce�� ���� �μ����� ���ϴ� ������� �̸�, �Ի����� �˻��Ѵ�.
select first_name, hire_date from employees where department_id = 
(select department_id from employees where first_name = 'Bruce');

-- �ο� ���� ���� ���� �μ� ��ȣ�� �˻��Ѵ�.
-- groupby -> �ٽ� ��� �� ���ؾ� �ϱ� ����
select department_id 
from employees 
group by department_id
having count(employee_id) =
(select  max(count(department_id)) as cnt 
from employees 
where department_id is not null
group by department_id);

--daniel�� ���� �μ����� ���ϴ� ��� �߿��� �޿��� jack���� ���� ����� �˻��Ѵ�.
select department_id, first_name from employees 
where department_id = 
(select department_id from employees where first_name = 'Daniel')
and salary <
(select salary from employees where first_name = 'Jack');

