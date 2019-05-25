use COMPANY;

select ENAME # , PNAME
from EMPLOYEE, WORKS_ON, PROJECT
where EMPLOYEE.ESSN = WORKS_ON.ESSN and WORKS_ON.PNO = PROJECT.PNO and PROJECT.PNAME = "SQL项目";

select ENAME, ADDRESS # , SALARY, DNAME
from EMPLOYEE, DEPARTMENT
where EMPLOYEE.DNO = DEPARTMENT.DNO and EMPLOYEE.SALARY < 3000 and DEPARTMENT.DNAME = "研发部";

select ENAME
from EMPLOYEE
where EMPLOYEE.ESSN not in (
    select ESSN
    from WORKS_ON
    where WORKS_ON.PNO = "P1"
);

select ENAME, DNAME
from EMPLOYEE, DEPARTMENT
where EMPLOYEE.SUPERSSN in (
    select ESSN
    from EMPLOYEE
    where EMPLOYEE.ENAME = "张红"
) and EMPLOYEE.DNO = DEPARTMENT.DNO;

select W1.ESSN
from WORKS_ON W1, WORKS_ON W2
where W1.PNO = "P1" and W2.PNO = "P2" and W1.ESSN = W2.ESSN;


select ENAME, EMPLOYEE.ESSN
from EMPLOYEE, (
    select ESSN
    from WORKS_ON
    group by ESSN having count(*) = (
        select count(*)
        from PROJECT
    )
) W
where EMPLOYEE.ESSN = W.ESSN;

select DNAME # , AVG_SALARY
from DEPARTMENT, (
    select DNO # , avg(SALARY) as AVG_SALARY
    from EMPLOYEE
    group by DNO having avg(SALARY) < 3000
) E
where DEPARTMENT.DNO = E.DNO;

select ENAME # , PCNT, HSUM
from EMPLOYEE, (
    select ESSN # , count(*) as PCNT, sum(HOURS) as HSUM
    from WORKS_ON
    group by ESSN having count(*) >= 3 and sum(HOURS) <= 8
) W
where EMPLOYEE.ESSN = W.ESSN;

select DNAME, avg(SALARY / HOURS) as HOUR_SALARY
from (
    select ESSN, sum(HOURS) as HOURS
    from WORKS_ON
    group by ESSN
) ESSN_HOURS, EMPLOYEE, DEPARTMENT
where EMPLOYEE.ESSN = ESSN_HOURS.ESSN and EMPLOYEE.DNO = DEPARTMENT.DNO
group by EMPLOYEE.DNO;
