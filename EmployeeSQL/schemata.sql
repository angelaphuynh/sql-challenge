-- Data Engineering --
-- Drop Tables if Existing

DROP TABLE IF EXISTS Dept_Emp,
                     Dept_Manager,
                     Titles,
                     Salaries, 
                     Employees, 
                     Departments;
-- Exported from QuickDBD: Specifying Data Types, Primary Keys & Foreign Keys 
-- Import CSV Files Into Corresponding SQL Table					

CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(40)   NOT NULL,
    "last_name" varchar(40)   NOT NULL,
    "gender" varchar(2)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Departments" (
    "dept_no" char(4)   NOT NULL,
    "dept_name" varchar(40)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_Manager" (
    "dept_no" char(4)   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "Dept_Emp" (
    "emp_no" int   NOT NULL,
    "dept_no" char(4)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" money   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "Titles" (
    "emp_no" int   NOT NULL,
    "title" varchar(40)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

-- Query * FROM Each Table Confirming Data
SELECT * FROM "Departments";
SELECT * FROM "Dept_emp";
SELECT * FROM "Dept_manager";
SELECT * FROM "Employees";
SELECT * FROM "Salaries";
SELECT * FROM "Titles";
