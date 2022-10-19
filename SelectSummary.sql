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

















