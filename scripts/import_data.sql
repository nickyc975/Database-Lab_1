use COMPANY;

load data local infile "data/departments.csv" 
into table DEPARTMENT
fields terminated by ',' optionally enclosed by '"' escaped by '\\'
lines terminated by '\n';

load data local infile "data/employees.csv" 
into table EMPLOYEE
fields terminated by ',' optionally enclosed by '"' escaped by '\\'
lines terminated by '\n';

load data local infile "data/projects.csv" 
into table PROJECT
fields terminated by ',' optionally enclosed by '"' escaped by '\\'
lines terminated by '\n';

load data local infile "data/works_ons.csv" 
into table WORKS_ON
fields terminated by ',' optionally enclosed by '"' escaped by '\\'
lines terminated by '\n';