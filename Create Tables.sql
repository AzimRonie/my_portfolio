--create table for Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10,2)
);
