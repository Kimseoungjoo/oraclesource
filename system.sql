alter session set "_ORACLE_SCRIPT" = true; 

-- 비밀번호 변경
-- alter user hr IDENTIFIED by hr;// DDL 관련 구문(CREATE, ALTER,
-- 새로운 사용자 생성
create USER c##scott IDENTIFIED BY tiger
default tablespace users
TEMPORARY TABLESPACE temp;

-- 새로운 사용자에게 권한 부여
grant connect, RESOURCE, dba to c##scott;



-- 사용자 관리 
-- SCOTT , HR ... 오라클 데이터베이스가 기본 계정으로 제공

-- 오라클 데이터베이스 특징
-- 테이블, 인덱스, 뷰, ... 여러가지 객체가 사용자별로 생성되고 관리
-- 데이터베이스 스키마
-- 데이터 간 관계, 데이터 구조, 제약 조건 등 데이터를 저장 및 관리하기 위해 정의한
-- 데이터베이스 구조의 범위 
-- ㅅㅏ용자 == 스키마

-- 사용자 생성
 CREATE USER c##test IDENTIFIED BY 12345;
 --사용자 비밀번호 변경
 alter user c##test identified by 54321;
 -- 사용자 삭제 
drop user c##test cascade;

-- 권한 관리 
-- 시스템 권한 : 사용자 생성, 정보 수정, 삭제, 데이터베이스 접근, 객체생성...
-- 롤 관리


-- 상태: 사용자는 c##test create session 권한을 가지고 있지 않음
-- 로그온이 거절되었습니다
-- 데이터베이스 접속 권한 부여
grant create session to c##test;
grant create table to c##test; 


create user c##test2 IDENTIFIED BY 12345
default tablespace users
TEMPORARY TABLESPACE temp;

-- resource : trigger, sequence, table .. 생성권한들이 모여있는 롤
grant resource, create session, create table to c##test2;

-- c##test2에게 users 테이블 공간 2m 할당
alter user c##test2 quota 2M on users;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ;