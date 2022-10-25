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


-- 날짜 함수

select sysdate 
from dual;

select sysdate - 1 어제, sysdate, sysdate + 1 내일
from dual;

select sysdate - hiredate as 근무일수  -- 차이가 일수 반환
from emp;

select trunc((sysdate - hiredate) / 365) 근속년수
from emp;

select sysdate, to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as 현재시간
from dual;

select hiredate ,to_char(hiredate,'YYYY-MM-DD HH24:MI:SS DAY') as 입사일자
from emp;

select to_char(123456,'L999,999')
from dual;

select sal, to_char(sal,'L999,999')
from emp;

select '20000' - 10000
from dual;

select '20000' - '5000'
from dual;

select '20,000' - '5,000'
from dual;

select to_number('20,000','999,999') - to_number('5,000','999,999')
from dual;

select to_date('20221019','YYYY/MM/DD')
from dual;

select *
from emp
where hiredate < 19820101;


select *
from emp
where hiredate < to_date('19820101','YYYY-MM-DD');

select *
from emp
where mgr is null;

select ename,job,mgr
from emp
where mgr is null;

select ename,job,nvl(to_char(mgr,'9999'),'CEO') as mgr
from emp
where mgr is null;

select *
from emp;

select comm, nvl2(comm,'O','X')
from emp;

select ename,job,deptno,
	decode(deptno,10,'AAA',20,'BBB',30,'CCC','기타') as 부서명
from emp;

select ename,job,deptno,
	case
	when deptno = 10 then 'AAA'
	when deptno = 20 then 'BBB'
	when deptno = 30 then 'CCC'
	else '기타'
	end as 부서명
from emp;

select ename,job,sal,
	case 
		when sal between 3000 and 5000 then '임원'
		when sal >= 2000 and sal < 3000 then '관리자'
		when sal >= 500 and sal < 2000 then '사원'
		else '기타'
	end as 직무
from emp;


select empno,rpad(substr(empno,1,2),4,'*') ,
	ename, rpad(substr(ename,1,1),length(ename),'*')
from emp
where length(ename) >= 5
and  length(ename) < 6;

select empno,ename,sal,
	trunc(sal / 21.5,2) as Day_pay,
	round(sal / 21.5 /8,1) as Time_pay
from emp;

select empno,ename,mgr,
	case	
		when substr(mgr,1,2) = '75' then '5555'
		when substr(mgr,1,2) = '76' then '6666'
		when substr(mgr,1,2) = '77' then '7777'
		when substr(mgr,1,2) = '78' then '8888'
		when mgr is null then '0000'
		else to_char(mgr)
	end as CHG_MGR
from emp;


select sum(sal)
from emp;

select avg(sal)
from emp;

select count(*),count(comm)
from emp;

select max(sal),min(sal)
from emp;

select ename,max(sal)
from emp;

select max(sal)
from emp;

select min(hiredate),max(hiredate)
from emp
where deptno = 20;

select avg(sal) from emp where deptno = 10
UNION
select avg(sal) from emp where deptno = 20
UNION
select avg(sal) from emp where deptno = 30;


select deptno
from emp
group by deptno;


select deptno, avg(sal)
from emp
group by deptno;

select deptno,avg(sal)
from emp
group by deptno
order by deptno;

select avg(sal)
from emp
group by deptno,job;

select deptno, job, avg(sal)
from emp
group by deptno, job;

select deptno, job, avg(sal)
from emp
group by deptno, job
order by deptno, job desc;


select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 2000;

select deptno,avg(sal)
from emp
where deptno != 10
group by deptno
having avg(sal) >= 2000;

select emp.ename,emp.job,emp.deptno,dept.dname,dept.loc
from emp,dept
where emp.deptno = dept.deptno;

select ename,job,emp.deptno,dname,loc
from emp,dept
where emp.deptno = dept.deptno;

select ename,job,e.deptno,dname,loc
from emp e,dept d --테이블에 별칭 부여
where e.deptno = d.deptno;

select ename,job,e.deptno,dname,loc
from emp e,dept d --테이블에 별칭 부여
where e.deptno = d.deptno
and sal >= 3000;

select ename, sal, grade
from emp e,salgrade s
where e.sal between s.losal and s.hisal;
--where e.sal >= s.losal and e.sal <= s.hisal

select empno,ename,sal,d.deptno,dname,grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal;

select ename,mgr
from emp;

select *
from emp;

select e.empno,e.ename,e.mgr,m.ename
from emp e, emp m  -- 반드시 별칭 부여
where e.mgr = m.empno;

select ename,deptno
from emp
where deptno = 20;

select work.ename , friend.ename
from emp work,emp friend
where work.deptno = friend.deptno
and work.ename = 'SCOTT'
and friend.ename != 'SCOTT';

select e.empno,e.ename,e.mgr,m.ename
from emp e, emp m  -- 반드시 별칭 부여
where e.mgr = m.empno(+);  -- 데이터가 없는 데이블쪽에 (+)를 붙인다

select ename,sal,d.deptno,dname
from emp e,dept d
where e.deptno(+) = d.deptno;

select ename,sal,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno;

select ename,sal,dname,loc
from emp e inner join dept d
using(deptno); -- 양쪽 테이블의 컬럼명이 동일한경우

select ename,sal,dname,loc
from emp e inner join dept d
using(deptno)
where ename = 'SCOTT';

select e.empno,e.ename,e.mgr,m.ename
from emp e inner join emp m
on e.mgr = m.empno;

select empno,ename,sal,grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

select e.empno,e.ename,e.mgr,m.ename
from emp e left outer join emp m  -- 데이터가 있는 쪽을 지정한다
on e.mgr = m.empno;

select empno,ename,sal,d.deptno,dname,grade
from emp e inner join dept d
on e.deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and s.hisal;

select ename,sal,d.deptno,dname
from emp e right outer join dept d
on e.deptno = d.deptno;


select d.deptno,d.dname,e.empno,e.ename,e.sal
from emp e inner join dept d
on e.deptno = d.deptno
where e.sal > 2000;

select   
    e.deptno,
	dname,
	trunc(avg(sal)),
	max(sal),
	min(sal),
	count(*)
from emp e inner join dept d
on e.deptno = d.deptno
group by e.deptno,d.dname;

select ename,sal
from emp
where sal = (
		select max(sal)
		from emp
	);
    
select ename , deptno
from emp
where deptno = (
		select deptno
		from dept
		where loc = 'DALLAS'
	);
    
select ename,sal,mgr
from emp
where mgr = (
		select empno
		from emp
		where ename = 'KING'
	);


select d.deptno,d.dname,e.empno,e.ename,e.job,e.sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by d.deptno , e.ename;

select d.deptno, d.dname,
       e.empno,e.ename,e.mgr,e.sal,e.deptno,
       s.losal,s.hisal,s.grade,
       m.empno,m.ename
from emp e right outer join dept d
on e.deptno = d.deptno
	full outer join salgrade s
on e.sal between s.losal and s.hisal
	left outer join emp m
on e.mgr = m.empno
	order by d.deptno, e.empno;



select trunc(avg(sal)),
	e.deptno
from emp e inner join dept d
using(deptno)
group by e.deptno;


select   
          deptno,
	d.dname,
	trunc(avg(sal)),
	max(sal),
	min(sal),
	count(*)
from emp inner join dept d
--on e.deptno = d.deptno
using(deptno)  --별칭 사용시 적용시 제한된다
group by deptno,d.dname;

select *
from emp
where sal in (
        select max(sal)
        from emp
        group by deptno 
	);
    
select *
from emp
where sal > any ( 
 	select max(sal)
	from emp
	group by deptno 
	);
    
select ename,sal
from emp
where sal > all(select sal
                from emp
                where deptno = 30
        );
        
select *
from emp
where (deptno,sal) in (
			select deptno,max(sal)
			from emp
			group by deptno
		);



-- DML(조작어)

create table dept_temp
as
select * from dept;

select *
from dept_temp;

insert into dept_temp (deptno,dname,loc)
values (50,'DATABASE');

insert into dept_temp (deptno,dname)  -- 묵시적  null데이터삽입
values (60,'JSP');

insert into dept_temp  --컬럼생략
values (70,'SEOUL');

insert into dept_temp  --컬럼생략
values (80,NULL,'SEOUL');

create table emp_temp
as
select * from emp
where 1 != 1;

select *
from emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (9999,'홍길동','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (3111,'심청이','MANAGER',9999,sysdate,4000,null,30);

drop table dept_temp2;

create table dept_temp2
as
select * from dept;

select *
from dept_temp2;

update dept_temp2
set loc = 'SEOUL';

update dept_temp2
set dname = 'DATABASE', loc = 'SEOUL'
where deptno = 40;

drop table emp_temp2;

create table emp_temp2
as
select * from emp;

select *
from emp_temp2;

delete from emp_temp2;

delete from emp_temp2
where ename = 'SCOTT';


drop table dept01;

create table dept01
as
select * from dept;

select *
from dept01;

delete from dept01;

commit;
rollback;

truncate table dept01;
rollback;


-- DDL
drop table emp_ddl;

create table emp_ddl(
    --사번,이름,직책,관리자,입사일,급여,성과급,부서번호
    empno number(4),
    ename varchar2(10), -- byte
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
);

select *
from emp_DDL;

insert into emp_ddl
values (9999,'이순신','MANAGER',1111,sysdate,1000,null,10);

create table emp_alter
as
select * from emp;

select *
from emp_alter;

alter table emp_alter
add address varchar2(100);

alter table emp_alter
rename column address to addr;

alter table emp_alter
modify empno number(10);

desc emp_alter;


alter table emp_alter
drop column addr;

drop table emp_alter;

select *
from emp_alter;

desc user_tables;

select table_name
from user_tables;

select owner, table_name
from all_tables;

drop table emp03;

create table emp03
as
select * from emp;

select *
from emp03;

insert into emp03
select * from emp03;

insert into emp03(empno,ename)
values (1111,'bts');


-- index 객체 생성전 (0.030 ~ 0,040)
select empno,ename
from emp03
where ename = 'bts';

create index idx_emp03_ename
on emp03(ename);

-- index 객체 생성후 (0.001 ~ 0,002)
select empno,ename
from emp03
where ename = 'bts';

drop index idx_emp03_ename;

show recyclebin;

flashback table emp_alter
to before drop;

purge recyclebin;


-- emp,dept

insert into emp
values (1111,'aaa','MANAGE',9999,SYSDATE,1000,NULL,50);

--무결성 제약조건(SCOTT.FK_DEPTNO)이 위배되었습니다- 부모 키가 없습니다

drop table emp04;

create table emp04(
    empno number(4) constraint emp04_empno_pk primary key,  --not null +  unique,
    ename varchar2(10) constraint emp04_ename_nn not null,
    job varchar2(9),
    deptno number(2)
);

delete from emp04;

select * from emp04;

insert into emp04
values (1111,'홍길동','MANAGER',30);

insert into emp04
values (2222,'홍길동','MANAGER',30);

insert into emp04
values (null,'김유신','SALESMAN',20);
--NULL을 ("SCOTT"."EMP04"."EMPNO") 안에 삽입할 수 없습니다

insert into emp04
values (2222,'옥동자','SALESMAN',10);
--무결성 제약 조건(SCOTT.SYS_C0011295)에 위배됩니다
--무결성 제약 조건(SCOTT.EMP04_EMPNO_PK)에 위배됩니다

insert into emp04
values (null,null,'MANAGER',30);

insert into emp
values (1111,'aaa','MANAGE',9999,SYSDATE,1000,NULL,50);

drop table emp07;

create table dept07(
   deptno number(2) constraint dept07_deptno_pk primary key,
   dname varchar2(20) constraint dept07_dname_nn not null,
   loc varchar2(20) constraint dept07_loc_nn not null
);

create table emp07(
   empno number(4) constraint emp07_empno_pk primary key,
   ename varchar2(9) constraint emp07_empno_nn not null,
   job varchar2(9),
   deptno number(2) constraint emp07_deptno_fk references dept07(deptno)	
);

select * from emp07;
select * from dept07;

insert into dept07
select * from dept;

insert into emp07
select empno,ename,job,deptno from emp;

insert into emp07
values (1111,'aaa','MANAGE',50);

drop table emp08;

create table emp08(
   empno number(4) primary key,
   ename varchar2(10) not null,
   sal number(7) constraint emp08_sal_ck check(sal between 500 and 5000),
   gender varchar2(2) constraint emp08_gender_ck check(gender in ('M','F'))
);

select * from emp08;

insert into emp08
values (1111,'hong',1000,'M');

insert into emp08
values (2222,'hong',200,'M');

insert into emp08
values (3333,'hong',1000,'A');

create table dept08(
   deptno number(2) primary key,
   dname varchar2(10) not null,
   loc varchar2(15) default 'SEOUL'
);

insert into dept08(deptno,dname)
values (10,'SALES');

select * from dept08;

insert into dept08(deptno,dname,loc)
values (20,'SALES','BUSAN');

drop table emp09;

create table emp09(
   empno number(4),
   ename varchar2(20) constraint emp09_ename_nn not null,
   job varchar2(20),
   deptno number(20),

   constraint emp09_empno_pk primary key(empno),
   constraint emp09_job_uk unique(job),
   constraint emp09_deptno_fk foreign key(deptno) references dept(deptno)  
);

insert into emp09
values (3333,'hong','PRESIDENT',80);



-- 복합키(기본키를 두개의 컬럼을 사용하는 경우)
-- 테이블 레벨 방식으로만 적용 가능

create table member(
   name varchar2(10),
   address varchar2(30),
   hphone varchar2(10),

   constraint member_name_address_pk primary key(name,address)
);

drop table emp10;

create table emp10(
   empno number(4),
   ename varchar2(20),
   job varchar2(20),
   deptno number(20)
);

alter table emp10
add constraint emp10_empno_pk primary key(empno);

alter table emp10
add constraint emp10_empno_fk foreign key(deptno) references dept(deptno);


alter table emp10
modify job constraint emp10_job_nn not null;

alter table emp10
modify ename constraint emp10_ename_nn not null;


alter table emp10
drop constraint emp10_empno_pk;



create table dept11(
   deptno number(2),
   dname varchar2(10),
   loc varchar2(15)
);

alter table dept11
add constraint dept11_deptno_pk primary key(deptno);

drop table emp11;

create table emp11(
   empno number(4),
   ename varchar2(20),
   job varchar2(20),
   deptno number(20)
);

alter table emp11
add constraint emp11_empno_pk primary key(empno);

alter table emp11
add constraint emp11_deptno_fk foreign key(deptno) references dept11(deptno);

insert into dept11
select * from dept;

insert into emp11
select empno,ename,job,deptno
from emp;


delete from dept11
where deptno = 10;

alter table dept11
disable primary key cascade;

alter table dept11
drop primary key cascade;

alter table emp01
drop primary key cascade;

drop table emp03;


CREATE TABLE DEPT_CONST ( 
   DEPTNO NUMBER(2), 
   DNAME  VARCHAR2(14), 
   LOC    VARCHAR2(13)
);

alter table DEPT_CONST
add CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY(deptno);

alter table DEPT_CONST
add CONSTRAINT DEPTCONST_DNAME_UNQ UNIQUE(dname);

alter table DEPT_CONST
modify loc CONSTRAINT DEPTCONST_LOC_NN NOT NULL;


CREATE TABLE EMP_CONST ( 
   EMPNO    NUMBER(4) , 
   ENAME    VARCHAR2(10) , 
   JOB      VARCHAR2(9), 
   TEL      VARCHAR2(20) , 
   HIREDATE DATE, 
   SAL      NUMBER(7, 2) , 
   COMM     NUMBER(7, 2), 
   DEPTNO   NUMBER(2)
); 

alter table EMP_CONST
add CONSTRAINT EMPCONST_EMPNO_PK PRIMARY KEY(empno);

alter table EMP_CONST
modify ename CONSTRAINT EMPCONST_ENAME_NN NOT NULL;

alter table EMP_CONST
add CONSTRAINT EMPCONST_TEL_UNQ UNIQUE(tel);

alter table EMP_CONST
add CONSTRAINT EMPCONST_SAL_CHK CHECK (SAL BETWEEN 1000 AND 9999);

alter table EMP_CONST
add CONSTRAINT EMPCONST_DEPTNO_FK FOREIGN KEY(deptno) REFERENCES DEPT_CONST (DEPTNO);


-- 객체 : table, index, view
-- create


create table dept_copy
as
select * from dept;

create table emp_copy
as
select * from emp;

create or replace view emp_view30
as
select empno,ename,sal,deptno 
from emp_copy
where deptno = 30;

select * 
from emp_view30;

insert into emp_view30
values (1111,'hong',1000,30);

insert into emp_view30 (empno,ename,sal)
values (1111,'hong',1000);

alter table emp_copy
add constraint emp_copy_deptno_fk foreign key(deptno) references dept(deptno);

insert into emp_view30 (empno,ename,sal)
values (2222,'hong',2000);

insert into emp_view30 (empno,ename,sal,deptno)
values (2222,'hong',2000,50);

select *
from emp_view30;

select *
from emp_copy;

create or replace view emp_view(사원번호,사원명,급여,부서번호)
as
select empno,ename,sal,deptno
from emp_copy;

select * from emp_view;

select * 
from emp_view
where 부서번호 = 20;
--where deptno = 20;

create or replace view emp_dept_view
as
select empno,ename,sal,e.deptno,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno
order by empno desc;

select *
from emp_dept_view;

create or replace view sal_view
as
select dname, min(sal) as min_sal, max(sal) as max_sal
from emp e inner join dept d
on e.deptno = d.deptno
group by d.dname;

select * from sal_view;

drop view view_sal;

create or replace view sal_view
as
select dname, min(sal) as min_sal, max(sal) as max_sal, avg(sal) as avg_sal
from emp e inner join dept d
on e.deptno = d.deptno
group by d.dname;


create or replace view view_chk30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with check option;  -- 조건절의 컬럼을 수정하지 못하게 한다.

update view_chk30
set deptno = 10;
-- 뷰의 WITH CHECK OPTION의 조건에 위배 됩니다

create or replace view view_read30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with read only;  -- 모든 컬럼에대한 C U D가 불가능(조회만 가능)

update view_read30
set deptno = 10;
-- 읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다.(insert,update,delete)


-- 뷰의 활용
-- TOP - N 조회하기
-- ROWNUM (의사컬럼) 
select * from emp;

-- 입사일이 가장 빠른 5명의 사원을 조회
select * from emp
order by hiredate asc;

select * from emp
where hiredate <= '81/05/01';

DESC emp;

select rownum,empno,ename,hiredate
from emp
where rownum <= 5;

select rownum,empno,ename,hiredate
from emp;

create or replace view view_hiredate
as
select empno,ename,hiredate
from emp
order by hiredate asc;

select * from view_hiredate;

select rownum,empno,ename,hiredate
from view_hiredate;

select rownum,empno,ename,hiredate
from view_hiredate
where rownum <= 7;

select rownum,empno,ename,hiredate
from view_hiredate
where rownum <= 7;

select rownum,empno,ename,hiredate
from view_hiredate
where rownum between 2 and 5;  -- rownum을 조건절에 직접 사용시 반드시 1을 포함하는 조건식을 만들어야 한다.


create or replace view view_hiredate_rm
as
select rownum rm,empno,ename,hiredate
from view_hiredate;

select rm,empno,ename,hiredate
from view_hiredate_rm;

select rm,empno,ename,hiredate
from view_hiredate_rm
where rm >=2 and rm <= 5;

select rm, b.*
from (
          select rownum rm, a.*
          from (
                         select empno,ename,hiredate
                         from emp
                         order by hiredate asc
                    ) a
          ) b
where rm >= 2 and rm <= 5;

select rownum,empno,ename,hiredate
from (
       select empno,ename,hiredate
       from emp
       order by hiredate asc
      )
where rownum <= 5;

drop sequence dept_deptno_seq;

create sequence dept_deptno_seq
increment by 10
start with 10;

select dept_deptno_seq.nextval
from dual;

select dept_deptno_seq.currval
from dual;

select dept_deptno_seq.nextval
from dual;

select dept_deptno_seq.currval
from dual;

select dept_deptno_seq.nextval
from dual;

select dept_deptno_seq.currval
from dual;

drop sequence emp_seq;

create sequence emp_seq
start with 1
increment by 1
maxvalue 1000;

drop table emp01;

create table emp01
as
select empno,ename,hiredate from emp
where 1 != 1;

select  *from emp01;

insert into emp01
values (emp_seq.nextval,'hong',sysdate);

















