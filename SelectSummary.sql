-- DQL(질의어) 데이터 조회 
-- select 컬럼명
-- from 테이블명

desc emp;

select * 
from emp;

select ename,empno,sal
from emp;

select DISTINCT(deptno)
from emp;

-- +,-,*,/
-- null 연산불가

select ename 사원명,sal,sal *12 + nvl(comm,0) as 연봉,comm
from emp;

-- 데이터 정렬
-- select 컬럼명
-- from 테이블명
-- order by 컬럼명(정렬기준이 되는 값) asc/desc

select *
from emp
order by sal asc;  --내림차순 정렬


select *
from emp
where sal >= 3000;  --급여가 3000 이상인 사원

select *
from emp
where deptno = 30 and job = 'SALESMAN' and empno = 7499;

select * 
from emp
where ename = 'FORD'; 

select *
from emp
where hiredate < '1982/01/01';

select *
from emp
where deptno = 10 or sal >= 2000;

select *
from emp
where sal >= 1000 and sal <= 3000;

select * 
from emp
where sal <= 1000 or sal >= 3000;

select *
from emp
where sal = 800 or sal = 3000 or sal = 5000;

select *
from emp
where sal in(800,3000,5000);

select * 
from emp
where ename like 'F%';

select *
from emp
where ename like '%O%';


select *
from emp
where ename like '___D';

select *
from emp
where ename like 'S___%';

select *
from emp
where comm is null;

select *
from emp
where comm is not null;

select empno,ename,sal,deptno
from emp
where deptno = 10
UNION -- 합집합
select empno,ename,sal,deptno
from emp
where deptno = 20;

select empno,ename,sal,deptno
from emp
where deptno = 10
UNION ALL-- 합집합
select empno,ename,sal,deptno
from emp
where deptno = 10;

select empno,ename,sal,deptno
from emp
MINUS -- 차집합
select empno,ename,sal,deptno
from emp
where deptno = 10;

select empno,ename,sal,deptno
from emp
INTERSECT -- 교집합
select empno,ename,sal,deptno
from emp
where deptno = 10;

select 'Welcome',upper('Welcome')
from dual;

select lower(ename),upper(ename)
from emp;

select *
from emp
where lower(ename) = 'scott';


select ename,length(ename)
from emp;

select 'Welcome to Oracle',substr('Welcome to Oracle',2,3),substr('Welcome to Oracle',10)
from dual;

select 'Welcome to Oracle',substr('Welcome to Oracle',-3,3),substr('Welcome to Oracle',-17)
from dual;

select instr('Welcome to Oracle','o')
from dual;

select instr('Welcome to Oracle','o',6)
from dual;

select instr('Welcome to Oracle','e',3,2)
from dual;

select 'Welcome to Oracle',replace('Welcome to Oracle','to','of')
from dual;

select 'oracle',lpad('oracle',10,'#'),rpad('oracle',10,'*'),lpad('oracle',10)
from dual;

select  rpad('990103-',14,'*')
from dual;

select concat(empno,ename), empno || '' || ename
from emp;

select 
	round(1234.5678),
	round(1234.5678,0),
	round(1234.5678,1),
	round(1234.5678,2),
    round(1234.5678,-1)
from dual;

select 
	trunc(1234.5678),
	trunc(1234.5678,0),
	trunc(1234.5678,1),
	trunc(1234.5678,2),
	trunc(1234.5678,-1)
from dual;


select 
	ceil(3.14),  --   자신보다 큰 가장 가까운 정수       4
	floor(3.14), --  자신보다 작은 가장 가까운 정수    3
	ceil(-3.14),  --   -3
	floor(-3.14) --   -4
from dual;

select mod(5,2),mod(10,4)
from dual;

select *
from emp
where mod(empno,2) = 1;























