-- scott 게정에 존재하는 모든 테이블을 조회(SELECT)
-- SQL은 대소문자 구별은 안함
-- 대소문자 구별은 비밀번호만 함
-- STRING >> ' ' 표현
SELECT
    *
FROM
    tab; 


-- 조회(SELECT) : 행 단위로 조회, 열단위로 조회
-- EMP 테이블의 내용을 전체조회
SELECT
    *
FROM
    emp;

--EMP 테이블의 EMPNO, ENAME, JOB만 조회
SELECT
    empno,
    ename,
    job
FROM
    emp;
--EMP 테이블의 EMPNO,DEPTNO 만 조회
SELECT
    empno,
    deptno
FROM
    emp;

SELECT
    *
FROM
    emp;

-- 중복을 제거후 조회 : DISTINCT
SELECT DISTINCT
    deptno
FROM
    emp;

SELECT
    *
FROM
    emp;
-- 별칭을 붙여서 조회 : AS(ALAIS)
SELECT
    empno AS 사원번호
FROM
    emp;

SELECT
    empno           AS 사원명,
    job             AS "직  책",
    sal             AS 급여,
    comm            AS 추가수당,
    sal * 12 + comm AS 연봉
FROM
    emp;
-- 순서정렬 : ORDER BY 기준 컬럼 명(오름차순, 내림차순)
-- ENAME, SAL 조회할 때 SAL 내림차순으로 정렬
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal; -- 오름 차순은 생략가능(ASC) 

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

-- EMP 테이블 전체 내용 조회하고, 단 사원번호 내림차순 
SELECT
    empno AS 사원번호
FROM
    emp
ORDER BY
    empno DESC;

-- 전체 내용 조회 (부서번호 오름차순, 급여 내림차순)
SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC; -- 회원정보 
-- [문제] 조회할 테이블은 EMP 테이블이며 모든 열을 출력한다

SELECT
    empno  AS employee_no,
    ename  AS employee_name,
    mgr    AS manager,
    sal    AS salary,
    comm   AS commission,
    deptno AS department_no
FROM
    emp
ORDER BY
    deptno DESC,
    ename;
    
-- where : 특정 조건을 기준으로 원하는 데이터를 조회 
-- 전체 데이터 조회, 단, 부서번호가 30 번인 데이터만 조회

SELECT
    *
FROM
    emp
WHERE
    deptno = 30;

-- 사원 번호가 7782번만 조회 
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;
-- 부서번호가 30번이고, 사원직책이 SALESMAN인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';
-- 쿼리 문만 대소문자 구분 없다 음하하하하하하하 뒤에서 배운다
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'salesman';
--사원번호가 7499 이고, 부서번호가 30인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND empno = 7499;
-- 부서번호가 30이거나 사원직책이 clerk 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';
----------------------------------------------------------------------------
-- 산술연산자를 사용한 WHERE

-- 연봉이 36000 인 사원 조회 
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;
-- 월급이 3000보다 큰 사원조회 
SELECT
    ename
FROM
    emp
WHERE
    sal > 3000;
-- 월급이 3000이상 인 사원 조회
SELECT
    ename
FROM
    emp
WHERE
    sal >= 3000;

--이름의 첫글자가 F이후인 사원 조회 
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';
-- 급여가 2500이상이고, 직업이 analyst인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2500
    AND job = 'ANALYST';

SELECT
    *
FROM
    emp
WHERE
    job = 'ANALYST'
    OR job = 'CLERK'
    OR job = 'MANAGER';

SELECT
    *
FROM
    emp
WHERE
    job IN ( 'ANALYST', 'CLERK', 'MANAGER' );

-- 등가비교연산자(  같다(=) , 같지 않다(!=,<>,^=)
SELECT
    *
FROM
    emp
WHERE
    sal != 3000;

SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

SELECT
    *
FROM
    emp
WHERE
    sal^= 3000;
-- 위와 같은 내용의 결과값 NOT 
SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;
--IN 
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'ANALYST', 'CLERK', 'MANAGER' );

SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'ANALYST', 'CLERK', 'MANAGER' );
-- 부서 번호가 10번 20번인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );
-- BETWEEN A AND B 
--급여가 2000에서 3000 사이인 사원조회 
SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;
--급여가 2000에서 3000 사이가 아닌 사원조회 
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;
-------------------------------------------------------------------------------
-- LIKE 연산자와 와일드 카드
-- 일부 문자열이 포함된 데이터 조회

-- 사원명이 s로 시작하는 사원 조회
-- 와일드카드 
-- ① % : 길이와 상관없이 모든 문자 데이터를 의미한다.
-- ② _ : 어떤 값이던 상관없이 한 개의 문자 데이터를 의미한다.
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

-- 사원명 2번쨰 글자가 L인 사원 조회 
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

-- 사원명에 AM 문자가 포함되어 있는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';
-- 사원명에 AM 문자가 포함되어있지 않은 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';

-- IS NULL
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;
-- NULL은 0이 아니고 완전히 비어있는 상태를 의미

-- MGR이 NULL인 사원
SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL; 
-- MGR이 NULL인 사원
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;
--NULL을 대체하는 함수도 있다 나중에 한다 
----------------------------------------------------------------------------
--집합 연산자 : 합집합 - UNION, UNION ALL(중복값 제거 X),
--            교집합 - INTERSECT
--            차집합 -  MINUS

-- EMPNO, ENAME, SAL, DEPTNO 조회(부서번호가 10번이거나 20번)
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 20;

--중복값 제거 
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;
-- 중복값을 제거하지 않는다
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

-- 첫번쨰 형태로 나온다
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    sal,
    job,
    deptno,
    sal
FROM
    emp
WHERE
    deptno = 20;

-- 차집합
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

-- 교집합
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;
----------------------------------------------------------------------
-- 오라클 함수 
-- 내장함수 -1) 문자함수
--             대소문자 변경
--             UPPER(문자열) : 괄호 안의 문자를 대문자로 변환
--             LOWER     : 소문자로 변환
--             INITCAP   : 괄호 안 문자중 첫글자만 대문자로 변환, 나머지는 소문자
SELECT
    ename,
    upper(ename)   AS 대문자,
    lower(ename)   AS 소문자,
    initcap(ename) AS 앞글자변경
FROM
    emp;
-- ENAME이 SCOTT인 사람 찾기
SELECT
    *
FROM
    emp
WHERE
    lower(ename) = 'scott';

SELECT
    *
FROM
    emp
WHERE
    lower(ename) LIKE lower('%scott%');

--                     문자 길이 구하기  
--                     LENGTH(문자열) : 해당 문자열의 길이를 돌려줌
--                     LENGTHB(문자열): 해당 문자열의 바이트 수를 돌려줌
SELECT
    ename,
    length(ename)
FROM
    emp;
-- 한글 한 자당 3BYTE 사용
-- DUAL : 데이터베이스 관리자가 소유한 테이블 / 임시로 연산이나 함수의 결과 값을 확인하는 용도

SELECT
    length('한글'),
    lengthb('한글')
FROM
    dual;
-- JOB이 6글자 이상인 사원들을 조회
SELECT
    *
FROM
    emp
WHERE
    length(job) >= 6;
--                  문자열 일부를 추출하기/ 잘라내기
--                  SUBSTR(문자열데이터, 시작위치, 추출길이)
--                  SUBSTR(문자열데이터, 시작위치)
SELECT
    job,
    substr(job, 1, 2),
    substr(job, 5)-- SQL은 1부터시작
FROM
    emp;
-- EMP 테이블의 모든 사원 이름을 세 번째 글자부터 끝까지 출력하기 
SELECT
    ename,
    substr(ename, 3)
FROM
    emp;
--                  문자열 데이터 안에서 특정 문자를 찾기
--                  INSTR(문자열, 찾을 문자열, 시작위치, 몇번째에 있는걸 찾을 것인지)

SELECT
    instr('HELLO, ORACLE!', 'L'),
    instr('HELLO, ORACLE!', 'L', 5),
    instr('HELLO, ORACLE!', 'L', 2, 2)
FROM
    dual;

-- 원본 문자열 : 이것이 Oracle이다 . 이것도 오라클이다
-- 찾을 문자열 : 이것

-- 제일 처음에 나오는 이것의 위치를 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것')
FROM
    dual;

--시작 위치를 3으로 지정한 후 나오는 이것의 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 3)
FROM
    dual;

-- 이것이 두번째로 나오는 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 1, 2)
FROM
    dual;
    
-- 사원 이름에 문자 S가 있는 사원을 구하기 
SELECT
    ename
FROM
    emp
WHERE
    instr(ename, 'S') > 0;

SELECT
    ename
FROM
    emp
WHERE
    ename LIKE '%S%';

--                 특정 문자를 다른 문자로 바꾸는 함수
--                 REPLASE(문자열 데이터 또는 열이름, 찾는 문자, 바꿀문자)
-- 010-1234-5678 => 010 1234 5678 || 01012345678
SELECT
    '010-1234-5678'                    AS 원본,
    replace('010-1234-5678', '-', ' ') AS replace1,
    replace('010-1234-5678', '-')      AS replace2
FROM
    dual;

--                 두 문자열 데이터를 합치는 함수
--                 CONCAT(문자열, 문자열 )
SELECT
    empno,
    ename,
    concat(empno, ename)
FROM
    emp
WHERE
    ename = 'SCOTT';
-- 7788:SCOTT
SELECT
    empno,
    ename,
    concat(empno, ':', ename)
FROM
    emp
WHERE
    ename = 'SCOTT'; -- ERROR
SELECT
    empno,
    ename,
    concat(empno, concat(':', ename))
FROM
    emp
WHERE
    ename = 'SCOTT'; 

-- || : 문자열 데이터 연결연산자
SELECT
    empno || ename,
    empno
    || ':'
    || ename
FROM
    emp
WHERE
    ename = 'SCOTT'; 
-- 문자열 함수 : TRIM 공백 제거(기본) 
--              BOTH(TRIM) : 양쪽 공백 제거
--              LEADING(LTRIM) : 왼쪽 공백 제거
--              TRALING(RTRIM) : 오른쪽 공백 제거
SELECT
    '     이것이    ',
    TRIM('   이것이    ')
FROM
    dual;

-- TRIM(삭제옵션(선택), 삭제할 문자(선택), FROM 원본문자열)
SELECT
    '['
    || TRIM('_' FROM '__ORACLE__')
    || '}' AS trim,
    '['
    || TRIM(LEADING '_' FROM '__ORACLE__')
    || '}' AS trim_leading,
    '['
    || TRIM(TRAILING '_' FROM '__ORACLE__')
    || '}' AS trim_trailing,
    '['
    || TRIM(BOTH '_' FROM '__ORACLE__')
    || '}' AS trim_both
FROM
    dual;

-- 숫자함수 : ROUND(숫자, 반올림 위치(선택))
--           TRUNC(숫자, 버림의 위치(선택))
--           CEIL(숫자, 올림 위치(선택))
--           FLOOR(숫자, 버림 위치(선택))
SELECT
    round(1234.5678)      AS round,
    round(1234.5678, 0)   AS round0,
    round(1234.5678, 1)   AS round1,
    round(1234.5678, 2)   AS round2,
    round(1234.5678, - 1) AS round_minus1,
    round(1234.5678, - 2) AS round_minus2
FROM
    dual;

SELECT
    trunc(1234.5678)      AS trunc,
    trunc(1234.5678, 0)   AS trunc0,
    trunc(1234.5678, 1)   AS trunc1,
    trunc(1234.5678, 2)   AS trunc2,
    trunc(1234.5678, - 1) AS trunc_minus1,
    trunc(1234.5678, - 2) AS trunc_minus2
FROM
    dual;

SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 3.14)
FROM
    dual;
-- 날짜함수
--SYSDATE : 오라클 데이터 베이스 서버가 설치된 OS의 현재 날짜와 시간
-- ADD_MONTHS : 몇 개월 이후 날짜를 구하는 함수
SELECT
    sysdate     AS now,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrow
FROM
    dual;

SELECT
    sysdate,
    add_months(sysdate, 3)
FROM
    dual;

-- 입사 20주년이 되는 사원들 조회
SELECT
    ename,
    hiredate,
    add_months(hiredate, 240)
FROM
    emp;

-- 현재 날짜를 기준으로 입사 38년 미만인 사원 조회
SELECT
    ename,
    hiredate
FROM
    emp
WHERE
    add_months(hiredate, 480) < sysdate;
    
-- MONTHS_BETWEEN : 두 날짜 간의 개월수 차이 구하기
SELECT
    empno,
    ename,
    hiredate,
    months_between(sysdate, hiredate)        AS month1,
    months_between(hiredate, sysdate)        AS month2,
    trunc(months_between(sysdate, hiredate)) AS month3
FROM
    emp;
-- NEXT_DAY(날짜, 요일문자)
-- LAST_DAY(날짜)

SELECT
    sysdate,
    next_day(sysdate, '월요일'),
    last_day(sysdate)
FROM
    dual;
    
-- 형변환 함수
-- TO_CHAR() : 숫자 또는 날짜 데이터를 문자데이터로 변환
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환
SELECT
    sysdate,
    to_char(sysdate, 'yyyy/mm/dd') AS 현재날짜
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'MM') AS 현재날짜
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'MON') AS 현재날짜
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'HH:MI:SS') AS 현재시간
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'HH12:MI:SS') AS 현재시간
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'HH24:MI:SS') AS 현재시간
FROM
    dual;

SELECT
    sal,
    to_char(sal, '$999,999') AS sal_$,
    to_char(sal, '$000,000') AS sal_$2,
    to_char(sal, 'L999,999') AS sal_l
FROM
    emp;

SELECT
    to_number('1,300', '999,999')
FROM
    dual;

SELECT
    TO_DATE('2021-09-12', 'YYYY-MM-DD') AS todate1,
    TO_DATE('20210912', 'YYYY-MM-DD')   AS todate2
FROM
    dual;
-- 널처리 함수
-- NVL(데이터, 널이면 반환할 값)
SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm
FROM
    emp;

SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm,
    nvl(comm, 0),
    sal + nvl(comm, 0)
FROM
    emp;

---NVL2(데이터, 널이 아닐경우 반환할 값, 널이면 반환할 값)
SELECT
    empno,
    ename,
    sal,
    comm,
    nvl2(comm, 'O', 'X'),
    nvl2(comm, sal * 12 + comm, sal * 12)
FROM
    emp;

-- DECODE 함수 
-- DECODE([검사 대상이 될 열 또는 데이터], 
--        [조건1],[데이터가 조건 1과 일치할 떄 반환할 결과],
--        [조건2],[데이터가 조건 2과 일치할 떄 반환할 결과],
--        ...
--        [위 조건들 중에서 일치한 경우가 없을 떄 반환할 결과])
-- job_id 에 따라 급여의 비율 설정
SELECT
    empno,
    ename,
    job,
    sal,
    decode(job, 'MANAGER', sal * 1.1, 'SALEMAN', sal * 1.05,
           'ANALYST', sal, sal * 1.03)
FROM
    emp;
-- CASE : DECODE 문으로 작성할 수 있는 것들은 모두 변환 가능
--        = 의 의미로 사용되지만 다른 조건도 가능하다
SELECT
    empno,
    ename,
    job,
    sal,
    CASE job
        WHEN 'MANAGER' THEN
            sal * 1.1
        WHEN 'SALEMAN' THEN
            sal * 1.05
        WHEN 'ANALYST' THEN
            sal
        ELSE
            sal * 1.03
    END AS upsal
FROM
    emp;
-- COMM 이 NULL이면 '해당사항 없음' , 0 이면 '수당 없음', 0보다 크면 '수당 : 2500' 출력
SELECT
    empno,
    ename,
    comm,
    CASE
        WHEN comm IS NULL THEN
            '해당사항없음'
        WHEN comm = 0 THEN
            '수당없음'
        WHEN comm < 0 THEN
            '수당 : 2500'
    END AS upsal
FROM
    emp;
--[실습1] 다음과 같은 결과가 나오도록 SQL문을 작성하시오.
--EMP 테이블에서 사원들의 월 평균 근무일수는 21.5일이다. 
--하루 근무 시간을 8시간으로 보았을 때 사원들의 하루 급여(DAY_PAY)와 시급(TIME_PAY)를 계산하여 결과를 출력한다. 
--단, 하루 급여는 소수점 셋째 자리에서 버리고, 시급은 두 번째 소수점에서 반올림하시오.

    -- 숫자함수 : ROUND(숫자, 반올림 위치(선택))
--           TRUNC(숫자, 버림의 위치(선택))
--           CEIL(숫자, 올림 위치(선택))
--           FLOOR(숫자, 버림 위치(선택))
SELECT
    empno,
    ename,
    sal,
    trunc(sal / 21.5, 2)     AS day_pay,
    round(sal / 21.5 / 8, 1) AS time_pay
FROM
    emp;
--[실습2] EMP 테이블에서 사원들은 입사일(HIREDATE)을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다. 
--사원들이 정직원이 되는 날짜(R_JOB)를 YYYY-MM-DD 형식으로 아래와 같이 출력하시오. 
--, 추가수당(COMM)이 없는 사원의 추가 수당은 N/A로 출력하시오.
SELECT
    empno,
    ename,
    hiredate,
    to_char(next_day(add_months(hiredate, 3), '월요일'), 'YYYY-MM-DD') AS r_job,
    nvl(to_char(comm), 'N/A')                                       AS comm
    --decode(comm, NULL, 'N/A', comm)  AS comm
FROM
    emp;

SELECT
    comm,
    nvl(comm, 0)
FROM
    emp;
--[실습3] EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원 번호(MGR)를 다음과 같은 조건을 기준으로 변환해서 CHG_MGR 열에 출력하시오.

--직속상관의 사원 번호가 존재하지 않을 경우 : 0000
--직속상관의 사원 번호 앞 두자리가 75일 경우 : 5555
--직속상관의 사원 번호 앞 두자리가 76일 경우 : 6666
--직속상관의 사원 번호 앞 두자리가 77일 경우 : 7777
--직속상관의 사원 번호 앞 두자리가 78일 경우 : 8888
--그 외 직속 상관 사원 번호의 경우 : 본래 직속 상관의 사원번호 그대로 출력

SELECT
    empno,
    ename,
    mgr,
    CASE
        WHEN substr(to_char(mgr), 1, 2) = '75' THEN--WHEN mgr LIKE '75%' THEN
            '5555'
        WHEN substr(to_char(mgr), 1, 2) = '76' THEN--WHEN mgr LIKE '76%' THEN
            '6666'
        WHEN substr(to_char(mgr), 1, 2) = '77' THEN--WHEN mgr LIKE '77%' THEN
            '7777'
        WHEN substr(to_char(mgr), 1, 2) = '78' THEN--WHEN mgr LIKE '78%' THEN
            '8888'
        WHEN mgr IS NULL THEN
            '0000'
        ELSE
            to_char(mgr)
    END AS chg_mgr
FROM
    emp;

SELECT
    empno,
    ename,
    mgr,
    decode(substr(to_char(mgr), 1, 2), NULL, '0000', '75', '5555',
           '76', '6666', '77', '7777', '78',
           '8888', to_char(mgr)) AS chg_mgr
FROM
    emp;
----------------------------단일행 함수(위)---------------------------------------
----------------------------다중행 함수(아래)-------------------------------------
-- 다중행 함수 : SUM(), COUNT(), AVG(), MAX(), MIN() 
--사원의 급여 합계
SELECT
    SUM(sal)
FROM
    emp;
--SELECT SUM(SAL), ENAME FROM EMP; -- 단일 그룹의 그룹 함수가 아닙니다.
-- EMP 테이블의 데이터 개수 조회 
SELECT
    COUNT(*)
FROM
    emp; -- 행의 갯수

SELECT
    COUNT(DISTINCT sal)
FROM
    emp;



-- 부서 번호가 10번의 사원의 최대 급여
SELECT
    MAX(sal)
FROM
    emp
WHERE
    deptno = 10;
-- 부서 번호가 10번의 사원의 최소 급여
SELECT
    MIN(sal)
FROM
    emp
WHERE
    deptno = 10;
-- 부서 번호가 20번인 사원 중에서 제일 오래된 입사일 조회
SELECT
    MIN(hiredate)
FROM
    emp
WHERE
    deptno = 20;

SELECT
    hiredate
FROM
    emp;

-- 부서번호가 30번인 사원들의 평균 급여 조회
SELECT
    round(avg(DISTINCT sal), 1)
FROM
    emp
WHERE
    deptno = 30;

-- 회사 사원들의 최대 급여와 최소 급여의 차이를 조회
SELECT
    MAX(salary) - MIN(salary) AS subsal
FROM
    emp;
-- 매니저로 근무하는 사원들의 총 수 조회( 단, MANAGER_ID 중복제거)
SELECT
    COUNT(DISTINCT mgr)
FROM
    emp
WHERE
    job = 'MANAGER';

SELECT
    *
FROM
    emp;
-- GROUP BY 그룹화할 열 지정(여러개 지정 가능)

-- 부서별 급여와 합 조회
SELECT
    SUM(sal),
    deptno
FROM
    emp
GROUP BY
    deptno
ORDER BY
    deptno;

-- 부서별 급여 평균 조회
SELECT
    AVG(sal),
    deptno
FROM
    emp
GROUP BY
    deptno
ORDER BY
    deptno;
-- 부서별 , 직무별 급여 평균 조회
SELECT
    AVG(sal),
    deptno,
    job
FROM
    emp
GROUP BY
    deptno,
    job
ORDER BY
    deptno,
    job;

-- GROUP BY ~ HAVING 조건식 
-- 부서별, 직무별 급여 평균 조회(단, 급여가 2000 이상이여야 한다)
SELECT
    deptno,
    AVG(sal)
FROM
    emp
    --WHERE AVG(SAL) >= 200 -- 그룹함수는 허가되지 않는다.
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000
ORDER BY
    deptno,
    job;

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
WHERE
    sal <= 3000 --① 출력 대상이 되는 행 제한
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000 -- ② 그룹화한 행 제한
ORDER BY
    deptno,
    job;

--[실습1] EMP 테이블을 이용하여 부서번호(DEPTNO), 평균급여(AVG_SAL),
--최고급여(MAX_SAL), 최저급여(MIN_SAL), 사원수(CNT)를 출력한다. 
--단, 평균 급여를 출력할 때 소수점을 제외하고 각 부서번호별로 출력하는 SQL 문을 작성하시오.
SELECT
    deptno,
    trunc(AVG(sal), 0) AS avg_sal,
    MAX(sal)           AS max_sal,
    MIN(sal)           AS min_sal,
    COUNT(*)
FROM
    emp
GROUP BY
    deptno;
 
 --[실습2] 같은 직책에 종사하는 사원이 3명 이상인 직책과
 --       인원수를 출력하는 SQL문을 작성하시오.
SELECT
    job,
    COUNT(*)
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(job) >= 3;

--[실습3] 사원들의 입사연도(HIRE_YEAR)를 기준으로
-- 부서별로 몇 명이 입사했는지 출력하는 SQL문 작성하시오.
SELECT
    to_char(hiredate, 'YYYY') AS hire_year,
    deptno,
    COUNT(*)
FROM
    emp
GROUP BY
    to_char(hiredate, 'YYYY'),
    deptno;
-- 데이터 삽입, 삭제 수정 : 결과는 실행된 행의 갯수로 넘어옴
--실습용 테이블 하나 생성
CREATE TABLE dept_temp
    AS
        SELECT
            *
        FROM
            dept;

SELECT
    *
FROM
    dept_temp;

-- INSERT : 데이터 삽입 
-- INSERT INTO 테이블명(필드명...) VALUES(값1,값2,값3...)
-- INSERT INTO 테이블명 VALUES(값1,값2,값3...)
INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    50,
    'DATABASE',
    'SEOUL'
);

INSERT INTO dept_temp VALUES (
    60,
    'NETWORK',
    'BUSAN'
);

INSERT INTO dept_temp (
    dname,
    loc,
    deptno
) VALUES (
    'NETWORK',
    'BUSAN',
    70
);

--이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.
--INSERT INTO dept_temp(DEPTNO,DNAME) VALUES(500,'DATABASE');
-- NULL 삽입하는 방법 ( 테이블 생성시 널이 가능하도록 열이 설정되어 있는 경우만 사용가능)
INSERT INTO dept_temp (
    deptno,
    dname
) VALUES (
    90,
    'DATABASE'
);

INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    91,
    'WEB',
    NULL
);

INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    92,
    'MOBILE',
    ''
);
--ALTER : 데이터 수정
--DELETE : 데이터 삭제 
DELETE FROM dept_temp
WHERE
    deptno = 91;

COMMIT;


-- 실습용 테이블 생성
-- 테이블 구조는 복사하되, 데이터는 복사하고 싶지 않을 떄 
CREATE TABLE emp_temp
    AS
        SELECT
            *
        FROM
            emp
        WHERE
            1 <> 1;

SELECT
    *
FROM
    emp_temp;

DESC emp_temp;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    1111,
    '홍길동',
    'manager',
    NULL,
    '2021-09-27',
    4000,
    NULL,
    10
);

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    2222,
    '성춘향',
    'analyst',
    NULL,
    '2021/09/27',
    5000,
    NULL,
    10
);

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    3333,
    '박보검',
    'analyst',
    NULL,
    sysdate,
    5000,
    NULL,
    10
);

COMMIT;

-- UPDATE : 수정/변경
-- UPDATE 테이블명 SET 변경할 열 = 변경할 값 , 변경할 열 = 변경할 값 ,... 
-- UPDATE 테이블명 SET 변경할 열 = 변경할 값 , 변경할 열 = 변경할 값 ,...  WHERE 수정할 조건 

SELECT
    *
FROM
    dept_temp;

UPDATE dept_temp
SET
    loc = 'SEOUL'
WHERE
    deptno = 90;

UPDATE dept_temp
SET
    loc = 'BUSAN'
WHERE
    deptno = 91;

COMMIT;

SELECT
    *
FROM
    emp_temp;

UPDATE emp_temp
SET
    comm = 100;
-- 수정한 내용 되돌리는 클래스 
ROLLBACK;
-- SAL이  4000이하인 사원만 추가 수당을 50으로 변경
UPDATE emp_temp
SET
    comm = 50
WHERE
    sal <= 4000;

COMMIT;

-- DELETE  : 삭제 
-- DELETE (FROM) 테이블 이름 WHERE 삭제할 데이터 조건 
CREATE TABLE emp_temp2
    AS
        SELECT
            *
        FROM
            emp;

SELECT
    *
FROM
    emp_temp2;

-- JOB이 MANAGER인 사원 삭제 
DELETE emp_temp2
WHERE
    job = 'MANAGER';

-- 전체 사원 삭제 
DELETE emp_temp2;

SELECT
    *
FROM
    emp_temp2;

ROLLBACK;

SELECT
    *
FROM
    emp_temp;

COMMIT;


-- JOIN(조인)
-- INNER JOIN  : 테이블 끼리 교집합 
-- SELECT 열, 열.. FROM 
-- OUTER JOIN : LEFT OUTER  JOIN, RIGHT OUTER JOINㅍ
SELECT
    COUNT(*)
FROM
    emp;

SELECT
    COUNT(*)
FROM
    dept;

-- 카테시안 조인 : 나올 수 있는 모든 조합 (14행 X 4행)
SELECT
    *
FROM
    emp,
    dept;
-- 내부조인(inner 조인)
-- 등가조인 : 일치하는 데이터를 기준으로 조인
-- 비등가조인 : 특정 범위에 있는 데이터 추출 
SELECT
    *
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno;
-- "column ambiguously defined" 열의 정의가 애매합니다
SELECT
    empno,
    ename,
    emp.deptno,
    dname
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno;

SELECT
    empno,
    ename,
    emp.deptno,
    dname
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno
ORDER BY
    dname;

SELECT
    empno,
    ename,
    e.deptno,
    dname
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno
ORDER BY
    dname;

-- sal 3000이상인 사원들의 사번, 이름, 부서 번호, 부서명, 급여
SELECT
    empno,
    ename,
    d.deptno,
    dname,
    sal
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND sal >= 3000;

-- 급여가 2500 이하이고 사원 번호가 9999이하인 사원의 사번, 이름, 급여, 부서명, 부서위치
SELECT
    empno,
    ename,
    sal,
    dname,
    loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND sal <= 2500
    AND empno <= 9999;

-- emp 테이블의 급여가 salgrade 특정 범위에 속하면 grade 값 조회
SELECT
    *
FROM
    salgrade;

SELECT
    *
FROM
    emp;

SELECT
    *
FROM
    emp      e,
    salgrade s
WHERE
    e.sal BETWEEN s.losal AND s.hisal
ORDER BY
    grade;

-- 자체조인 (selfjoin 셀프조인) : 본인 테이블과 조인
SELECT
    *
FROM
    emp;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno;

-- 외부조인(outer join)  일치하지 않는 것도 뽑고 싶을 때 


-- 왼쪽외부조인(left outer join)
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno (+);

-- 오른쪽외부조인(right outer join)
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr (+) = e2.empno;

-- 양쪽외부조인( + 기호 제공안함)
--select e1.empno, e1.ename, e1.mgr,e2.empno,e2.ename
--from emp e1, emp e2 where 
--e1.mgr(+) = e2.empno(+);

-- 모든 데이터 베이스에서 사용 가능한 표준 조인 구문
-- join ~ on
SELECT
    empno,
    ename,
    e.deptno,
    dname
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
ORDER BY
    dname;

SELECT
    empno,
    ename,
    d.deptno,
    dname,
    sal
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND sal >= 3000;

SELECT
    empno,
    ename,
    d.deptno,
    dname,
    sal
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
    sal >= 3000;

SELECT
    empno,
    ename,
    sal,
    dname,
    loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND sal <= 2500
    AND empno <= 9999;

SELECT
    empno,
    ename,
    sal,
    dname,
    loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        sal <= 2500
    AND empno <= 9999;

SELECT
    *
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;

-- outer 표준 구문
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno (+);

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1
    LEFT OUTER JOIN emp e2 ON e1.mgr = e2.empno;
---------------------
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr (+) = e2.empno;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1
    RIGHT OUTER JOIN emp e2 ON e1.mgr = e2.empno;
------
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1
    FULL OUTER JOIN emp e2 ON e1.mgr = e2.empno;


-- [실습1] 급여가 2000초과인 사원들의 부서 정보, 사원 정보를
-- 아래와 같이 출력하는 SQL 문을 작성하시오.
SELECT
    d.deptno,
    dname,
    empno,
    ename,
    sal
FROM
    dept d,
    emp  e
WHERE
        d.deptno = e.deptno
    AND sal > 2000
ORDER BY
    d.deptno;

SELECT
    e.deptno,
    dname,
    empno,
    ename,
    sal
FROM
         emp e
    JOIN dept d ON d.deptno = e.deptno
WHERE
    e.sal > 2000
ORDER BY
    d.deptno;
--[실습2] 각 부서별 평균 급여, 최대 급여, 최소 급여, 
--       사원수를 출력하는 SQL문을 작성하시오
SELECT
    d.deptno,
    d.dname,
    floor(AVG(sal)) AS avg_sal,
    MAX(sal)        AS max_sal,
    MIN(sal)        AS min_sal,
    COUNT(*)
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
GROUP BY
    d.deptno,
    d.dname;
--[실습3] 모든 부서정보와 사원 정보를 아래와 같이 부서번호,
--사원이름 순으로 정렬하여 출력하는 SQL문을 작성하시오.
SELECT
    e.deptno,
    dname,
    empno,
    ename,
    job,
    sal
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno
ORDER BY
    e.deptno,
    e.empno;

SELECT
    d.deptno,
    dname,
    empno,
    ename,
    job,
    sal
FROM
    dept d,
    emp  e
WHERE
    d.deptno = e.deptno (+)
ORDER BY
    d.deptno,
    e.empno;

SELECT
    d.deptno,
    dname,
    empno,
    ename,
    job,
    sal
FROM
    dept d
    LEFT OUTER JOIN emp  e ON d.deptno = e.deptno
ORDER BY
    d.deptno,
    e.empno;

--[실습4] 모든 부서정보와 사원 정보, 급여등급 정보, 
--각 사원의 직속 상관의 정보 부서번호, 
--사원번호 순으로 정렬하여 출력하는 SQL문을 작성하시오.

-- emp e1 테이블과 dept 테이블 조인 => dept 테이블 기준(dept테이블 내용 모두 출력)
select *
from emp e1, dept d1
where e1.deptno(+) = d1.deptno;
-- 첫번째 연결 결과랑 salgrade 조인
select *
from emp e1, dept d1, salgrade s1 
where e1.deptno(+) = d1.deptno
and e1.sal between s1.losal(+) and s1.hisal(+);
-- 두번쨰 결과의 mgr이랑 emp e2 테이블의 empno 랑 조인 
SELECT
    e1.deptno,
    dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    losal,
    hisal,
    grade,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp      e1,
    emp      e2,
    dept     d,
    salgrade s
WHERE
        e1.deptno(+) = d.deptno 
    AND e1.sal BETWEEN s.losal(+) AND s.hisal(+)
    AND e1.mgr = e2.empno(+)
ORDER BY
    e1.deptno,
    empno;
------------------------------------------------------------------------
select *
from emp e1, dept d1, salgrade s1 
where e1.deptno(+) = d1.deptno
and e1.sal between s1.losal(+) and s1.hisal(+);
-- 두번쨰 결과의 mgr이랑 emp e2 테이블의 empno 랑 조인 
SELECT
    e1.deptno,
    dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    losal,
    hisal,
    grade,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp      e1 right outer join dept d on e1.deptno = d.deptno 
                left outer join salgrade s on e1.sal BETWEEN s.losal AND s.hisal
                left outer join emp e2 on e1.mgr = e2.empno
ORDER BY
    d.deptno,
    e1.empno;
-------------------------------------------------------------------------
SELECT
    *
FROM
         emp e1
    JOIN emp e2 ON e1.empno = e2.empno
    JOIN emp e3 ON e2.empno = e3.empno;
-------------------------------------------------------------------------
-- 서브 쿼리 : sql 문을 실행하는 데 필요한 데이터를 추가로 조회하기 위해 sql 문 내부에서
--            사용하는 select 문을 말함 
--            연산자와 같은 비교 또는 조회 대상의 오른쪽에 놓여서 괄호로 묶어서 사용
--            서브쿼리의 SELECT 절에 명시한 열은 메인쿼리의 비교 대상과 같은 자료형과 
--            같은 개수로 지정 
--            조인과 서브쿼리는 같이 사용 가능하다. 



select sal from emp where ename = 'JONES';  --2975
-- 2975 보다 큰 사원 조회 
SELECT * FROM emp WHERE SAL >2975;
-- 이 두 문장을 합치는게 서브쿼리 
-- 단일행 서브쿼리 
-- >, >=, = , <= , <>, !=, ^= 
SELECT * FROM emp WHERE SAL > (SELECT sal FROM emp WHERE ename = 'JONES');

-- ALLEN 사원의 추가수당보다 많은 추가수당을 받는 사원 조회
SELECT  COMM FROM emp WHERE ename = 'ALLEN';
SELECT * FROM emp WHERE COMM>(SELECT  COMM FROM emp WHERE ename = 'ALLEN');
-- WARD 사원의 입사일 보다 빨리 입사한 사원 목록 조회
SELECT * FROM emp WHERE hiredate<(select hiredate from emp where ename = 'WARD');
-----------------------------------------------------------------------

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원정보( 사원번호, 
-- 사원명, 직업, 급여) 와 소속부서정보(부서번호, 부서명, 부서위치)를 조회
select empno, ename, job, sal, e.deptno, dname, loc
from emp e join dept d  on e.deptno = d.deptno 
where d.deptno = 20 and e.sal > (select avg(sal) from emp);
-- 다중행 서브쿼리 
-- 서브쿼리 실행결과가 여러 개로 나오는 걸 의미 
-- IN, ANY(SOME), ALL, EXISTS
-- 부서별 최고 급여보다 큰 사원 조회 
select max(sal) 
from emp
group by deptno;

--ORA-01427: 단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
select * 
from emp 
where sal = (select max(sal) from emp group by deptno);

-- IN : 메인 쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치하면 TRUE
select * 
from emp 
where sal in (select max(sal) from emp group by deptno);

-- ANY(SOME) : 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 true
SELECT *
FROM emp 
WHERE SAL = ANY(SELECT MAX(sal) FROM emp GROUP BY deptno);
-- 30번 부서 사원들의 최고급여보다 적은 사원 조회
select * 
FROM emp
WHERE SAL < ANY(SELECT sal FROM emp WHERE deptno = 30);
-- 30번 부서 사원들의 최저급여보다 많은 사원 조회
select * 
FROM emp
WHERE SAL > ANY(SELECT sal FROM emp WHERE deptno = 30);

-- ALL : 메인쿼리의 조건식을 서브 쿼리의 결과 모두가 만족하면 TRUE
-- 30번 부서 사원들의 급여보다 적은 사원 조회
SELECT *
FROM emp 
WHERE SAL < ALL(SELECT SAL FROM EMP WHERE DEPTNO= 30);

SELECT *
FROM emp 
WHERE SAL > ALL(SELECT SAL FROM EMP WHERE DEPTNO= 30);

-- EXISTS : 서브 쿼리의 결과가 존재하면(행이 1개이상 존재하면) TRUE
SELECT *
FROM emp 
WHERE  EXISTS(SELECT DNAME FROM DEPT WHERE DEPTNO= 10);

SELECT *
FROM emp 
WHERE  EXISTS(SELECT DNAME FROM DEPT WHERE DEPTNO= 50);

-- 문제] 전체 사원 중 ALLEN 과 같은 직책인 사원들의 사원정보, 부서정보 출력하기
-- ENAME, JOB,SAL, DEPTNO, DNAME 출력
SELECT ename, job, sal , e.deptno, dname
FROM emp e join dept d on e.deptno = d.deptno
where e.job in(select job FROM emp where ename = 'ALLEN');

--문제 ] 전체사원의 평균 급여보다 높은 급여를 받는 사원들의 사원정보, 부서정보, 급여등급
-- 출력하기(급여가 많은 순으로 정렬하되 급여가 같은 경우에는 사원번호를 오름차순으로 정렬)
select empno,ename, job ,sal , e.deptno, s.grade
from emp e join dept d on e.deptno = d.deptno
           join salgrade s on e.sal between s.losal and s.hisal
where sal > ANY(SELECT AVG(SAL) FROM EMP) 
order by sal desc,EmPNO;

-- 비교할 열이 여러 개인 다중열 서브쿼리
SELECT  * 
FROM emp
WHERE (deptno,sal) IN(SELECT deptno, MAX(sal) FROM emp GROUP BY deptno);

--FROM 서브쿼리 (인라인 뷰)
SELECT empno, ename ,E10.deptno,dname,loc 
FROM (SELECT * FROM emp WHERE deptno = 10) E10, (SELECT * FROM dept) D
WHERE E10.deptno = D.deptno;

-- INSERT 사용하는 서브쿼리
-- VALUES 절은 사용하지 않음 
-- 데이터가 추가되는 테이블의 열 개수와 서브쿼리의 열 개수가 일치해야 한다. 
-- 데이터가 추가되는 테이블의 자료형과 서브쿼리의 자료형이 일치해야 한다.
-- EMP 테이블에서 SALGRADE 테이블을 참조하여 급여 등급이 1인 사원만을 EMP_TEMP
-- 에 추가하기
SELECT * 
FROM EMP E, SALGRADE S 
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 1;


INSERT INTO emp_temp(empno,ename,job,mgr,hiredate, sal,comm,deptno)
SELECT e.EMPNO,e.ename,e.job,e.mgr,e.hiredate,e.sal,e.comm,e.deptno 
FROM EMP E, SALGRADE S 
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 1;


-- UPDATE 서브쿼리 
SELECT * FROM dept_temp;
-- 40번 부서의 부서 이름과 지역 수정(detp 테이블의 deptno = 30 인 지역명,부서명)
 
SELECT dname, loc 
FROM dept
WHERE deptno = 30;

UPDATE DEPT_TEMP SET (DNAME,LOC) = (SELECT dname, loc 
FROM dept
WHERE deptno = 30)
WHERE DEPTNO = 40;

UPDATE dept_temp
SET loc = 'SEOUL'
WHERE deptno = (SELECT deptno FROM dept_temp WHERE dname = 'ACCOUNTING');

--DELETE 서브쿼리
SELECT * FROM emp_temp;
-- 급여 등급이 3등급이고 30번 부서인 사원들만 삭제

DELETE emp_temp WHERE empno IN(SELECT EMPNO 
FROM EMP_TEMP E, SALGRADE S 
WHERE  E.SAL BETWEEN s.losal AND S.HISAL AND S.GRADE =3 AND E.DEPTNO = 30);

--[실습1] 실습을 위하여 기존 테이블을 이용하여 테이블을 생성한다.
--① EMP 테이블의 내용을 이용하여 EXAM_EMP 생성
CREATE  TABLE EXAM_EMP AS SELECT * FROM EMP;
--② DEPT 테이블의 내용을 이용하여 EXAM_DEPT 생성
CREATE  TABLE EXAM_DEPT AS SELECT * FROM DEPT;
--③ SALGRADE 테이블의 내용을 이용하여 EXAM_SALGRADE 생성
CREATE  TABLE EXAM_SALGRADE AS SELECT * FROM SALGRADE;

--[실습2] 다음의 정보를 EXAM_EMP 테이블에 입력하시오.
SELECT * FROM EXAM_EMP
ORDER BY DEPTNO;
INSERT INTO EXAM_EMP VALUES(7201,'TEST_USER1','MANAGER',7788,'2016-01-02',4500,NULL,50);
COMMIT;
--[실습3] EXAM_EMP에 속한 사원 중 50번 부서에서 근무하는 사원들의 
--평균 급여보다 많은 급여를 받고 있는 
--사원들을 70번 부서로 옮기는 SQL 문 작성하기
UPDATE EXAM_EMP SET DEPTNO = 70 WHERE SAL > (SELECT AVG(SAL) FROM exam_emp WHERE DEPTNO = 50);
ROLLBACK;
--[실습4] EXAM_EMP에 속한 사원 중 60번 부서의 사원 중에서
--입사일이 가장 빠른 사원보다 늦게 입사한 사원의 급여를 10% 인상하고
--80번 부서로 옮기는 SQL 문 작성하기
UPDATE EXAM_EMP SET DEPTNO = 80, SAL = SAL*1.1 WHERE HIREDATE > (SELECT MIN(HIREDATE) FROM EXAM_EMP WHERE DEPTNO = 60);
--[실습5] EXAM_EMP에 속한 사원 중, 급여 등급이 5인 사원을 
-- 삭제하는 SQL문을 작성하기
DELETE FROM EXAM_EMP WHERE EMPNO IN (SELECT EMPNO FROM EXAM_EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE =5);

COMMIT;

-- 트랜잭션 
-- 하나의 단위로 데이터를 처리

CREATE TABLE DEPT_TCL AS SELECT * FROM DEPT;
SELECT * FROM DEPT_TCL;
-- 트랜잭션과 관련있는 명령어 실행
INSERT INTO DEPT_TCL VALUES(50,'DATABASE', 'SEOUL');
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;

DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';
--------------------------------------------------
SELECT * FROM DEPT_TCL;
-- 수행된 명령 취소
ROLLBACK;
-- 수행된 명령 최종 반영 
COMMIT;
SELECT * FROM DEPT_TCL;

--세션 : 어떤 활동을 위한 시간이나 기간 
--     데이터베이스 접속을 시작으로 여러 데이터베이스에서 관련 작업을 수행한 후
--     접속을 종료하기까지 전체 기간
DELETE FROM DEPT_TCL WHERE DEPTNO=50;
SELECT * FROM DEPT_TCL;
COMMIT;

UPDATE DEPT_TCL
SET LOC = 'SEOUL'
WHERE DEPTNO = 30;
COMMIT;








