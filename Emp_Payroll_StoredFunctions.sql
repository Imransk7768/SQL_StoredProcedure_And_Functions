
create database FcnPayroll_Services
use FcnPayroll_Services

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

--alter table emp_payroll Add PhoneNumber varchar(15);

--alter table emp_payroll Add Adress varchar(150) not null default 'Address', 
--Department varchar(60) not null default 'Dept';

--UPDATE emp_payroll SET Department='EEE' where Id=1;

--alter table emp_payroll Add Deductions int not null default 0,Taxable_Pay int not null default 0,
--Income_Tax int not null default 0,Net_Pay int not null default 0 ;

select * from emp_payroll
----------------------------------------------------------------------------------------------------

SELECT MAX(Salary) FROM emp_payroll

SELECT MIN(Salary) FROM emp_payroll WHERE GENDER='M'

SELECT COUNT(*) FROM emp_payroll WHERE GENDER='M'

SELECT COUNT(*) FROM emp_payroll WHERE GENDER='F'

SELECT SUM(Salary) FROM emp_payroll WHERE GENDER='F'

SELECT AVG(Salary) FROM emp_payroll WHERE GENDER='M'

-------------------------CASE FUNCTION---------------------------

SELECT * ,Income_Tax=
CASE 
	WHEN SALARY > 30000 THEN 1500
	WHEN SALARY < 20000 THEN 500
	ELSE 1000
END
FROM emp_payroll
GO	


SELECT * ,Deductions=
CASE 
	WHEN SALARY > 30000 THEN 1000
	WHEN SALARY < 20000 THEN 500
	ELSE 500
END
FROM emp_payroll
GO

-----------------------------------------------------------------
--SCALAR VALUED FUNCTIONS----------------------------------------

CREATE or ALTER FUNCTION FcnEmp_Payroll(@Column int, @Rate int)
RETURNS int
AS 
BEGIN
RETURN (@Column*@rate)/100
END

SELECT *, dbo.FcnEmp_Payroll(Salary,5) AS Taxable_Pay FROM emp_payroll

-----------------------------------------------------------------
--TABULAR VALUED FUNCTIONS---------------------------------------

GO
CREATE FUNCTION FcnService_Payroll(@gender as varchar(1))
RETURNS TABLE
AS 
RETURN (SELECT * FROM emp_payroll WHERE Gender=@gender)

SELECT * FROM dbo.FcnService_Payroll('M')

