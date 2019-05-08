SELECT e.empId
	, e.lastName
	, e.firstName
	, e.gender
	, s.salary 
FROM employee e
JOIN salary s on s.empId = e.empId
ORDER BY salary DESC;

SELECT *
FROM employee
WHERE hireDate BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hireDate;

SELECT d.deptId
	, d.deptName
	, dm.empId
	, e.lastName
	, e.firstName
	, dm.hiredate
	, dm.leavedate
FROM department_manager dm
JOIN department d on d.deptId = dm.deptId
JOIN employee e on e.empId = dm.empId
ORDER BY deptId;

SELECT e.empId
	, e.lastName
	, e.firstName
	, d.deptName
FROM employee e
JOIN department_employee de ON de.empId = e.empId
JOIN department d ON d.deptId = de.deptId
ORDER by d.deptId;

SELECT *
FROM employee
WHERE firstName = 'Hercules'
AND lastName LIKE 'B%'
ORDER BY hireDate;

SELECT de.empId
	, e.lastName
	, e.firstName
	, d.deptName
FROM department_employee de
JOIN employee e ON e.empId = de.empId
JOIN department d ON d.deptId = de.deptId
WHERE d.deptName = 'Sales'
ORDER BY de.empid;

SELECT de.empId
	, e.lastName
	, e.firstName
	, d.deptName
FROM department_employee de
JOIN employee e ON e.empId = de.empId
JOIN department d ON d.deptId = de.deptId
WHERE d.deptName IN ('Sales', 'Development')
ORDER BY d.deptName;

SELECT lastName
	, COUNT(lastName)
FROM employee
GROUP BY lastName
ORDER BY COUNT(lastName) DESC;
