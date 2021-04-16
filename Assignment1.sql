create database storagelayer;

use storagelayer;

create table Employee (
EmpNo int,		-- int(10) integer width is deprecated now.
EmpName varchar(20),
Job varchar(10),
Mgr int,
Hiredate datetime,
Salary numeric(7,2),
Comm numeric(7,2),
DeptNo int
);

create table Departmen (
DeptNo int Primary Key,
DeptName varchar(20),
DeptLoc varchar(20)
);

alter table Departmen rename Department;

drop table Employee;

desc Employee;

alter table Employee add  constraint pk_add_EmpNo primary key(EmpNo);	-- add constraint to add constraint.
-- alter table Employee modify Empno Primary Key;	to modify the definition of column.
-- change is same as modifiy but it also changes the column name so 2 column name needs to mention.

alter table Employee add constraint fk_add_DeptNo foreign key(DeptNo) references Department(DeptNo);
alter table Employee add constraint fk_add_Mgr foreign key(Mgr) references Employee(EmpNo);

INSERT INTO Department VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO Department VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO Department VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO Department VALUES (40, 'OPERATIONS', 'BOSTON');

select * from Department;

INSERT INTO Employee VALUES   (7839, 'KING',   'PRESIDENT', NULL,    str_to_date('11/17/1981','%m/%d/%Y') , 5000, NULL, null);   
INSERT INTO Employee VALUES   (7566, 'JONES',  'MANAGER',   		7839, str_to_date('04/2/1981'	,'%m/%d/%Y'),  2975, NULL, 20);
INSERT INTO Employee VALUES   (7698, 'BLAKE',  'MANAGER',   		7839, str_to_date('05/01/1981'	,'%m/%d/%Y'),  2850, NULL, 30);
INSERT INTO Employee VALUES   (7782, 'CLARK',  'MANAGER',   		7839, str_to_date('06/09/1981'	,'%m/%d/%Y'),  2450, NULL, 10);
INSERT INTO Employee VALUES   (7999, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/01/2011'  ,'%m/%d/%Y'), 4000, NULL, 10);
INSERT INTO Employee VALUES   (7788, 'SCOTT',  'ANALYST',   		7566, str_to_date('12/09/1982'  ,'%m/%d/%Y'), 3000, NULL, 20);
INSERT INTO Employee VALUES   (7902, 'FORD',   'ANALYST',   		7566, str_to_date('12/03/1981'  ,'%m/%d/%Y'),  3000, NULL, 20);
INSERT INTO Employee VALUES   (7499, 'ALLEN',  'SALESMAN',  		7698, str_to_date('02/20/1981'  ,'%m/%d/%Y'), 1600,  300, 30);
INSERT INTO Employee VALUES   (7521, 'WARD',   'SALESMAN',  		7698, str_to_date('02/22/1981'  ,'%m/%d/%Y'), 1250,  500, 30);
INSERT INTO Employee VALUES   (7654, 'MARTIN', 'SALESMAN',  		7698, str_to_date('09/28/1981'  ,'%m/%d/%Y'), 1250, 1400, 30);
INSERT INTO Employee VALUES   (7844, 'TURNER', 'SALESMAN',  		7698, str_to_date('09/08/1981'  ,'%m/%d/%Y'),  1500,    0, 30);
INSERT INTO Employee VALUES   (7900, 'JAMES',  'CLERK',			7698, str_to_date('12/03/1981'  ,'%m/%d/%Y'),   950, NULL, 30);
INSERT INTO Employee VALUES   (7369, 'SMITH',  'CLERK',			7902, str_to_date('12/17/1980'  ,'%m/%d/%Y'), 800, NULL, 20);
INSERT INTO Employee VALUES   (7876, 'ADAMS',  'CLERK',			7788, str_to_date('01/12/2003'  ,'%m/%d/%Y'), 1100, NULL, 20);
INSERT INTO Employee VALUES   (7934, 'MILLER', 'CLERK',			7782, str_to_date('01/23/2002'  ,'%m/%d/%Y'), 1300, NULL, 10);
INSERT INTO Employee VALUES   (7901, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/23/2012'  ,'%m/%d/%Y'), 3000, NULL, 10);

select * from Employee;

-- Q1

select Employee.EmpNo as "Employee Id", Employee.EmpName as "Employee Name", Employee.Job as Position, Employee.Mgr, Employee.Hiredate, Employee.Salary, Employee.Comm, Department.DeptNo as "Department Id", Department.DeptName as "Department Name", Department.DeptLoc as "Department Location"
from Employee 
inner join
Department on Employee.DeptNo = Department.DeptNo
where Employee.Job = "MANAGER";

-- Q2

select Employee.EmpNo as "Employee Id", Employee.EmpName as "Employee Name", Employee.Job as Position, Employee.Mgr, Employee.Hiredate, Employee.Salary, Employee.Comm, Department.DeptNo as "Department Id", Department.DeptName as "Department Name", Department.DeptLoc as "Department Location"
from Employee 
inner join
Department on Employee.DeptNo = Department.DeptNo
where Employee.Job in ("MANAGER","ANALYST","CLERK");

-- Q3

select * from Employee where salary between 3000 and 5000; -- both value are inclusive
select * from Employee where salary >= 3000 and salary <= 5000;

-- Q4

select EmpName as "Employee Name" from Employee where job in ("MANAGER","ANALYST","CLERK") and salary between 3000 and 5000;

-- Q5/6

select EmpName from Employee where Comm is not NULL;

-- Q7

select EmpName from Employee where EmpName like "S%";

-- Q8

select EmpName from Employee where EmpName like "%R";

-- Q9

select EmpName from Employee where EmpName like "%A%";

-- Q10

select EmpName from Employee where EmpName like "_A%";

-- Q11

select EmpName from Employee where EmpName like "M%" or EmpName like "S%";

-- Q12

select EmpName from Employee where regexp_like(EmpName, "[A-M]");

-- Q13

select EmpName from Employee where EmpName like "%\_%";		-- \ escape character

-- Q14

select Employee.EmpNo as "Employee Id", Employee.EmpName as "Employee Name", Employee.Job as Position, Employee.Mgr, Employee.Hiredate, Employee.Salary, Employee.Comm, Department.DeptNo as "Department Id", Department.DeptName as "Department Name", Department.DeptLoc as "Department Location"
from Employee 
inner join
Department on Employee.DeptNo = Department.DeptNo
where Employee.Job = "MANAGER" and Department.DeptNo in (10,20) or (Employee.Job = "CLERK" and Employee.DeptNo = 30);

-- Q15

-- Q16

select * from Employee order by EmpName;

-- Q17

select * from Employee order by salary desc;

-- Q18

select * from Employee group by DeptNo order by salary desc;

-- Q19

select * from Employee order by salary desc limit 3;

-- Q20

-- Q23

select distinct(Job) as Job from Employee;

-- Q24

select sum(Salary) as "Total Salary" from Employee;

-- Q25

select Department.DeptName, sum(Employee.Salary) as "Salary"
from Employee
inner join
Department on Employee.DeptNo = Department.DeptNo
group by Department.DeptName;

-- Q26

select Job, count(EmpNo) from Employee group by Job;

-- Q27

select EmpName from Employee where month(Hiredate) = 2;
select EmpName from Employee where monthname(Hiredate) = "February";

-- Q28

select EmpName from Employee where year(Hiredate) >= 1981 and year(Hiredate) <= 1983;