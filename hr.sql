--EMPLOYEE 테이블 전체 내용 조회 
SELECT
    *
FROM
    employees;
--EMPLOYEES 테이블의 FIRST_NAME, LAST_NAME, JOB_ID만 조회
SELECT
    first_name,
    last_name,
    job_id
FROM
    employees;


-- Quiz
-- EMPLOYEE_ID가 176인 사람의 LAST_NAME과 DEPARTMENT_ID 조회
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    employee_id = 176;
-->,<,>=,<= 사용
-- SALARY가 12000이상 되는 직원들의 LAST_NAME,SALARY 조회
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 12000;
-- SALARY가 5000~12000의 범위 이외인 사원들의 LAST_NAME, SALARY 조회
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 12000
    OR salary < 5000;


-- 20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 DEPARTMENT_ID 조회
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 20, 50 ); -- 정답

-- COMMISSION_PCT를 받는 모든 사원들의 LAST_NAME, SALARY, COMMISSION_PCT 조회
-- 단. SALARY 내림차순, COMMISSION_PCT 내림차순
SELECT
    last_name,
    commission_pct,
    salary
FROM
    employees
WHERE
    commission_pct != 0
ORDER BY
    salary DESC,
    commission_pct DESC; -- 
-- SALARY가 2500,3500,7000 이 아니며 JOB_ID가 SA_REP, ST_CLERK인 사원 조회
SELECT
    *
FROM
    employees
WHERE
    salary NOT IN ( 2500, 3500, 7000 )
    AND job_id IN ( 'SA_REP', 'ST_CLERK' );

-- 2008/02/20~ 2008/05/01 사이에 고용된 사원들의 LAST_NAME, EMPLOYEE_ID, HIRE_DATE 
-- 조회한다. HIRE_DATE 내림차순으로 조회
SELECT
    last_name,
    hire_date,
    employee_id
FROM
    employees
WHERE
        hire_date >= '2008/02/20'
    AND hire_date <= '2008/05/01'
ORDER BY
    hire_date DESC;
--2004년도에 고용된 모든 사람들의 LAST_NAME, HIRE_DATE 조회
--HIRE_DATE 오름차순 정렬
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
        hire_date < '2005/01/01'
    AND hire_date >= '2004/01/01'
ORDER BY
    hire_date DESC;


--salary가 5000~12000의 범위 이외인 사원들의 last_name, salary 조회
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary NOT BETWEEN 5000 AND 12000;
---- 20번 및 50번 부서에서 근무하며, salary가 5000~12000의 사이 사원들의 LAST_NAME 및 DEPARTMENT_ID 조회
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
    AND salary BETWEEN 5000 AND 12000;
-- 2008/02/20~ 2008/05/01 사이에 고용된 사원들의 LAST_NAME, EMPLOYEE_ID, HIRE_DATE 
-- 조회한다. HIRE_DATE 내림차순으로 조회
SELECT
    last_name,
    hire_date,
    employee_id
FROM
    employees
WHERE
    hire_date BETWEEN '2008/02/20' AND '2008/05/01'
ORDER BY
    hire_date DESC;
--2004년도에 고용된 모든 사람들의 LAST_NAME, HIRE_DATE 조회
--HIRE_DATE 오름차순 정렬
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2004/01/01' AND '2005/01/01'
ORDER BY
    hire_date DESC;
    
-- LIKE 
--2004년도에 고용된 모든 사람들의 LAST_NAME, HIRE_DATE 조회
--HIRE_DATE 오름차순 정렬
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date LIKE '04%'
ORDER BY
    hire_date;
-- LAST_NAME에 u가 포함되는 사원들의 사번 및 last_name 조회
SELECT
    department_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '%u%';
--LAST_NAME에 4번째 글자가 포함되는 a인 사원들의 last_name 조회
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '___a%';
-- LAST_NAME에 글자가 a혹은 e 글자가 들어있는 사원들의 last_name 조회한 후
-- last_name 오름차순 조회
SELECT
    last_name
FROM
    employees
WHERE
    REGEXP_LIKE ( last_name,
                  'a|e' )
ORDER BY
    last_name;

SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    OR last_name LIKE '%e%'
ORDER BY
    last_name;
-- LAST_NAME에 글자가 a와 e 글자가 들어있는 사원들의 last_name 조회한 후
-- last_name 오름차순 조회
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%e%'
    OR last_name LIKE '%e%a%'
ORDER BY
    last_name;

SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    AND last_name LIKE '%e%'
ORDER BY
    last_name;

--IS NULL 
-- MANAGER_ID가 없는 사원들의 LAST_NAME, JOB_ID 조회
SELECT
    last_name,
    job_id
FROM
    employees
WHERE
    manager_id IS NULL;
--JOB_ID가 ST_CLERK 인 사원의 DEPARTMENT_ID 조회(단, 부서번호가 NULL인 것 제외)
SELECT DISTINCT
    department_id
FROM
    employees
WHERE
        job_id = 'ST_CLERK'
    AND department_id IS NOT NULL;
--COMMISSION_PCT가 NULL이 아닌 사원들 중에서 COMMISSION = SALARY * COMMISSION_PCT를 구한 후
-- EMPLOYEE_ID, FIRST_NAME, JOB_ID COMMISSION 조회
SELECT
    employee_id,
    first_name,
    job_id,
    ( salary * commission_pct ) AS commission
FROM
    employees
WHERE
    commission_pct IS NOT NULL; -- DB 꿀 잼 꿀 잼 
 -- frist_name이 Curtis인 사람의 first_NAME, last_name, email, phon_number, job_id 조회
 -- 단, job_id 결과는 소문자로 출력한다.lower
SELECT
    first_name,
    last_name,
    email,
    phone_number,
    lower(job_id)
FROM
    employees
WHERE
    first_name = 'Curtis';
-- job_id가 AD_PRES, PU_CUERK인 사원들의 EMPLOYEE_ID, FIRST_NAME, LAST_NAME,
-- DEPARTMENT_ID, JOB_ID 조회, 단, 사원명 FIRST_NAME과 LAST_NAME을 연결하여 출력
SELECT
    concat(first_name, concat(' ', last_name)),
    employee_id,
    department_id,
    job_id
FROM
    employees
WHERE
    job_id IN ( 'AD_PRES', 'PU_CUERK' );
    
 --[실습4] 부서 80의 각 사원에 대해 적용 가능한 세율을 표시하시오.  

SELECT
    last_name,
    salary,
    CASE
        WHEN salary >= 14000 THEN
            0.45
            WHEN salary >= 12000 THEN
            0.44
            WHEN salary >= 10000 THEN
            0.42
            WHEN salary >= 8000 THEN
            0.40
            WHEN salary >= 6000 THEN
            0.3
            WHEN salary >= 4000 THEN
            0.2
            WHEN salary >= 2000 THEN
            0.09
            ELSE 0
    END AS tax_rate
FROM
    employees where department_id = 80;
    
SELECT LAST_NAME, SALARY, DECODE(TRUNC(SALARY/2000,0),
                                 0,0.00,
                                 1, 0.09,
                                 2,0.20,
                                 3,0.30,
                                 4,0.40,
                                 5,0.42,
                                 6,0.44,
                                 0.45
                                 ) AS TAX_RATE
FROM EMPLOYEES;
-- 사원들의 최대급여와 최소 급여의 차이를 조회
select max(salary) - min(salary) as gab from employees;
-- 매니저로 근무하는 사원들의 총 수 조회( 단. manager_id 중복제거
select count(DISTINCT manAger_id) from employees;
select * from employees;

----------------------------JOIN-------------------------------------------
-- 문제1 자신의 담당 매니저의 고용일보다 빠른 입사자 찾기(셀프조인)
select 
*
from employees e1 join employees e2 on e1.manager_id = e2.employee_id 
where e1.hire_date < e2.hire_date
order by e1.employee_id;
-- 문제2 도시 이름이 T로 시작하는 지역에 사는 사원들의 사번, LAST_name, 부서번호 조회
--      (employees, departments,  locations)
select 
employee_id, last_name, e.department_id
from employees e join departments d on e.department_id = d.department_id
                 join locations l on d.location_id = l.location_id
                 where l.city like 'T%'
                 order by e.employee_id;
select 
employee_id, last_name, e.department_id
from employees e, departments d, locations l 
where e.department_id = d.department_id and d.location_id = l.location_id
and city like 'T%';
-- 문제3  위치 id가 1700인 사원들의 last_name , 부서번호, 연봉조회
--       (employees, departments)
select 
last_name, e.department_id, salary
from employees e, departments d 
where e.department_id = d.department_id and d.location_id =1700
order by salary;


-- 문제4 Executive 부서에 근무하는 모든 사원들의 부서번호, last_namem job_id 조회
-- (employees, departments)
select e.department_id, last_name, job_id
from employees e join departments d on e.department_id=d.department_id
where d.department_name = 'Executive'
order by e.department_id;
select *
from employees e join departments d on e.department_id=d.department_id
order by e.department_id;

-- LAST_NAME에 u가 포함되는 사원들과 동일 부서에 근무하는 사원들의
-- 사번 및 last_name 조회
select 
employee_id, last_name
from employees 
where department_id in (select DISTINCT department_id from employees where last_name like '%u%');






























