/*
-- 
Creating the tables
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    birth_date DATE,
    hire_date DATE,
    job_title VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    salary INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE promotions (
    promotion_id INT PRIMARY KEY,
    employee_id INT,
    promotion_date DATE,
    old_title VARCHAR(50),
    new_title VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

--Inserting data
INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Sales'),
(4, 'Finance');

INSERT INTO employees (employee_id, first_name, last_name, gender, birth_date, hire_date, job_title, department_id) VALUES
(101, 'Alice', 'Smith', 'F', '1990-06-15', '2015-01-20', 'HR Coordinator', 1),
(102, 'Bob', 'Johnson', 'M', '1985-03-22', '2012-09-10', 'Software Engineer', 2),
(103, 'Carol', 'Lee', 'F', '1992-11-03', '2018-05-15', 'Sales Associate', 3),
(104, 'David', 'Ng', 'M', '1988-07-30', '2016-10-01', 'Accountant', 4),
(105, 'Emily', 'Zhao', 'F', '1995-02-17', '2020-07-07', 'Software Engineer', 2),
(106, 'Frank', 'Brown', 'M', '1991-12-12', '2017-04-12', 'HR Specialist', 1);

INSERT INTO salaries (salary_id, employee_id, salary, start_date, end_date) VALUES
(1, 101, 60000, '2020-01-01', NULL),
(2, 102, 90000, '2019-01-01', NULL),
(3, 103, 50000, '2021-01-01', NULL),
(4, 104, 70000, '2020-01-01', NULL),
(5, 105, 85000, '2021-07-07', NULL),
(6, 106, 62000, '2020-01-01', NULL);

INSERT INTO promotions (promotion_id, employee_id, promotion_date, old_title, new_title) VALUES
(1, 101, '2019-12-01', 'HR Assistant', 'HR Coordinator'),
(2, 102, '2017-06-15', 'Junior Developer', 'Software Engineer'),
(3, 104, '2019-05-01', 'Junior Accountant', 'Accountant'),
(4, 106, '2021-03-10', 'HR Assistant', 'HR Specialist');
*/
--Analysing the DATABASE
--Let's start with the Average salary per department
SELECT d.department_name, ROUND(AVG(s.salary), 2) AS average_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN salaries s ON e.employee_id = s.employee_id
GROUP BY 
    d.department_name
ORDER BY 
    average_salary DESC;
