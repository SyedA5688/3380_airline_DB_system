-- Written by Syed to speed up deleting the entire ER model so that Nathan's create_table_script can be run again

DROP TABLE employee CASCADE;
DROP TABLE employee_address CASCADE;
DROP TABLE department CASCADE;
DROP TABLE job CASCADE;
DROP TABLE job_location CASCADE;
DROP TABLE benefits CASCADE;
DROP TABLE payroll CASCADE;
DROP TABLE leave CASCADE;
DROP TABLE salary CASCADE;
