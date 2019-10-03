select * from copa_officer;

-- Dense Rank SQL multiple options:


SELECT officer_id, salary
FROM (
      SELECT salary,
             officer_id,
          DENSE_RANK() OVER (ORDER BY SALARY DESC) AS DENSE_RANK
      FROM data_salary
      ) as d
WHERE d.dense_rank = 3;

-- run with and without distinct

select  distinct x.first_name, x.last_name, AD.salary  --, AD.id
from data_officer x,
(SELECT officer_id, salary, id
FROM (
      SELECT id, salary,
             officer_id,
          DENSE_RANK() OVER (ORDER BY SALARY DESC) AS DENSE_RANK
      FROM data_salary
      ) as d
WHERE d.dense_rank = 3) as AD
where x.id = AD.officer_id;

-- display dirty data - Mr John Escalante has two records
select distinct * from  data_officer o, data_salary s where  o.id = s.officer_id and o.first_name ='John' and last_name ='Escalante';

select distinct x.first_name, x.last_name, AD.salary, cast(AD.salary as money) from data_officer x,
(SELECT officer_id, salary
FROM (
      SELECT salary,
             officer_id,
          DENSE_RANK() OVER (ORDER BY SALARY DESC) AS DENSE_RANK
      FROM data_salary
      ) as d
WHERE d.dense_rank = 3) as AD
where x.id = AD.officer_id;


 --Average Salary by Rank  - order ASC/Desc

select rank, avg(salary) from data_salary group by rank order by avg(salary) asc;


select rank, avg(salary) from data_salary group by rank order by avg(salary) desc;


--Group By with Order By for number of allegation count

SELECT o.id, COUNT(a.id) as allegation_count
FROM data_officer o
LEFT JOIN data_officerallegation a on o.id = a.officer_id
GROUP BY o.id
ORDER BY allegation_count DESC;




-- TO_char

SELECT
    complaint_date,
    TO_CHAR(
        complaint_date,
        'HH12:MI:SS'
    ) complaint_time
FROM
    copa_officer
ORDER BY
    complaint_date;

----
SELECT
    complaint_date,
    TO_CHAR(
        complaint_date,
        'MON-DD-YYYY HH12:MI PM'
    ) complaint_time
FROM
    copa_officer
ORDER BY
    complaint_date;

--

SELECT
    complaint_date,
    TO_CHAR(
        complaint_date,
        'MON/DD/YYYY HH12:MI:SS PM'
    ) complaint_time
FROM
    copa_officer
ORDER BY
    complaint_date;

-----  The officer first name last name has a salary of X and was hired on date Y

select 'officer ' || x.first_name || ' '|| x.last_name || ' has a salary of '|| cast(s.salary as money) || ' and was hired on ' ||  TO_CHAR(
        s.org_hire_date,
        'MON DD YYYY')   from data_officer x, data_salary s
where s.officer_id = x.id


-------

select officer_id, count(allegation_id), officer_age from data_officerallegation group by officer_id, allegation_id, officer_age order by officer_age

----

select * from copa_officer;


-----
-- all officers w/ allegation records
SELECT first_name AS first, last_name AS last
FROM data_officer o
INNER JOIN data_officerallegation a
ON o.id = a.officer_id;

------Left Join

SELECT o.id, o.first_name, o.last_name, COUNT(a.id) as allegation_count
FROM data_officer o
LEFT JOIN data_officerallegation a on o.id = a.officer_id
GROUP BY o.id
ORDER BY allegation_count DESC;

--------- Right Join
-- officers allegation count with >=1 allegation
SELECT o.id, COUNT(a.id) as allegation_count
FROM data_officer o
RIGHT JOIN data_officerallegation a on o.id = a.officer_id
GROUP BY o.id
ORDER BY allegation_count DESC;

-----------

SELECT o.id as officer_id, tts.id as trr_status_id
FROM data_officer o
FULL OUTER JOIN trr_trrstatus tts on o.id = tts.officer_id;

------------

SELECT o1.first_name AS officer_1, o2.first_name AS officer_2, o1.last_name
FROM data_officer o1, data_officer o2
WHERE o1.id <> o2.id
AND o1.last_name = o2.last_name;

--------------

SELECT race
FROM data_officer
UNION
SELECT race
FROM data_complainant
UNION
SELECT race
FROM data_victim
--------

SELECT location, COUNT(id)
FROM data_allegation
GROUP BY location
--------


-- Dense Rank SQL multiple options:

SELECT officer_id, salary
FROM (
      SELECT salary,
             officer_id,
          DENSE_RANK() OVER (ORDER BY SALARY DESC) AS DENSE_RANK
      FROM data_salary
      ) as d
WHERE d.dense_rank = 3;

-- run with and without distinct

select  distinct x.first_name, x.last_name, AD.salary  --, AD.id
from data_officer x,
(SELECT officer_id, salary, id
FROM (
      SELECT id, salary,
             officer_id,
          DENSE_RANK() OVER (ORDER BY SALARY DESC) AS DENSE_RANK
      FROM data_salary
      ) as d
WHERE d.dense_rank = 3) as AD
where x.id = AD.officer_id;

-- display dirty data - Mr John Escalante has two records
select distinct * from  data_officer o, data_salary s where  o.id = s.officer_id and o.first_name ='John' and last_name ='Escalante';

select distinct * from  data_officer o, data_salary s where  o.id = s.officer_id and o.first_name ='John' and last_name ='Escalante';


select distinct x.first_name, x.last_name, AD.salary, cast(AD.salary as money) from data_officer x,
(SELECT officer_id, salary
FROM (
      SELECT salary,
             officer_id,
          DENSE_RANK() OVER (ORDER BY SALARY DESC) AS DENSE_RANK
      FROM data_salary
      ) as d
WHERE d.dense_rank = 3) as AD
where x.id = AD.officer_id;


 --Average Salary by Rank  - order ASC/Desc

select rank, avg(salary) from data_salary group by rank order by avg(salary) asc;


select rank, avg(salary) from data_salary group by rank order by avg(salary) desc;


--Group By with Order By for number of allegation count

SELECT o.id, COUNT(a.id) as allegation_count
FROM data_officer o
LEFT JOIN data_officerallegation a on o.id = a.officer_id
GROUP BY o.id
ORDER BY allegation_count DESC;




-- TO_char

SELECT
    complaint_date,
    TO_CHAR(
        complaint_date,
        'HH12:MI:SS'
    ) complaint_time
FROM
    copa_officer
ORDER BY
    complaint_date;

----
SELECT
    complaint_date,
    TO_CHAR(
        complaint_date,
        'MON-DD-YYYY HH12:MI PM'
    ) complaint_time
FROM
    copa_officer
ORDER BY
    complaint_date;

--

SELECT
    complaint_date,
    TO_CHAR(
        complaint_date,
        'MON/DD/YYYY HH12:MI:SS PM'
    ) complaint_time
FROM
    copa_officer
ORDER BY
    complaint_date;

-----  The officer first name last name has a salary of X and was hired on date Y

select 'officer ' || x.first_name || ' '|| x.last_name || ' has a salary of '|| cast(s.salary as money) || ' and was hired on ' ||  TO_CHAR(
        s.org_hire_date,
        'MON DD YYYY')   from data_officer x, data_salary s
where s.officer_id = x.id


-------

select officer_id, count(allegation_id), COALESCE(officer_age, 0) from data_officerallegation group by officer_id, allegation_id, officer_age order by officer_age

-------

--select age()

--

-- officers with allegations resulting in suspension
SELECT id
 FROM data_allegation
 WHERE id = ANY
 (
     SELECT allegation_id
     FROM data_officerallegation
     WHERE final_outcome LIKE '%Suspen%'
);
--
SELECT id
FROM data_allegation
WHERE id = ALL (
    SELECT allegation_id
    FROM data_officerallegation
    WHERE final_finding = 'NU'
);
