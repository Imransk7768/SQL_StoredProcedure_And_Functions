
create database sppayroll_services
use sppayroll_services

create table emp_payroll
(Id int Primary key Identity(1,1),
Name varchar(150),
Age int,
Salary int,
StartDate date);

insert emp_payroll (Name,Age,Salary,StartDate) values 
('Rehan',24,28000,'04-07-2022'),
('Ramesh',30,28000,'08-12-2021'),
('Akhil',22,28000,'12-15-2019'),
('Gaurav',26,28000,'11-09-2021'),
('saheed',44,28000,'07-23-2021'),
('Surfraz',44,28000,'07-23-2021');

 --drop table emp_payroll

 --delete from emp_payroll where Name='Terissa';

Alter table emp_payroll Add Gender varchar(1)

UPDATE emp_payroll SET Gender='M' where Id =1
UPDATE emp_payroll SET Gender='M' where Id =6
UPDATE emp_payroll SET Gender='M' where Id in (2,3,4,5)

UPDATE emp_payroll SET Salary=30000 where Id=2
UPDATE emp_payroll SET Salary=22000 where Id=3
UPDATE emp_payroll SET Salary=18000 where Id=5
UPDATE emp_payroll SET Salary=34000 where Id=4


UPDATE emp_payroll SET Gender='F' where Id = 5;
UPDATE emp_payroll SET Name='Sirisha' where Id = 5;

UPDATE emp_payroll SET Name='Akhila',Gender='F' where Id = 3;

alter table emp_payroll Add PhoneNumber varchar(15);

alter table emp_payroll Add Adress varchar(150) not null default 'Address', 
Department varchar(60) not null default 'Dept';

UPDATE emp_payroll SET Department='EEE' where Id=1;

alter table emp_payroll Add Deductions int not null default 0,Taxable_Pay int not null default 0,
Income_Tax int not null default 0,Net_Pay int not null default 0 ;

select * from emp_payroll
-----------------------------------------------------------------------------------------------------------------------


create Procedure spEmp_Payroll
AS
  BEGIN
	select * from emp_payroll
  END


create Procedure spEmp_Payroll_Service
(
@Name varchar(60),
@Age int,
@Salary int,
@StartDate Date,
@Gender varchar(1),
@PhoneNumber varchar(20),
@Department varchar(60),
@Deductions int,
@Taxable_Pay int,
@Income_Tax int,
@Net_Pay int
)
AS
Insert into emp_payroll
(Name,Age,Salary,StartDate,Gender,PhoneNumber,Department,Deductions,Taxable_Pay,Income_Tax,Net_Pay)
values(@Name,@Age,@Salary,@StartDate,@Gender,@PhoneNumber,@Department,@Deductions,@Taxable_Pay,@Income_Tax,@Net_Pay)


EXEC spEmp_Payroll_Service
'Terissa',36,30000,'03-01-2018','F','9900998877','Marketing',11000,500,500,4000


select * from emp_payroll

