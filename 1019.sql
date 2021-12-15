--1) 부서별 직원명부 출력 (부서번호, 부서명, 사원 이름 출력, 부서번호 내림차순)
SELECT d.department_id 부서번호, department_name 부서명, first_name
사원명
FROM departments d, employees e
WHERE d.department_id = e.department_id ORDER BY 1 DESC; 

--2)부서별 직원명부 출력 (부서번호, 부서명, 사원 이름 출력 + 단, 부서없는 사원도 포함)
SELECT d.department_id 부서번호, department_name 부서명, first_name
사원명
FROM departments d, employees e
WHERE d.department_id = e.department_id(+)
ORDER BY 1 DESC;

--3)급여가 10000 이상인 사원과 이 사원이 일하는 부서의 이름을 검색한다.
select * from employees;
select * from departments;
select * from locations;

SELECT e.first_name 사원명, e.salary 급여, department_name 부서
FROM employees e ,departments d
WHERE e.salary >= 10000 AND e.department_id = d.department_id; 

--4) 각 부서가 위치하고 있는 도시의 이름을 검색한다.
SELECT A.department_name 부서이름, B.city 도시
FROM departments A, locations B
WHERE A.location_id = B.location_id;

--5) 도시 ‘Toronto’, ‘Munich’에 위치한 부서들의 이름을 검색한다. 
SELECT B.city 도시, department_name 부서
FROM departments A, locations B
WHERE b.city in ('Toronto','Munich') AND a.location_id = b.location_id;

--6)사원 중에서 자신의 상사보다 급여가 높은 사원의 급여 정보를 검색한다.
SELECT A.first_name 사원, A.salary 사원급여, B.first_name 상사, B.salary 상사급여
FROM employees A, employees B WHERE a.salary > b.salary;

--7)사원 중에서 이름은 같지만 사원번호가 다른 동명이인을 검색한다.
select a.first_name 사원, a.employee_id 사원번호
from employees A, employees B WHERE A.first_name = B.first_name;


--자연조인 : 조건절 없이 양쪽에 해당하는 컬럼을 적어주면서 자동으로 등가조인 실시
select employee_id 사원번호, first_name 부서번호
from employees e
NATURAL join departments d
ORDER BY department_id;



