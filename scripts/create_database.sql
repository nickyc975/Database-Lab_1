create database COMPANY character set utf8  COLLATE utf8_general_ci;

use COMPANY;

set @@foreign_key_checks=OFF;

create table DEPARTMENT(
    DNAME varchar(50),
    DNO varchar(11),
    MGRSSN varchar(11),
    MGRSTARTDATE date,

    primary key(DNO)
);

create table EMPLOYEE(
    ENAME varchar(50),
    ESSN char(11),
    ADDRESS varchar(50),
    SALARY float,
    SUPERSSN char(11),
    DNO varchar(11),

    primary key(ESSN),
    foreign key(DNO) references DEPARTMENT(DNO)
);

create table PROJECT(
    PNAME varchar(50),
    PNO varchar(11),
    PLOCATION varchar(50),
    DNO varchar(11),

    primary key(PNO),
    foreign key(DNO) references DEPARTMENT(DNO)
);

create table WORKS_ON(
    ESSN varchar(11),
    PNO varchar(11),
    HOURS int,

    primary key(ESSN,PNO),
    foreign key(ESSN) references EMPLOYEE(ESSN),
    foreign key(PNO) references PROJECT(PNO)
);