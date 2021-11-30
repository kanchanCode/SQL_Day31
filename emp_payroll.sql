use payroll_service;
Create Table emp_payroll(emp_id INT NOT NULL,Basic_pay float default 0,Deductions float default 0, Taxable_pay float default 0,Income_Tax float default 0,Net_pay float default 0,primary key(emp_id));

select * from emp_payroll;
drop table emp_payroll;
insert into emp_payroll values(101,100000,20000,80000,0,80000);
insert into emp_payroll values(102,200000,100000,200000,50000,150000);
insert into emp_payroll values(103,300000,30000,270000,10000,260000);
insert into emp_payroll values(104,300000,100000,200000,50000,150000);

