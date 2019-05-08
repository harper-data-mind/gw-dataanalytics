CREATE TABLE Department (
    deptId varchar(10)   NOT NULL,
    deptName varchar(50)   NOT NULL,
    CONSTRAINT pk_Department PRIMARY KEY (
        deptId
     )
);

CREATE TABLE Department_Employee (
    empId int   NOT NULL,
    deptId varchar(50)   NOT NULL,
    deptStartDate date   NOT NULL,
    deptEndDate date  DEFAULT '9999-01-01' NOT NULL
);

CREATE TABLE Department_Manager (
    deptId varchar(50)   NOT NULL,
    empId int   NOT NULL,
    hireDate date   NOT NULL,
    leaveDate date  DEFAULT '9999-01-01' NOT NULL
);

CREATE TABLE Employee (
    empId  SERIAL  NOT NULL,
    birthDate date   NOT NULL,
    firstName varchar(20)   NOT NULL,
    lastName varchar(20)   NOT NULL,
    gender varchar(1)   NOT NULL,
    hireDate date   NOT NULL,
    CONSTRAINT pk_Employee PRIMARY KEY (
        empId
     )
);

CREATE TABLE Salary (
    empId int   NOT NULL,
    salary int   NOT NULL,
    salStartDate date   NOT NULL,
    salEndDate date  DEFAULT '9999-01-01' NOT NULL
);

CREATE TABLE Title (
    empId int   NOT NULL,
    title varchar(50)   NOT NULL,
    titleStartDate date   NOT NULL,
    titleEndDate date  DEFAULT '9999-01-01' NOT NULL
);

ALTER SEQUENCE Employee_empId_seq RESTART WITH 1000;

ALTER TABLE Department_Employee ADD CONSTRAINT fk_Department_Employee_empId FOREIGN KEY(empId)
REFERENCES Employee (empId);

ALTER TABLE Department_Employee ADD CONSTRAINT fk_Department_Employee_deptId FOREIGN KEY(deptId)
REFERENCES Department (deptId);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_deptId FOREIGN KEY(deptId)
REFERENCES Department (deptId);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_empId FOREIGN KEY(empId)
REFERENCES Employee (empId);

ALTER TABLE Salary ADD CONSTRAINT fk_Salary_empId FOREIGN KEY(empId)
REFERENCES Employee (empId);

ALTER TABLE Title ADD CONSTRAINT fk_Title_empId FOREIGN KEY(empId)
REFERENCES Employee (empId);

