select salary
from employees
where last_name = 'Abel';

--ㄱ
select * from employees where last_name ='Abel';

--ㄴ
select * from employees
where salary > 11000;

--ㄱ+ㄴ (서브쿼리로 바꿈)
select * from employees 
where salary > any (select salary from employees where last_name in('Abel'));

select * from employees e join departments d
on e.department_id = d.department_id
where d.department_name = 'IT';

--위에 있는 것 서브쿼리로 바꿈
select * from employees where department_id = (
select department_id from departments where department_name ='IT');

select * from employees;
select * from departments;

--50번 부서의 최저 급여보다 높은 부서의 최저 급여 검색
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

--부서별 급여 평균(1) 가장 높은 부서 검색(2->서브쿼리로 넘어감)
--서브쿼리를 작성하기 위한 순서 (위에)
select department_id, AVG(salary)  from employees where department_id is not null group by department_id;

select MAX(AVG(salary))  from employees group by department_id;

select department_id
from employees
group by department_id
having AVG(salary) = (select MAX(AVG(salary)) from employees group by department_id);

-- 급여 평균 중 가장 높은 부서의 이름
select department_name
from departments
where department_id = (
    select department_id
    from employees
    group by department_id
    having AVG(salary) = (select MAX(AVG(salary)) from employees group by department_id)
);

--서브 쿼리 - 다중 행 서브 쿼리 
--select 컬럼 from 테이블 where 컬럼 < 다중 행 연산자 > (select ****);
--in, any -> 여러개 중 하나(or), all을 이용한다.

-- 각 부서별 최저급여를 가지는 사원을 검색
select * from employees a where a.salary in (
    select min(salary) from employees group by department_id
) order by a.salary desc;

-- 20번 부서에 근무하는 사원의 관리자 번호 -> 100,201
select manager_id, employee_id, first_name, salary, department_id from employees
where manager_id in (
    select manager_id from employees where department_id IN (20,80)
) and department_id not in (20,80);

--직업코드가 'st_man'인 사원의 급여보다 낮은 급여를 받는 사원 검색
select employee_id from employees
where salary <  any (
    select salary from employees where job_id = 'ST_MAN'
) and job_id <> 'st_man';