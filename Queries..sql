/*1. Basic Queries*/

--a. Retrieve all records from the Employees table

SELECT * FROM Employees;

--b. Retrieve all records from the Salaries table

SELECT * FROM Salaries;

--c. Retrieve employees from a specific department

SELECT * FROM Employees
WHERE DepartmentID = 3;

/*2. Aggregate Functions*/

--a. Calculate the average salary of all employees

SELECT AVG(SalaryAmount) AS AverageSalary
FROM Salaries;

--b. Calculate the total number of employees in each department

SELECT DepartmentID, COUNT(*) AS NumberOfEmployees
FROM Employees
GROUP BY DepartmentID;

/*3. Joins*/

--a. Retrieve the list of employees with their corresponding salaries

SELECT e.EmployeeID, e.FirstName, e.LastName, e.DepartmentID, s.SalaryAmount
FROM Employees e
JOIN Salaries s ON e.EmployeeID = s.EmployeeID;

--b. Retrieve employees who do not have a salary record

SELECT e.EmployeeID, e.FirstName, e.LastName
FROM Employees e
LEFT JOIN Salaries s ON e.EmployeeID = s.EmployeeID
WHERE s.EmployeeID IS NULL;


/*4.Advanced Queries*/

--a. Find the employee with the highest salary

SELECT e.EmployeeID, e.FirstName, e.LastName, e.DepartmentID, s.SalaryAmount
FROM Employees e
JOIN Salaries s ON e.EmployeeID = s.EmployeeID
WHERE s.SalaryAmount = (SELECT MAX(SalaryAmount) FROM Salaries);

--b. Calculate the average salary per department

SELECT e.DepartmentID, AVG(s.SalaryAmount) AS AverageSalary
FROM Employees e
JOIN Salaries s ON e.EmployeeID = s.EmployeeID
GROUP BY e.DepartmentID;


--c.Find departments where all employees earn above a certain salary threshold

SELECT EmployeeID, FirstName, LastName, DateOfBirth,
       DATEDIFF(YEAR, DateOfBirth, GETDATE()) AS CurrentAge,
       DATEDIFF(YEAR, DateOfBirth, GETDATE()) - 27 AS ExperienceFromAge27
FROM Employees
WHERE DATEDIFF(YEAR, DateOfBirth, GETDATE()) >= 27;

--d. Retrieve employees who have been with the company for more than 5 years
SELECT EmployeeID, FirstName, LastName, DateOfBirth,
       DATEDIFF(YEAR, DateOfBirth, GETDATE()) AS CurrentAge,
       DATEDIFF(YEAR, DateOfBirth, GETDATE()) - 27 AS ExperienceFromAge27
FROM Employees
WHERE DATEDIFF(YEAR, DateOfBirth, GETDATE()) >= 27
  AND DATEDIFF(YEAR, DateOfBirth, GETDATE()) - 27 > 5;

