-- 
select * from departments
where department_id = (select department_id from employees 
group by department_id 
having avg(salary) =
(select max(avg(salary)) from employees group by department_id)); 

--다중 행 서브 쿼리
--검색 값이 여러 개 검색된다.

select * from employees A
where A.salary IN (
    select min(salary)
    from employees
    group by department_id
) order by a.salary desc;

-- 20번 부서에 근무하는 사원의 관리자가 관리하는 다른 부서의 사원 검색
select employee_id, first_name, department_id from employees where manager_id IN 
(select manager_id from employees where department_id = 20) and department_id <> 20;

-- 직업 코드가 이것인 사원이 급여 중 하나보다 낮은 급여를 받는 사원 검색
select first_name, salary from employees where employee_id < any
(select salary from employees where job_id = 'ST_MAN');

-- 방법 두 가지임 -> max 사용
select first_name, salary from employees where employee_id < 
(select max(salary) from employees where job_id = 'ST_MAN');

select first_name, salary from employees where employee_id < all 
(select min(salary) from employees where job_id = 'ST_MAN');

--다중 열 서브 쿼리
-- 각 직업 코드별 최저임금을 받는 사원이다.
select first_name, last_name, salary, job_id from employees where (job_id, salary) in
(select job_id, min(salary) from employees group by job_id);

--이름이 bruce인 사원과 직업코드, 상사번호가 같은 사원 검색 (이름이 'brunce'인 사원 제외)
select job_id, employee_id 
from employees
where (manager_id, job_id) in 
(select manager_id, job_id from employees where first_name = 'Bruce')
and first_name <> 'Bruce';

-- 각 부서별로 최대 급여를 받는 사원 검색
select department_id, employee_id,  first_name, salary
from employees
where (department_id, salary) in (select department_id, max(salary)
   from employees
   group by department_id);
   
-- bruce와 같은 부서에서 일하는 사원들의 이름, 입사일을 검색한다.
select first_name, hire_date from employees where department_id = 
(select department_id from employees where first_name = 'Bruce');

-- 인원 수가 가장 많은 부서 번호를 검색한다.
-- groupby -> 다시 사원 수 구해야 하기 때문
select department_id 
from employees 
group by department_id
having count(employee_id) =
(select  max(count(department_id)) as cnt 
from employees 
where department_id is not null
group by department_id);

--daniel과 같은 부서에서 일하는 사원 중에서 급여가 jack보다 낮은 사원을 검색한다.
select department_id, first_name from employees 
where department_id = 
(select department_id from employees where first_name = 'Daniel')
and salary <
(select salary from employees where first_name = 'Jack');

