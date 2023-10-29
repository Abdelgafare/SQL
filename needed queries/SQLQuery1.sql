--Create Table EmployeeDemographics 
--(EmployeeID int, 
--FirstName varchar(50), 
--LastName varchar(50), 
--Age int, 
--Gender varchar(50)
--)
--Create Table EmployeeSalary 
--(EmployeeID int, 
--JobTitle varchar(50), 
--Salary int
--)



--Insert into EmployeeDemographics VALUES
--(1001, 'Jim', 'Halpert', 30,'Male'),
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male')
--Insert Into EmployeeSalary VALUES
--(1001, 'Salesman', 45000),
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)
--Insert into EmployeeDemographics VALUES
--(1011, 'Ryan', 'Howard', 26, 'Male'),
--(NULL, 'Holly','Flax', NULL, 'Male'),
--(1013, 'Darryl', 'Philbin', NULL, 'Male')

--Insert into EmployeeSalary VALUES
--(1010, NULL, 47000),
--(NULL, 'Salesman', 43000)



--select FirstName,lastname
--from EmployeeDemographics
--select *
--from EmployeeDemographics
--select Top 5 *
--from EmployeeDemographics
--select Distinct(employeeid)
--from EmployeeDemographics
--select count(lastname) 
--from EmployeeDemographics
--select count(lastname) as lastname
--from EmployeeDemographics
--select max(salary)
--from employeesalary
--select min(salary)
--from employeesalary

--################# from statement and there stmpols as also % which used in selecting for examples the names thich end with s

--select *
--from EmployeeDemographics
--where firstname ='jim'         
--select *
--from EmployeeDemographics
--where firstname <>'jim'  
--select *
--from EmployeeDemographics
--where age <30 
--select *
--from EmployeeDemographics
--where age >=32 
--select *
--from EmployeeDemographics
--where age >=32 and gender='male'
--select *
--from EmployeeDemographics
--where age >=32 or gender='male'


--select *
--from EmployeeDemographics
--where LASTname LIKE'S%' 
--select *
--from EmployeeDemographics
--where LASTname LIKE'%S%'
--select *
--from EmployeeDemographics
--where LASTname LIKE'S%o%' 
--select* 
--from EmployeeDemographics
--where firstname is null
--select* 
--from EmployeeDemographics
--where firstname is not null
--select* 
--from EmployeeDemographics
--where firstname in('toby','jim')




--####### group by order by 
--select distinct(gender)
--from EmployeeDemographics
--select gender
--from EmployeeDemographics
--group by gender
--select gender,count(gender)
--from EmployeeDemographics
--group by gender
--select age,count(age)
--from EmployeeDemographics
--group by age
--select distinct age
--from EmployeeDemographics
--select gender,count(gender) as countgender
--from EmployeeDemographics
--where age>31
--group by gender
--order by countgender asc 
--####asc or desc-forarrengement
--select * 
--from EmployeeDemographics
--order by 4 desc
--#### the number here represent the column number 




--######
--select *
--from EmployeeDemographics
--select *
--from employeesalary
--select *
--from EmployeeDemographics
--inner join employeesalary
-- on  employeesalary.employeeid = EmployeeDemographics.employeeid

--select *
--from EmployeeDemographics
--full outer join employeesalary
-- on  employeesalary.employeeid = EmployeeDemographics.employeeid
--select employeesalary.employeeid,firstname,lastname,jobtitle,salary
--from EmployeeDemographics
--inner join employeesalary
-- on  employeesalary.employeeid = EmployeeDemographics.employeeid
--### we need to calculate the average salary for the sales man
--select jobtitle,avg(salary) as avgsalary
--from EmployeeDemographics
--inner join employeesalary
--on employeesalary.employeeid = EmployeeDemographics.employeeid
--where jobtitle='salesman'
--group by jobtitle









--Create Table WareHouseEmployeeDemographics 
--(EmployeeID int, 
--FirstName varchar(50), 
--LastName varchar(50), 
--Age int, 
--Gender varchar(50)
--)


--Insert into WareHouseEmployeeDemographics VALUES
--(1013, 'Darryl', 'Philbin', NULL, 'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31, 'Female')
--select*
--from EmployeeDemographics
--union all 
--select*
--from WareHouseEmployeeDemographics
--### using all to show all the duplicates since that the union function only with two tabels that have the same columns




--###################### case statement 
--select firstname,lastname, age,
--CASE
--when age>30 then 'old'
--when age between 27 and 30 then 'mature'
--else 'young'
--end
--from EmployeeDemographics
--where age is not null 
--order by age
--select firstname,lastname,jobtitle,salary,
--case
--when jobtitle = 'salesman'then salary+(salary*0.1)
--when jobtitle = 'hr'then salary+(salary*0.05)
--when jobtitle = 'accountant'then salary+(salary*0.00001)
--else salary+(salary*0.0003)
--end
--from EmployeeDemographics
-- join employeesalary
--on employeesalary.employeeid = EmployeeDemographics.employeeid
--order by salary desc







--##### having clause
--select jobtitle,count(jobtitle)
--from EmployeeDemographics
--join employeesalary
--on employeesalary.employeeid = EmployeeDemographics.employeeid
--group by jobtitle
--having count(jobtitle)>1

--select JobTitle,avg(salary)
--from EmployeeDemographics
--join employeesalary
--on employeesalary.employeeid = EmployeeDemographics.employeeid
--group by JobTitle
--having avg(salary)>50000










--###############Updating/Deleting Data
--update EmployeeDemographics
--set age=31 ,gender='female'
--where firstname='holly'and lastname='flax'
--select*
--from  EmployeeDemographics
--delete from EmployeeDemographics
--where EmployeeID=1005







--############# Aliasing or changing the column names 
--select firstname as Fname
--from EmployeeDemographics


--select firstname+' '+ lastname as fullname
--from EmployeeDemographics




--##### Partition By 
--select gender, firstname ,lastname,salary,count(gender) over(partition by gender)
--from EmployeeDemographics
--join employeesalary
--on employeesalary.employeeid = EmployeeDemographics.employeeid











--### Temp Tables
--create table #temp_table (
--employeeid int,
--JobTitle varchar(100),
--salary int)
--select* 
--from #temp_table
--insert into #temp_table values 
--('1001','HR',45000)
--insert into #temp_table
--select *
--from EmployeeSalary
--### we use 
--drop table if exists #temp_table 
--to delete any perviouys tables with this name to run it once and not getting an error 


--######  String Functions + Use Cases
--Drop Table EmployeeErrors;


--CREATE TABLE EmployeeErrors (
--EmployeeID varchar(50)
--,FirstName varchar(50)
--,LastName varchar(50)
--)

--Insert into EmployeeErrors Values 
--('1001  ', 'Jimbo', 'Halbert')
--,('  1002', 'Pamela', 'Beasely')
--,('1005', 'TOby', 'Flenderson - Fired')

--Select *
--From EmployeeErrors

-- Using Trim, LTRIM, RTRIM trim to get rid of blanck spaces


--Select EmployeeID, TRIM(employeeID) AS IDTRIM
--FROM EmployeeErrors 

--Select EmployeeID, RTRIM(employeeID) as IDRTRIM
--FROM EmployeeErrors 

--Select EmployeeID, LTRIM(employeeID) as IDLTRIM
--FROM EmployeeErrors 

	



-- Using Replace

--Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
--FROM EmployeeErrors


-- Using Substring
--select SUBSTRING (firstname,1,3)
--from EmployeeErrors
--Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
--FROM EmployeeErrors err
--JOIN EmployeeDemographics dem
--	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
--	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)



-- Using UPPER and lower

--Select firstname, LOWER(firstname)
--from EmployeeErrors

--Select Firstname, UPPER(FirstName)
--from EmployeeErrors
      




--####  Stored Procedures + Use Cases




--CREATE PROCEDURE Temp_Employee
--AS
--DROP TABLE IF EXISTS #temp_employee
--Create table #temp_employee (
--JobTitle varchar(100),
--EmployeesPerJob int ,
--AvgAge int,
--AvgSalary int
--)


--Insert into #temp_employee
--SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
--FROM EmployeeDemographics emp
--JOIN EmployeeSalary sal
--	ON emp.EmployeeID = sal.EmployeeID
--group by JobTitle

--Select * 
--From #temp_employee
--GO;




--CREATE PROCEDURE Temp_Employee2 
--@JobTitle varchar(100)
--AS
--DROP TABLE IF EXISTS #temp_employee3
--Create table #temp_employee3 (
--JobTitle varchar(100),
--EmployeesPerJob int ,
--AvgAge int,
--AvgSalary int
--)


--Insert into #temp_employee3
--SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
--FROM EmployeeDemographics emp
--JOIN EmployeeSalary sal
--	ON emp.EmployeeID = sal.EmployeeID
--where JobTitle = @JobTitle --- make sure to change this in this script from original above
--group by JobTitle

--Select * 
--From #temp_employee3
--GO;


--exec Temp_Employee2 @jobtitle = 'Salesman'
--exec Temp_Employee2 @jobtitle = 'Accountant'


--### Subqueries
select *
from EmployeeSalary
select employeeid,salary,(select avg(salary) from EmployeeSalary)

from EmployeeSalary

GROUP BY employeeid,salary


