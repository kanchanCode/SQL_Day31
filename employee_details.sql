use payroll_service;
CREATE TABLE employee_details(emp_id INT NOT NULL,name VARCHAR(20) NOT NULL, gender char(1),PhoneNumber varchar(20),Address varchar(150),start date NOT NULL,primary key(emp_id));

select * from employee_details;

INSERT INTO employee_details(emp_id,name,gender,phoneNumber,Address,start) values(101,'Bill','M',8865443346,'Country India','2018-01-03');
INSERT INTO employee_details(emp_id,name,gender,phoneNumber,Address,start) values(102,'Terisa','F',7453238656,'Country India','2019-11-13');
INSERT INTO employee_details(emp_id,name,gender,phoneNumber,Address,start) values(103,'Charlie','M',9864235656,'Country India','2020-05-21');
INSERT INTO employee_details(emp_id,name,gender,phoneNumber,Address,start) values(104,'Mark','M',6453231656,'Country India','2018-03-03');


select * from employee_details where start between cast('2019-01-01' as date) and date(now()); 

SELECT employee_details.gender,sum(employee_payroll.Basic_pay) from employee_payroll,employee_details group by employee_details.gender;
SELECT employee_details.gender,avg(employee_payroll.Basic_pay) from employee_payroll,employee_details group by employee_details.gender;
SELECT employee_details.gender,count(distinct employee_payroll.Basic_pay) from employee_payroll,employee_details group by employee_details.gender;
