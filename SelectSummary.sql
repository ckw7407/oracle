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









