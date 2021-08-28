/* Creating table schema */

--Create table Department

DROP TABLE Department;

CREATE TABLE "Department" (
    "dept_no" varchar(5)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    "last_updated" timestamp without time zone DEFAULT now() NOT NULL ,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_no"
     )
);

-- Create table Titles

DROP TABLE Titles;

CREATE TABLE "Titles" (
    "title_id" varchar(10)   NOT NULL,
    "title" varchar(50)   NOT NULL,
    "last_updated" timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);


-- Create table Employees

DROP TABLE Employees;

CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "emp_title" varchar(10)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(100)   NOT NULL,
    "last_name" varchar(100)   NOT NULL,
    "sex" varchar(5)   NOT NULL,
    "hire_date" date   NOT NULL,
    "last_updated" timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

-- Create table Dept_Manager

DROP TABLE Dept_Manager;

CREATE TABLE "Dept_Manager" (
    "id" serial   NOT NULL,
    "dept_no" varchar(5)   NOT NULL,
    "emp_no" int   NOT NULL,
    "last_updated" timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "id"
     )
);

-- Create table Dept_Emp

DROP TABLE Dept_Emp;

CREATE TABLE "Dept_Emp" (
    "id" serial   NOT NULL,
    "emp_no" int   NOT NULL,
    "dept_no" varchar(5)   NOT NULL,
    "last_updated" timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
        "id"
     )
);


-- Create table Salaries

DROP TABLE Salaries;

CREATE TABLE "Salaries" (
    "id" serial   NOT NULL,
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "last_updated" timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");
