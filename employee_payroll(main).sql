#MSSQL DB
#Use Case 1 : Create, Show and Use DB
#create database payroll_service;
use payroll_service;
show databases;

#Use Case 2 : Create Table
CREATE TABLE employee_payroll(id INT NOT NULL AUTO_INCREMENT, name VARCHAR(20) NOT NULL, salary double NOT NULL ,start date NOT NULL,PRIMARY KEY(id));
describe employee_payroll;

#Use Case 3 : Perform CURD operation(user INSERT)
insert into employee_payroll(name,salary,start)values ('Bill',100000.00,'2018-01-03');
insert into employee_payroll(name,salary,start)values ('Terisa',200000.00,'2019-11-13');
insert into employee_payroll(name,salary,start)values ('Charlie',300000.00,'2020-05-21');

#Use Case 4 : To retrieve data
select * from employee_payroll;

#Use Case 5 : Retrieve data with specific conditions
select * from employee_payroll where name='Bill';
select * from employee_payroll where start between cast('2018-01-01' as date) and date(now()); 

#Use Case 7 : Add gender column and update rows
ALTER TABLE employee_payroll ADD COLUMN gender char(1) AFTER name;
UPDATE employee_payroll SET gender='F' where name='Terisa';
UPDATE employee_payroll SET gender='M' where name='Bill' or name='Charlie';

#Use Case 6 : To find sum,average, min, max and count of male and female employee
SELECT SUM(salary) from employee_payroll where gender='F' group by gender;
SELECT min(salary) from employee_payroll where gender='M' group by gender;

SELECT gender,sum(salary) from employee_payroll group by gender;
SELECT gender,avg(salary) from employee_payroll group by gender;
SELECT gender,count(salary) from employee_payroll group by gender;

#Use Case 8 : To extend information of employee(add phone,address with default value and department)
ALTER TABLE employee_payroll ADD COLUMN PhoneNumber varchar(20) AFTER gender;
ALTER TABLE employee_payroll ADD COLUMN Department varchar(20) NOT NULL AFTER PhoneNumber;
ALTER TABLE employee_payroll ADD COLUMN Address varchar(150) NOT NULL DEFAULT'Country India' AFTER PhoneNumber;

#Use Case 9 : To extend information of employee(add basic pay,deductions,taxable pay,income pay and net pay)
ALTER TABLE employee_payroll RENAME COLUMN salary TO Basic_pay;
ALTER TABLE employee_payroll ADD COLUMN Deductions float default 0 AFTER Basic_pay;
ALTER TABLE employee_payroll ADD COLUMN Taxable_pay float default 0 AFTER Deductions;
ALTER TABLE employee_payroll ADD COLUMN Income_Tax float default 0 AFTER Taxable_pay;
ALTER TABLE employee_payroll ADD COLUMN Net_pay float default 0 AFTER Income_Tax;
ALTER TABLE employee_payroll ADD COLUMN Net_pay float default 0 AFTER Net_pay;

insert into employee_payroll(name,Basic_pay,Department,start)values ('Mark',100000.00,'TBD','2018-03-03');

#Use Case 10 : To create one more row for Terisa with additional info.
insert into employee_payroll(name,gender,Department,Basic_pay,Deductions,Taxable_pay,Income_tax,Net_pay,start)values ('Terisa','F','Marketing',300000.00,100000.00,200000.00,50000.00,150000,'2018-01-03');
update employee_payroll set Address='Mumbai,India' where id=5;
update employee_payroll set PhoneNumber='0987654321' where id=5;
update employee_payroll set Department='sales' where id=2;

#Use Case 11 : NOrmalization and ER diagram
ALTER TABLE employee_payroll ADD COLUMN Department_id varchar(50) AFTER Department;
update employee_payroll set Department_id='D02' where id=2;
update employee_payroll set Department_id='D03' where id=5;
update employee_payroll set Department='sales' where id=4;
update employee_payroll set Department_id='D02' where id=4;
update employee_payroll set Department='IT' where id=1;
update employee_payroll set Department_id='D01' where id=1;
update employee_payroll set Department='Manager' where id=3;
update employee_payroll set Department_id='D04' where id=3;

update employee_payroll set gender='M' where id=4;
update employee_payroll set phoneNumber='6453231656' where id=4;
update employee_payroll set phoneNumber='9864235656' where id=3;
update employee_payroll set phoneNumber='7453238656' where id=2;
update employee_payroll set phoneNumber='7453238656' where id=5;
update employee_payroll set phoneNumber='8865443346' where id=1;

update employee_payroll set Deductions=20000 where id=1;
update employee_payroll set Taxable_pay=80000 where id=1;
update employee_payroll set Income_Tax=0 where id=1;
update employee_payroll set Net_pay=80000 where id=1;

update employee_payroll set Deductions=100000 where id=2;
update employee_payroll set Taxable_pay=200000 where id=2;
update employee_payroll set Income_Tax=50000 where id=2;
update employee_payroll set Net_pay=150000 where id=2;

update employee_payroll set Deductions=30000 where id=3;
update employee_payroll set Taxable_pay=270000 where id=3;
update employee_payroll set Income_Tax=10000 where id=3;
update employee_payroll set Net_pay=260000 where id=3;

update employee_payroll set Deductions=20000 where id=4;
update employee_payroll set Taxable_pay=80000 where id=4;
update employee_payroll set Income_Tax=0 where id=4;
update employee_payroll set Net_pay=80000 where id=4;

update employee_payroll set Address='Country India' where id=5;
update employee_payroll set start='2019-11-13' where id=5;


AlTER TABLE employee_payroll MODIFY COLUMN id INT NOT NULL auto_increment;
ALTER TABLE employee_payroll ADD COLUMN emp_id INT NOT NULL AFTER id;

update employee_payroll set emp_id=101 where id=1;
update employee_payroll set emp_id=102 where id=2;
update employee_payroll set emp_id=103 where id=3;
update employee_payroll set emp_id=104 where id=4;
update employee_payroll set emp_id=102 where id=5;














