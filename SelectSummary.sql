-- DQL(���Ǿ�) ������ ��ȸ 
-- select �÷���
-- from ���̺��

desc emp;

select * 
from emp;

select ename,empno,sal
from emp;

select DISTINCT(deptno)
from emp;

-- +,-,*,/
-- null ����Ұ�

select ename �����,sal,sal *12 + nvl(comm,0) as ����,comm
from emp;

-- ������ ����
-- select �÷���
-- from ���̺��
-- order by �÷���(���ı����� �Ǵ� ��) asc/desc

select *
from emp
order by sal asc;  --�������� ����


select *
from emp
where sal >= 3000;  --�޿��� 3000 �̻��� ���

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
UNION -- ������
select empno,ename,sal,deptno
from emp
where deptno = 20;

select empno,ename,sal,deptno
from emp
where deptno = 10
UNION ALL-- ������
select empno,ename,sal,deptno
from emp
where deptno = 10;

select empno,ename,sal,deptno
from emp
MINUS -- ������
select empno,ename,sal,deptno
from emp
where deptno = 10;

select empno,ename,sal,deptno
from emp
INTERSECT -- ������
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
	ceil(3.14),  --   �ڽź��� ū ���� ����� ����       4
	floor(3.14), --  �ڽź��� ���� ���� ����� ����    3
	ceil(-3.14),  --   -3
	floor(-3.14) --   -4
from dual;

select mod(5,2),mod(10,4)
from dual;

select *
from emp
where mod(empno,2) = 1;


-- ��¥ �Լ�

select sysdate 
from dual;

select sysdate - 1 ����, sysdate, sysdate + 1 ����
from dual;

select sysdate - hiredate as �ٹ��ϼ�  -- ���̰� �ϼ� ��ȯ
from emp;

select trunc((sysdate - hiredate) / 365) �ټӳ��
from emp;

select sysdate, to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as ����ð�
from dual;

select hiredate ,to_char(hiredate,'YYYY-MM-DD HH24:MI:SS DAY') as �Ի�����
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
	decode(deptno,10,'AAA',20,'BBB',30,'CCC','��Ÿ') as �μ���
from emp;

select ename,job,deptno,
	case
	when deptno = 10 then 'AAA'
	when deptno = 20 then 'BBB'
	when deptno = 30 then 'CCC'
	else '��Ÿ'
	end as �μ���
from emp;

select ename,job,sal,
	case 
		when sal between 3000 and 5000 then '�ӿ�'
		when sal >= 2000 and sal < 3000 then '������'
		when sal >= 500 and sal < 2000 then '���'
		else '��Ÿ'
	end as ����
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
from emp e,dept d --���̺� ��Ī �ο�
where e.deptno = d.deptno;

select ename,job,e.deptno,dname,loc
from emp e,dept d --���̺� ��Ī �ο�
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
from emp e, emp m  -- �ݵ�� ��Ī �ο�
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
from emp e, emp m  -- �ݵ�� ��Ī �ο�
where e.mgr = m.empno(+);  -- �����Ͱ� ���� ���̺��ʿ� (+)�� ���δ�

select ename,sal,d.deptno,dname
from emp e,dept d
where e.deptno(+) = d.deptno;

select ename,sal,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno;

select ename,sal,dname,loc
from emp e inner join dept d
using(deptno); -- ���� ���̺��� �÷����� �����Ѱ��

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
from emp e left outer join emp m  -- �����Ͱ� �ִ� ���� �����Ѵ�
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
using(deptno)  --��Ī ���� ����� ���ѵȴ�
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



-- DML(���۾�)

create table dept_temp
as
select * from dept;

select *
from dept_temp;

insert into dept_temp (deptno,dname,loc)
values (50,'DATABASE');

insert into dept_temp (deptno,dname)  -- ������  null�����ͻ���
values (60,'JSP');

insert into dept_temp  --�÷�����
values (70,'SEOUL');

insert into dept_temp  --�÷�����
values (80,NULL,'SEOUL');

create table emp_temp
as
select * from emp
where 1 != 1;

select *
from emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (9999,'ȫ�浿','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (3111,'��û��','MANAGER',9999,sysdate,4000,null,30);

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
    --���,�̸�,��å,������,�Ի���,�޿�,������,�μ���ȣ
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
values (9999,'�̼���','MANAGER',1111,sysdate,1000,null,10);

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


-- index ��ü ������ (0.030 ~ 0,040)
select empno,ename
from emp03
where ename = 'bts';

create index idx_emp03_ename
on emp03(ename);

-- index ��ü ������ (0.001 ~ 0,002)
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

--���Ἲ ��������(SCOTT.FK_DEPTNO)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�

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
values (1111,'ȫ�浿','MANAGER',30);

insert into emp04
values (2222,'ȫ�浿','MANAGER',30);

insert into emp04
values (null,'������','SALESMAN',20);
--NULL�� ("SCOTT"."EMP04"."EMPNO") �ȿ� ������ �� �����ϴ�

insert into emp04
values (2222,'������','SALESMAN',10);
--���Ἲ ���� ����(SCOTT.SYS_C0011295)�� ����˴ϴ�
--���Ἲ ���� ����(SCOTT.EMP04_EMPNO_PK)�� ����˴ϴ�

insert into emp04
values (null,null,'MANAGER',30);









