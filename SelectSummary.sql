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









