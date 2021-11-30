use payroll_service;
Create Table emp_department(emp_id int not null ,dept_id varchar(50) not null, dept_name varchar(50));

insert into emp_department values(101,'D01','IT');
insert into emp_department values(102,'D02','sales');
insert into emp_department values(102,'D03','marketing');
insert into emp_department values(103,'D04','Manager');
insert into emp_department values(104,'D02','sales');

drop table emp_department;
select * from emp_department;
desc emp_department;


SELECT emp_department.dept_name,count(distinct employee_details.gender) from emp_department,employee_details group by emp_department.dept_name;
