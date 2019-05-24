use COMPANY;

load data local infile "data/employees.txt" into table EMPLOYEE;
load data local infile "data/departments.txt" into table DEPARTMENT;
load data local infile "data/projects.txt" into table PROJECT;
load data local infile "data/works_ons.txt" into table WORKS_ON;