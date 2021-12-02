BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('23762 SNAIL POINT DRIVE','RICHMOND','UNITED STATES','71626','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,m_initial,ssn,phone,email)
VALUES ('KEVIN','CHAN','2003-08-14','M','5','Y','827362563','+18324444444','kevin.y.chan@gmail.com')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000003','15.25','2000')
RETURNING employee_id;
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('38263 OTHER SNAIL DRIVE','HOUSTON','UNITED STATES','18263','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,m_initial,ssn,phone,email,job_id,manager_id)
VALUES ('KEVIN','CHAN','2001-07-15','M','6','Y','183625143','+18325555555','kevin.y.chan@gmail','4','1000001')
RETURNING employee_id;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('38263 OTHER SNAIL DRIVE','HOUSTON','UNITED STATES','18263','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,m_initial,ssn,phone,email,job_id,manager_id)
VALUES ('KEVIN','CHAN','2001-07-15','M','7','Y','183625143','+18325555555','kevin.y.chan@gmail.com','4','1000001')
RETURNING employee_id;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('38263 OTHER SNAIL DRIVE','HOUSTON','UNITED STATES','18263','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,job_id,manager_id)
VALUES ('BART','SIMPSON','11988-05-08','M','8','183632723','+18326561827','bart.simpson@gmail.com','4','1000001')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000006','16.70','3000')
RETURNING employee_id;
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('54443 ROCK LANE BOULEVARD','SUGAR LAND','UNITED STATES OF AMERICA','28263','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id)
VALUES ('JASON','MORGAN','2000-10-12','M','9')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage)
VALUES ('1000007','12.01')
RETURNING employee_id;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('54443 ROCK LANE BOULEVARD','SUGAR LAND','UNITED STATES OF AMERICA','28263','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn)
VALUES ('JASON','MORGAN','2000-10-12','M','10','382642752')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage)
VALUES ('1000008','12.01')
RETURNING employee_id;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('54443 ROCK LANE BOULEVARD','SUGAR LAND','UNITED STATES OF AMERICA','28263','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn)
VALUES ('JASON','MORGAN','2000-10-12','M','11','382642752')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000009','12.01','1500')
RETURNING employee_id;
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('10 LONG POINT LN','WASHINGTON DC','UNITED STATES','92812','VIRGINIA')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,manager_id)
VALUES ('MARIA','PEREZ','2003-01-01','M','12','183625374','+12810472644','maria.perez@hotmail.com','23424333')
RETURNING employee_id;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('10 LONG POINT LN','WASHINGTON DC','UNITED STATES','92812','VIRGINIA')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,manager_id)
VALUES ('MARIA','PEREZ','2003-01-01','M','13','183625374','+12810472644','maria.perez@hotmail.com','1000000')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000011','18.00','4000');
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,state)
VALUES ('222 DRIVE','SUGAR LAND','UNTIED STATES','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,phone)
VALUES ('WALT','DISNEY','2021-11-10','M','14','+12')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage)
VALUES ('1000012','9');
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,state)
VALUES ('222 DRIVE','SUGAR LAND','UNTIED STATES','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,phone)
VALUES ('WALT','DISNEY','2021-11-10','M','15','+12')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage)
VALUES ('1000013','9');
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country)
VALUES ('34 DRIVE','HOUSTON','UNITED STATES')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,manager_id)
VALUES ('ALI','RIZVI','2021-11-11','M','16','3')
RETURNING employee_id;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country)
VALUES ('34 DRIVE','HOUSTON','UNITED STATES')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,manager_id)
VALUES ('ALI','RIZVI','2021-11-11','M','17','3')
RETURNING employee_id;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country)
VALUES ('34 DRIVE','HOUSTON','UNITED STATES')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,manager_id)
VALUES ('ALI','RIZVI','2021-11-11','M','18','1000000')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage)
VALUES ('1000016','4');
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country)
VALUES ('34 DRIVE','HOUSTON','UNITED STATES')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,manager_id)
VALUES ('ALI','RIZVI','2021-11-11','M','19','1000000')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage)
VALUES ('1000017','4');
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country)
VALUES ('34 DRIVE','HOUSTON','UNITED STATES')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,manager_id)
VALUES ('ALI','RIZVI','2021-11-11','M','20','1000003')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage)
VALUES ('1000018','4');
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country)
VALUES ('34 DRIVE','HOUSTON','UNITED STATES')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,manager_id)
VALUES ('ALI','RIZVI','2021-11-11','M','21','234223434','1000003')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage)
VALUES ('1000019','4');
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country)
VALUES ('34 DRIVE','HOUSTON','UNITED STATES')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,manager_id)
VALUES ('ALI','RIZVI','2021-11-11','M','22','234223434','+13242342344','1000003')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage)
VALUES ('1000020','4');
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country)
VALUES ('34 DRIVE','HOUSTON','UNITED STATES')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,manager_id)
VALUES ('ALI','RIZVI','2021-11-11','M','23','234223434','+13242342344','live@gmail.com','1000003')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage)
VALUES ('1000021','4');
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('34 DRIVE','HOUSTON','UNITED STATES','28362','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,manager_id)
VALUES ('ALI','RIZVI','2021-11-11','M','24','234223434','+13242342344','live@gmail.com','1000003')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage)
VALUES ('1000022','4');
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('34 DRIVE','HOUSTON','UNITED STATES','28362','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,job_id,manager_id)
VALUES ('ALI','RIZVI','2021-11-11','M','25','234223434','+13242342344','live@gmail.com','3','1000003')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage)
VALUES ('1000023','4');
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('34 DRIVE','HOUSTON','UNITED STATES','28362','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,job_id,manager_id)
VALUES ('ALI','RIZVI','2021-09-07','M','26','234223434','+13242342344','live@gmail.com','3','1000002')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage)
VALUES ('1000024','4');
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('34 DRIVE','HOUSTON','UNITED STATES','28362','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,job_id,manager_id)
VALUES ('ALI','RIZVI','2021-09-07','M','27','234223434','+13242342344','live@gmail.com','3','1000002')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000025','4','2000');
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('12453 BIG STREET LN','HOUSTON','UNITED STATES','28363','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,manager_id)
VALUES ('SYED','RIZVI','2021-08-17','M','28','1000000')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000026','16.00','2000');
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('128471 KURMANBEK STREET LN','SUGAR LAND','UNITED STATES','28927','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,manager_id)
VALUES ('NATHAN','VALTIERRA','2019-05-29','M','29','18272651','1000000')
RETURNING employee_id;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('128471 KURMANBEK STREET LN','SUGAR LAND','UNITED STATES','28927','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,manager_id)
VALUES ('NATHAN','VALTIERRA','2019-05-29','M','30','182726512','1000000')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000028','19.00','20000');
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('11223 NATHAN LN','HOUSTON','UNITED STATES','82751','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,manager_id)
VALUES ('KURMANBEK','BAZAROV','2021-11-05','M','31','1000000')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000029','18.00','1000');
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,state)
VALUES ('11 BEST STREET LN','HOUSTON','UNITED STATES','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,manager_id)
VALUES ('ANOTHER','GUY','1999-01-01','M','32','1000000')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000030','1.00','2000');
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country)
VALUES ('12 GREAT STREET','HOUSTON','UNITED STATES')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,manager_id)
VALUES ('THIRD','GUY','1988-01-01','M','33','1000001')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000031','10.00','2000');
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('11872 ROCK BRAZOS TRAIL','SUGAR LAND','UNITED STATES','72626','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,manager_id)
VALUES ('FOURTH','GUY','1987-01-02','M','34','1000000')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000032','10.00','2000');
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('12398 FIFTH STREET','NEW YORK','UNITED STATES','91918','NEW YORK')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,job_id,manager_id)
VALUES ('FIFTH','GUY','2010-09-17','M','35','3','1000002')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000033','1000','1828');
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('SEVENTH STREET','SUGAR LAND','UNITED STATES','19282','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,job_id,manager_id)
VALUES ('SIX','GUY','1111-01-01','M','36','191872823','+12828272622','sixth.guy@gmail.com','4','1000000')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000034','19.00','1992');
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('12522 SEVENTH STREET','HOUSTON','UNITED STATES','29282','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,job_id,manager_id)
VALUES ('SYED','RIZVI','2001-01-21','M','5','183617272','+183231813883','syed.rizvi@email.com','4','1000001')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000003','15.00','2500');
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT employee_id
FROM employee
WHERE employee_id = '1000003';
UPDATE employee
SET
	m_initial = 'A'
WHERE employee_id = '1000003';
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT employee_id
FROM employee
WHERE employee_id = '1000003';
UPDATE employee
SET
	manager_id = '1000000'
WHERE employee_id = '1000003';
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT employee_id
FROM employee
WHERE employee_id = '1000003';
UPDATE employee
SET
	last_name = 'RIZVII'
WHERE employee_id = '1000003';
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT employee_id
FROM employee
WHERE employee_id = '1000003';
UPDATE employee
SET
	last_name = 'RIZVI',
	manager_id = '1000002'
WHERE employee_id = '1000003';
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT employee_id
FROM employee
WHERE employee_id = '1000003';
UPDATE employee
SET
	manager_id = '1000000'
WHERE employee_id = '1000003';
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT employee_id
FROM employee
WHERE employee_id = '1000003';
UPDATE employee
SET
	manager_id = '1'
WHERE employee_id = '1000003';
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job (job_title,department_id,location_id,benefits_package_id,weekly_hours)
VALUES ('COPILOT','1','0','0','40')
RETURNING job_id;
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job (job_title,department_id,location_id,benefits_package_id,weekly_hours)
VALUES ('DIRECTOR OF TICKET SALES','4','0','0','45')
RETURNING job_id;
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT job_id
FROM job
WHERE job_id = '3';
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT job_id
FROM job
WHERE job_id = '2';
UPDATE job
SET
	job_title = 'SENIOR DIRECTOR OF TICKET SALES'
WHERE job_id = '2'
RETURNING job_id;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT job_id
FROM job
WHERE job_id = '1';
UPDATE job
SET
	job_title = 'SENIOR DIRECTOR OF TICKET SALES',
	department_id = '4'
WHERE job_id = '1'
RETURNING job_id;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT job_id
FROM job
WHERE job_id = '1';
UPDATE job
SET
	department_id = '4'
WHERE job_id = '1'
RETURNING job_id;
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT job_id
FROM job
WHERE job_id = '3';
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT job_id
FROM job
WHERE job_id = '2';
UPDATE job
SET
	job_title = 'DR DIRECTOR OF TICKET SALES'
WHERE job_id = '2'
RETURNING job_id;
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('12345 BIG STREET LN','SUGAR LAND','UNITED STATES','29228','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,m_initial,ssn,phone,email,job_id)
VALUES ('SYED','RIZVI','2000-08-16','M','1','A','183665262','+18324232424','syed.a.rizvi@hotmail.com','2')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000000','15.99','2500');
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('18272 SEVENTH STREET','HOUSTON','UNITED STATES','29283','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,m_initial,ssn,phone,email,job_id,manager_id)
VALUES ('PRASHANTH','PATEL','2001-01-01','M','2','P','193837723','+11928839392','prashanth.p.p@gmail.com','4','1000000')
RETURNING employee_id;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('18272 SEVENTH STREET','HOUSTON','UNITED STATES','29283','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,m_initial,ssn,phone,email,job_id,manager_id)
VALUES ('PRASHANTH','PATEL','2001-01-01','M','3','P','193837723','+11928839392','prashanth.p.p@gmail.com','4','1000000')
RETURNING employee_id;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('18272 SEVENTH STREET','HOUSTON','UNITED STATES','29283','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,m_initial,ssn,phone,email,job_id)
VALUES ('PRASHANTH','PATEL','2001-01-01','M','4','P','193837723','+11928839392','prashanth.p.p@gmail.com','4')
RETURNING employee_id;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('18272 SEVENTH STREET','HOUSTON','UNITED STATES','29283','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,m_initial,phone,email,job_id,manager_id)
VALUES ('PRASHANTH','PATEL','2001-01-01','M','5','P','+11928839392','prashanth.p.p@gmail.com','4','1000000')
RETURNING employee_id;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('18272 SEVENTH STREET','HOUSTON','UNITED STATES','29283','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,m_initial,phone,job_id,manager_id)
VALUES ('PRASHANTH','PATEL','2001-01-01','M','6','P','+11928839392','3','1000000')
RETURNING employee_id;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('18272 SEVENTH STREET','HOUSTON','UNITED STATES','29283','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,m_initial,phone,email,job_id,manager_id)
VALUES ('PRASHANTH','PATEL','2001-01-01','M','7','P','+11928839392','prashanth.p.p@gmail.com','1','1000000')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000006','16.00','2000');
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO leave (employee_id,date,reason,status)
VALUES ('1000000','2021-01-01','EYEDOCTOR APPOINTMENT','RETURNED')
RETURNING *;
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO leave (employee_id,date,reason,status)
VALUES ('1000000','2021-03-17','OUT SICK, FLU','RETURNED')
RETURNING *;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO leave (employee_id,date,reason,status)
VALUES ('1000000','2020-02-02','OUT SICK WITH FLU.','RETURNED')
RETURNING *;
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO leave (employee_id,date,reason,status)
VALUES ('1000006','2021-01-01','BABYSITTING SON AT HOME.','RETURNED')
RETURNING *;
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT leave_id
FROM leave
WHERE leave_id = '3';
UPDATE leave
SET
	leave_id = '3',
	reason = 'NEW DOCTOR APPOINTMENT'
WHERE leave_id = '3'
RETURNING leave_id;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT leave_id
FROM leave
WHERE leave_id = '1';
UPDATE leave
SET
	reason = 'NEW DOCTOR APPOINTMENT'
WHERE leave_id = '1'
RETURNING leave_id;
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT leave_id
FROM leave
WHERE leave_id = '3';
UPDATE leave
SET
	date = '2021-11-16'
WHERE leave_id = '3'
RETURNING leave_id;
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO department (department_name,creation_date,department_head_id)
VALUES ('FLIGHT PERSONNEL','2021-01-01','0')
RETURNING department_id;
ROLLBACK;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO department (department_name,creation_date,department_head_id)
VALUES ('FLIGHT PERSONNEL','2021-01-01','1000000')
RETURNING department_id;
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT department_id
FROM department
WHERE department_id = '9';
UPDATE department
SET
	department_name = 'MEDICALL'
WHERE department_id = '9'
RETURNING department_id;
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO benefits (health_insurance_provider,amount,stock_options,retirement_plan)
VALUES ('ALLSTATE','50000.00','NASDAQ','2055 RETIREMENT REGULAR')
RETURNING *;
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO benefits (health_insurance_provider,amount,stock_options,retirement_plan)
VALUES ('AETNA','30000.00','INVESTMENT PORTFOLIO','2060 RETIREMENT PLUS')
RETURNING *;
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT benefits_package_id
FROM benefits
WHERE benefits_package_id = '1';
UPDATE benefits
SET
	stock_options = 'NASDAQ PORTFOLIO'
WHERE benefits_package_id = '1'
RETURNING benefits_package_id;
COMMIT;
END TRANSACTION;

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT benefits_package_id
FROM benefits
WHERE benefits_package_id = '2';
UPDATE benefits
SET
	amount = '35000.00'
WHERE benefits_package_id = '2'
RETURNING benefits_package_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 12:08:22 AM */
-- Create a new payroll entry
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO payroll(employee_id,hours_worked,pay_period,tax_rate,gross_income,taxed_income,net_income)
SELECT employee_id,hours_worked,pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income
FROM (
	SELECT e.employee_id, '45'::INT AS hours_worked, '2021-11-16'::DATE AS pay_period, '0.10'::REAL AS tax_rate,
		CASE
			WHEN '45'::INT <= 4.4 * weekly_hours THEN '45'::INT * hourly_wage
			ELSE (1.5 * '45'::INT - 0.5* 4.4 * weekly_hours) * hourly_wage
		END gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
	AND e.employee_id = '1000000'
) AS gross_calc
RETURNING *;
ROLLBACK;

/* 11/30/2021, 12:12:04 AM */
-- Create new employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('12345 SEVENTH STREET','SUGAR LAND','UNITED STATES','28723','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email)
VALUES ('SYED','RIZVI','2019-06-03','M','1','182372612','+18324445554','syed.a.rizvi@gmail.com')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000000','100','20000');
COMMIT;
END TRANSACTION;

/* 11/30/2021, 12:14:46 AM */
-- Add new job
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job (job_title,department_id,location_id,benefits_package_id,weekly_hours)
VALUES ('PILOT','0','0','0','40')
RETURNING job_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 12:15:10 AM */
-- Create a new payroll entry
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO payroll(employee_id,hours_worked,pay_period,tax_rate,gross_income,taxed_income,net_income)
SELECT employee_id,hours_worked,pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income
FROM (
	SELECT e.employee_id, '45'::INT AS hours_worked, '2021-01-01'::DATE AS pay_period, '0.10'::REAL AS tax_rate,
		CASE
			WHEN '45'::INT <= 4.4 * weekly_hours THEN '45'::INT * hourly_wage
			ELSE (1.5 * '45'::INT - 0.5* 4.4 * weekly_hours) * hourly_wage
		END gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
	AND e.employee_id = '1000000'
) AS gross_calc
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 12:16:30 AM */
-- Create a new payroll entry
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO payroll(employee_id,hours_worked,pay_period,tax_rate,gross_income,taxed_income,net_income)
SELECT employee_id,hours_worked,pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income
FROM (
	SELECT e.employee_id, '40'::INT AS hours_worked, '2021-01-01'::DATE AS pay_period, '0.5'::REAL AS tax_rate,
		CASE
			WHEN '40'::INT <= 4.4 * weekly_hours THEN '40'::INT * hourly_wage
			ELSE (1.5 * '40'::INT - 0.5* 4.4 * weekly_hours) * hourly_wage
		END gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
	AND e.employee_id = '1000000'
) AS gross_calc
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 12:17:31 AM */
-- Update employee details
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Check employee exists
SELECT employee_id
FROM employee
WHERE employee_id = '1000000';
UPDATE employee
SET
	job_id = '1'
WHERE employee_id = '1000000';
COMMIT;
END TRANSACTION;

/* 11/30/2021, 12:17:51 AM */
-- Create a new payroll entry
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO payroll(employee_id,hours_worked,pay_period,tax_rate,gross_income,taxed_income,net_income)
SELECT employee_id,hours_worked,pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income
FROM (
	SELECT e.employee_id, '40'::INT AS hours_worked, '2021-01-01'::DATE AS pay_period, '0.4'::REAL AS tax_rate,
		CASE
			WHEN '40'::INT <= 4.4 * weekly_hours THEN '40'::INT * hourly_wage
			ELSE (1.5 * '40'::INT - 0.5* 4.4 * weekly_hours) * hourly_wage
		END gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
	AND e.employee_id = '1000000'
) AS gross_calc
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 12:39:07 AM */
-- Create a new payroll entry
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO payroll(employee_id,hours_worked,pay_period,tax_rate,gross_income,taxed_income,net_income)
SELECT employee_id,hours_worked,pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income
FROM (
	SELECT e.employee_id, '45'::INT AS hours_worked, '2020-02-02'::DATE AS pay_period, '0.1'::REAL AS tax_rate,
		CASE
			WHEN '45'::INT <= 4.4 * weekly_hours THEN '45'::INT * hourly_wage
			ELSE (1.5 * '45'::INT - 0.5* 4.4 * weekly_hours) * hourly_wage
		END gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
	AND e.employee_id = '1000000'
) AS gross_calc
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 12:45:00 AM */
-- Create a new payroll entry for every assigned employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '2021-12-02'::DATE AS pay_period, '0.2'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 12:45:22 AM */
-- Create a new payroll entry for every assigned employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '2021-12-03'::DATE AS pay_period, '0.25'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:04:34 AM */
-- Create new employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('12345 SIXTH STREET','HOUSTON','UNITED STATES','28238','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,m_initial,ssn,phone,email,job_id,manager_id)
VALUES ('JOHN','LUETZELSCHWAB','2000-01-21','M','2','A','100303030','+19328238429','john@hotmail.com','1','1000000')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000001','15.00','2000');
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:05:36 AM */
-- Create new employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('12345 FIFTH STREET','HOUSTON','UNITED STATES','292929','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,manager_id)
VALUES ('MIRANDA','PEREZ','2001-01-01','F','3','229929229','+19228828289','miranda.perez@hotmail.com','1000000')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000002','19.00','1000');
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:21:10 AM */
-- Delete employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM employee
WHERE employee_id = '1000002'
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:22:38 AM */
-- Delete employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM employee
WHERE employee_id = '1000001'
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:23:25 AM */
-- Create new employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('12345 SEVENTH STREET','HOUSTON','UNITED STATES','28382','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id)
VALUES ('JOHN','DOE','2020-01-01','M','4')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000003','15.00','2000');
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:23:43 AM */
-- Delete employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM employee
WHERE employee_id = '1000003'
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:25:48 AM */
-- Create new employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('12345 FOURTH STREET','SUGAR LAND','UNITED STATES','22882','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id)
VALUES ('JOHN','DOE','2020-02-02','M','5')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000004','16.00','2000');
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:26:09 AM */
-- Delete employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM employee
WHERE employee_id = '1000004'
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:26:53 AM */
-- Create new employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country)
VALUES ('12345 FOURTH STREET','HOUSTON','UNITED STATES')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id)
VALUES ('JOHN','DOE','2020-02-02','M','6')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000005','15.00','20000');
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:27:06 AM */
-- Delete employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM employee
WHERE employee_id = '1000005'
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:28:04 AM */
-- Create new employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country)
VALUES ('12345 THIRD STREET','SUGAR LAND','UNITED STATES')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id)
VALUES ('JOHN','DOE','2020-02-02','M','7')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000006','15','20000');
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:28:36 AM */
-- Delete employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM employee
WHERE employee_id = '1000006'
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:34:17 AM */
-- Add new job
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job (job_title,department_id,location_id,benefits_package_id,weekly_hours)
VALUES ('COPILOT','0','0','0','45')
RETURNING job_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:34:42 AM */
-- Create new department
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO department (department_name,creation_date,department_head_id)
VALUES ('FLIGHT PERSONNEL','1990-01-01','1000000')
RETURNING department_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:34:59 AM */
-- Create new department
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO department (department_name,creation_date,department_head_id)
VALUES ('CARGO PERSONNEL','1989-01-01','1000000')
RETURNING department_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:35:25 AM */
-- Add new job
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job (job_title,department_id,location_id,benefits_package_id,weekly_hours)
VALUES ('PILOT','4','0','0','30')
RETURNING job_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:35:57 AM */
-- Delete job
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM job
WHERE job_id = '2'
COMMIT;
END TRANSACTION;

/* 11/30/2021, 1:42:04 AM */
-- Delete department
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM department
WHERE department_id = '7'
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:47:28 AM */
-- Create new job location
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job_location (address_id,location_name,airport_id,flight_id)
VALUES ('1','AUSTIN OFFICE','1','1')
RETURNING *;
ROLLBACK;

/* 11/30/2021, 10:48:17 AM */
-- Create new job location
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job_location (address_id,location_name,airport_id,flight_id)
VALUES ('1','AUSTIN OFFICE','0','0')
RETURNING *;
ROLLBACK;

/* 11/30/2021, 10:48:48 AM */
-- Create new job location
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job_location (address_id,location_name,airport_id,flight_id)
VALUES ('1','HOUSTON OFFICE','0','0')
RETURNING *;
ROLLBACK;

/* 11/30/2021, 10:51:47 AM */
-- Create new job location
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job_location (address_id,location_name,airport_id,flight_id)
VALUES ('1','NEW YORK OFFICE','0','0')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:53:25 AM */
-- Create new job location
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job_location (address_id,location_name,airport_id,flight_id)
VALUES ('2','HOUSTON OFFICE','1','2')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:53:44 AM */
-- Create new job location
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job_location (address_id,location_name,airport_id,flight_id)
VALUES ('3','ATLANTA GA OFFICE','2','1')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:54:11 AM */
-- Create new job location
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job_location (address_id,location_name,airport_id,flight_id)
VALUES ('4','SAN ANTONIO OFFICE','3','3')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:55:36 AM */
-- Create new benefits package
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO benefits (health_insurance_provider,amount,stock_options,retirement_plan)
VALUES ('AETNA','5000','NASDAQ FIVE HUNDRED','2050 RETIREMENT PLUS')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:55:55 AM */
-- Create new benefits package
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO benefits (health_insurance_provider,amount,stock_options,retirement_plan)
VALUES ('AETNA','10000','NASDAQ','DEFAULLT EMPLOYEE PLAN')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:56:25 AM */
-- Create new benefits package
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO benefits (health_insurance_provider,amount,stock_options,retirement_plan)
VALUES ('ALLSTATE','4000','NASDAQ','2060 RETIREMENT REGULAR PLAN')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:57:42 AM */
-- Delete job
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM job
WHERE job_id = '3'
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:58:32 AM */
-- Add new job
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job (job_title,department_id,location_id,benefits_package_id,weekly_hours)
VALUES ('FLIGHT ATTENDENT','1','3','3','45')
RETURNING job_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:58:45 AM */
-- Add new job
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job (job_title,department_id,location_id,benefits_package_id,weekly_hours)
VALUES ('FLIGHT ATTENDENT','2','2','1','40')
RETURNING job_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:59:26 AM */
-- Add new job
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job (job_title,department_id,location_id,benefits_package_id,weekly_hours)
VALUES ('BAGGAGE HANDLER','5','2','3','45')
RETURNING job_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:59:36 AM */
-- Add new job
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job (job_title,department_id,location_id,benefits_package_id,weekly_hours)
VALUES ('BAGGAGE HANDLER','5','1','2','40')
RETURNING job_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:59:58 AM */
-- Add new job
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job (job_title,department_id,location_id,benefits_package_id,weekly_hours)
VALUES ('CHECK IN ATTENDANT','7','1','1','40')
RETURNING job_id;
ROLLBACK;

/* 11/30/2021, 11:00:30 AM */
-- Add new job
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job (job_title,department_id,location_id,benefits_package_id,weekly_hours)
VALUES ('CHECK IN ATTENDANT','5','1','1','40')
RETURNING job_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 11:00:34 AM */
-- Add new job
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job (job_title,department_id,location_id,benefits_package_id,weekly_hours)
VALUES ('CHECK IN ATTENDANT','5','2','1','40')
RETURNING job_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 11:00:37 AM */
-- Add new job
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job (job_title,department_id,location_id,benefits_package_id,weekly_hours)
VALUES ('CHECK IN ATTENDANT','5','3','1','40')
RETURNING job_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 11:00:41 AM */
-- Add new job
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job (job_title,department_id,location_id,benefits_package_id,weekly_hours)
VALUES ('CHECK IN ATTENDANT','5','4','1','40')
RETURNING job_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 11:00:45 AM */
-- Add new job
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job (job_title,department_id,location_id,benefits_package_id,weekly_hours)
VALUES ('CHECK IN ATTENDANT','5','5','1','40')
RETURNING job_id;
ROLLBACK;

/* 11/30/2021, 11:02:34 AM */
-- Create new employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('12345 SIXTH STREET','HOUSTON','UNITED STATES','92929','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,job_id,manager_id)
VALUES ('NATHAN','VALTIERRA','2000-02-02','M','8','191919191','+18328248282','nathan.valt@yahoo.com','4','1000000')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000007','20.00','10000');
COMMIT;
END TRANSACTION;

/* 11/30/2021, 11:04:28 AM */
-- Create new employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('12345 SEVENTH STREET LN','HOUSTON','UNITED STATES','28282','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,job_id,manager_id)
VALUES ('JANE','HERRERA','1999-01-01','F','9','123456832','+19128288482','jane.h@gmail.com','3','1000007')
RETURNING employee_id;
ROLLBACK;

/* 11/30/2021, 11:05:05 AM */
-- Create new employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('12345 SEVENTH STREET LN','HOUSTON','UNITED STATES','28282','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,job_id,manager_id)
VALUES ('JANE','HERRERA','1999-01-01','F','10','123456832','+19128288482','jane.h@gmail.com','4','1000007')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000009','15.00','20000');
COMMIT;
END TRANSACTION;

/* 11/30/2021, 11:06:50 AM */
-- Create new employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('12345 SEVENTH STREET LN','HOUSTON','UNITED STATES','92882','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,job_id,manager_id)
VALUES ('PRASHANTH','KHAN','2002-03-03','M','11','987654322','+18329324334','prashanth.khan@yahoo.com','5','1000007')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000010','18.00','15000');
COMMIT;
END TRANSACTION;

/* 11/30/2021, 11:09:13 AM */
-- Create new leave entry for employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO leave (employee_id,date,reason,status)
VALUES ('1000000','2021-01-01','HEALTH CHECKUP','RETURNED')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 11:09:23 AM */
-- Create new leave entry for employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO leave (employee_id,date,reason,status)
VALUES ('1000000','2020-02-02','EYE DOCTOR APPOINTMENT','RETURNED')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 11:10:06 AM */
-- Create new leave entry for employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO leave (employee_id,date,reason,status)
VALUES ('1000007','2021-03-03','BABYSITTING','RETURNED')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 11:10:42 AM */
-- Create new leave entry for employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO leave (employee_id,date,reason,status)
VALUES ('1000009','2019-01-01','DOCTOR APPOINTMENT','RETURNED')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 9:34:28 PM */
-- Create new leave entry for employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO leave (employee_id,date,reason,status)
VALUES ('1000001','2021-01-01','DOCTORS APPOINTMENT','RETURNED')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 9:56:35 PM */
-- Delete employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM employee
WHERE employee_id = '1000047'
COMMIT;
END TRANSACTION;

/* 11/30/2021, 9:58:11 PM */
-- Delete employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM employee
WHERE employee_id = '1000075'
COMMIT;
END TRANSACTION;

/* 11/30/2021, 9:59:50 PM */
-- Delete employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM employee
WHERE employee_id = '1000076'
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:00:57 PM */
-- Delete employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM employee
WHERE employee_id = '1000077'
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:02:58 PM */
-- Delete employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM employee
WHERE employee_id = '1000089'
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:05:21 PM */
-- Delete employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM employee
WHERE employee_id = '1000090'
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:10:57 PM */
-- Create new employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('12345 SEVENTH STREET','HOUSTON','UNITED STATES','83838','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,job_id,manager_id)
VALUES ('PACE','WALKER','2010-01-01','M','267','282727327','+18828383828','pace@gmail.com','4','1000000')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000263','19.00','2000');
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:13:16 PM */
-- Update employee details
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Check employee exists
SELECT employee_id
FROM employee
WHERE employee_id = '1000096';
UPDATE employee
SET
	last_name = 'ALLARDA'
WHERE employee_id = '1000096';
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:14:02 PM */
-- Update employee details
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Check employee exists
SELECT employee_id
FROM employee
WHERE employee_id = '1000051';
UPDATE employee
SET
	last_name = 'SHIRAZI'
WHERE employee_id = '1000051';
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:22:24 PM */
-- Add new job
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job (job_title,department_id,location_id,benefits_package_id,weekly_hours)
VALUES ('ENTRY LEVEL PILOT','4','3','2','40')
RETURNING job_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:23:38 PM */
-- Create new job location
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO job_location (address_id,location_name,airport_id,flight_id)
VALUES ('4','WASHINGTON SUB OFFICE','4','2')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:26:40 PM */
-- Update job details
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Check job exists firstSELECT job_id
FROM job
WHERE job_id = '4';

UPDATE job
SET
	location_id = '2'
WHERE job_id = '4'
RETURNING job_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:27:29 PM */
-- Delete job
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM job
WHERE job_id = '120'
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:41:00 PM */
-- Create new department
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO department (department_name,creation_date,department_head_id)
VALUES ('EMAIL ADVERTISING','2010-01-20','1000023')
RETURNING department_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:43:09 PM */
-- Update department details
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT department_id
FROM department
WHERE department_id = '13';
UPDATE department
SET
	creation_date = '2019-01-01'
WHERE department_id = '13'
RETURNING department_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:43:33 PM */
-- Delete department
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM department
WHERE department_id = '13'
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:48:08 PM */
-- Create new leave entry for employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO leave (employee_id,date,reason,status)
VALUES ('1000000','2020-02-02','OUT SICK','RETURNED')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:51:23 PM */
-- Create new leave entry for employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO leave (employee_id,date,reason,status)
VALUES ('1000002','2021-11-30','MISSED WORK TO ATTEND DATABASES COURSE LECTURE','RETURNED')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:51:51 PM */
-- Update leave entry
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT leave_id
FROM leave
WHERE leave_id = '2';
UPDATE leave
SET
	reason = 'OUT SICK WITH FLU'
WHERE leave_id = '2'
RETURNING leave_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:56:09 PM */
-- Create new benefits package
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO benefits (health_insurance_provider,amount,stock_options,retirement_plan)
VALUES ('AETNA','5000','NASDAQ','2055 RETIREMENT PREMIUM')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 10:57:30 PM */
-- Update benefits package details
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Check benefits package exists
SELECT benefits_package_id
FROM benefits
WHERE benefits_package_id = '4';

UPDATE benefits
SET
	health_insurance_provider = 'AETNA'
WHERE benefits_package_id = '4'
RETURNING benefits_package_id;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 11:00:17 PM */
-- Create a new payroll entry
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO payroll(employee_id,hours_worked,pay_period,tax_rate,gross_income,taxed_income,net_income)
SELECT employee_id,hours_worked,pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income
FROM (
	SELECT e.employee_id, '50'::INT AS hours_worked, '2020-02-20'::DATE AS pay_period, '0.1'::REAL AS tax_rate,
		CASE
			WHEN '50'::INT <= 4.4 * weekly_hours THEN '50'::INT * hourly_wage
			ELSE (1.5 * '50'::INT - 0.5* 4.4 * weekly_hours) * hourly_wage
		END gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
	AND e.employee_id = '1000077'
) AS gross_calc
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 11:00:29 PM */
-- Create a new payroll entry for every assigned employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '2021-02-02'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 11:02:36 PM */
-- Create a new payroll entry
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO payroll(employee_id,hours_worked,pay_period,tax_rate,gross_income,taxed_income,net_income)
SELECT employee_id,hours_worked,pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income
FROM (
	SELECT e.employee_id, '40'::INT AS hours_worked, '2021-01-01'::DATE AS pay_period, '0.15'::REAL AS tax_rate,
		CASE
			WHEN '40'::INT <= 4.4 * weekly_hours THEN '40'::INT * hourly_wage
			ELSE (1.5 * '40'::INT - 0.5* 4.4 * weekly_hours) * hourly_wage
		END gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
	AND e.employee_id = '1000008'
) AS gross_calc
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 11:18:44 PM */
-- Create a new payroll entry for every assigned employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '2021-05-18'::DATE AS pay_period, '0.05'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 11:20:32 PM */
-- Create a new payroll entry for every assigned employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '2021-06-30'::DATE AS pay_period, '0.05'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc
RETURNING *;
COMMIT;
END TRANSACTION;

/* 11/30/2021, 11:21:32 PM */
-- Create a new payroll entry for every assigned employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '2021-10-31'::DATE AS pay_period, '0.15'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc
RETURNING *;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 11:40:45 AM */
-- Update employee details
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Check employee exists
SELECT employee_id
FROM employee
WHERE employee_id = '1000004';
UPDATE employee
SET
	last_name = 'SYEDA'
WHERE employee_id = '1000004';
COMMIT;
END TRANSACTION;

/* 12/1/2021, 1:50:11 PM */
-- Delete employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM employee
WHERE employee_id = '1000000'
ROLLBACK;

/* 12/1/2021, 1:50:40 PM */
-- Delete employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM employee
WHERE employee_id = '1000006'
COMMIT;
END TRANSACTION;

/* 12/1/2021, 1:53:18 PM */
-- Delete employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM employee
WHERE employee_id = '1000009'
COMMIT;
END TRANSACTION;

/* 12/1/2021, 1:53:44 PM */
-- Delete all tables
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DROP TABLE IF EXISTS payroll          CASCADE;
DROP TABLE IF EXISTS benefits         CASCADE;
DROP TABLE IF EXISTS salary           CASCADE;
DROP TABLE IF EXISTS leave            CASCADE;
DROP TABLE IF EXISTS department       CASCADE;
DROP TABLE IF EXISTS job_location     CASCADE;
DROP TABLE IF EXISTS job              CASCADE;
DROP TABLE IF EXISTS employee         CASCADE;
DROP TABLE IF EXISTS employee_address CASCADE;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 1:53:45 PM */
-- Recreate tables from script
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Run these commands in ElephantSQL postgres database in browser tab to recreate starting tables for local testing

CREATE TABLE benefits (
  benefits_package_id        INT          GENERATED ALWAYS AS IDENTITY, 
  amount                     MONEY        NOT NULL,
  stock_options              VARCHAR(100), 
  health_insurance_provider  VARCHAR(100) NOT NULL CHECK(health_insurance_provider ~ '^[A-Z \d]+$'),
  retirement_plan            VARCHAR(100),

  PRIMARY KEY(benefits_package_id)
);


CREATE TABLE employee_address (
  address_id      INT           GENERATED ALWAYS AS IDENTITY,
  street_address  VARCHAR(100)  NOT NULL CHECK(street_address ~ '^[A-Z \/\d#\.,-]+$'),   -- Includes appt/po box info and locality info if applicable
  city            VARCHAR(50)   NOT NULL CHECK(city ~ '^[A-Z ]+$'), -- Also serves as post town if applicable
  zip_code        VARCHAR(16)   CHECK(zip_code ~ '^[\d \-A-Z]+$'), -- Also serves as postcode if applicable
  state           VARCHAR(50)   CHECK(state ~ '^[A-Z ]+$'), -- Also serves as province if applicable
  country         VARCHAR(50)   NOT NULL CHECK(country ~ '^[A-Z ]+$'),   -- Also serves as region if applicable

  PRIMARY KEY(address_id)
);


CREATE TABLE job_location (
  location_id   INT GENERATED ALWAYS AS IDENTITY,
  airport_id    INT,
  address_id    INT NOT NULL,
  flight_id     INT,
  location_name VARCHAR(50),

  PRIMARY KEY(location_id)
);


CREATE TABLE department (
  department_id       INT          GENERATED ALWAYS AS IDENTITY,
  department_name     VARCHAR(50)  NOT NULL CHECK(department_name ~ '^[A-Z ]+$'),
  creation_date       DATE         NOT NULL, 
  department_head_id  INT,

  PRIMARY KEY(department_id)
);


CREATE TABLE job (
  job_id              INT         GENERATED ALWAYS AS IDENTITY, 
  job_title           VARCHAR(50) NOT NULL CHECK(job_title ~ '^[A-Z \-]+$'),
  department_id       INT         NOT NULL, 
  location_id         INT         NOT NULL,
  weekly_hours        INT         DEFAULT 40 CHECK(weekly_hours <= 168),
  benefits_package_id INT         DEFAULT 0 NOT NULL,

  PRIMARY KEY(job_id),
  FOREIGN KEY(department_id)
    REFERENCES department(department_id)
    ON DELETE CASCADE,

  FOREIGN KEY(location_id)
    REFERENCES job_location(location_id)
    ON DELETE CASCADE,

  FOREIGN KEY(benefits_package_id)
    REFERENCES benefits(benefits_package_id)
    ON DELETE SET DEFAULT
);


CREATE TABLE employee (
  employee_id INT           GENERATED ALWAYS AS IDENTITY (START WITH 1000000),
  first_name  VARCHAR(50)   NOT NULL CHECK(first_name ~ '^[A-Z ]+$'),
  m_initial   CHAR(1),  
  last_name   VARCHAR(50)   NOT NULL CHECK(last_name ~ '^[A-Z ]+$'),
  ssn         CHAR(9)       UNIQUE CHECK(ssn ~ '^\d{9}$'),
  dob         DATE          NOT NULL,
  gender      CHAR(1)       NOT NULL CHECK(gender ~ '^[MFO]$'),
  phone       VARCHAR(15)   CHECK(phone ~ '^\+[0-9]+$'),
  email       VARCHAR(100)  UNIQUE CHECK(email ~ '^[\w\.\+]{1,64}@(\w+\.[A-Za-z]+){1,100}$'),
  job_id      INT           DEFAULT 0 NOT NULL,
  address_id  INT           NOT NULL,
  manager_id  INT,

  PRIMARY KEY(employee_id),
  FOREIGN KEY(job_id)
    REFERENCES job(job_id)
    ON DELETE SET DEFAULT,

  FOREIGN KEY(address_id)
    REFERENCES employee_address(address_id),

  FOREIGN KEY(manager_id)
    REFERENCES employee(employee_id)
    ON DELETE SET NULL
);


CREATE TABLE salary (
  salary_id    INT    GENERATED ALWAYS AS IDENTITY,
  employee_id  INT    NOT NULL,
  hourly_wage  MONEY  NOT NULL,
  annual_bonus MONEY  DEFAULT 0 NOT NULL,

  PRIMARY KEY(salary_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE leave (
  leave_id    INT           GENERATED ALWAYS AS IDENTITY,
  employee_id INT           NOT NULL,
  date        DATE          NOT NULL,
  reason      VARCHAR(100)  NOT NULL CHECK(reason ~ '^[A-Z \.\d]+$'),
  status      VARCHAR(50)   NOT NULL CHECK(status ~ '^[A-Z \.\d]+$'),

  PRIMARY KEY(leave_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE payroll (
  payroll_id    INT       GENERATED ALWAYS AS IDENTITY,
  employee_id   INT       NOT NULL, 
  hours_worked  REAL      NOT NULL,
  pay_period    DATE      NOT NULL,
  tax_rate      REAL      NOT NULL,
  gross_income  MONEY     NOT NULL,
  taxed_income  MONEY     NOT NULL,
  net_income    MONEY     NOT NULL,
  
  UNIQUE(employee_id, pay_period),

  PRIMARY KEY(payroll_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


/* DEFAULTS */
ALTER TABLE department
ADD CONSTRAINT fk_head FOREIGN KEY (department_head_id) REFERENCES employee(employee_id);


INSERT INTO benefits OVERRIDING SYSTEM VALUE VALUES(0, 0, 0, 'UNASSIGNED', 0);

INSERT INTO job_location OVERRIDING SYSTEM VALUE VALUES(0, NULL, 0, NULL);

INSERT INTO department OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', '1980-1-1');

INSERT INTO job OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', 0, 0, 0, 0);


/* Initial populated tables */

-- Departments (based on https://www.avjobs.com/history/structure-of-the-airline-industry.asp)
INSERT INTO department (department_name, creation_date) VALUES 
('BOARD OF DIRECTORS',            '1980-01-01'),
('ENGINEERING AND MAINTENANCE',   '1980-01-01'),
('GROUND OPERATIONS',             '1980-01-01'),
('FLIGHT OPERATIONS',             '1980-01-01'),
('SALES AND MARKETING',           '1980-01-01'),
('RESERVATIONS AND TICKETING',    '1980-01-01'),
('FINANCE AND PROPERTY',          '1980-01-01'),
('INFORMATION SERVICES',          '1990-11-08'),
('PERSONNEL',                     '1980-01-01'),
('EMERGENCY SERVICES',            '1980-04-05'),
('LEGAL',                         '1981-03-11'),
('PUBLIC RELATIONS AND PLANNING', '1985-07-20');


-- Benefits
INSERT INTO benefits (amount, stock_options, health_insurance_provider, retirement_plan) VALUES
(1000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS A', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS A', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN A'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(6000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS C', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(10000, 'STOCK OPTIONS D', 'INSURANCE PROVIDER D', 'RETIREMENT PLAN D'),
(4500,  'STOCK OPTIONS D', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN C');


-- Job locations
INSERT INTO job_location (airport_id, address_id, flight_id, location_name) VALUES
(NULL,  1,  NULL, 'OFFICES IN CITY A'),
(NULL,  2,  NULL, 'OFFICES IN CITY B'),
(NULL,  6,  NULL, 'OFFICES IN CITY C'),

(1, 3,  NULL, 'AIRPORT IN CITY A'),
(1, 3,  100,  'AIRPORT IN CITY A'),
(1, 3,  101,  'AIRPORT IN CITY A'),
(1, 3,  102,  'AIRPORT IN CITY A'),
(1, 3,  103,  'AIRPORT IN CITY A'),

(2, 4,  NULL, 'AIRPORT A IN CITY B'),
(2, 4,  200,  'AIRPORT A IN CITY B'),
(2, 4,  201,  'AIRPORT A IN CITY B'),
(2, 4,  202,  'AIRPORT A IN CITY B'),
(2, 4,  203,  'AIRPORT A IN CITY B'),

(3, 5,  NULL, 'AIRPORT B IN CITY B'),
(3, 5,  300,  'AIRPORT B IN CITY B'),
(3, 5,  301,  'AIRPORT B IN CITY B'),
(3, 5,  302,  'AIRPORT B IN CITY B'),
(3, 5,  303,  'AIRPORT B IN CITY B'),

(4, 7,  NULL, 'AIRPORT IN CITY C'),
(4, 7,  400,  'AIRPORT IN CITY C'),
(4, 7,  401,  'AIRPORT IN CITY C'),
(4, 7,  402,  'AIRPORT IN CITY C'),
(4, 7,  403,  'AIRPORT IN CITY C');


-- Jobs (based on https://www.airlinejobfinder.com/members/airline-jobs/)
INSERT INTO job (job_title, department_id, location_id, weekly_hours, benefits_package_id) VALUES
-- Board of Directors (1)
('CHIEF EXECUTIVE OFFICER', 1,  2,  50, 9),
('CHAIRMAN',                1,  2,  40, 9),
('VICE CHAIR',              1,  2,  40, 9),
('BOARD SECRETARY',         1,  2,  40, 9),
('TREASURER',               1,  2,  40, 9),
('BOARD MEMBER',            1,  2,  40, 9),

-- Maintenance and Engineering (2)
('AVIATION MAINTENANCE TECHNICIAN', 2,  4,  40, 2),
('POWERPLANT MECHANIC',             2,  4,  40, 2),
('AIRFRAME MECHANIC',               2,  4,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  4,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  4,  40, 2),
('AIRCRAFT FUELER',                 2,  4,  40, 2),
('AVIONIC TECHNICIAN',              2,  4,  40, 2),
('CABIN MAINTENANCE',               2,  4,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  4,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  4,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  9,  40, 2),
('POWERPLANT MECHANIC',             2,  9,  40, 2),
('AIRFRAME MECHANIC',               2,  9,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  9,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  9,  40, 2),
('AIRCRAFT FUELER',                 2,  9,  40, 2),
('AVIONIC TECHNICIAN',              2,  9,  40, 2),
('CABIN MAINTENANCE',               2,  9,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  9,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  9,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  14,  40, 2),
('POWERPLANT MECHANIC',             2,  14,  40, 2),
('AIRFRAME MECHANIC',               2,  14,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  14,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  14,  40, 2),
('AIRCRAFT FUELER',                 2,  14,  40, 2),
('AVIONIC TECHNICIAN',              2,  14,  40, 2),
('CABIN MAINTENANCE',               2,  14,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  14,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  14,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  19,  40, 2),
('POWERPLANT MECHANIC',             2,  19,  40, 2),
('AIRFRAME MECHANIC',               2,  19,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  19,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  19,  40, 2),
('AIRCRAFT FUELER',                 2,  19,  40, 2),
('AVIONIC TECHNICIAN',              2,  19,  40, 2),
('CABIN MAINTENANCE',               2,  19,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  19,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  19,  40, 2),

-- Ground Operations (3)
('DIRECTOR OF AVIATION',        3, 1, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 1, 40, 3),
('DIRECTOR OF AVIATION',        3, 2, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 2, 40, 3),
('DIRECTOR OF AVIATION',        3, 3, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 3, 40, 3),

('BAGGAGE HANDLER',               3,  4,  40, 5),
('SKYCAP',                        3,  4,  40, 5),
('CONCESSIONS',                   3,  4,  40, 5),
('AIRPORT GUIDE',                 3,  4,  40, 5),
('AIRPORT CUSTODIAN',             3,  4,  40, 1),
('OPERATIONS AGENT',              3,  4,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  4,  40, 3),
('PASSENGER SERVICE AGENT',       3,  4,  40, 3),
('RAMP PLANNER',                  3,  4,  40, 3),
('AIRLINE STATION AGENT',         3,  4,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  4,  40, 7),

('BAGGAGE HANDLER',               3,  9,  40, 5),
('SKYCAP',                        3,  9,  40, 5),
('CONCESSIONS',                   3,  9,  40, 5),
('AIRPORT GUIDE',                 3,  9,  40, 5),
('AIRPORT CUSTODIAN',             3,  9,  40, 1),
('OPERATIONS AGENT',              3,  9,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  9,  40, 3),
('PASSENGER SERVICE AGENT',       3,  9,  40, 3),
('RAMP PLANNER',                  3,  9,  40, 3),
('AIRLINE STATION AGENT',         3,  9,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  9,  40, 7),

('BAGGAGE HANDLER',               3,  14, 40, 5),
('SKYCAP',                        3,  14, 40, 5),
('CONCESSIONS',                   3,  14, 40, 5),
('AIRPORT GUIDE',                 3,  14, 40, 5),
('AIRPORT CUSTODIAN',             3,  14, 40, 1),
('OPERATIONS AGENT',              3,  14, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  14, 40, 3),
('PASSENGER SERVICE AGENT',       3,  14, 40, 3),
('RAMP PLANNER',                  3,  14, 40, 3),
('AIRLINE STATION AGENT',         3,  14, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  14, 40, 7),

('BAGGAGE HANDLER',               3,  19, 40, 5),
('SKYCAP',                        3,  19, 40, 5),
('CONCESSIONS',                   3,  19, 40, 5),
('AIRPORT GUIDE',                 3,  19, 40, 5),
('AIRPORT CUSTODIAN',             3,  19, 40, 1),
('OPERATIONS AGENT',              3,  19, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  19, 40, 3),
('PASSENGER SERVICE AGENT',       3,  19, 40, 3),
('RAMP PLANNER',                  3,  19, 40, 3),
('DISTRICT OPERATIONS MANAGER',   3,  19, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  19, 40, 7),

-- Flight Operations (4)
('FLIGHT DISPATCHER',       4,  4,  40, 6),
('AVIATION METEOROLOGIST',  4,  4,  40, 6),
('FLIGHT DISPATCHER',       4,  9,  40, 6),
('AVIATION METEOROLOGIST',  4,  9,  40, 6),
('FLIGHT DISPATCHER',       4,  14, 40, 6),
('AVIATION METEOROLOGIST',  4,  14, 40, 6),
('FLIGHT DISPATCHER',       4,  19, 40, 6),
('AVIATION METEOROLOGIST',  4,  19, 40, 6),

('CARGO CARRIER PILOT', 4,  5,  60, 6),
('COPORATE PILOT',      4,  5,  30, 6),
('CHARTER PILOT',       4,  5,  60, 6),

('CARGO CARRIER PILOT', 4,  6,  60, 6),
('COPORATE PILOT',      4,  6,  30, 6),
('CHARTER PILOT',       4,  6,  60, 6),

('CARGO CARRIER PILOT', 4,  7,  60, 6),
('COPORATE PILOT',      4,  7,  30, 6),
('CHARTER PILOT',       4,  7,  60, 6),

('CARGO CARRIER PILOT', 4,  8,  60, 6),
('COPORATE PILOT',      4,  8,  30, 6),
('CHARTER PILOT',       4,  8,  60, 6),

('CARGO CARRIER PILOT', 4,  10, 60, 6),
('COPORATE PILOT',      4,  10, 30, 6),
('CHARTER PILOT',       4,  10, 60, 6),

('CARGO CARRIER PILOT', 4,  11, 60, 6),
('COPORATE PILOT',      4,  11, 30, 6),
('CHARTER PILOT',       4,  11, 60, 6),

('CARGO CARRIER PILOT', 4,  12, 60, 6),
('COPORATE PILOT',      4,  12, 30, 6),
('CHARTER PILOT',       4,  12, 60, 6),

('CARGO CARRIER PILOT', 4,  13, 60, 6),
('COPORATE PILOT',      4,  13, 30, 6),
('CHARTER PILOT',       4,  13, 60, 6),

('CARGO CARRIER PILOT', 4,  15, 60, 6),
('COPORATE PILOT',      4,  15, 30, 6),
('CHARTER PILOT',       4,  15, 60, 6),

('CARGO CARRIER PILOT', 4,  16, 60, 6),
('COPORATE PILOT',      4,  16, 30, 6),
('CHARTER PILOT',       4,  16, 60, 6),

('CARGO CARRIER PILOT', 4,  17, 60, 6),
('COPORATE PILOT',      4,  17, 30, 6),
('CHARTER PILOT',       4,  17, 60, 6),

('CARGO CARRIER PILOT', 4,  18, 60, 6),
('COPORATE PILOT',      4,  18, 30, 6),
('CHARTER PILOT',       4,  18, 60, 6),

('CARGO CARRIER PILOT', 4,  20, 60, 6),
('COPORATE PILOT',      4,  20, 30, 6),
('CHARTER PILOT',       4,  20, 60, 6),

('CARGO CARRIER PILOT', 4,  21, 60, 6),
('COPORATE PILOT',      4,  21, 30, 6),
('CHARTER PILOT',       4,  21, 60, 6),

('CARGO CARRIER PILOT', 4,  22, 60, 6),
('COPORATE PILOT',      4,  22, 30, 6),
('CHARTER PILOT',       4,  22, 60, 6),

('CARGO CARRIER PILOT', 4,  23, 60, 6),
('COPORATE PILOT',      4,  23, 30, 6),
('CHARTER PILOT',       4,  23, 60, 6),

-- Sales and Marketing (5)
('REGIONAL SALES MANAGER',  5,  1,  40, 3),
('SALES REPRESENTATIVE',    5,  1,  40, 3),
('AIRLINE MARKETER',        5,  1,  40, 3),
('SALES INTERN',            5,  1,  20, 3),

('REGIONAL SALES MANAGER',  5,  2,  40, 3),
('SALES REPRESENTATIVE',    5,  2,  40, 3),
('AIRLINE MARKETER',        5,  2,  40, 3),
('SALES INTERN',            5,  2,  20, 3),

('REGIONAL SALES MANAGER',  5,  3,  40, 3),
('SALES REPRESENTATIVE',    5,  3,  40, 3),
('AIRLINE MARKETER',        5,  3,  40, 3),
('SALES INTERN',            5,  3,  20, 3),

-- Reservations and Ticketing (6)
('RESERVATION SALES AGENT', 6,  4,  40, 3),
('AIRLINE TICKET AGENT',    6,  4,  40, 3),

('RESERVATION SALES AGENT', 6,  9,  40, 3),
('AIRLINE TICKET AGENT',    6,  9,  40, 3),

('RESERVATION SALES AGENT', 6,  14, 40, 3),
('AIRLINE TICKET AGENT',    6,  14, 40, 3),

('RESERVATION SALES AGENT', 6,  19, 40, 3),
('AIRLINE TICKET AGENT',    6,  19, 40, 3),

-- Finance and Property (7)
('ACCOUNTANT',                7,  1,  40, 5),
('AUDITOR',                   7,  1,  40, 5),
('FINANCE ASSITANT',          7,  1,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  1,  40, 5),
('PAYROLL CLERK',             7,  1,  40, 5),
('FINANCIAL ANALYST',         7,  1,  40, 5),
('PAYROLL MANAGER',           7,  1,  40, 5),
('FINANCE INTERN',            7,  1,  20, 5),

('ACCOUNTANT',                7,  2,  40, 5),
('AUDITOR',                   7,  2,  40, 5),
('FINANCE ASSITANT',          7,  2,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  2,  40, 5),
('PAYROLL CLERK',             7,  2,  40, 5),
('FINANCIAL ANALYST',         7,  2,  40, 5),
('PAYROLL MANAGER',           7,  2,  40, 5),
('FINANCE INTERN',            7,  2,  20, 5),

('ACCOUNTANT',                7,  3,  40, 5),
('AUDITOR',                   7,  3,  40, 5),
('FINANCE ASSITANT',          7,  3,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  3,  40, 5),
('PAYROLL CLERK',             7,  3,  40, 5),
('FINANCIAL ANALYST',         7,  3,  40, 5),
('PAYROLL MANAGER',           7,  3,  40, 5),
('FINANCE INTERN',            7,  3,  20, 5),

-- Information services (8)
('IT SPECIALIST',     8,  1,  40, 3),
('IT INTERN',         8,  1,  20, 3),
('HELP DESK SUPPORT', 8,  1,  40, 3),

('IT SPECIALIST',     8,  2,  40, 3),
('HELP DESK SUPPORT', 8,  2,  40, 3),
('IT INTERN',         8,  2,  20, 3),

('IT SPECIALIST',     8,  3,  40, 3),
('HELP DESK SUPPORT', 8,  3,  40, 3),
('IT INTERN',         8,  3,  20, 3),

-- Personnel (9)
('SECRETARY',                   9,  1,  40, 3),
('MAIL CLERK',                  9,  1,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  1,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  1,  40, 3),
('RECEPTIONIST',                9,  1,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  1,  40, 3),

('SECRETARY',                   9,  2,  40, 3),
('MAIL CLERK',                  9,  2,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  2,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  2,  40, 3),
('RECEPTIONIST',                9,  2,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  2,  40, 3),

('SECRETARY',                   9,  3,  40, 3),
('MAIL CLERK',                  9,  3,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  3,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  3,  40, 3),
('RECEPTIONIST',                9,  3,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  3,  40, 3),

-- Emergency Services (10)
('FIREFIGHTER',           10,  4,  40, 10),
('FIREFIGHTER MEDIC',     10,  4,  40, 10),
('POLICE OFFICER',        10,  4,  40, 10),
('FIRE AND CRASH RESCUE', 10,  4,  30, 10),
('POLICE PATROL OFFICER', 10,  4,  30, 10),

('FIREFIGHTER',           10,  9,  40, 10),
('FIREFIGHTER MEDIC',     10,  9,  40, 10),
('POLICE OFFICER',        10,  9,  40, 10),
('FIRE AND CRASH RESCUE', 10,  9,  30, 10),
('POLICE PATROL OFFICER', 10,  9,  30, 10),

('FIREFIGHTER',           10,  14, 40, 10),
('FIREFIGHTER MEDIC',     10,  14, 40, 10),
('POLICE OFFICER',        10,  14, 40, 10),
('FIRE AND CRASH RESCUE', 10,  14, 30, 10),
('POLICE PATROL OFFICER', 10,  14, 30, 10),

('FIREFIGHTER',           10,  19, 40, 10),
('FIREFIGHTER MEDIC',     10,  19, 40, 10),
('POLICE OFFICER',        10,  19, 40, 10),
('FIRE AND CRASH RESCUE', 10,  19, 30, 10),
('POLICE PATROL OFFICER', 10,  19, 30, 10),

-- Legal (11)
('AVIATION ATTORNEY',  11,  1,  40, 7),
('AVIATION ATTORNEY',  11,  2,  40, 7),
('AVIATION ATTORNEY',  11,  3,  40, 7),

-- Public Relations and Planning (12)
('PUBLIC RELATIONS SPECIALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS GENERALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS MANAGER',    12,  2,  40, 3),
('PUBLIC RELATIONS INTERN',     12,  2,  20, 3),

('HEAD OF ENGINEERING',           2,  2,  40, 9),
('HEAD OF GROUND OPERATIONS',     3,  2,  40, 9),
('HEAD OF FLIGHT OPERATIONS',     4,  2,  40, 9),
('HEAD OF SALES',                 5,  2,  40, 9),
('HEAD OF RESERVATIONS',          6,  2,  40, 9),
('HEAD OF FINANCE',               7,  2,  40, 9),
('HEAD OF INFORMATION SERVICES',  8,  2,  40, 9),
('HEAD OF PERSONNEL MANAGEMENT',  9,  2,  40, 9),
('HEAD OF EMERGENCY SERVICES',    10, 2,  40, 9),
('HEAD OF LEGAL',                 11, 2,  40, 9),
('HEAD OF PUBLIC RELATIONS',      12, 2,  40, 9);


-- Employee Address
INSERT INTO employee_address (street_address, city, zip_code, state, country) VALUES
('123 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('123 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('321 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('555 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('9029 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('765 MAIN ST',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('767 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('876 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8770 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('202 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('101 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('896 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('909 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('920 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('808 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8760 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8755 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('423 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('202 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('101 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('896 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('909 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 SEAWATER LN',     'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8260 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8234 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8754 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('808 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8234 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8754 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SLEEPY HILLS',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 FISHWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MINOR ST',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 LION LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 JUMPY HILLS',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 FISHWATER ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MINOR RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 LION RD',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SLEEPY SLOPES',  'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('423 FISHWATER RD',    'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8777 MAIN ST',        'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('920 LONG LN',         'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 KLEINE DR',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 EINE DR',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 ROADY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 NEIN LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KLEINE DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 EINE DR',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 ROADY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KLEINE DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 EINE DR',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 ROADY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 ROCKY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 BUMPY HILLS',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 POOLWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 DIGGY LN',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 ZEBRA ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 MERRYWEATHER LN', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CHRONO ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('420 CLOUDY DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 MERRYWEATHER LN', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 CHRONO ST',      'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('420 CLOUDY DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 TIME ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 TIME ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 TIME ST',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 STEEL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 STEEL LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A');


-- Employee
INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOHN',      'H',        'SMITH',      '123456789', '1965-01-01',  'M',    '+15553219090', 'jsmith@company.org',     1,      1,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MARY',      NULL,       'ORLEANS',    '987654321', '1970-04-09',  'F',    '+15559990001', 'morleans@company.org',   2,      2,          1000000),
('HARRIS',    NULL,       'BEAUDRY',    '111223333', '1967-04-29',  'M',    '+15559990021', 'hbeaudry@company.org',   3,      3,          NULL),
('ANABEL',    'A',        'NEALIOUS',   '112345678', '1980-01-09',  'F',    '+15559990011', 'anaulious@company.org',  4,      4,          NULL),
('DON',       'E',        'SYLVER',     '112345688', '1969-11-24',  'M',    '+15559980011', 'dsylver@company.org',    5,      5,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BRENDON',   NULL,       'LAMBINO',    '112346689', '1965-11-24',  'M',    '+15559680011', 'blambino@company.org',   6,      6,          1000001),
('MYRTLE',    NULL,       'TRUOG',      '122345688', '1969-12-24',  'F',    '+16559980011', 'mtruog@company.org',     6,      7,          1000001),
('LASZLO',    NULL,       'LUAIN',      '111345688', '1971-02-24',  'M',    '+15567980011', 'lluain@company.org',     6,      8,          1000001);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '117345689', '1984-06-23',  'M',    '+15567980111', NULL,                     7,      9,          NULL),
('LATIFA',    NULL,       'BELTZ',      '117245689', '1984-02-24',  'F',    '+15569980011', NULL,                     8,      10,         NULL),
('ELINA',     NULL,       'HAUTUM',     '117445689', '1983-06-24',  'F',    '+15567900811', NULL,                     9,      11,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '117545689', '1983-08-12',  'M',    '+15567980211', NULL,                     10,     12,         NULL),
('SOLOMON',   'V',        'TERZI',      '117745689', '1984-09-23',  'M',    '+15567980311', NULL,                     11,     13,         NULL),
('QUINCTUS',  NULL,       'HART',       '113345689', '1990-12-19',  'M',    '+15567980411', NULL,                     12,     14,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '118345689', '1987-06-04',  'F',    '+15567980511', NULL,                     13,     15,         NULL),
('LAURENS',   NULL,       'RUSH',       '114345689', '1989-05-03',  'M',    '+15567980611', NULL,                     14,     16,         NULL),
('SHANNA',    'M',        'PLANCK',     '111342689', '1990-04-02',  'F',    '+15567980711', NULL,                     15,     17,         NULL),
('REINALDO',  'S',        'CLARK',      '117355689', '1988-03-01',  'M',    '+15567980811', NULL,                     16,     18,         NULL);


UPDATE employee
SET manager_id = 1000017
WHERE employee_id < 1000017 AND employee_id > 1000007;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PRINCE',    'S',        'BERGFALK',   '100000001', '1984-06-23',  'M',    '+15567180111', NULL,                     17,     19,         NULL),
('RICO',      NULL,       'MILFORD',    '100000002', '1984-02-24',  'M',    '+15569180011', NULL,                     18,     20,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000003', '1983-06-24',  'M',    '+15567100811', NULL,                     19,     21,         NULL),
('BENVENUTO', 'J',        'BRYAN',      '100000004', '1983-08-12',  'M',    '+15567180211', NULL,                     20,     22,         NULL),
('SARA',      'S',        'COKES',      '100000005', '1984-09-23',  'F',    '+15567180311', NULL,                     21,     23,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000006', '1990-12-19',  'F',    '+15567180411', NULL,                     22,     24,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000007', '1987-06-04',  'F',    '+15567180511', NULL,                     23,     25,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000008', '1989-05-03',  'F',    '+15567180611', NULL,                     24,     26,         NULL),
('KYLEE',     'M',        'DARROW',     '100000009', '1990-04-02',  'F',    '+15567180711', NULL,                     25,     27,         NULL),
('SHIRO',     'G',        'DARZI',      '100000010', '1988-03-01',  'M',    '+15567180811', NULL,                     26,     28,         NULL);


UPDATE employee
SET manager_id = 1000027
WHERE employee_id < 1000027 AND employee_id > 1000017;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'B',        'ANKEREN',    '100000011', '1984-06-23',  'M',    '+15566180111', NULL,                     27,     29,         NULL),
('RICO',      NULL,       'MILFORD',    '100000012', '1984-02-24',  'M',    '+15566180011', NULL,                     28,     30,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000013', '1983-06-24',  'M',    '+15566100811', NULL,                     29,     31,         NULL),
('BENVENUTO', 'A',        'BRYAN',      '100000014', '1983-08-12',  'M',    '+15566180211', NULL,                     30,     32,         NULL),
('SARA',      'T',        'COKES',      '100000015', '1984-09-23',  'F',    '+15566180311', NULL,                     31,     33,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000016', '1990-12-19',  'F',    '+15566180411', NULL,                     32,     34,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000017', '1987-06-04',  'F',    '+15566180511', NULL,                     33,     35,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000018', '1989-05-03',  'F',    '+15566180611', NULL,                     34,     36,         NULL),
('KYLEE',     'O',        'DARROW',     '100000019', '1990-04-02',  'F',    '+15566180711', NULL,                     35,     37,         NULL),
('SHIRO',     'K',        'DARZI',      '100000020', '1988-03-01',  'M',    '+15566180811', NULL,                     36,     38,         NULL);


UPDATE employee
SET manager_id = 1000037
WHERE employee_id < 1000037 AND employee_id > 1000027;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '100000031', '1985-06-13',  'M',    '+25567980221', NULL,                     37,     39,         NULL),
('LATIFA',    NULL,       'BELTZ',      '100000032', '1985-02-14',  'F',    '+25569980221', NULL,                     38,     40,         NULL),
('ELINA',     NULL,       'HAUTUM',     '100000033', '1985-06-14',  'F',    '+25567900221', NULL,                     39,     41,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '100000034', '1985-08-12',  'M',    '+25574980221', NULL,                     40,     42,         NULL),
('SOLOMON',   'V',        'TERZI',      '100000035', '1985-09-13',  'M',    '+25574880221', NULL,                     41,     43,         NULL),
('QUINCTUS',  NULL,       'HART',       '100000036', '1995-12-19',  'M',    '+25568980221', NULL,                     42,     44,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '100000037', '1985-06-14',  'F',    '+25577980221', NULL,                     43,     45,         NULL),
('LAURENS',   NULL,       'RUSH',       '100000038', '1985-05-13',  'M',    '+25587980221', NULL,                     44,     46,         NULL),
('SHANNA',    'M',        'PLANCK',     '100000039', '1995-04-12',  'F',    '+25569980221', NULL,                     45,     47,         NULL),
('REINALDO',  'Q',        'HART',       '100000040', '1985-03-11',  'M',    '+25560980221', NULL,                     46,     48,         NULL);


UPDATE employee
SET manager_id = 1000047
WHERE employee_id < 1000047 AND employee_id > 1000037;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAUTVYDAS', 'C',        'LANG',       '100000041', '1986-06-13',  'M',    '+15567980221', NULL,                     47,     49,         NULL),
('JOAKIM',    NULL,       'LEON',       '100000042', '1986-02-14',  'M',    '+15569980221', NULL,                     48,     50,         NULL),
('VALENTIN',  NULL,       'FIORE',      '100000043', '1986-06-14',  'M',    '+15567900221', NULL,                     49,     51,         NULL),
('SHAHIN',    'G',        'HOBBES',     '100000044', '1986-08-12',  'M',    '+15574980221', NULL,                     50,     52,         NULL),
('EVITA',     'I',        'ACHTEROP',   '100000045', '1986-09-13',  'F',    '+15574880221', NULL,                     51,     53,         NULL),
('REINALDO',  'I',        'CLARKE',     '100000046', '1986-03-11',  'M',    '+15560980221', NULL,                     52,     54,         NULL);


UPDATE employee
SET manager_id = employee_id - 1
WHERE employee_id IN (1000049, 1000051, 1000053);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'J',        'DUPUY',      '100000047', '1984-06-23',  'M',    '+15867980221', NULL,                     53,     55,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000048', '1994-02-24',  'M',    '+15869980221', NULL,                     54,     56,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000049', '1984-06-24',  'F',    '+15867900221', NULL,                     55,     57,         NULL),
('LOLA',      'I',        'PATTERSON',  '100000050', '1984-08-22',  'F',    '+15874980221', NULL,                     56,     58,         NULL),
('DEIRDRE',   'R',        'STRANGE',    '100000051', '1984-09-23',  'F',    '+15874880221', NULL,                     57,     59,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000052', '1964-12-29',  'M',    '+15868980221', NULL,                     58,     60,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000053', '1984-06-24',  'F',    '+15877980221', NULL,                     59,     61,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000054', '1964-05-23',  'M',    '+15887980221', NULL,                     60,     62,         NULL),
('VALERIAN',  'M',        'DABNEY',     '100000055', '1994-04-22',  'F',    '+15869580221', NULL,                     61,     63,         NULL),
('LIANE',     'M',        'MARIA',      '100000056', '1994-04-22',  'F',    '+15869380221', NULL,                     62,     64,         NULL),
('TAAVI',     'B',        'HOUBEN',     '100000057', '1984-03-21',  'M',    '+15860980221', NULL,                     63,     65,         NULL);


UPDATE employee
SET manager_id = 1000063
WHERE employee_id < 1000065 AND employee_id > 1000053 AND NOT employee_id = 1000063;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'A',        'DUPUY',      '100000058', '1982-04-23',  'M',    '+15867910221', NULL,                     64,     66,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000059', '1992-12-24',  'M',    '+15869910221', NULL,                     65,     67,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000060', '1982-04-24',  'F',    '+15867510221', NULL,                     66,     68,         NULL),
('LOLA',      'A',        'PATTERSON',  '100000061', '1982-06-22',  'F',    '+15874910221', NULL,                     67,     69,         NULL),
('DEIRDRE',   'A',        'STRANGE',    '100000062', '1982-07-23',  'F',    '+15874810221', NULL,                     68,     70,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000063', '1962-12-29',  'M',    '+15868910221', NULL,                     69,     71,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000064', '1982-04-24',  'F',    '+15877910221', NULL,                     70,     72,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000065', '1962-03-23',  'M',    '+15887910221', NULL,                     71,     73,         NULL),
('VALERIAN',  'A',        'DABNEY',     '100000066', '1992-02-22',  'F',    '+15869510221', NULL,                     72,     74,         NULL),
('BRIGITTA',  'A',        'MATHEWSON',  '100000067', '1992-02-22',  'F',    '+15869310221', NULL,                     73,     75,         NULL),
('TAAVI',     'A',        'HOUBEN',     '100000068', '1982-01-21',  'M',    '+15860910221', NULL,                     74,     76,         NULL);


UPDATE employee
SET manager_id = 1000074
WHERE employee_id < 1000076 AND employee_id > 1000064 AND NOT employee_id = 1000074;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000069', '1988-04-23',  'M',    '+15867910361', NULL,                     75,     77,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000070', '1998-12-24',  'F',    '+15869910361', NULL,                     76,     78,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000071', '1988-04-24',  'F',    '+15867510361', NULL,                     77,     79,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000072', '1988-06-22',  'F',    '+15874910361', NULL,                     78,     80,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000073', '1988-07-23',  'M',    '+15874810361', NULL,                     79,     81,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000074', '1968-12-29',  'M',    '+15868910361', NULL,                     80,     82,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000075', '1988-04-24',  'M',    '+15877910361', NULL,                     81,     83,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000076', '1968-03-23',  'M',    '+15887910361', NULL,                     82,     84,         NULL),
('SUNE',      'P',        'FOSSE',      '100000077', '1998-02-22',  'F',    '+15869510361', NULL,                     83,     85,         NULL),
('GEORGETA',  'L',        'ALLARD',     '100000078', '1998-02-22',  'F',    '+15869310361', NULL,                     84,     86,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000079', '1988-01-21',  'F',    '+15860910361', NULL,                     85,     87,         NULL);


UPDATE employee
SET manager_id = 1000085
WHERE employee_id < 1000087 AND employee_id > 1000075 AND NOT employee_id = 1000085;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000080', '1988-04-23',  'M',    '+25867910361', NULL,                     86,     88,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000081', '1998-12-24',  'F',    '+25869910361', NULL,                     87,     89,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000082', '1988-04-24',  'F',    '+25867510361', NULL,                     88,     90,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000083', '1988-06-22',  'F',    '+25874910361', NULL,                     89,     91,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000084', '1988-07-23',  'M',    '+25874810361', NULL,                     90,     92,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000085', '1968-12-29',  'M',    '+25868910361', NULL,                     91,     93,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000086', '1988-04-24',  'M',    '+25877910361', NULL,                     92,     94,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000087', '1968-03-23',  'M',    '+25887910361', NULL,                     93,     95,         NULL),
('SUNE',      'P',        'FOSSE',      '100000088', '1998-02-22',  'F',    '+25869510361', NULL,                     94,     96,         NULL),
('SANDRA',    'M',        'ALLARD',     '100000089', '1998-02-22',  'F',    '+25869310361', NULL,                     95,     97,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000090', '1988-01-21',  'F',    '+25860910361', NULL,                     96,     98,         NULL);


UPDATE employee
SET manager_id = 1000096
WHERE employee_id < 1000098 AND employee_id > 1000086 AND NOT employee_id = 1000096;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000091', '1988-04-23',  'M',    '+15067910361', NULL,                     97,     99,         1000063),
('KRISTIN',   NULL,       'SCRIVEN',    '100000092', '1998-12-24',  'F',    '+15069910361', NULL,                     98,     100,        1000063),
('MONIKA',    NULL,       'INGESSON',   '100000093', '1988-04-24',  'F',    '+15067510361', NULL,                     99,     101,        1000074),
('VASIA',     'K',        'MIYAZAKI',   '100000094', '1988-06-22',  'F',    '+15074910361', NULL,                     100,    102,        1000074),
('FAIRUZ',    'H',        'BYRD',       '100000095', '1988-07-23',  'M',    '+15074810361', NULL,                     101,    103,        1000085),
('SULEYMAN',  NULL,       'KURZMANN',   '100000096', '1968-12-29',  'M',    '+15068910361', NULL,                     102,    104,        1000085),
('FELIX',     NULL,       'LINDQVIST',  '100000097', '1988-04-24',  'M',    '+25077910361', NULL,                     103,    105,        1000096),
('TSHEPO',    NULL,       'BEST',       '100000098', '1968-03-23',  'M',    '+25087910361', NULL,                     104,    106,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'S',        'CORNELL',    '100000099', '1988-04-23',  'M',    NULL,           NULL,                     105,    107,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000100', '1998-12-24',  'F',    NULL,           NULL,                     106,    108,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000101', '1988-04-24',  'F',    NULL,           NULL,                     107,    109,        NULL),
('VASIA',     'R',        'MIYAZAKI',   '100000102', '1988-06-22',  'F',    NULL,           NULL,                     108,    110,        NULL),
('FAIRUZ',    'Q',        'BYRD',       '100000103', '1988-07-23',  'M',    NULL,           NULL,                     109,    111,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000104', '1968-12-29',  'M',    NULL,           NULL,                     110,    112,        NULL),
('NAMEY',     NULL,       'LINDQVIST',  '100000105', '1988-04-24',  'M',    NULL,           NULL,                     111,    113,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000106', '1988-04-24',  'M',    NULL,           NULL,                     112,    114,        NULL),
('HIDEKI',    'P',        'CORNELL',    '100000107', '1988-04-23',  'M',    NULL,           NULL,                     113,    115,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000108', '1998-12-24',  'F',    NULL,           NULL,                     114,    116,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000109', '1988-04-24',  'F',    NULL,           NULL,                     115,    117,        NULL),
('VASIA',     'O',        'MIYAZAKI',   '100000110', '1988-06-22',  'F',    NULL,           NULL,                     116,    118,        NULL),
('FAIRUZ',    'N',        'BYRD',       '100000111', '1988-07-23',  'M',    NULL,           NULL,                     117,    119,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000112', '1968-12-29',  'M',    NULL,           NULL,                     118,    120,        NULL),
('AMY',       NULL,       'LINDQVIST',  '100000113', '1988-04-24',  'F',    NULL,           NULL,                     119,    121,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000114', '1988-04-24',  'M',    NULL,           NULL,                     120,    122,        NULL),
('HIDEKI',    'M',        'CORNELL',    '100000115', '1988-04-23',  'M',    NULL,           NULL,                     121,    123,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000116', '1998-12-24',  'F',    NULL,           NULL,                     122,    124,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000117', '1988-04-24',  'F',    NULL,           NULL,                     123,    125,        NULL),
('VASIA',     'L',        'MIYAZAKI',   '100000118', '1988-06-22',  'F',    NULL,           NULL,                     124,    126,        NULL),
('FAIRUZ',    'K',        'BYRD',       '100000119', '1988-07-23',  'M',    NULL,           NULL,                     125,    127,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000120', '1968-12-29',  'M',    NULL,           NULL,                     126,    128,        NULL),
('FELIX',     NULL,       'ULG',        '100000121', '1988-04-24',  'M',    NULL,           NULL,                     127,    129,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000122', '1988-04-24',  'M',    NULL,           NULL,                     128,    130,        NULL),
('HIDEKI',    'J',        'CORNELL',    '100000123', '1988-04-23',  'M',    NULL,           NULL,                     129,    131,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000124', '1998-12-24',  'F',    NULL,           NULL,                     130,    132,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000125', '1988-04-24',  'F',    NULL,           NULL,                     131,    133,        NULL),
('VASIA',     'H',        'MIYAZAKI',   '100000126', '1988-06-22',  'F',    NULL,           NULL,                     132,    134,        NULL),
('FAIRUZ',    'I',        'BYRD',       '100000127', '1988-07-23',  'M',    NULL,           NULL,                     133,    135,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000128', '1968-12-29',  'M',    NULL,           NULL,                     134,    136,        NULL),
('FELIX',     NULL,       'KURZMANN',   '100000129', '1988-04-24',  'M',    NULL,           NULL,                     135,    137,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000130', '1988-04-24',  'M',    NULL,           NULL,                     136,    138,        NULL),
('HIDEKI',    'G',        'CORNELL',    '100000131', '1988-04-23',  'M',    NULL,           NULL,                     137,    139,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000132', '1998-12-24',  'F',    NULL,           NULL,                     138,    140,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000133', '1988-04-24',  'F',    NULL,           NULL,                     139,    141,        NULL),
('VASIA',     'F',        'MIYAZAKI',   '100000134', '1988-06-22',  'F',    NULL,           NULL,                     140,    142,        NULL),
('FAIRUZ',    'E',        'BYRD',       '100000135', '1988-07-23',  'M',    NULL,           NULL,                     141,    143,        NULL),
('HERSHALL',  NULL,       'KURZMANN',   '100000136', '1968-12-29',  'M',    NULL,           NULL,                     142,    144,        NULL),
('JEREMY',    NULL,       'LINDQVIST',  '100000137', '1988-04-24',  'M',    NULL,           NULL,                     143,    145,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000138', '1988-04-24',  'M',    NULL,           NULL,                     144,    146,        NULL),
('HIDEKI',    'C',        'CORNELL',    '100000139', '1988-04-23',  'M',    NULL,           NULL,                     145,    147,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000140', '1998-12-24',  'F',    NULL,           NULL,                     146,    148,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000141', '1988-04-24',  'F',    NULL,           NULL,                     147,    149,        NULL),
('VASIA',     'B',        'MIYAZAKI',   '100000142', '1988-06-22',  'F',    NULL,           NULL,                     148,    150,        NULL),
('MARK',      'A',        'BYRD',       '100000143', '1988-07-23',  'M',    NULL,           NULL,                     149,    151,        NULL),
('JOHN',      NULL,       'KURZMANN',   '100000144', '1968-12-29',  'M',    NULL,           NULL,                     150,    152,        NULL),
('KARL',      NULL,       'LINDQVIST',  '100000145', '1988-04-24',  'M',    NULL,           NULL,                     151,    153,        NULL),
('JOHN',      NULL,       'LINDQVIST',  '100000146', '1988-04-24',  'M',    NULL,           NULL,                     152,    154,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PROPSPER',  'S',        'ALFERINK',   '100000147', '1988-04-23',  'M',    NULL,           NULL,                     153,    155,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BEATRICE',  'S',        'ABBADELLI',  '100000148', '1988-04-23',  'F',    NULL,           NULL,                     154,    156,        1000154),
('KUROSH',    NULL,       'ABBADELLI',  '100000149', '1988-04-23',  'M',    NULL,           NULL,                     155,    157,        1000154),
('LUKAS',     NULL,       'ABBADELLI',  '100000150', '1988-04-23',  'M',    NULL,           NULL,                     156,    158,        1000154);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000151', '1988-04-23',  'M',    NULL,           NULL,                     157,    159,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('FRANCO',    'S',        'CALVO',      '100000152', '1989-04-23',  'M',    NULL,           NULL,                     158,    160,        1000158),
('ALVA',      NULL,       'SERAFINI',   '100000153', '1989-05-23',  'F',    NULL,           NULL,                     159,    161,        1000158),
('LUKAS',     NULL,       'CALVO',      '100000154', '1985-08-28',  'M',    NULL,           NULL,                     160,    162,        1000158);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000155', '1988-04-23',  'M',    NULL,           NULL,                     161,    163,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'S',        'JEANS',      '100000156', '1989-04-23',  'M',    NULL,           NULL,                     162,    164,        1000162),
('HARRY',     NULL,       'NOSE',       '100000157', '1989-05-23',  'M',    NULL,           NULL,                     163,    165,        1000162),
('BARNEY',    NULL,       'BILLS',      '100000158', '1985-08-28',  'M',    NULL,           NULL,                     164,    166,        1000162);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'J',        'JEANS',      '100000159', '1989-04-23',  'M',    NULL,           NULL,                     165,    167,        1000063),
('HARRY',     NULL,       'NOSEN',      '100000160', '1989-05-23',  'M',    NULL,           NULL,                     166,    168,        1000063),
('BARNEY',    NULL,       'BILLS',      '100000161', '1985-08-28',  'M',    NULL,           NULL,                     167,    169,        1000074),
('JIMMY',     'P',        'JEANS',      '100000162', '1989-04-23',  'M',    NULL,           NULL,                     168,    170,        1000074),
('BARRY',     NULL,       'NOSE',       '100000163', '1989-05-23',  'M',    NULL,           NULL,                     169,    171,        1000085),
('BARNEY',    NULL,       'BILLS',      '100000164', '1985-08-28',  'M',    NULL,           NULL,                     170,    172,        1000085),
('JIMMOTHY',  'S',        'JENSON',     '100000165', '1989-04-23',  'M',    NULL,           NULL,                     171,    173,        1000096),
('LARRY',     NULL,       'NOSE',       '100000166', '1989-05-23',  'M',    NULL,           NULL,                     172,    174,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANNE',      'S',        'PERROT',     '100000167', '1975-04-23',  'F',    NULL,           NULL,                     173,    175,        NULL),
('SAWDA',     NULL,       'PAPOUTSIS',  '100000168', '1975-05-23',  'F',    NULL,           NULL,                     174,    176,        NULL),
('BARNEY',    NULL,       'DINO',       '100000169', '1974-08-28',  'M',    NULL,           NULL,                     175,    177,        NULL),
('JACOBA',    'A',        'PENA',       '100000170', '1974-04-23',  'M',    NULL,           NULL,                     176,    178,        NULL),
('SEONG',     NULL,       'KOOLS',      '100000171', '1974-05-23',  'F',    NULL,           NULL,                     177,    179,        NULL),
('IKENNA',    NULL,       'ROMILLY',    '100000172', '1974-08-28',  'F',    NULL,           NULL,                     178,    180,        NULL),
('FERNANDO',  'V',        'BRICE',      '100000173', '1974-04-23',  'M',    NULL,           NULL,                     179,    181,        NULL),
('HORACIO',   NULL,       'KURZ',       '100000174', '1974-05-23',  'M',    NULL,           NULL,                     180,    182,        NULL);


UPDATE employee
SET manager_id = 1000179
WHERE employee_id IN (1000176, 1000177, 1000181);


UPDATE employee
SET manager_id = 1000180
WHERE employee_id IN (1000174, 1000175, 1000178, 1000179);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'WILDGRUBE',  '100000175', '1975-04-23',  'F',    NULL,           NULL,                     181,    183,        NULL),
('STARR',     NULL,       'GARNETT',    '100000176', '1975-05-23',  'F',    NULL,           NULL,                     182,    184,        NULL),
('PING',      NULL,       'DINO',       '100000177', '1974-08-28',  'M',    NULL,           NULL,                     183,    185,        NULL),
('JEF',       'C',        'COMO',       '100000178', '1974-04-23',  'M',    NULL,           NULL,                     184,    186,        NULL),
('SEVERINE',  NULL,       'BJARNESEN',  '100000179', '1974-05-23',  'F',    NULL,           NULL,                     185,    187,        NULL),
('HUAN',      NULL,       'LEIFSSON',   '100000180', '1974-08-28',  'M',    NULL,           NULL,                     186,    188,        NULL),
('LINWOOD',   'O',        'COOKE',      '100000181', '1974-04-23',  'M',    NULL,           NULL,                     187,    189,        NULL),
('PEPE',      NULL,       'GARDINER',   '100000182', '1974-05-23',  'M',    NULL,           NULL,                     188,    190,        NULL);


UPDATE employee
SET manager_id = 1000187
WHERE employee_id IN (1000184, 1000185, 1000189);


UPDATE employee
SET manager_id = 1000188
WHERE employee_id IN (1000182, 1000183, 1000186, 1000187);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAISIA',    'S',        'ROSE',       '100000183', '1975-04-23',  'F',    NULL,           NULL,                     189,    191,        NULL),
('OLGA',      NULL,       'SCHULTHEISS','100000184', '1975-05-23',  'F',    NULL,           NULL,                     190,    192,        NULL),
('KYOU',      NULL,       'SUZUKI',     '100000185', '1970-08-28',  'F',    NULL,           NULL,                     191,    193,        NULL),
('ROLLO',     'D',        'SHORT',      '100000186', '1970-04-23',  'M',    NULL,           NULL,                     192,    194,        NULL),
('LEONARDO',  NULL,       'BJARNESEN',  '100000187', '1970-05-23',  'M',    NULL,           NULL,                     193,    195,        NULL),
('HUAN',      NULL,       'ROSE',       '100000188', '1970-08-28',  'M',    NULL,           NULL,                     194,    196,        NULL),
('FLAVIA',    'O',        'MOROZOV',    '100000189', '1970-04-23',  'M',    NULL,           NULL,                     195,    197,        NULL),
('CORINNA',   NULL,       'WERNHER',    '100000190', '1970-05-23',  'M',    NULL,           NULL,                     196,    198,        NULL);


UPDATE employee
SET manager_id = 1000195
WHERE employee_id IN (1000192, 1000193, 1000197);


UPDATE employee
SET manager_id = 1000196
WHERE employee_id IN (1000190, 1000191, 1000194, 1000195);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MAXINE',    'A',        'THAIDHG',    '100000191', '1975-04-23',  'F',    NULL,           NULL,                     197,    199,        NULL),
('MARCEAU',   NULL,       'OTTEN',      '100000192', '2000-05-23',  'M',    NULL,           NULL,                     198,    200,        NULL),
('HARLOW',    NULL,       'ARENDOK',    '100000193', '1970-08-28',  'M',    NULL,           NULL,                     199,    201,        NULL);


UPDATE employee
SET manager_id = 1000198
WHERE employee_id = 1000199;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANDRE',     'K',        'GILBERT',    '100000194', '1975-05-23',  'M',    NULL,           NULL,                     200,    202,        NULL),
('EMIL',      NULL,       'TRAVERSO',   '100000195', '2000-08-23',  'M',    NULL,           NULL,                     201,    203,        NULL),
('SEPHORA',   NULL,       'VILLENEUVE', '100000196', '1971-08-28',  'F',    NULL,           NULL,                     202,    204,        NULL);


UPDATE employee
SET manager_id = 1000201
WHERE employee_id = 1000202;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AFAF',      'S',        'LOWE',       '100000197', '1975-04-23',  'M',    NULL,           NULL,                     203,    205,        NULL),
('MAXIME',    NULL,       'LAMBERT',    '100000198', '2001-08-23',  'M',    NULL,           NULL,                     204,    206,        NULL),
('TERZO',     NULL,       'HERZOG',     '100000199', '1970-08-28',  'F',    NULL,           NULL,                     205,    207,        NULL);


UPDATE employee
SET manager_id = 1000204
WHERE employee_id = 1000205;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'LOWE',       '100000200', '1975-04-23',  'F',    NULL,           NULL,                     206,    208,        NULL),
('STARR',     NULL,       'LAMBERT',    '100000201', '2001-08-23',  'F',    NULL,           NULL,                     207,    209,        NULL),
('PING',      NULL,       'HERZOG',     '100000202', '1970-08-28',  'M',    NULL,           NULL,                     208,    210,        NULL),
('JEF',       'H',        'LOWE',       '100000203', '1975-04-23',  'M',    NULL,           NULL,                     209,    211,        NULL),
('SEVERINE',  NULL,       'LAMBERT',    '100000204', '2001-08-23',  'F',    NULL,           NULL,                     210,    212,        NULL),
('HUAN',      NULL,       'HERZOG',     '100000205', '1970-08-28',  'F',    NULL,           NULL,                     211,    213,        NULL);


UPDATE employee
SET manager_id = 1000210
WHERE employee_id = 1000209;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'P',        'LOWE',       '100000206', '1978-12-01',  'M',    NULL,           NULL,                     212,    214,        NULL),
('RICO',      NULL,       'LAMBERT',    '100000207', '1999-04-02',  'M',    NULL,           NULL,                     213,    215,        NULL),
('DEVARAJ',   NULL,       'HERZOG',     '100000208', '1978-03-03',  'M',    NULL,           NULL,                     214,    216,        NULL),
('BENVENUTO', 'L',        'LOWE',       '100000209', '1978-02-04',  'M',    NULL,           NULL,                     215,    217,        NULL),
('SARA',      NULL,       'LAMBERT',    '100000210', '1999-01-05',  'F',    NULL,           NULL,                     216,    218,        NULL),
('LALE',      NULL,       'HERZOG',     '100000211', '1978-05-06',  'M',    NULL,           NULL,                     217,    219,        NULL);


UPDATE employee
SET manager_id = 1000216
WHERE employee_id = 1000215;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('RAJ',       'D',        'OSBOURNE',   '100000212', '1978-12-01',  'M',    NULL,           NULL,                     218,    220,        NULL),
('SIMONE',    NULL,       'ASIS',       '100000213', '1999-04-02',  'F',    NULL,           NULL,                     219,    221,        NULL),
('JOLINE',    NULL,       'LEEUWENHOEK','100000214', '1978-03-03',  'F',    NULL,           NULL,                     220,    222,        NULL),
('YULIA',     'L',        'THAIDHG',    '100000215', '1978-02-04',  'F',    NULL,           NULL,                     221,    223,        NULL),
('CY',        NULL,       'NEAL',       '100000216', '1999-01-05',  'M',    NULL,           NULL,                     222,    224,        NULL),
('ANDREA',    NULL,       'MCCREERY',   '100000217', '1978-05-06',  'F',    NULL,           NULL,                     223,    225,        NULL);


UPDATE employee
SET manager_id = 1000222
WHERE employee_id = 1000221;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('SIMONE',    NULL,       'MCCREERY',   '100000218', '1999-04-02',  'F',    NULL,           NULL,                     224,    226,        NULL),
('JOLINE',    NULL,       'NEAL',       '100000219', '1978-03-03',  'F',    NULL,           NULL,                     225,    227,        NULL),
('YULIA',     'L',        'SMITH',      '100000220', '1978-02-04',  'F',    NULL,           NULL,                     226,    228,        NULL),
('CY',        NULL,       'ASIS',       '100000221', '1999-01-05',  'M',    NULL,           NULL,                     227,    229,        NULL),
('ANDREA',    NULL,       'OSBOURNE',   '100000222', '1978-05-06',  'F',    NULL,           NULL,                     228,    230,        NULL),

('SUHAIL',    NULL,       'ROSE',       '100000223', '1999-04-02',  'M',    NULL,           NULL,                     229,    231,        NULL),
('NUAN',      NULL,       'SCHULTHEISS','100000224', '1978-03-03',  'M',    NULL,           NULL,                     230,    232,        NULL),
('INNOKENTI', 'L',        'SUZUKI',     '100000225', '1978-02-04',  'M',    NULL,           NULL,                     231,    233,        NULL),
('KENTIGERN', NULL,       'SHORT',      '100000226', '1999-01-05',  'M',    NULL,           NULL,                     232,    234,        NULL),
('RIEN',      NULL,       'BJARNESEN',  '100000227', '1978-05-06',  'M',    NULL,           NULL,                     233,    235,        NULL),

('SUHAIL',    NULL,       'PORCHER',    '100000228', '1999-04-02',  'M',    NULL,           NULL,                     234,    236,        NULL),
('NUAN',      NULL,       'BAUMGARTEN', '100000229', '1978-03-03',  'M',    NULL,           NULL,                     235,    237,        NULL),
('INNOKENTI', 'L',        'MIKHAILOV',  '100000230', '1978-02-04',  'M',    NULL,           NULL,                     236,    238,        NULL),
('KENTIGERN', NULL,       'BAGGI',      '100000231', '1999-01-05',  'M',    NULL,           NULL,                     237,    239,        NULL),
('RIEN',      NULL,       'NOYER',      '100000232', '1978-05-06',  'M',    NULL,           NULL,                     238,    240,        NULL),

('SIMONE',    NULL,       'PORCHER',    '100000233', '1999-04-02',  'F',    NULL,           NULL,                     239,    241,        NULL),
('JOLINE',    NULL,       'BAUMGARTEN', '100000234', '1978-03-03',  'M',    NULL,           NULL,                     240,    242,        NULL),
('YULIA',     'L',        'MIKHAILOV',  '100000235', '1978-02-04',  'M',    NULL,           NULL,                     241,    243,        NULL),
('CY',        NULL,       'BAGGI',      '100000236', '1999-01-05',  'M',    NULL,           NULL,                     242,    244,        NULL),
('ANDREA',    NULL,       'NOYER',      '100000237', '1978-05-06',  'M',    NULL,           NULL,                     243,    245,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('LAWYER',    'D',        'SAWYER',     '100000238', '1978-12-01',  'M',    NULL,           NULL,                     244,    246,        NULL),
('SIMONE',    NULL,       'LAW',        '100000239', '1999-04-02',  'F',    NULL,           NULL,                     245,    247,        NULL),
('JOE',       NULL,       'TURNEY',     '100000240', '1978-03-03',  'M',    NULL,           NULL,                     246,    248,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'SAWYER',     '100000241', '1978-12-01',  'M',    NULL,           NULL,                     247,    249,        NULL),
('NATHAN',    NULL,       'TURNER',     '100000242', '1999-04-02',  'M',    NULL,           NULL,                     248,    250,        NULL),
('ELISE',     NULL,       'STEEL',      '100000243', '1978-03-03',  'F',    NULL,           NULL,                     249,    251,        NULL),
('MARY',      NULL,       'SUE',        '100000244', '1978-03-03',  'F',    NULL,           NULL,                     250,    252,        NULL);


UPDATE employee
SET manager_id = 1000250
WHERE employee_id > 1000247 AND NOT employee_id = 1000250;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'GOLD',       '100000245', '1965-12-01',  'M',    NULL,           'jgold@company.org',      251,    253,        NULL),
('NATHAN',    NULL,       'SILVER',     '100000246', '1966-04-02',  'M',    NULL,           'nsilver@company.org',    252,    254,        NULL),
('ELISE',     NULL,       'BRONZE',     '100000247', '1967-03-14',  'F',    NULL,           'ebronze@company.org',    253,    255,        NULL),
('MARY',      NULL,       'COPPER',     '100000248', '1968-03-04',  'F',    NULL,           'mcopper@company.org',    254,    256,        NULL),
('JOHN',      'K',        'BRASS',      '100000249', '1969-12-11',  'M',    NULL,           'jbrass@company.org',     255,    257,        NULL),
('NEIL',      NULL,       'ZINC',       '100000250', '1965-07-02',  'M',    NULL,           'nzinc@company.org',      256,    258,        NULL),
('ELLEN',     NULL,       'TIN',        '100000251', '1966-03-03',  'F',    NULL,           'etin@company.org',       257,    259,        NULL),
('MYRTLE',    NULL,       'PEWTER',     '100000252', '1967-04-03',  'F',    NULL,           'mpewter@company.org',    258,    260,        NULL),
('JERKYLL',   'G',        'LEAD',       '100000253', '1968-12-06',  'M',    NULL,           'jlead@company.org',      259,    261,        NULL),
('NERRY',     NULL,       'CHROMIUM',   '100000254', '1969-04-02',  'M',    NULL,           'nchromium@company.org',  260,    262,        NULL),
('PENELOPE',  NULL,       'IRON',       '100000255', '1970-03-03',  'F',    NULL,           'eiron@company.org',      261,    263,        NULL);


-- Create department heads
UPDATE department
SET department_head_id = 1000000
WHERE department_id = 1;


UPDATE department
SET department_head_id = 1000252
WHERE department_id = 2;


UPDATE department
SET department_head_id = 1000253
WHERE department_id = 3;


UPDATE department
SET department_head_id = 1000254
WHERE department_id = 4;


UPDATE department
SET department_head_id = 1000255
WHERE department_id = 5;


UPDATE department
SET department_head_id = 1000256
WHERE department_id = 6;


UPDATE department
SET department_head_id = 1000257
WHERE department_id = 7;


UPDATE department
SET department_head_id = 1000258
WHERE department_id = 8;


UPDATE department
SET department_head_id = 1000259
WHERE department_id = 9;


UPDATE department
SET department_head_id = 1000260
WHERE department_id = 10;


UPDATE department
SET department_head_id = 1000261
WHERE department_id = 11;


UPDATE department
SET department_head_id = 1000262
WHERE department_id = 12;


-- Salary
INSERT INTO salary (employee_id, hourly_wage, annual_bonus) VALUES
(1000000, '$375', '$700,000'),
(1000001, '$100', '$250,000'),
(1000002, '$90',  '$200,000'),
(1000003, '$50',  '$120,000'),
(1000004, '$100', '$200,000'),
(1000005, '$35',  '$100,000'),
(1000006, '$35',  '$100,000'),
(1000007, '$35',  '$100,000'),
(1000008, '$30', '$1,000'),
(1000009, '$30', '$1,000'),
(1000010, '$40', '$1,000'),
(1000011, '$30', '$1,000'),
(1000012, '$25', '$1,000'),
(1000013, '$22', '$1,000'),
(1000014, '$22', '$1,000'),
(1000015, '$18', '$1,000'),
(1000016, '$20', '$1,000'),
(1000017, '$40', '$1,000'),
(1000018, '$30', '$1,000'),
(1000019, '$30', '$1,000'),
(1000020, '$40', '$1,000'),
(1000021, '$30', '$1,000'),
(1000022, '$25', '$1,000'),
(1000023, '$22', '$1,000'),
(1000024, '$22', '$1,000'),
(1000025, '$18', '$1,000'),
(1000026, '$20', '$1,000'),
(1000027, '$40', '$1,000'),
(1000028, '$30', '$1,000'),
(1000029, '$30', '$1,000'),
(1000030, '$40', '$1,000'),
(1000031, '$30', '$1,000'),
(1000032, '$25', '$1,000'),
(1000033, '$22', '$1,000'),
(1000034, '$22', '$1,000'),
(1000035, '$18', '$1,000'),
(1000036, '$20', '$1,000'),
(1000037, '$40', '$1,000'),
(1000038, '$30', '$1,000'),
(1000039, '$30', '$1,000'),
(1000040, '$40', '$1,000'),
(1000041, '$30', '$1,000'),
(1000042, '$25', '$1,000'),
(1000043, '$22', '$1,000'),
(1000044, '$22', '$1,000'),
(1000045, '$18', '$1,000'),
(1000046, '$20', '$1,000'),
(1000047, '$40', '$1,000'),
(1000048, '$40', '$5,000'),
(1000049, '$34', '$3,000'),
(1000050, '$42', '$5,000'),
(1000051, '$34', '$3,000'),
(1000052, '$40', '$5,000'),
(1000053, '$34', '$3,000'),
(1000054, '$30', '$1,000'),
(1000055, '$30', '$1,000'),
(1000056, '$40', '$1,000'),
(1000057, '$30', '$1,000'),
(1000058, '$25', '$1,000'),
(1000059, '$22', '$1,000'),
(1000060, '$22', '$1,000'),
(1000061, '$18', '$1,000'),
(1000062, '$20', '$1,000'),
(1000063, '$35', '$1,000'),
(1000064, '$40', '$1,000'),
(1000065, '$30', '$1,000'),
(1000066, '$30', '$1,000'),
(1000067, '$40', '$1,000'),
(1000068, '$30', '$1,000'),
(1000069, '$25', '$1,000'),
(1000070, '$22', '$1,000'),
(1000071, '$22', '$1,000'),
(1000072, '$18', '$1,000'),
(1000073, '$20', '$1,000'),
(1000074, '$35', '$1,000'),
(1000075, '$40', '$1,000'),
(1000076, '$30', '$1,000'),
(1000077, '$30', '$1,000'),
(1000078, '$40', '$1,000'),
(1000079, '$30', '$1,000'),
(1000080, '$25', '$1,000'),
(1000081, '$22', '$1,000'),
(1000082, '$22', '$1,000'),
(1000083, '$18', '$1,000'),
(1000084, '$20', '$1,000'),
(1000085, '$35', '$1,000'),
(1000086, '$40', '$1,000'),
(1000087, '$30', '$1,000'),
(1000088, '$30', '$1,000'),
(1000089, '$40', '$1,000'),
(1000090, '$30', '$1,000'),
(1000091, '$25', '$1,000'),
(1000092, '$22', '$1,000'),
(1000093, '$22', '$1,000'),
(1000094, '$18', '$1,000'),
(1000095, '$20', '$1,000'),
(1000096, '$35', '$1,000'),
(1000097, '$40', '$1,000'),
(1000098, '$30', '$10,000'),
(1000099, '$30', '$10,000'),
(1000100, '$40', '$10,000'),
(1000101, '$30', '$10,000'),
(1000102, '$25', '$10,000'),
(1000103, '$22', '$10,000'),
(1000104, '$22', '$10,000'),
(1000105, '$18', '$10,000'),
(1000106, '$40', '$10,000'),
(1000107, '$40', '$10,000'),
(1000108, '$40', '$10,000'),
(1000109, '$40', '$10,000'),
(1000110, '$40', '$10,000'),
(1000111, '$40', '$10,000'),
(1000112, '$40', '$10,000'),
(1000113, '$40', '$10,000'),
(1000114, '$40', '$10,000'),
(1000115, '$40', '$10,000'),
(1000116, '$40', '$10,000'),
(1000117, '$40', '$10,000'),
(1000118, '$40', '$10,000'),
(1000119, '$40', '$10,000'),
(1000120, '$40', '$10,000'),
(1000121, '$40', '$10,000'),
(1000122, '$40', '$10,000'),
(1000123, '$40', '$10,000'),
(1000124, '$40', '$10,000'),
(1000125, '$40', '$10,000'),
(1000126, '$40', '$10,000'),
(1000127, '$40', '$10,000'),
(1000128, '$40', '$10,000'),
(1000129, '$40', '$10,000'),
(1000130, '$40', '$10,000'),
(1000131, '$40', '$10,000'),
(1000132, '$40', '$10,000'),
(1000133, '$40', '$10,000'),
(1000134, '$40', '$10,000'),
(1000135, '$40', '$10,000'),
(1000136, '$40', '$10,000'),
(1000137, '$40', '$10,000'),
(1000138, '$40', '$10,000'),
(1000139, '$40', '$10,000'),
(1000140, '$40', '$10,000'),
(1000141, '$40', '$10,000'),
(1000142, '$40', '$10,000'),
(1000143, '$40', '$10,000'),
(1000144, '$40', '$10,000'),
(1000145, '$40', '$10,000'),
(1000146, '$40', '$10,000'),
(1000147, '$40', '$10,000'),
(1000148, '$40', '$10,000'),
(1000149, '$40', '$10,000'),
(1000150, '$40', '$10,000'),
(1000151, '$40', '$10,000'),
(1000152, '$40', '$10,000'),
(1000153, '$40', '$10,000'),
(1000154, '$30', '$10,000'),
(1000155, '$30', '$10,000'),
(1000156, '$40', '$10,000'),
(1000157, '$15', '$0'),
(1000158, '$25', '$10,000'),
(1000159, '$22', '$10,000'),
(1000160, '$22', '$10,000'),
(1000161, '$15', '$0'),
(1000162, '$25', '$10,000'),
(1000163, '$22', '$10,000'),
(1000164, '$22', '$10,000'),
(1000165, '$15', '$0'),
(1000166, '$30', '$1,000'),
(1000167, '$30', '$1,000'),
(1000168, '$20', '$1,000'),
(1000169, '$30', '$1,000'),
(1000170, '$25', '$1,000'),
(1000171, '$22', '$1,000'),
(1000172, '$22', '$1,000'),
(1000173, '$18', '$1,000'),
(1000174, '$35', '$2,250'),
(1000175, '$35', '$2,500'),
(1000176, '$28', '$1,000'),
(1000177, '$24', '$1,000'),
(1000178, '$29', '$1,000'),
(1000179, '$31', '$1,000'),
(1000180, '$40', '$1,000'),
(1000181, '$20', '$0'),
(1000182, '$35', '$2,250'),
(1000183, '$35', '$2,500'),
(1000184, '$28', '$1,000'),
(1000185, '$24', '$1,000'),
(1000186, '$29', '$1,000'),
(1000187, '$31', '$1,000'),
(1000188, '$40', '$1,000'),
(1000189, '$20', '$0'),
(1000190, '$35', '$2,250'),
(1000191, '$35', '$2,500'),
(1000192, '$28', '$1,000'),
(1000193, '$24', '$1,000'),
(1000194, '$29', '$1,000'),
(1000195, '$31', '$1,000'),
(1000196, '$40', '$1,000'),
(1000197, '$20', '$0'),
(1000198, '$35', '$2,250'),
(1000199, '$16', '$0'),
(1000200, '$20', '$1,000'),
(1000201, '$28', '$1,000'),
(1000202, '$20', '$1,000'),
(1000203, '$15', '$0'),
(1000204, '$29', '$1,000'),
(1000205, '$20', '$1,000'),
(1000206, '$15.50', '$0'),
(1000207, '$20', '$2,250'),
(1000208, '$20', '$2,250'),
(1000209, '$30', '$2,250'),
(1000210, '$40', '$2,250'),
(1000211, '$20', '$2,250'),
(1000212, '$40', '$2,250'),
(1000213, '$20', '$2,250'),
(1000214, '$20', '$2,250'),
(1000215, '$30', '$2,250'),
(1000216, '$40', '$2,250'),
(1000217, '$20', '$2,250'),
(1000218, '$40', '$2,250'),
(1000219, '$20', '$2,250'),
(1000220, '$20', '$2,250'),
(1000221, '$30', '$2,250'),
(1000222, '$40', '$2,250'),
(1000223, '$20', '$2,250'),
(1000224, '$40', '$2,250'),
(1000225, '$40', '$10,000'),
(1000226, '$40', '$10,000'),
(1000227, '$40', '$10,000'),
(1000228, '$40', '$10,000'),
(1000229, '$40', '$10,000'),
(1000230, '$40', '$10,000'),
(1000231, '$40', '$10,000'),
(1000232, '$40', '$10,000'),
(1000233, '$40', '$10,000'),
(1000234, '$40', '$10,000'),
(1000235, '$40', '$10,000'),
(1000236, '$40', '$10,000'),
(1000237, '$40', '$10,000'),
(1000238, '$40', '$10,000'),
(1000239, '$40', '$10,000'),
(1000240, '$40', '$10,000'),
(1000241, '$40', '$10,000'),
(1000242, '$40', '$10,000'),
(1000243, '$40', '$10,000'),
(1000244, '$40', '$10,000'),
(1000245, '$40', '$10,000'),
(1000246, '$40', '$10,000'),
(1000247, '$40', '$10,000'),
(1000248, '$35', '$10,000'),
(1000249, '$30', '$10,000'),
(1000250, '$40', '$10,000'),
(1000251, '$16', '$0'),
(1000252, '$50', '$90,000'),
(1000253, '$50', '$90,000'),
(1000254, '$50', '$90,000'),
(1000255, '$50', '$90,000'),
(1000256, '$50', '$90,000'),
(1000257, '$50', '$90,000'),
(1000258, '$50', '$90,000'),
(1000259, '$50', '$90,000'),
(1000260, '$50', '$90,000'),
(1000261, '$50', '$90,000'),
(1000262, '$50', '$90,000');


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-01-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-02-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-03-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-04-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 1:55:18 PM */
-- Delete employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM employee
WHERE employee_id = '1000008'
COMMIT;
END TRANSACTION;

/* 12/1/2021, 1:55:39 PM */
-- Update employee details
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Check employee exists
SELECT employee_id
FROM employee
WHERE employee_id = '1000009';
UPDATE employee
SET
	last_name = 'SYEDA'
WHERE employee_id = '1000009';
COMMIT;
END TRANSACTION;

/* 12/1/2021, 1:55:59 PM */
-- Delete all tables
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DROP TABLE IF EXISTS payroll          CASCADE;
DROP TABLE IF EXISTS benefits         CASCADE;
DROP TABLE IF EXISTS salary           CASCADE;
DROP TABLE IF EXISTS leave            CASCADE;
DROP TABLE IF EXISTS department       CASCADE;
DROP TABLE IF EXISTS job_location     CASCADE;
DROP TABLE IF EXISTS job              CASCADE;
DROP TABLE IF EXISTS employee         CASCADE;
DROP TABLE IF EXISTS employee_address CASCADE;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 1:56:00 PM */
-- Recreate tables from script
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Run these commands in ElephantSQL postgres database in browser tab to recreate starting tables for local testing

CREATE TABLE benefits (
  benefits_package_id        INT          GENERATED ALWAYS AS IDENTITY, 
  amount                     MONEY        NOT NULL,
  stock_options              VARCHAR(100), 
  health_insurance_provider  VARCHAR(100) NOT NULL CHECK(health_insurance_provider ~ '^[A-Z \d]+$'),
  retirement_plan            VARCHAR(100),

  PRIMARY KEY(benefits_package_id)
);


CREATE TABLE employee_address (
  address_id      INT           GENERATED ALWAYS AS IDENTITY,
  street_address  VARCHAR(100)  NOT NULL CHECK(street_address ~ '^[A-Z \/\d#\.,-]+$'),   -- Includes appt/po box info and locality info if applicable
  city            VARCHAR(50)   NOT NULL CHECK(city ~ '^[A-Z ]+$'), -- Also serves as post town if applicable
  zip_code        VARCHAR(16)   CHECK(zip_code ~ '^[\d \-A-Z]+$'), -- Also serves as postcode if applicable
  state           VARCHAR(50)   CHECK(state ~ '^[A-Z ]+$'), -- Also serves as province if applicable
  country         VARCHAR(50)   NOT NULL CHECK(country ~ '^[A-Z ]+$'),   -- Also serves as region if applicable

  PRIMARY KEY(address_id)
);


CREATE TABLE job_location (
  location_id   INT GENERATED ALWAYS AS IDENTITY,
  airport_id    INT,
  address_id    INT NOT NULL,
  flight_id     INT,
  location_name VARCHAR(50),

  PRIMARY KEY(location_id)
);


CREATE TABLE department (
  department_id       INT          GENERATED ALWAYS AS IDENTITY,
  department_name     VARCHAR(50)  NOT NULL CHECK(department_name ~ '^[A-Z ]+$'),
  creation_date       DATE         NOT NULL, 
  department_head_id  INT,

  PRIMARY KEY(department_id)
);


CREATE TABLE job (
  job_id              INT         GENERATED ALWAYS AS IDENTITY, 
  job_title           VARCHAR(50) NOT NULL CHECK(job_title ~ '^[A-Z \-]+$'),
  department_id       INT         NOT NULL, 
  location_id         INT         NOT NULL,
  weekly_hours        INT         DEFAULT 40 CHECK(weekly_hours <= 168),
  benefits_package_id INT         DEFAULT 0 NOT NULL,

  PRIMARY KEY(job_id),
  FOREIGN KEY(department_id)
    REFERENCES department(department_id)
    ON DELETE CASCADE,

  FOREIGN KEY(location_id)
    REFERENCES job_location(location_id)
    ON DELETE CASCADE,

  FOREIGN KEY(benefits_package_id)
    REFERENCES benefits(benefits_package_id)
    ON DELETE SET DEFAULT
);


CREATE TABLE employee (
  employee_id INT           GENERATED ALWAYS AS IDENTITY (START WITH 1000000),
  first_name  VARCHAR(50)   NOT NULL CHECK(first_name ~ '^[A-Z ]+$'),
  m_initial   CHAR(1),  
  last_name   VARCHAR(50)   NOT NULL CHECK(last_name ~ '^[A-Z ]+$'),
  ssn         CHAR(9)       UNIQUE CHECK(ssn ~ '^\d{9}$'),
  dob         DATE          NOT NULL,
  gender      CHAR(1)       NOT NULL CHECK(gender ~ '^[MFO]$'),
  phone       VARCHAR(15)   CHECK(phone ~ '^\+[0-9]+$'),
  email       VARCHAR(100)  UNIQUE CHECK(email ~ '^[\w\.\+]{1,64}@(\w+\.[A-Za-z]+){1,100}$'),
  job_id      INT           DEFAULT 0 NOT NULL,
  address_id  INT           NOT NULL,
  manager_id  INT,

  PRIMARY KEY(employee_id),
  FOREIGN KEY(job_id)
    REFERENCES job(job_id)
    ON DELETE SET DEFAULT,

  FOREIGN KEY(address_id)
    REFERENCES employee_address(address_id),

  FOREIGN KEY(manager_id)
    REFERENCES employee(employee_id)
    ON DELETE SET NULL
);


CREATE TABLE salary (
  salary_id    INT    GENERATED ALWAYS AS IDENTITY,
  employee_id  INT    NOT NULL,
  hourly_wage  MONEY  NOT NULL,
  annual_bonus MONEY  DEFAULT 0 NOT NULL,

  PRIMARY KEY(salary_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE leave (
  leave_id    INT           GENERATED ALWAYS AS IDENTITY,
  employee_id INT           NOT NULL,
  date        DATE          NOT NULL,
  reason      VARCHAR(100)  NOT NULL CHECK(reason ~ '^[A-Z \.\d]+$'),
  status      VARCHAR(50)   NOT NULL CHECK(status ~ '^[A-Z \.\d]+$'),

  PRIMARY KEY(leave_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE payroll (
  payroll_id    INT       GENERATED ALWAYS AS IDENTITY,
  employee_id   INT       NOT NULL, 
  hours_worked  REAL      NOT NULL,
  pay_period    DATE      NOT NULL,
  tax_rate      REAL      NOT NULL,
  gross_income  MONEY     NOT NULL,
  taxed_income  MONEY     NOT NULL,
  net_income    MONEY     NOT NULL,
  
  UNIQUE(employee_id, pay_period),

  PRIMARY KEY(payroll_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


/* DEFAULTS */
ALTER TABLE department
ADD CONSTRAINT fk_head FOREIGN KEY (department_head_id) REFERENCES employee(employee_id);


INSERT INTO benefits OVERRIDING SYSTEM VALUE VALUES(0, 0, 0, 'UNASSIGNED', 0);

INSERT INTO job_location OVERRIDING SYSTEM VALUE VALUES(0, NULL, 0, NULL);

INSERT INTO department OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', '1980-1-1');

INSERT INTO job OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', 0, 0, 0, 0);


/* Initial populated tables */

-- Departments (based on https://www.avjobs.com/history/structure-of-the-airline-industry.asp)
INSERT INTO department (department_name, creation_date) VALUES 
('BOARD OF DIRECTORS',            '1980-01-01'),
('ENGINEERING AND MAINTENANCE',   '1980-01-01'),
('GROUND OPERATIONS',             '1980-01-01'),
('FLIGHT OPERATIONS',             '1980-01-01'),
('SALES AND MARKETING',           '1980-01-01'),
('RESERVATIONS AND TICKETING',    '1980-01-01'),
('FINANCE AND PROPERTY',          '1980-01-01'),
('INFORMATION SERVICES',          '1990-11-08'),
('PERSONNEL',                     '1980-01-01'),
('EMERGENCY SERVICES',            '1980-04-05'),
('LEGAL',                         '1981-03-11'),
('PUBLIC RELATIONS AND PLANNING', '1985-07-20');


-- Benefits
INSERT INTO benefits (amount, stock_options, health_insurance_provider, retirement_plan) VALUES
(1000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS A', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS A', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN A'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(6000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS C', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(10000, 'STOCK OPTIONS D', 'INSURANCE PROVIDER D', 'RETIREMENT PLAN D'),
(4500,  'STOCK OPTIONS D', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN C');


-- Job locations
INSERT INTO job_location (airport_id, address_id, flight_id, location_name) VALUES
(NULL,  1,  NULL, 'OFFICES IN CITY A'),
(NULL,  2,  NULL, 'OFFICES IN CITY B'),
(NULL,  6,  NULL, 'OFFICES IN CITY C'),

(1, 3,  NULL, 'AIRPORT IN CITY A'),
(1, 3,  100,  'AIRPORT IN CITY A'),
(1, 3,  101,  'AIRPORT IN CITY A'),
(1, 3,  102,  'AIRPORT IN CITY A'),
(1, 3,  103,  'AIRPORT IN CITY A'),

(2, 4,  NULL, 'AIRPORT A IN CITY B'),
(2, 4,  200,  'AIRPORT A IN CITY B'),
(2, 4,  201,  'AIRPORT A IN CITY B'),
(2, 4,  202,  'AIRPORT A IN CITY B'),
(2, 4,  203,  'AIRPORT A IN CITY B'),

(3, 5,  NULL, 'AIRPORT B IN CITY B'),
(3, 5,  300,  'AIRPORT B IN CITY B'),
(3, 5,  301,  'AIRPORT B IN CITY B'),
(3, 5,  302,  'AIRPORT B IN CITY B'),
(3, 5,  303,  'AIRPORT B IN CITY B'),

(4, 7,  NULL, 'AIRPORT IN CITY C'),
(4, 7,  400,  'AIRPORT IN CITY C'),
(4, 7,  401,  'AIRPORT IN CITY C'),
(4, 7,  402,  'AIRPORT IN CITY C'),
(4, 7,  403,  'AIRPORT IN CITY C');


-- Jobs (based on https://www.airlinejobfinder.com/members/airline-jobs/)
INSERT INTO job (job_title, department_id, location_id, weekly_hours, benefits_package_id) VALUES
-- Board of Directors (1)
('CHIEF EXECUTIVE OFFICER', 1,  2,  50, 9),
('CHAIRMAN',                1,  2,  40, 9),
('VICE CHAIR',              1,  2,  40, 9),
('BOARD SECRETARY',         1,  2,  40, 9),
('TREASURER',               1,  2,  40, 9),
('BOARD MEMBER',            1,  2,  40, 9),

-- Maintenance and Engineering (2)
('AVIATION MAINTENANCE TECHNICIAN', 2,  4,  40, 2),
('POWERPLANT MECHANIC',             2,  4,  40, 2),
('AIRFRAME MECHANIC',               2,  4,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  4,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  4,  40, 2),
('AIRCRAFT FUELER',                 2,  4,  40, 2),
('AVIONIC TECHNICIAN',              2,  4,  40, 2),
('CABIN MAINTENANCE',               2,  4,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  4,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  4,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  9,  40, 2),
('POWERPLANT MECHANIC',             2,  9,  40, 2),
('AIRFRAME MECHANIC',               2,  9,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  9,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  9,  40, 2),
('AIRCRAFT FUELER',                 2,  9,  40, 2),
('AVIONIC TECHNICIAN',              2,  9,  40, 2),
('CABIN MAINTENANCE',               2,  9,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  9,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  9,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  14,  40, 2),
('POWERPLANT MECHANIC',             2,  14,  40, 2),
('AIRFRAME MECHANIC',               2,  14,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  14,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  14,  40, 2),
('AIRCRAFT FUELER',                 2,  14,  40, 2),
('AVIONIC TECHNICIAN',              2,  14,  40, 2),
('CABIN MAINTENANCE',               2,  14,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  14,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  14,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  19,  40, 2),
('POWERPLANT MECHANIC',             2,  19,  40, 2),
('AIRFRAME MECHANIC',               2,  19,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  19,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  19,  40, 2),
('AIRCRAFT FUELER',                 2,  19,  40, 2),
('AVIONIC TECHNICIAN',              2,  19,  40, 2),
('CABIN MAINTENANCE',               2,  19,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  19,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  19,  40, 2),

-- Ground Operations (3)
('DIRECTOR OF AVIATION',        3, 1, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 1, 40, 3),
('DIRECTOR OF AVIATION',        3, 2, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 2, 40, 3),
('DIRECTOR OF AVIATION',        3, 3, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 3, 40, 3),

('BAGGAGE HANDLER',               3,  4,  40, 5),
('SKYCAP',                        3,  4,  40, 5),
('CONCESSIONS',                   3,  4,  40, 5),
('AIRPORT GUIDE',                 3,  4,  40, 5),
('AIRPORT CUSTODIAN',             3,  4,  40, 1),
('OPERATIONS AGENT',              3,  4,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  4,  40, 3),
('PASSENGER SERVICE AGENT',       3,  4,  40, 3),
('RAMP PLANNER',                  3,  4,  40, 3),
('AIRLINE STATION AGENT',         3,  4,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  4,  40, 7),

('BAGGAGE HANDLER',               3,  9,  40, 5),
('SKYCAP',                        3,  9,  40, 5),
('CONCESSIONS',                   3,  9,  40, 5),
('AIRPORT GUIDE',                 3,  9,  40, 5),
('AIRPORT CUSTODIAN',             3,  9,  40, 1),
('OPERATIONS AGENT',              3,  9,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  9,  40, 3),
('PASSENGER SERVICE AGENT',       3,  9,  40, 3),
('RAMP PLANNER',                  3,  9,  40, 3),
('AIRLINE STATION AGENT',         3,  9,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  9,  40, 7),

('BAGGAGE HANDLER',               3,  14, 40, 5),
('SKYCAP',                        3,  14, 40, 5),
('CONCESSIONS',                   3,  14, 40, 5),
('AIRPORT GUIDE',                 3,  14, 40, 5),
('AIRPORT CUSTODIAN',             3,  14, 40, 1),
('OPERATIONS AGENT',              3,  14, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  14, 40, 3),
('PASSENGER SERVICE AGENT',       3,  14, 40, 3),
('RAMP PLANNER',                  3,  14, 40, 3),
('AIRLINE STATION AGENT',         3,  14, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  14, 40, 7),

('BAGGAGE HANDLER',               3,  19, 40, 5),
('SKYCAP',                        3,  19, 40, 5),
('CONCESSIONS',                   3,  19, 40, 5),
('AIRPORT GUIDE',                 3,  19, 40, 5),
('AIRPORT CUSTODIAN',             3,  19, 40, 1),
('OPERATIONS AGENT',              3,  19, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  19, 40, 3),
('PASSENGER SERVICE AGENT',       3,  19, 40, 3),
('RAMP PLANNER',                  3,  19, 40, 3),
('DISTRICT OPERATIONS MANAGER',   3,  19, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  19, 40, 7),

-- Flight Operations (4)
('FLIGHT DISPATCHER',       4,  4,  40, 6),
('AVIATION METEOROLOGIST',  4,  4,  40, 6),
('FLIGHT DISPATCHER',       4,  9,  40, 6),
('AVIATION METEOROLOGIST',  4,  9,  40, 6),
('FLIGHT DISPATCHER',       4,  14, 40, 6),
('AVIATION METEOROLOGIST',  4,  14, 40, 6),
('FLIGHT DISPATCHER',       4,  19, 40, 6),
('AVIATION METEOROLOGIST',  4,  19, 40, 6),

('CARGO CARRIER PILOT', 4,  5,  60, 6),
('COPORATE PILOT',      4,  5,  30, 6),
('CHARTER PILOT',       4,  5,  60, 6),

('CARGO CARRIER PILOT', 4,  6,  60, 6),
('COPORATE PILOT',      4,  6,  30, 6),
('CHARTER PILOT',       4,  6,  60, 6),

('CARGO CARRIER PILOT', 4,  7,  60, 6),
('COPORATE PILOT',      4,  7,  30, 6),
('CHARTER PILOT',       4,  7,  60, 6),

('CARGO CARRIER PILOT', 4,  8,  60, 6),
('COPORATE PILOT',      4,  8,  30, 6),
('CHARTER PILOT',       4,  8,  60, 6),

('CARGO CARRIER PILOT', 4,  10, 60, 6),
('COPORATE PILOT',      4,  10, 30, 6),
('CHARTER PILOT',       4,  10, 60, 6),

('CARGO CARRIER PILOT', 4,  11, 60, 6),
('COPORATE PILOT',      4,  11, 30, 6),
('CHARTER PILOT',       4,  11, 60, 6),

('CARGO CARRIER PILOT', 4,  12, 60, 6),
('COPORATE PILOT',      4,  12, 30, 6),
('CHARTER PILOT',       4,  12, 60, 6),

('CARGO CARRIER PILOT', 4,  13, 60, 6),
('COPORATE PILOT',      4,  13, 30, 6),
('CHARTER PILOT',       4,  13, 60, 6),

('CARGO CARRIER PILOT', 4,  15, 60, 6),
('COPORATE PILOT',      4,  15, 30, 6),
('CHARTER PILOT',       4,  15, 60, 6),

('CARGO CARRIER PILOT', 4,  16, 60, 6),
('COPORATE PILOT',      4,  16, 30, 6),
('CHARTER PILOT',       4,  16, 60, 6),

('CARGO CARRIER PILOT', 4,  17, 60, 6),
('COPORATE PILOT',      4,  17, 30, 6),
('CHARTER PILOT',       4,  17, 60, 6),

('CARGO CARRIER PILOT', 4,  18, 60, 6),
('COPORATE PILOT',      4,  18, 30, 6),
('CHARTER PILOT',       4,  18, 60, 6),

('CARGO CARRIER PILOT', 4,  20, 60, 6),
('COPORATE PILOT',      4,  20, 30, 6),
('CHARTER PILOT',       4,  20, 60, 6),

('CARGO CARRIER PILOT', 4,  21, 60, 6),
('COPORATE PILOT',      4,  21, 30, 6),
('CHARTER PILOT',       4,  21, 60, 6),

('CARGO CARRIER PILOT', 4,  22, 60, 6),
('COPORATE PILOT',      4,  22, 30, 6),
('CHARTER PILOT',       4,  22, 60, 6),

('CARGO CARRIER PILOT', 4,  23, 60, 6),
('COPORATE PILOT',      4,  23, 30, 6),
('CHARTER PILOT',       4,  23, 60, 6),

-- Sales and Marketing (5)
('REGIONAL SALES MANAGER',  5,  1,  40, 3),
('SALES REPRESENTATIVE',    5,  1,  40, 3),
('AIRLINE MARKETER',        5,  1,  40, 3),
('SALES INTERN',            5,  1,  20, 3),

('REGIONAL SALES MANAGER',  5,  2,  40, 3),
('SALES REPRESENTATIVE',    5,  2,  40, 3),
('AIRLINE MARKETER',        5,  2,  40, 3),
('SALES INTERN',            5,  2,  20, 3),

('REGIONAL SALES MANAGER',  5,  3,  40, 3),
('SALES REPRESENTATIVE',    5,  3,  40, 3),
('AIRLINE MARKETER',        5,  3,  40, 3),
('SALES INTERN',            5,  3,  20, 3),

-- Reservations and Ticketing (6)
('RESERVATION SALES AGENT', 6,  4,  40, 3),
('AIRLINE TICKET AGENT',    6,  4,  40, 3),

('RESERVATION SALES AGENT', 6,  9,  40, 3),
('AIRLINE TICKET AGENT',    6,  9,  40, 3),

('RESERVATION SALES AGENT', 6,  14, 40, 3),
('AIRLINE TICKET AGENT',    6,  14, 40, 3),

('RESERVATION SALES AGENT', 6,  19, 40, 3),
('AIRLINE TICKET AGENT',    6,  19, 40, 3),

-- Finance and Property (7)
('ACCOUNTANT',                7,  1,  40, 5),
('AUDITOR',                   7,  1,  40, 5),
('FINANCE ASSITANT',          7,  1,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  1,  40, 5),
('PAYROLL CLERK',             7,  1,  40, 5),
('FINANCIAL ANALYST',         7,  1,  40, 5),
('PAYROLL MANAGER',           7,  1,  40, 5),
('FINANCE INTERN',            7,  1,  20, 5),

('ACCOUNTANT',                7,  2,  40, 5),
('AUDITOR',                   7,  2,  40, 5),
('FINANCE ASSITANT',          7,  2,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  2,  40, 5),
('PAYROLL CLERK',             7,  2,  40, 5),
('FINANCIAL ANALYST',         7,  2,  40, 5),
('PAYROLL MANAGER',           7,  2,  40, 5),
('FINANCE INTERN',            7,  2,  20, 5),

('ACCOUNTANT',                7,  3,  40, 5),
('AUDITOR',                   7,  3,  40, 5),
('FINANCE ASSITANT',          7,  3,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  3,  40, 5),
('PAYROLL CLERK',             7,  3,  40, 5),
('FINANCIAL ANALYST',         7,  3,  40, 5),
('PAYROLL MANAGER',           7,  3,  40, 5),
('FINANCE INTERN',            7,  3,  20, 5),

-- Information services (8)
('IT SPECIALIST',     8,  1,  40, 3),
('IT INTERN',         8,  1,  20, 3),
('HELP DESK SUPPORT', 8,  1,  40, 3),

('IT SPECIALIST',     8,  2,  40, 3),
('HELP DESK SUPPORT', 8,  2,  40, 3),
('IT INTERN',         8,  2,  20, 3),

('IT SPECIALIST',     8,  3,  40, 3),
('HELP DESK SUPPORT', 8,  3,  40, 3),
('IT INTERN',         8,  3,  20, 3),

-- Personnel (9)
('SECRETARY',                   9,  1,  40, 3),
('MAIL CLERK',                  9,  1,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  1,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  1,  40, 3),
('RECEPTIONIST',                9,  1,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  1,  40, 3),

('SECRETARY',                   9,  2,  40, 3),
('MAIL CLERK',                  9,  2,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  2,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  2,  40, 3),
('RECEPTIONIST',                9,  2,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  2,  40, 3),

('SECRETARY',                   9,  3,  40, 3),
('MAIL CLERK',                  9,  3,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  3,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  3,  40, 3),
('RECEPTIONIST',                9,  3,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  3,  40, 3),

-- Emergency Services (10)
('FIREFIGHTER',           10,  4,  40, 10),
('FIREFIGHTER MEDIC',     10,  4,  40, 10),
('POLICE OFFICER',        10,  4,  40, 10),
('FIRE AND CRASH RESCUE', 10,  4,  30, 10),
('POLICE PATROL OFFICER', 10,  4,  30, 10),

('FIREFIGHTER',           10,  9,  40, 10),
('FIREFIGHTER MEDIC',     10,  9,  40, 10),
('POLICE OFFICER',        10,  9,  40, 10),
('FIRE AND CRASH RESCUE', 10,  9,  30, 10),
('POLICE PATROL OFFICER', 10,  9,  30, 10),

('FIREFIGHTER',           10,  14, 40, 10),
('FIREFIGHTER MEDIC',     10,  14, 40, 10),
('POLICE OFFICER',        10,  14, 40, 10),
('FIRE AND CRASH RESCUE', 10,  14, 30, 10),
('POLICE PATROL OFFICER', 10,  14, 30, 10),

('FIREFIGHTER',           10,  19, 40, 10),
('FIREFIGHTER MEDIC',     10,  19, 40, 10),
('POLICE OFFICER',        10,  19, 40, 10),
('FIRE AND CRASH RESCUE', 10,  19, 30, 10),
('POLICE PATROL OFFICER', 10,  19, 30, 10),

-- Legal (11)
('AVIATION ATTORNEY',  11,  1,  40, 7),
('AVIATION ATTORNEY',  11,  2,  40, 7),
('AVIATION ATTORNEY',  11,  3,  40, 7),

-- Public Relations and Planning (12)
('PUBLIC RELATIONS SPECIALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS GENERALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS MANAGER',    12,  2,  40, 3),
('PUBLIC RELATIONS INTERN',     12,  2,  20, 3),

('HEAD OF ENGINEERING',           2,  2,  40, 9),
('HEAD OF GROUND OPERATIONS',     3,  2,  40, 9),
('HEAD OF FLIGHT OPERATIONS',     4,  2,  40, 9),
('HEAD OF SALES',                 5,  2,  40, 9),
('HEAD OF RESERVATIONS',          6,  2,  40, 9),
('HEAD OF FINANCE',               7,  2,  40, 9),
('HEAD OF INFORMATION SERVICES',  8,  2,  40, 9),
('HEAD OF PERSONNEL MANAGEMENT',  9,  2,  40, 9),
('HEAD OF EMERGENCY SERVICES',    10, 2,  40, 9),
('HEAD OF LEGAL',                 11, 2,  40, 9),
('HEAD OF PUBLIC RELATIONS',      12, 2,  40, 9);


-- Employee Address
INSERT INTO employee_address (street_address, city, zip_code, state, country) VALUES
('123 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('123 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('321 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('555 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('9029 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('765 MAIN ST',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('767 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('876 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8770 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('202 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('101 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('896 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('909 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('920 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('808 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8760 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8755 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('423 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('202 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('101 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('896 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('909 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 SEAWATER LN',     'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8260 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8234 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8754 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('808 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8234 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8754 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SLEEPY HILLS',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 FISHWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MINOR ST',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 LION LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 JUMPY HILLS',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 FISHWATER ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MINOR RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 LION RD',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SLEEPY SLOPES',  'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('423 FISHWATER RD',    'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8777 MAIN ST',        'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('920 LONG LN',         'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 KLEINE DR',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 EINE DR',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 ROADY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 NEIN LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KLEINE DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 EINE DR',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 ROADY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KLEINE DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 EINE DR',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 ROADY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 ROCKY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 BUMPY HILLS',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 POOLWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 DIGGY LN',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 ZEBRA ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 MERRYWEATHER LN', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CHRONO ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('420 CLOUDY DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 MERRYWEATHER LN', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 CHRONO ST',      'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('420 CLOUDY DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 TIME ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 TIME ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 TIME ST',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 STEEL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 STEEL LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A');


-- Employee
INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOHN',      'H',        'SMITH',      '123456789', '1965-01-01',  'M',    '+15553219090', 'jsmith@company.org',     1,      1,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MARY',      NULL,       'ORLEANS',    '987654321', '1970-04-09',  'F',    '+15559990001', 'morleans@company.org',   2,      2,          1000000),
('HARRIS',    NULL,       'BEAUDRY',    '111223333', '1967-04-29',  'M',    '+15559990021', 'hbeaudry@company.org',   3,      3,          NULL),
('ANABEL',    'A',        'NEALIOUS',   '112345678', '1980-01-09',  'F',    '+15559990011', 'anaulious@company.org',  4,      4,          NULL),
('DON',       'E',        'SYLVER',     '112345688', '1969-11-24',  'M',    '+15559980011', 'dsylver@company.org',    5,      5,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BRENDON',   NULL,       'LAMBINO',    '112346689', '1965-11-24',  'M',    '+15559680011', 'blambino@company.org',   6,      6,          1000001),
('MYRTLE',    NULL,       'TRUOG',      '122345688', '1969-12-24',  'F',    '+16559980011', 'mtruog@company.org',     6,      7,          1000001),
('LASZLO',    NULL,       'LUAIN',      '111345688', '1971-02-24',  'M',    '+15567980011', 'lluain@company.org',     6,      8,          1000001);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '117345689', '1984-06-23',  'M',    '+15567980111', NULL,                     7,      9,          NULL),
('LATIFA',    NULL,       'BELTZ',      '117245689', '1984-02-24',  'F',    '+15569980011', NULL,                     8,      10,         NULL),
('ELINA',     NULL,       'HAUTUM',     '117445689', '1983-06-24',  'F',    '+15567900811', NULL,                     9,      11,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '117545689', '1983-08-12',  'M',    '+15567980211', NULL,                     10,     12,         NULL),
('SOLOMON',   'V',        'TERZI',      '117745689', '1984-09-23',  'M',    '+15567980311', NULL,                     11,     13,         NULL),
('QUINCTUS',  NULL,       'HART',       '113345689', '1990-12-19',  'M',    '+15567980411', NULL,                     12,     14,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '118345689', '1987-06-04',  'F',    '+15567980511', NULL,                     13,     15,         NULL),
('LAURENS',   NULL,       'RUSH',       '114345689', '1989-05-03',  'M',    '+15567980611', NULL,                     14,     16,         NULL),
('SHANNA',    'M',        'PLANCK',     '111342689', '1990-04-02',  'F',    '+15567980711', NULL,                     15,     17,         NULL),
('REINALDO',  'S',        'CLARK',      '117355689', '1988-03-01',  'M',    '+15567980811', NULL,                     16,     18,         NULL);


UPDATE employee
SET manager_id = 1000017
WHERE employee_id < 1000017 AND employee_id > 1000007;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PRINCE',    'S',        'BERGFALK',   '100000001', '1984-06-23',  'M',    '+15567180111', NULL,                     17,     19,         NULL),
('RICO',      NULL,       'MILFORD',    '100000002', '1984-02-24',  'M',    '+15569180011', NULL,                     18,     20,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000003', '1983-06-24',  'M',    '+15567100811', NULL,                     19,     21,         NULL),
('BENVENUTO', 'J',        'BRYAN',      '100000004', '1983-08-12',  'M',    '+15567180211', NULL,                     20,     22,         NULL),
('SARA',      'S',        'COKES',      '100000005', '1984-09-23',  'F',    '+15567180311', NULL,                     21,     23,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000006', '1990-12-19',  'F',    '+15567180411', NULL,                     22,     24,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000007', '1987-06-04',  'F',    '+15567180511', NULL,                     23,     25,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000008', '1989-05-03',  'F',    '+15567180611', NULL,                     24,     26,         NULL),
('KYLEE',     'M',        'DARROW',     '100000009', '1990-04-02',  'F',    '+15567180711', NULL,                     25,     27,         NULL),
('SHIRO',     'G',        'DARZI',      '100000010', '1988-03-01',  'M',    '+15567180811', NULL,                     26,     28,         NULL);


UPDATE employee
SET manager_id = 1000027
WHERE employee_id < 1000027 AND employee_id > 1000017;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'B',        'ANKEREN',    '100000011', '1984-06-23',  'M',    '+15566180111', NULL,                     27,     29,         NULL),
('RICO',      NULL,       'MILFORD',    '100000012', '1984-02-24',  'M',    '+15566180011', NULL,                     28,     30,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000013', '1983-06-24',  'M',    '+15566100811', NULL,                     29,     31,         NULL),
('BENVENUTO', 'A',        'BRYAN',      '100000014', '1983-08-12',  'M',    '+15566180211', NULL,                     30,     32,         NULL),
('SARA',      'T',        'COKES',      '100000015', '1984-09-23',  'F',    '+15566180311', NULL,                     31,     33,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000016', '1990-12-19',  'F',    '+15566180411', NULL,                     32,     34,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000017', '1987-06-04',  'F',    '+15566180511', NULL,                     33,     35,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000018', '1989-05-03',  'F',    '+15566180611', NULL,                     34,     36,         NULL),
('KYLEE',     'O',        'DARROW',     '100000019', '1990-04-02',  'F',    '+15566180711', NULL,                     35,     37,         NULL),
('SHIRO',     'K',        'DARZI',      '100000020', '1988-03-01',  'M',    '+15566180811', NULL,                     36,     38,         NULL);


UPDATE employee
SET manager_id = 1000037
WHERE employee_id < 1000037 AND employee_id > 1000027;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '100000031', '1985-06-13',  'M',    '+25567980221', NULL,                     37,     39,         NULL),
('LATIFA',    NULL,       'BELTZ',      '100000032', '1985-02-14',  'F',    '+25569980221', NULL,                     38,     40,         NULL),
('ELINA',     NULL,       'HAUTUM',     '100000033', '1985-06-14',  'F',    '+25567900221', NULL,                     39,     41,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '100000034', '1985-08-12',  'M',    '+25574980221', NULL,                     40,     42,         NULL),
('SOLOMON',   'V',        'TERZI',      '100000035', '1985-09-13',  'M',    '+25574880221', NULL,                     41,     43,         NULL),
('QUINCTUS',  NULL,       'HART',       '100000036', '1995-12-19',  'M',    '+25568980221', NULL,                     42,     44,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '100000037', '1985-06-14',  'F',    '+25577980221', NULL,                     43,     45,         NULL),
('LAURENS',   NULL,       'RUSH',       '100000038', '1985-05-13',  'M',    '+25587980221', NULL,                     44,     46,         NULL),
('SHANNA',    'M',        'PLANCK',     '100000039', '1995-04-12',  'F',    '+25569980221', NULL,                     45,     47,         NULL),
('REINALDO',  'Q',        'HART',       '100000040', '1985-03-11',  'M',    '+25560980221', NULL,                     46,     48,         NULL);


UPDATE employee
SET manager_id = 1000047
WHERE employee_id < 1000047 AND employee_id > 1000037;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAUTVYDAS', 'C',        'LANG',       '100000041', '1986-06-13',  'M',    '+15567980221', NULL,                     47,     49,         NULL),
('JOAKIM',    NULL,       'LEON',       '100000042', '1986-02-14',  'M',    '+15569980221', NULL,                     48,     50,         NULL),
('VALENTIN',  NULL,       'FIORE',      '100000043', '1986-06-14',  'M',    '+15567900221', NULL,                     49,     51,         NULL),
('SHAHIN',    'G',        'HOBBES',     '100000044', '1986-08-12',  'M',    '+15574980221', NULL,                     50,     52,         NULL),
('EVITA',     'I',        'ACHTEROP',   '100000045', '1986-09-13',  'F',    '+15574880221', NULL,                     51,     53,         NULL),
('REINALDO',  'I',        'CLARKE',     '100000046', '1986-03-11',  'M',    '+15560980221', NULL,                     52,     54,         NULL);


UPDATE employee
SET manager_id = employee_id - 1
WHERE employee_id IN (1000049, 1000051, 1000053);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'J',        'DUPUY',      '100000047', '1984-06-23',  'M',    '+15867980221', NULL,                     53,     55,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000048', '1994-02-24',  'M',    '+15869980221', NULL,                     54,     56,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000049', '1984-06-24',  'F',    '+15867900221', NULL,                     55,     57,         NULL),
('LOLA',      'I',        'PATTERSON',  '100000050', '1984-08-22',  'F',    '+15874980221', NULL,                     56,     58,         NULL),
('DEIRDRE',   'R',        'STRANGE',    '100000051', '1984-09-23',  'F',    '+15874880221', NULL,                     57,     59,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000052', '1964-12-29',  'M',    '+15868980221', NULL,                     58,     60,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000053', '1984-06-24',  'F',    '+15877980221', NULL,                     59,     61,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000054', '1964-05-23',  'M',    '+15887980221', NULL,                     60,     62,         NULL),
('VALERIAN',  'M',        'DABNEY',     '100000055', '1994-04-22',  'F',    '+15869580221', NULL,                     61,     63,         NULL),
('LIANE',     'M',        'MARIA',      '100000056', '1994-04-22',  'F',    '+15869380221', NULL,                     62,     64,         NULL),
('TAAVI',     'B',        'HOUBEN',     '100000057', '1984-03-21',  'M',    '+15860980221', NULL,                     63,     65,         NULL);


UPDATE employee
SET manager_id = 1000063
WHERE employee_id < 1000065 AND employee_id > 1000053 AND NOT employee_id = 1000063;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'A',        'DUPUY',      '100000058', '1982-04-23',  'M',    '+15867910221', NULL,                     64,     66,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000059', '1992-12-24',  'M',    '+15869910221', NULL,                     65,     67,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000060', '1982-04-24',  'F',    '+15867510221', NULL,                     66,     68,         NULL),
('LOLA',      'A',        'PATTERSON',  '100000061', '1982-06-22',  'F',    '+15874910221', NULL,                     67,     69,         NULL),
('DEIRDRE',   'A',        'STRANGE',    '100000062', '1982-07-23',  'F',    '+15874810221', NULL,                     68,     70,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000063', '1962-12-29',  'M',    '+15868910221', NULL,                     69,     71,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000064', '1982-04-24',  'F',    '+15877910221', NULL,                     70,     72,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000065', '1962-03-23',  'M',    '+15887910221', NULL,                     71,     73,         NULL),
('VALERIAN',  'A',        'DABNEY',     '100000066', '1992-02-22',  'F',    '+15869510221', NULL,                     72,     74,         NULL),
('BRIGITTA',  'A',        'MATHEWSON',  '100000067', '1992-02-22',  'F',    '+15869310221', NULL,                     73,     75,         NULL),
('TAAVI',     'A',        'HOUBEN',     '100000068', '1982-01-21',  'M',    '+15860910221', NULL,                     74,     76,         NULL);


UPDATE employee
SET manager_id = 1000074
WHERE employee_id < 1000076 AND employee_id > 1000064 AND NOT employee_id = 1000074;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000069', '1988-04-23',  'M',    '+15867910361', NULL,                     75,     77,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000070', '1998-12-24',  'F',    '+15869910361', NULL,                     76,     78,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000071', '1988-04-24',  'F',    '+15867510361', NULL,                     77,     79,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000072', '1988-06-22',  'F',    '+15874910361', NULL,                     78,     80,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000073', '1988-07-23',  'M',    '+15874810361', NULL,                     79,     81,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000074', '1968-12-29',  'M',    '+15868910361', NULL,                     80,     82,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000075', '1988-04-24',  'M',    '+15877910361', NULL,                     81,     83,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000076', '1968-03-23',  'M',    '+15887910361', NULL,                     82,     84,         NULL),
('SUNE',      'P',        'FOSSE',      '100000077', '1998-02-22',  'F',    '+15869510361', NULL,                     83,     85,         NULL),
('GEORGETA',  'L',        'ALLARD',     '100000078', '1998-02-22',  'F',    '+15869310361', NULL,                     84,     86,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000079', '1988-01-21',  'F',    '+15860910361', NULL,                     85,     87,         NULL);


UPDATE employee
SET manager_id = 1000085
WHERE employee_id < 1000087 AND employee_id > 1000075 AND NOT employee_id = 1000085;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000080', '1988-04-23',  'M',    '+25867910361', NULL,                     86,     88,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000081', '1998-12-24',  'F',    '+25869910361', NULL,                     87,     89,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000082', '1988-04-24',  'F',    '+25867510361', NULL,                     88,     90,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000083', '1988-06-22',  'F',    '+25874910361', NULL,                     89,     91,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000084', '1988-07-23',  'M',    '+25874810361', NULL,                     90,     92,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000085', '1968-12-29',  'M',    '+25868910361', NULL,                     91,     93,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000086', '1988-04-24',  'M',    '+25877910361', NULL,                     92,     94,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000087', '1968-03-23',  'M',    '+25887910361', NULL,                     93,     95,         NULL),
('SUNE',      'P',        'FOSSE',      '100000088', '1998-02-22',  'F',    '+25869510361', NULL,                     94,     96,         NULL),
('SANDRA',    'M',        'ALLARD',     '100000089', '1998-02-22',  'F',    '+25869310361', NULL,                     95,     97,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000090', '1988-01-21',  'F',    '+25860910361', NULL,                     96,     98,         NULL);


UPDATE employee
SET manager_id = 1000096
WHERE employee_id < 1000098 AND employee_id > 1000086 AND NOT employee_id = 1000096;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000091', '1988-04-23',  'M',    '+15067910361', NULL,                     97,     99,         1000063),
('KRISTIN',   NULL,       'SCRIVEN',    '100000092', '1998-12-24',  'F',    '+15069910361', NULL,                     98,     100,        1000063),
('MONIKA',    NULL,       'INGESSON',   '100000093', '1988-04-24',  'F',    '+15067510361', NULL,                     99,     101,        1000074),
('VASIA',     'K',        'MIYAZAKI',   '100000094', '1988-06-22',  'F',    '+15074910361', NULL,                     100,    102,        1000074),
('FAIRUZ',    'H',        'BYRD',       '100000095', '1988-07-23',  'M',    '+15074810361', NULL,                     101,    103,        1000085),
('SULEYMAN',  NULL,       'KURZMANN',   '100000096', '1968-12-29',  'M',    '+15068910361', NULL,                     102,    104,        1000085),
('FELIX',     NULL,       'LINDQVIST',  '100000097', '1988-04-24',  'M',    '+25077910361', NULL,                     103,    105,        1000096),
('TSHEPO',    NULL,       'BEST',       '100000098', '1968-03-23',  'M',    '+25087910361', NULL,                     104,    106,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'S',        'CORNELL',    '100000099', '1988-04-23',  'M',    NULL,           NULL,                     105,    107,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000100', '1998-12-24',  'F',    NULL,           NULL,                     106,    108,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000101', '1988-04-24',  'F',    NULL,           NULL,                     107,    109,        NULL),
('VASIA',     'R',        'MIYAZAKI',   '100000102', '1988-06-22',  'F',    NULL,           NULL,                     108,    110,        NULL),
('FAIRUZ',    'Q',        'BYRD',       '100000103', '1988-07-23',  'M',    NULL,           NULL,                     109,    111,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000104', '1968-12-29',  'M',    NULL,           NULL,                     110,    112,        NULL),
('NAMEY',     NULL,       'LINDQVIST',  '100000105', '1988-04-24',  'M',    NULL,           NULL,                     111,    113,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000106', '1988-04-24',  'M',    NULL,           NULL,                     112,    114,        NULL),
('HIDEKI',    'P',        'CORNELL',    '100000107', '1988-04-23',  'M',    NULL,           NULL,                     113,    115,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000108', '1998-12-24',  'F',    NULL,           NULL,                     114,    116,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000109', '1988-04-24',  'F',    NULL,           NULL,                     115,    117,        NULL),
('VASIA',     'O',        'MIYAZAKI',   '100000110', '1988-06-22',  'F',    NULL,           NULL,                     116,    118,        NULL),
('FAIRUZ',    'N',        'BYRD',       '100000111', '1988-07-23',  'M',    NULL,           NULL,                     117,    119,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000112', '1968-12-29',  'M',    NULL,           NULL,                     118,    120,        NULL),
('AMY',       NULL,       'LINDQVIST',  '100000113', '1988-04-24',  'F',    NULL,           NULL,                     119,    121,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000114', '1988-04-24',  'M',    NULL,           NULL,                     120,    122,        NULL),
('HIDEKI',    'M',        'CORNELL',    '100000115', '1988-04-23',  'M',    NULL,           NULL,                     121,    123,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000116', '1998-12-24',  'F',    NULL,           NULL,                     122,    124,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000117', '1988-04-24',  'F',    NULL,           NULL,                     123,    125,        NULL),
('VASIA',     'L',        'MIYAZAKI',   '100000118', '1988-06-22',  'F',    NULL,           NULL,                     124,    126,        NULL),
('FAIRUZ',    'K',        'BYRD',       '100000119', '1988-07-23',  'M',    NULL,           NULL,                     125,    127,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000120', '1968-12-29',  'M',    NULL,           NULL,                     126,    128,        NULL),
('FELIX',     NULL,       'ULG',        '100000121', '1988-04-24',  'M',    NULL,           NULL,                     127,    129,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000122', '1988-04-24',  'M',    NULL,           NULL,                     128,    130,        NULL),
('HIDEKI',    'J',        'CORNELL',    '100000123', '1988-04-23',  'M',    NULL,           NULL,                     129,    131,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000124', '1998-12-24',  'F',    NULL,           NULL,                     130,    132,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000125', '1988-04-24',  'F',    NULL,           NULL,                     131,    133,        NULL),
('VASIA',     'H',        'MIYAZAKI',   '100000126', '1988-06-22',  'F',    NULL,           NULL,                     132,    134,        NULL),
('FAIRUZ',    'I',        'BYRD',       '100000127', '1988-07-23',  'M',    NULL,           NULL,                     133,    135,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000128', '1968-12-29',  'M',    NULL,           NULL,                     134,    136,        NULL),
('FELIX',     NULL,       'KURZMANN',   '100000129', '1988-04-24',  'M',    NULL,           NULL,                     135,    137,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000130', '1988-04-24',  'M',    NULL,           NULL,                     136,    138,        NULL),
('HIDEKI',    'G',        'CORNELL',    '100000131', '1988-04-23',  'M',    NULL,           NULL,                     137,    139,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000132', '1998-12-24',  'F',    NULL,           NULL,                     138,    140,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000133', '1988-04-24',  'F',    NULL,           NULL,                     139,    141,        NULL),
('VASIA',     'F',        'MIYAZAKI',   '100000134', '1988-06-22',  'F',    NULL,           NULL,                     140,    142,        NULL),
('FAIRUZ',    'E',        'BYRD',       '100000135', '1988-07-23',  'M',    NULL,           NULL,                     141,    143,        NULL),
('HERSHALL',  NULL,       'KURZMANN',   '100000136', '1968-12-29',  'M',    NULL,           NULL,                     142,    144,        NULL),
('JEREMY',    NULL,       'LINDQVIST',  '100000137', '1988-04-24',  'M',    NULL,           NULL,                     143,    145,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000138', '1988-04-24',  'M',    NULL,           NULL,                     144,    146,        NULL),
('HIDEKI',    'C',        'CORNELL',    '100000139', '1988-04-23',  'M',    NULL,           NULL,                     145,    147,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000140', '1998-12-24',  'F',    NULL,           NULL,                     146,    148,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000141', '1988-04-24',  'F',    NULL,           NULL,                     147,    149,        NULL),
('VASIA',     'B',        'MIYAZAKI',   '100000142', '1988-06-22',  'F',    NULL,           NULL,                     148,    150,        NULL),
('MARK',      'A',        'BYRD',       '100000143', '1988-07-23',  'M',    NULL,           NULL,                     149,    151,        NULL),
('JOHN',      NULL,       'KURZMANN',   '100000144', '1968-12-29',  'M',    NULL,           NULL,                     150,    152,        NULL),
('KARL',      NULL,       'LINDQVIST',  '100000145', '1988-04-24',  'M',    NULL,           NULL,                     151,    153,        NULL),
('JOHN',      NULL,       'LINDQVIST',  '100000146', '1988-04-24',  'M',    NULL,           NULL,                     152,    154,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PROPSPER',  'S',        'ALFERINK',   '100000147', '1988-04-23',  'M',    NULL,           NULL,                     153,    155,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BEATRICE',  'S',        'ABBADELLI',  '100000148', '1988-04-23',  'F',    NULL,           NULL,                     154,    156,        1000154),
('KUROSH',    NULL,       'ABBADELLI',  '100000149', '1988-04-23',  'M',    NULL,           NULL,                     155,    157,        1000154),
('LUKAS',     NULL,       'ABBADELLI',  '100000150', '1988-04-23',  'M',    NULL,           NULL,                     156,    158,        1000154);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000151', '1988-04-23',  'M',    NULL,           NULL,                     157,    159,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('FRANCO',    'S',        'CALVO',      '100000152', '1989-04-23',  'M',    NULL,           NULL,                     158,    160,        1000158),
('ALVA',      NULL,       'SERAFINI',   '100000153', '1989-05-23',  'F',    NULL,           NULL,                     159,    161,        1000158),
('LUKAS',     NULL,       'CALVO',      '100000154', '1985-08-28',  'M',    NULL,           NULL,                     160,    162,        1000158);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000155', '1988-04-23',  'M',    NULL,           NULL,                     161,    163,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'S',        'JEANS',      '100000156', '1989-04-23',  'M',    NULL,           NULL,                     162,    164,        1000162),
('HARRY',     NULL,       'NOSE',       '100000157', '1989-05-23',  'M',    NULL,           NULL,                     163,    165,        1000162),
('BARNEY',    NULL,       'BILLS',      '100000158', '1985-08-28',  'M',    NULL,           NULL,                     164,    166,        1000162);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'J',        'JEANS',      '100000159', '1989-04-23',  'M',    NULL,           NULL,                     165,    167,        1000063),
('HARRY',     NULL,       'NOSEN',      '100000160', '1989-05-23',  'M',    NULL,           NULL,                     166,    168,        1000063),
('BARNEY',    NULL,       'BILLS',      '100000161', '1985-08-28',  'M',    NULL,           NULL,                     167,    169,        1000074),
('JIMMY',     'P',        'JEANS',      '100000162', '1989-04-23',  'M',    NULL,           NULL,                     168,    170,        1000074),
('BARRY',     NULL,       'NOSE',       '100000163', '1989-05-23',  'M',    NULL,           NULL,                     169,    171,        1000085),
('BARNEY',    NULL,       'BILLS',      '100000164', '1985-08-28',  'M',    NULL,           NULL,                     170,    172,        1000085),
('JIMMOTHY',  'S',        'JENSON',     '100000165', '1989-04-23',  'M',    NULL,           NULL,                     171,    173,        1000096),
('LARRY',     NULL,       'NOSE',       '100000166', '1989-05-23',  'M',    NULL,           NULL,                     172,    174,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANNE',      'S',        'PERROT',     '100000167', '1975-04-23',  'F',    NULL,           NULL,                     173,    175,        NULL),
('SAWDA',     NULL,       'PAPOUTSIS',  '100000168', '1975-05-23',  'F',    NULL,           NULL,                     174,    176,        NULL),
('BARNEY',    NULL,       'DINO',       '100000169', '1974-08-28',  'M',    NULL,           NULL,                     175,    177,        NULL),
('JACOBA',    'A',        'PENA',       '100000170', '1974-04-23',  'M',    NULL,           NULL,                     176,    178,        NULL),
('SEONG',     NULL,       'KOOLS',      '100000171', '1974-05-23',  'F',    NULL,           NULL,                     177,    179,        NULL),
('IKENNA',    NULL,       'ROMILLY',    '100000172', '1974-08-28',  'F',    NULL,           NULL,                     178,    180,        NULL),
('FERNANDO',  'V',        'BRICE',      '100000173', '1974-04-23',  'M',    NULL,           NULL,                     179,    181,        NULL),
('HORACIO',   NULL,       'KURZ',       '100000174', '1974-05-23',  'M',    NULL,           NULL,                     180,    182,        NULL);


UPDATE employee
SET manager_id = 1000179
WHERE employee_id IN (1000176, 1000177, 1000181);


UPDATE employee
SET manager_id = 1000180
WHERE employee_id IN (1000174, 1000175, 1000178, 1000179);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'WILDGRUBE',  '100000175', '1975-04-23',  'F',    NULL,           NULL,                     181,    183,        NULL),
('STARR',     NULL,       'GARNETT',    '100000176', '1975-05-23',  'F',    NULL,           NULL,                     182,    184,        NULL),
('PING',      NULL,       'DINO',       '100000177', '1974-08-28',  'M',    NULL,           NULL,                     183,    185,        NULL),
('JEF',       'C',        'COMO',       '100000178', '1974-04-23',  'M',    NULL,           NULL,                     184,    186,        NULL),
('SEVERINE',  NULL,       'BJARNESEN',  '100000179', '1974-05-23',  'F',    NULL,           NULL,                     185,    187,        NULL),
('HUAN',      NULL,       'LEIFSSON',   '100000180', '1974-08-28',  'M',    NULL,           NULL,                     186,    188,        NULL),
('LINWOOD',   'O',        'COOKE',      '100000181', '1974-04-23',  'M',    NULL,           NULL,                     187,    189,        NULL),
('PEPE',      NULL,       'GARDINER',   '100000182', '1974-05-23',  'M',    NULL,           NULL,                     188,    190,        NULL);


UPDATE employee
SET manager_id = 1000187
WHERE employee_id IN (1000184, 1000185, 1000189);


UPDATE employee
SET manager_id = 1000188
WHERE employee_id IN (1000182, 1000183, 1000186, 1000187);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAISIA',    'S',        'ROSE',       '100000183', '1975-04-23',  'F',    NULL,           NULL,                     189,    191,        NULL),
('OLGA',      NULL,       'SCHULTHEISS','100000184', '1975-05-23',  'F',    NULL,           NULL,                     190,    192,        NULL),
('KYOU',      NULL,       'SUZUKI',     '100000185', '1970-08-28',  'F',    NULL,           NULL,                     191,    193,        NULL),
('ROLLO',     'D',        'SHORT',      '100000186', '1970-04-23',  'M',    NULL,           NULL,                     192,    194,        NULL),
('LEONARDO',  NULL,       'BJARNESEN',  '100000187', '1970-05-23',  'M',    NULL,           NULL,                     193,    195,        NULL),
('HUAN',      NULL,       'ROSE',       '100000188', '1970-08-28',  'M',    NULL,           NULL,                     194,    196,        NULL),
('FLAVIA',    'O',        'MOROZOV',    '100000189', '1970-04-23',  'M',    NULL,           NULL,                     195,    197,        NULL),
('CORINNA',   NULL,       'WERNHER',    '100000190', '1970-05-23',  'M',    NULL,           NULL,                     196,    198,        NULL);


UPDATE employee
SET manager_id = 1000195
WHERE employee_id IN (1000192, 1000193, 1000197);


UPDATE employee
SET manager_id = 1000196
WHERE employee_id IN (1000190, 1000191, 1000194, 1000195);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MAXINE',    'A',        'THAIDHG',    '100000191', '1975-04-23',  'F',    NULL,           NULL,                     197,    199,        NULL),
('MARCEAU',   NULL,       'OTTEN',      '100000192', '2000-05-23',  'M',    NULL,           NULL,                     198,    200,        NULL),
('HARLOW',    NULL,       'ARENDOK',    '100000193', '1970-08-28',  'M',    NULL,           NULL,                     199,    201,        NULL);


UPDATE employee
SET manager_id = 1000198
WHERE employee_id = 1000199;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANDRE',     'K',        'GILBERT',    '100000194', '1975-05-23',  'M',    NULL,           NULL,                     200,    202,        NULL),
('EMIL',      NULL,       'TRAVERSO',   '100000195', '2000-08-23',  'M',    NULL,           NULL,                     201,    203,        NULL),
('SEPHORA',   NULL,       'VILLENEUVE', '100000196', '1971-08-28',  'F',    NULL,           NULL,                     202,    204,        NULL);


UPDATE employee
SET manager_id = 1000201
WHERE employee_id = 1000202;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AFAF',      'S',        'LOWE',       '100000197', '1975-04-23',  'M',    NULL,           NULL,                     203,    205,        NULL),
('MAXIME',    NULL,       'LAMBERT',    '100000198', '2001-08-23',  'M',    NULL,           NULL,                     204,    206,        NULL),
('TERZO',     NULL,       'HERZOG',     '100000199', '1970-08-28',  'F',    NULL,           NULL,                     205,    207,        NULL);


UPDATE employee
SET manager_id = 1000204
WHERE employee_id = 1000205;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'LOWE',       '100000200', '1975-04-23',  'F',    NULL,           NULL,                     206,    208,        NULL),
('STARR',     NULL,       'LAMBERT',    '100000201', '2001-08-23',  'F',    NULL,           NULL,                     207,    209,        NULL),
('PING',      NULL,       'HERZOG',     '100000202', '1970-08-28',  'M',    NULL,           NULL,                     208,    210,        NULL),
('JEF',       'H',        'LOWE',       '100000203', '1975-04-23',  'M',    NULL,           NULL,                     209,    211,        NULL),
('SEVERINE',  NULL,       'LAMBERT',    '100000204', '2001-08-23',  'F',    NULL,           NULL,                     210,    212,        NULL),
('HUAN',      NULL,       'HERZOG',     '100000205', '1970-08-28',  'F',    NULL,           NULL,                     211,    213,        NULL);


UPDATE employee
SET manager_id = 1000210
WHERE employee_id = 1000209;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'P',        'LOWE',       '100000206', '1978-12-01',  'M',    NULL,           NULL,                     212,    214,        NULL),
('RICO',      NULL,       'LAMBERT',    '100000207', '1999-04-02',  'M',    NULL,           NULL,                     213,    215,        NULL),
('DEVARAJ',   NULL,       'HERZOG',     '100000208', '1978-03-03',  'M',    NULL,           NULL,                     214,    216,        NULL),
('BENVENUTO', 'L',        'LOWE',       '100000209', '1978-02-04',  'M',    NULL,           NULL,                     215,    217,        NULL),
('SARA',      NULL,       'LAMBERT',    '100000210', '1999-01-05',  'F',    NULL,           NULL,                     216,    218,        NULL),
('LALE',      NULL,       'HERZOG',     '100000211', '1978-05-06',  'M',    NULL,           NULL,                     217,    219,        NULL);


UPDATE employee
SET manager_id = 1000216
WHERE employee_id = 1000215;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('RAJ',       'D',        'OSBOURNE',   '100000212', '1978-12-01',  'M',    NULL,           NULL,                     218,    220,        NULL),
('SIMONE',    NULL,       'ASIS',       '100000213', '1999-04-02',  'F',    NULL,           NULL,                     219,    221,        NULL),
('JOLINE',    NULL,       'LEEUWENHOEK','100000214', '1978-03-03',  'F',    NULL,           NULL,                     220,    222,        NULL),
('YULIA',     'L',        'THAIDHG',    '100000215', '1978-02-04',  'F',    NULL,           NULL,                     221,    223,        NULL),
('CY',        NULL,       'NEAL',       '100000216', '1999-01-05',  'M',    NULL,           NULL,                     222,    224,        NULL),
('ANDREA',    NULL,       'MCCREERY',   '100000217', '1978-05-06',  'F',    NULL,           NULL,                     223,    225,        NULL);


UPDATE employee
SET manager_id = 1000222
WHERE employee_id = 1000221;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('SIMONE',    NULL,       'MCCREERY',   '100000218', '1999-04-02',  'F',    NULL,           NULL,                     224,    226,        NULL),
('JOLINE',    NULL,       'NEAL',       '100000219', '1978-03-03',  'F',    NULL,           NULL,                     225,    227,        NULL),
('YULIA',     'L',        'SMITH',      '100000220', '1978-02-04',  'F',    NULL,           NULL,                     226,    228,        NULL),
('CY',        NULL,       'ASIS',       '100000221', '1999-01-05',  'M',    NULL,           NULL,                     227,    229,        NULL),
('ANDREA',    NULL,       'OSBOURNE',   '100000222', '1978-05-06',  'F',    NULL,           NULL,                     228,    230,        NULL),

('SUHAIL',    NULL,       'ROSE',       '100000223', '1999-04-02',  'M',    NULL,           NULL,                     229,    231,        NULL),
('NUAN',      NULL,       'SCHULTHEISS','100000224', '1978-03-03',  'M',    NULL,           NULL,                     230,    232,        NULL),
('INNOKENTI', 'L',        'SUZUKI',     '100000225', '1978-02-04',  'M',    NULL,           NULL,                     231,    233,        NULL),
('KENTIGERN', NULL,       'SHORT',      '100000226', '1999-01-05',  'M',    NULL,           NULL,                     232,    234,        NULL),
('RIEN',      NULL,       'BJARNESEN',  '100000227', '1978-05-06',  'M',    NULL,           NULL,                     233,    235,        NULL),

('SUHAIL',    NULL,       'PORCHER',    '100000228', '1999-04-02',  'M',    NULL,           NULL,                     234,    236,        NULL),
('NUAN',      NULL,       'BAUMGARTEN', '100000229', '1978-03-03',  'M',    NULL,           NULL,                     235,    237,        NULL),
('INNOKENTI', 'L',        'MIKHAILOV',  '100000230', '1978-02-04',  'M',    NULL,           NULL,                     236,    238,        NULL),
('KENTIGERN', NULL,       'BAGGI',      '100000231', '1999-01-05',  'M',    NULL,           NULL,                     237,    239,        NULL),
('RIEN',      NULL,       'NOYER',      '100000232', '1978-05-06',  'M',    NULL,           NULL,                     238,    240,        NULL),

('SIMONE',    NULL,       'PORCHER',    '100000233', '1999-04-02',  'F',    NULL,           NULL,                     239,    241,        NULL),
('JOLINE',    NULL,       'BAUMGARTEN', '100000234', '1978-03-03',  'M',    NULL,           NULL,                     240,    242,        NULL),
('YULIA',     'L',        'MIKHAILOV',  '100000235', '1978-02-04',  'M',    NULL,           NULL,                     241,    243,        NULL),
('CY',        NULL,       'BAGGI',      '100000236', '1999-01-05',  'M',    NULL,           NULL,                     242,    244,        NULL),
('ANDREA',    NULL,       'NOYER',      '100000237', '1978-05-06',  'M',    NULL,           NULL,                     243,    245,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('LAWYER',    'D',        'SAWYER',     '100000238', '1978-12-01',  'M',    NULL,           NULL,                     244,    246,        NULL),
('SIMONE',    NULL,       'LAW',        '100000239', '1999-04-02',  'F',    NULL,           NULL,                     245,    247,        NULL),
('JOE',       NULL,       'TURNEY',     '100000240', '1978-03-03',  'M',    NULL,           NULL,                     246,    248,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'SAWYER',     '100000241', '1978-12-01',  'M',    NULL,           NULL,                     247,    249,        NULL),
('NATHAN',    NULL,       'TURNER',     '100000242', '1999-04-02',  'M',    NULL,           NULL,                     248,    250,        NULL),
('ELISE',     NULL,       'STEEL',      '100000243', '1978-03-03',  'F',    NULL,           NULL,                     249,    251,        NULL),
('MARY',      NULL,       'SUE',        '100000244', '1978-03-03',  'F',    NULL,           NULL,                     250,    252,        NULL);


UPDATE employee
SET manager_id = 1000250
WHERE employee_id > 1000247 AND NOT employee_id = 1000250;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'GOLD',       '100000245', '1965-12-01',  'M',    NULL,           'jgold@company.org',      251,    253,        NULL),
('NATHAN',    NULL,       'SILVER',     '100000246', '1966-04-02',  'M',    NULL,           'nsilver@company.org',    252,    254,        NULL),
('ELISE',     NULL,       'BRONZE',     '100000247', '1967-03-14',  'F',    NULL,           'ebronze@company.org',    253,    255,        NULL),
('MARY',      NULL,       'COPPER',     '100000248', '1968-03-04',  'F',    NULL,           'mcopper@company.org',    254,    256,        NULL),
('JOHN',      'K',        'BRASS',      '100000249', '1969-12-11',  'M',    NULL,           'jbrass@company.org',     255,    257,        NULL),
('NEIL',      NULL,       'ZINC',       '100000250', '1965-07-02',  'M',    NULL,           'nzinc@company.org',      256,    258,        NULL),
('ELLEN',     NULL,       'TIN',        '100000251', '1966-03-03',  'F',    NULL,           'etin@company.org',       257,    259,        NULL),
('MYRTLE',    NULL,       'PEWTER',     '100000252', '1967-04-03',  'F',    NULL,           'mpewter@company.org',    258,    260,        NULL),
('JERKYLL',   'G',        'LEAD',       '100000253', '1968-12-06',  'M',    NULL,           'jlead@company.org',      259,    261,        NULL),
('NERRY',     NULL,       'CHROMIUM',   '100000254', '1969-04-02',  'M',    NULL,           'nchromium@company.org',  260,    262,        NULL),
('PENELOPE',  NULL,       'IRON',       '100000255', '1970-03-03',  'F',    NULL,           'eiron@company.org',      261,    263,        NULL);


-- Create department heads
UPDATE department
SET department_head_id = 1000000
WHERE department_id = 1;


UPDATE department
SET department_head_id = 1000252
WHERE department_id = 2;


UPDATE department
SET department_head_id = 1000253
WHERE department_id = 3;


UPDATE department
SET department_head_id = 1000254
WHERE department_id = 4;


UPDATE department
SET department_head_id = 1000255
WHERE department_id = 5;


UPDATE department
SET department_head_id = 1000256
WHERE department_id = 6;


UPDATE department
SET department_head_id = 1000257
WHERE department_id = 7;


UPDATE department
SET department_head_id = 1000258
WHERE department_id = 8;


UPDATE department
SET department_head_id = 1000259
WHERE department_id = 9;


UPDATE department
SET department_head_id = 1000260
WHERE department_id = 10;


UPDATE department
SET department_head_id = 1000261
WHERE department_id = 11;


UPDATE department
SET department_head_id = 1000262
WHERE department_id = 12;


-- Salary
INSERT INTO salary (employee_id, hourly_wage, annual_bonus) VALUES
(1000000, '$375', '$700,000'),
(1000001, '$100', '$250,000'),
(1000002, '$90',  '$200,000'),
(1000003, '$50',  '$120,000'),
(1000004, '$100', '$200,000'),
(1000005, '$35',  '$100,000'),
(1000006, '$35',  '$100,000'),
(1000007, '$35',  '$100,000'),
(1000008, '$30', '$1,000'),
(1000009, '$30', '$1,000'),
(1000010, '$40', '$1,000'),
(1000011, '$30', '$1,000'),
(1000012, '$25', '$1,000'),
(1000013, '$22', '$1,000'),
(1000014, '$22', '$1,000'),
(1000015, '$18', '$1,000'),
(1000016, '$20', '$1,000'),
(1000017, '$40', '$1,000'),
(1000018, '$30', '$1,000'),
(1000019, '$30', '$1,000'),
(1000020, '$40', '$1,000'),
(1000021, '$30', '$1,000'),
(1000022, '$25', '$1,000'),
(1000023, '$22', '$1,000'),
(1000024, '$22', '$1,000'),
(1000025, '$18', '$1,000'),
(1000026, '$20', '$1,000'),
(1000027, '$40', '$1,000'),
(1000028, '$30', '$1,000'),
(1000029, '$30', '$1,000'),
(1000030, '$40', '$1,000'),
(1000031, '$30', '$1,000'),
(1000032, '$25', '$1,000'),
(1000033, '$22', '$1,000'),
(1000034, '$22', '$1,000'),
(1000035, '$18', '$1,000'),
(1000036, '$20', '$1,000'),
(1000037, '$40', '$1,000'),
(1000038, '$30', '$1,000'),
(1000039, '$30', '$1,000'),
(1000040, '$40', '$1,000'),
(1000041, '$30', '$1,000'),
(1000042, '$25', '$1,000'),
(1000043, '$22', '$1,000'),
(1000044, '$22', '$1,000'),
(1000045, '$18', '$1,000'),
(1000046, '$20', '$1,000'),
(1000047, '$40', '$1,000'),
(1000048, '$40', '$5,000'),
(1000049, '$34', '$3,000'),
(1000050, '$42', '$5,000'),
(1000051, '$34', '$3,000'),
(1000052, '$40', '$5,000'),
(1000053, '$34', '$3,000'),
(1000054, '$30', '$1,000'),
(1000055, '$30', '$1,000'),
(1000056, '$40', '$1,000'),
(1000057, '$30', '$1,000'),
(1000058, '$25', '$1,000'),
(1000059, '$22', '$1,000'),
(1000060, '$22', '$1,000'),
(1000061, '$18', '$1,000'),
(1000062, '$20', '$1,000'),
(1000063, '$35', '$1,000'),
(1000064, '$40', '$1,000'),
(1000065, '$30', '$1,000'),
(1000066, '$30', '$1,000'),
(1000067, '$40', '$1,000'),
(1000068, '$30', '$1,000'),
(1000069, '$25', '$1,000'),
(1000070, '$22', '$1,000'),
(1000071, '$22', '$1,000'),
(1000072, '$18', '$1,000'),
(1000073, '$20', '$1,000'),
(1000074, '$35', '$1,000'),
(1000075, '$40', '$1,000'),
(1000076, '$30', '$1,000'),
(1000077, '$30', '$1,000'),
(1000078, '$40', '$1,000'),
(1000079, '$30', '$1,000'),
(1000080, '$25', '$1,000'),
(1000081, '$22', '$1,000'),
(1000082, '$22', '$1,000'),
(1000083, '$18', '$1,000'),
(1000084, '$20', '$1,000'),
(1000085, '$35', '$1,000'),
(1000086, '$40', '$1,000'),
(1000087, '$30', '$1,000'),
(1000088, '$30', '$1,000'),
(1000089, '$40', '$1,000'),
(1000090, '$30', '$1,000'),
(1000091, '$25', '$1,000'),
(1000092, '$22', '$1,000'),
(1000093, '$22', '$1,000'),
(1000094, '$18', '$1,000'),
(1000095, '$20', '$1,000'),
(1000096, '$35', '$1,000'),
(1000097, '$40', '$1,000'),
(1000098, '$30', '$10,000'),
(1000099, '$30', '$10,000'),
(1000100, '$40', '$10,000'),
(1000101, '$30', '$10,000'),
(1000102, '$25', '$10,000'),
(1000103, '$22', '$10,000'),
(1000104, '$22', '$10,000'),
(1000105, '$18', '$10,000'),
(1000106, '$40', '$10,000'),
(1000107, '$40', '$10,000'),
(1000108, '$40', '$10,000'),
(1000109, '$40', '$10,000'),
(1000110, '$40', '$10,000'),
(1000111, '$40', '$10,000'),
(1000112, '$40', '$10,000'),
(1000113, '$40', '$10,000'),
(1000114, '$40', '$10,000'),
(1000115, '$40', '$10,000'),
(1000116, '$40', '$10,000'),
(1000117, '$40', '$10,000'),
(1000118, '$40', '$10,000'),
(1000119, '$40', '$10,000'),
(1000120, '$40', '$10,000'),
(1000121, '$40', '$10,000'),
(1000122, '$40', '$10,000'),
(1000123, '$40', '$10,000'),
(1000124, '$40', '$10,000'),
(1000125, '$40', '$10,000'),
(1000126, '$40', '$10,000'),
(1000127, '$40', '$10,000'),
(1000128, '$40', '$10,000'),
(1000129, '$40', '$10,000'),
(1000130, '$40', '$10,000'),
(1000131, '$40', '$10,000'),
(1000132, '$40', '$10,000'),
(1000133, '$40', '$10,000'),
(1000134, '$40', '$10,000'),
(1000135, '$40', '$10,000'),
(1000136, '$40', '$10,000'),
(1000137, '$40', '$10,000'),
(1000138, '$40', '$10,000'),
(1000139, '$40', '$10,000'),
(1000140, '$40', '$10,000'),
(1000141, '$40', '$10,000'),
(1000142, '$40', '$10,000'),
(1000143, '$40', '$10,000'),
(1000144, '$40', '$10,000'),
(1000145, '$40', '$10,000'),
(1000146, '$40', '$10,000'),
(1000147, '$40', '$10,000'),
(1000148, '$40', '$10,000'),
(1000149, '$40', '$10,000'),
(1000150, '$40', '$10,000'),
(1000151, '$40', '$10,000'),
(1000152, '$40', '$10,000'),
(1000153, '$40', '$10,000'),
(1000154, '$30', '$10,000'),
(1000155, '$30', '$10,000'),
(1000156, '$40', '$10,000'),
(1000157, '$15', '$0'),
(1000158, '$25', '$10,000'),
(1000159, '$22', '$10,000'),
(1000160, '$22', '$10,000'),
(1000161, '$15', '$0'),
(1000162, '$25', '$10,000'),
(1000163, '$22', '$10,000'),
(1000164, '$22', '$10,000'),
(1000165, '$15', '$0'),
(1000166, '$30', '$1,000'),
(1000167, '$30', '$1,000'),
(1000168, '$20', '$1,000'),
(1000169, '$30', '$1,000'),
(1000170, '$25', '$1,000'),
(1000171, '$22', '$1,000'),
(1000172, '$22', '$1,000'),
(1000173, '$18', '$1,000'),
(1000174, '$35', '$2,250'),
(1000175, '$35', '$2,500'),
(1000176, '$28', '$1,000'),
(1000177, '$24', '$1,000'),
(1000178, '$29', '$1,000'),
(1000179, '$31', '$1,000'),
(1000180, '$40', '$1,000'),
(1000181, '$20', '$0'),
(1000182, '$35', '$2,250'),
(1000183, '$35', '$2,500'),
(1000184, '$28', '$1,000'),
(1000185, '$24', '$1,000'),
(1000186, '$29', '$1,000'),
(1000187, '$31', '$1,000'),
(1000188, '$40', '$1,000'),
(1000189, '$20', '$0'),
(1000190, '$35', '$2,250'),
(1000191, '$35', '$2,500'),
(1000192, '$28', '$1,000'),
(1000193, '$24', '$1,000'),
(1000194, '$29', '$1,000'),
(1000195, '$31', '$1,000'),
(1000196, '$40', '$1,000'),
(1000197, '$20', '$0'),
(1000198, '$35', '$2,250'),
(1000199, '$16', '$0'),
(1000200, '$20', '$1,000'),
(1000201, '$28', '$1,000'),
(1000202, '$20', '$1,000'),
(1000203, '$15', '$0'),
(1000204, '$29', '$1,000'),
(1000205, '$20', '$1,000'),
(1000206, '$15.50', '$0'),
(1000207, '$20', '$2,250'),
(1000208, '$20', '$2,250'),
(1000209, '$30', '$2,250'),
(1000210, '$40', '$2,250'),
(1000211, '$20', '$2,250'),
(1000212, '$40', '$2,250'),
(1000213, '$20', '$2,250'),
(1000214, '$20', '$2,250'),
(1000215, '$30', '$2,250'),
(1000216, '$40', '$2,250'),
(1000217, '$20', '$2,250'),
(1000218, '$40', '$2,250'),
(1000219, '$20', '$2,250'),
(1000220, '$20', '$2,250'),
(1000221, '$30', '$2,250'),
(1000222, '$40', '$2,250'),
(1000223, '$20', '$2,250'),
(1000224, '$40', '$2,250'),
(1000225, '$40', '$10,000'),
(1000226, '$40', '$10,000'),
(1000227, '$40', '$10,000'),
(1000228, '$40', '$10,000'),
(1000229, '$40', '$10,000'),
(1000230, '$40', '$10,000'),
(1000231, '$40', '$10,000'),
(1000232, '$40', '$10,000'),
(1000233, '$40', '$10,000'),
(1000234, '$40', '$10,000'),
(1000235, '$40', '$10,000'),
(1000236, '$40', '$10,000'),
(1000237, '$40', '$10,000'),
(1000238, '$40', '$10,000'),
(1000239, '$40', '$10,000'),
(1000240, '$40', '$10,000'),
(1000241, '$40', '$10,000'),
(1000242, '$40', '$10,000'),
(1000243, '$40', '$10,000'),
(1000244, '$40', '$10,000'),
(1000245, '$40', '$10,000'),
(1000246, '$40', '$10,000'),
(1000247, '$40', '$10,000'),
(1000248, '$35', '$10,000'),
(1000249, '$30', '$10,000'),
(1000250, '$40', '$10,000'),
(1000251, '$16', '$0'),
(1000252, '$50', '$90,000'),
(1000253, '$50', '$90,000'),
(1000254, '$50', '$90,000'),
(1000255, '$50', '$90,000'),
(1000256, '$50', '$90,000'),
(1000257, '$50', '$90,000'),
(1000258, '$50', '$90,000'),
(1000259, '$50', '$90,000'),
(1000260, '$50', '$90,000'),
(1000261, '$50', '$90,000'),
(1000262, '$50', '$90,000');


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-01-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-02-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-03-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-04-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 1:56:58 PM */
-- Delete all tables
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DROP TABLE IF EXISTS payroll          CASCADE;
DROP TABLE IF EXISTS benefits         CASCADE;
DROP TABLE IF EXISTS salary           CASCADE;
DROP TABLE IF EXISTS leave            CASCADE;
DROP TABLE IF EXISTS department       CASCADE;
DROP TABLE IF EXISTS job_location     CASCADE;
DROP TABLE IF EXISTS job              CASCADE;
DROP TABLE IF EXISTS employee         CASCADE;
DROP TABLE IF EXISTS employee_address CASCADE;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 1:56:59 PM */
-- Recreate tables from script
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Run these commands in ElephantSQL postgres database in browser tab to recreate starting tables for local testing

CREATE TABLE benefits (
  benefits_package_id        INT          GENERATED ALWAYS AS IDENTITY, 
  amount                     MONEY        NOT NULL,
  stock_options              VARCHAR(100), 
  health_insurance_provider  VARCHAR(100) NOT NULL CHECK(health_insurance_provider ~ '^[A-Z \d]+$'),
  retirement_plan            VARCHAR(100),

  PRIMARY KEY(benefits_package_id)
);


CREATE TABLE employee_address (
  address_id      INT           GENERATED ALWAYS AS IDENTITY,
  street_address  VARCHAR(100)  NOT NULL CHECK(street_address ~ '^[A-Z \/\d#\.,-]+$'),   -- Includes appt/po box info and locality info if applicable
  city            VARCHAR(50)   NOT NULL CHECK(city ~ '^[A-Z ]+$'), -- Also serves as post town if applicable
  zip_code        VARCHAR(16)   CHECK(zip_code ~ '^[\d \-A-Z]+$'), -- Also serves as postcode if applicable
  state           VARCHAR(50)   CHECK(state ~ '^[A-Z ]+$'), -- Also serves as province if applicable
  country         VARCHAR(50)   NOT NULL CHECK(country ~ '^[A-Z ]+$'),   -- Also serves as region if applicable

  PRIMARY KEY(address_id)
);


CREATE TABLE job_location (
  location_id   INT GENERATED ALWAYS AS IDENTITY,
  airport_id    INT,
  address_id    INT NOT NULL,
  flight_id     INT,
  location_name VARCHAR(50),

  PRIMARY KEY(location_id)
);


CREATE TABLE department (
  department_id       INT          GENERATED ALWAYS AS IDENTITY,
  department_name     VARCHAR(50)  NOT NULL CHECK(department_name ~ '^[A-Z ]+$'),
  creation_date       DATE         NOT NULL, 
  department_head_id  INT,

  PRIMARY KEY(department_id)
);


CREATE TABLE job (
  job_id              INT         GENERATED ALWAYS AS IDENTITY, 
  job_title           VARCHAR(50) NOT NULL CHECK(job_title ~ '^[A-Z \-]+$'),
  department_id       INT         NOT NULL, 
  location_id         INT         NOT NULL,
  weekly_hours        INT         DEFAULT 40 CHECK(weekly_hours <= 168),
  benefits_package_id INT         DEFAULT 0 NOT NULL,

  PRIMARY KEY(job_id),
  FOREIGN KEY(department_id)
    REFERENCES department(department_id)
    ON DELETE CASCADE,

  FOREIGN KEY(location_id)
    REFERENCES job_location(location_id)
    ON DELETE CASCADE,

  FOREIGN KEY(benefits_package_id)
    REFERENCES benefits(benefits_package_id)
    ON DELETE SET DEFAULT
);


CREATE TABLE employee (
  employee_id INT           GENERATED ALWAYS AS IDENTITY (START WITH 1000000),
  first_name  VARCHAR(50)   NOT NULL CHECK(first_name ~ '^[A-Z ]+$'),
  m_initial   CHAR(1),  
  last_name   VARCHAR(50)   NOT NULL CHECK(last_name ~ '^[A-Z ]+$'),
  ssn         CHAR(9)       UNIQUE CHECK(ssn ~ '^\d{9}$'),
  dob         DATE          NOT NULL,
  gender      CHAR(1)       NOT NULL CHECK(gender ~ '^[MFO]$'),
  phone       VARCHAR(15)   CHECK(phone ~ '^\+[0-9]+$'),
  email       VARCHAR(100)  UNIQUE CHECK(email ~ '^[\w\.\+]{1,64}@(\w+\.[A-Za-z]+){1,100}$'),
  job_id      INT           DEFAULT 0 NOT NULL,
  address_id  INT           NOT NULL,
  manager_id  INT,

  PRIMARY KEY(employee_id),
  FOREIGN KEY(job_id)
    REFERENCES job(job_id)
    ON DELETE SET DEFAULT,

  FOREIGN KEY(address_id)
    REFERENCES employee_address(address_id),

  FOREIGN KEY(manager_id)
    REFERENCES employee(employee_id)
    ON DELETE SET NULL
);


CREATE TABLE salary (
  salary_id    INT    GENERATED ALWAYS AS IDENTITY,
  employee_id  INT    NOT NULL,
  hourly_wage  MONEY  NOT NULL,
  annual_bonus MONEY  DEFAULT 0 NOT NULL,

  PRIMARY KEY(salary_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE leave (
  leave_id    INT           GENERATED ALWAYS AS IDENTITY,
  employee_id INT           NOT NULL,
  date        DATE          NOT NULL,
  reason      VARCHAR(100)  NOT NULL CHECK(reason ~ '^[A-Z \.\d]+$'),
  status      VARCHAR(50)   NOT NULL CHECK(status ~ '^[A-Z \.\d]+$'),

  PRIMARY KEY(leave_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE payroll (
  payroll_id    INT       GENERATED ALWAYS AS IDENTITY,
  employee_id   INT       NOT NULL, 
  hours_worked  REAL      NOT NULL,
  pay_period    DATE      NOT NULL,
  tax_rate      REAL      NOT NULL,
  gross_income  MONEY     NOT NULL,
  taxed_income  MONEY     NOT NULL,
  net_income    MONEY     NOT NULL,
  
  UNIQUE(employee_id, pay_period),

  PRIMARY KEY(payroll_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


/* DEFAULTS */
ALTER TABLE department
ADD CONSTRAINT fk_head FOREIGN KEY (department_head_id) REFERENCES employee(employee_id);


INSERT INTO benefits OVERRIDING SYSTEM VALUE VALUES(0, 0, 0, 'UNASSIGNED', 0);

INSERT INTO job_location OVERRIDING SYSTEM VALUE VALUES(0, NULL, 0, NULL);

INSERT INTO department OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', '1980-1-1');

INSERT INTO job OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', 0, 0, 0, 0);


/* Initial populated tables */

-- Departments (based on https://www.avjobs.com/history/structure-of-the-airline-industry.asp)
INSERT INTO department (department_name, creation_date) VALUES 
('BOARD OF DIRECTORS',            '1980-01-01'),
('ENGINEERING AND MAINTENANCE',   '1980-01-01'),
('GROUND OPERATIONS',             '1980-01-01'),
('FLIGHT OPERATIONS',             '1980-01-01'),
('SALES AND MARKETING',           '1980-01-01'),
('RESERVATIONS AND TICKETING',    '1980-01-01'),
('FINANCE AND PROPERTY',          '1980-01-01'),
('INFORMATION SERVICES',          '1990-11-08'),
('PERSONNEL',                     '1980-01-01'),
('EMERGENCY SERVICES',            '1980-04-05'),
('LEGAL',                         '1981-03-11'),
('PUBLIC RELATIONS AND PLANNING', '1985-07-20');


-- Benefits
INSERT INTO benefits (amount, stock_options, health_insurance_provider, retirement_plan) VALUES
(1000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS A', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS A', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN A'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(6000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS C', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(10000, 'STOCK OPTIONS D', 'INSURANCE PROVIDER D', 'RETIREMENT PLAN D'),
(4500,  'STOCK OPTIONS D', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN C');


-- Job locations
INSERT INTO job_location (airport_id, address_id, flight_id, location_name) VALUES
(NULL,  1,  NULL, 'OFFICES IN CITY A'),
(NULL,  2,  NULL, 'OFFICES IN CITY B'),
(NULL,  6,  NULL, 'OFFICES IN CITY C'),

(1, 3,  NULL, 'AIRPORT IN CITY A'),
(1, 3,  100,  'AIRPORT IN CITY A'),
(1, 3,  101,  'AIRPORT IN CITY A'),
(1, 3,  102,  'AIRPORT IN CITY A'),
(1, 3,  103,  'AIRPORT IN CITY A'),

(2, 4,  NULL, 'AIRPORT A IN CITY B'),
(2, 4,  200,  'AIRPORT A IN CITY B'),
(2, 4,  201,  'AIRPORT A IN CITY B'),
(2, 4,  202,  'AIRPORT A IN CITY B'),
(2, 4,  203,  'AIRPORT A IN CITY B'),

(3, 5,  NULL, 'AIRPORT B IN CITY B'),
(3, 5,  300,  'AIRPORT B IN CITY B'),
(3, 5,  301,  'AIRPORT B IN CITY B'),
(3, 5,  302,  'AIRPORT B IN CITY B'),
(3, 5,  303,  'AIRPORT B IN CITY B'),

(4, 7,  NULL, 'AIRPORT IN CITY C'),
(4, 7,  400,  'AIRPORT IN CITY C'),
(4, 7,  401,  'AIRPORT IN CITY C'),
(4, 7,  402,  'AIRPORT IN CITY C'),
(4, 7,  403,  'AIRPORT IN CITY C');


-- Jobs (based on https://www.airlinejobfinder.com/members/airline-jobs/)
INSERT INTO job (job_title, department_id, location_id, weekly_hours, benefits_package_id) VALUES
-- Board of Directors (1)
('CHIEF EXECUTIVE OFFICER', 1,  2,  50, 9),
('CHAIRMAN',                1,  2,  40, 9),
('VICE CHAIR',              1,  2,  40, 9),
('BOARD SECRETARY',         1,  2,  40, 9),
('TREASURER',               1,  2,  40, 9),
('BOARD MEMBER',            1,  2,  40, 9),

-- Maintenance and Engineering (2)
('AVIATION MAINTENANCE TECHNICIAN', 2,  4,  40, 2),
('POWERPLANT MECHANIC',             2,  4,  40, 2),
('AIRFRAME MECHANIC',               2,  4,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  4,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  4,  40, 2),
('AIRCRAFT FUELER',                 2,  4,  40, 2),
('AVIONIC TECHNICIAN',              2,  4,  40, 2),
('CABIN MAINTENANCE',               2,  4,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  4,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  4,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  9,  40, 2),
('POWERPLANT MECHANIC',             2,  9,  40, 2),
('AIRFRAME MECHANIC',               2,  9,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  9,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  9,  40, 2),
('AIRCRAFT FUELER',                 2,  9,  40, 2),
('AVIONIC TECHNICIAN',              2,  9,  40, 2),
('CABIN MAINTENANCE',               2,  9,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  9,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  9,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  14,  40, 2),
('POWERPLANT MECHANIC',             2,  14,  40, 2),
('AIRFRAME MECHANIC',               2,  14,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  14,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  14,  40, 2),
('AIRCRAFT FUELER',                 2,  14,  40, 2),
('AVIONIC TECHNICIAN',              2,  14,  40, 2),
('CABIN MAINTENANCE',               2,  14,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  14,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  14,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  19,  40, 2),
('POWERPLANT MECHANIC',             2,  19,  40, 2),
('AIRFRAME MECHANIC',               2,  19,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  19,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  19,  40, 2),
('AIRCRAFT FUELER',                 2,  19,  40, 2),
('AVIONIC TECHNICIAN',              2,  19,  40, 2),
('CABIN MAINTENANCE',               2,  19,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  19,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  19,  40, 2),

-- Ground Operations (3)
('DIRECTOR OF AVIATION',        3, 1, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 1, 40, 3),
('DIRECTOR OF AVIATION',        3, 2, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 2, 40, 3),
('DIRECTOR OF AVIATION',        3, 3, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 3, 40, 3),

('BAGGAGE HANDLER',               3,  4,  40, 5),
('SKYCAP',                        3,  4,  40, 5),
('CONCESSIONS',                   3,  4,  40, 5),
('AIRPORT GUIDE',                 3,  4,  40, 5),
('AIRPORT CUSTODIAN',             3,  4,  40, 1),
('OPERATIONS AGENT',              3,  4,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  4,  40, 3),
('PASSENGER SERVICE AGENT',       3,  4,  40, 3),
('RAMP PLANNER',                  3,  4,  40, 3),
('AIRLINE STATION AGENT',         3,  4,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  4,  40, 7),

('BAGGAGE HANDLER',               3,  9,  40, 5),
('SKYCAP',                        3,  9,  40, 5),
('CONCESSIONS',                   3,  9,  40, 5),
('AIRPORT GUIDE',                 3,  9,  40, 5),
('AIRPORT CUSTODIAN',             3,  9,  40, 1),
('OPERATIONS AGENT',              3,  9,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  9,  40, 3),
('PASSENGER SERVICE AGENT',       3,  9,  40, 3),
('RAMP PLANNER',                  3,  9,  40, 3),
('AIRLINE STATION AGENT',         3,  9,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  9,  40, 7),

('BAGGAGE HANDLER',               3,  14, 40, 5),
('SKYCAP',                        3,  14, 40, 5),
('CONCESSIONS',                   3,  14, 40, 5),
('AIRPORT GUIDE',                 3,  14, 40, 5),
('AIRPORT CUSTODIAN',             3,  14, 40, 1),
('OPERATIONS AGENT',              3,  14, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  14, 40, 3),
('PASSENGER SERVICE AGENT',       3,  14, 40, 3),
('RAMP PLANNER',                  3,  14, 40, 3),
('AIRLINE STATION AGENT',         3,  14, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  14, 40, 7),

('BAGGAGE HANDLER',               3,  19, 40, 5),
('SKYCAP',                        3,  19, 40, 5),
('CONCESSIONS',                   3,  19, 40, 5),
('AIRPORT GUIDE',                 3,  19, 40, 5),
('AIRPORT CUSTODIAN',             3,  19, 40, 1),
('OPERATIONS AGENT',              3,  19, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  19, 40, 3),
('PASSENGER SERVICE AGENT',       3,  19, 40, 3),
('RAMP PLANNER',                  3,  19, 40, 3),
('DISTRICT OPERATIONS MANAGER',   3,  19, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  19, 40, 7),

-- Flight Operations (4)
('FLIGHT DISPATCHER',       4,  4,  40, 6),
('AVIATION METEOROLOGIST',  4,  4,  40, 6),
('FLIGHT DISPATCHER',       4,  9,  40, 6),
('AVIATION METEOROLOGIST',  4,  9,  40, 6),
('FLIGHT DISPATCHER',       4,  14, 40, 6),
('AVIATION METEOROLOGIST',  4,  14, 40, 6),
('FLIGHT DISPATCHER',       4,  19, 40, 6),
('AVIATION METEOROLOGIST',  4,  19, 40, 6),

('CARGO CARRIER PILOT', 4,  5,  60, 6),
('COPORATE PILOT',      4,  5,  30, 6),
('CHARTER PILOT',       4,  5,  60, 6),

('CARGO CARRIER PILOT', 4,  6,  60, 6),
('COPORATE PILOT',      4,  6,  30, 6),
('CHARTER PILOT',       4,  6,  60, 6),

('CARGO CARRIER PILOT', 4,  7,  60, 6),
('COPORATE PILOT',      4,  7,  30, 6),
('CHARTER PILOT',       4,  7,  60, 6),

('CARGO CARRIER PILOT', 4,  8,  60, 6),
('COPORATE PILOT',      4,  8,  30, 6),
('CHARTER PILOT',       4,  8,  60, 6),

('CARGO CARRIER PILOT', 4,  10, 60, 6),
('COPORATE PILOT',      4,  10, 30, 6),
('CHARTER PILOT',       4,  10, 60, 6),

('CARGO CARRIER PILOT', 4,  11, 60, 6),
('COPORATE PILOT',      4,  11, 30, 6),
('CHARTER PILOT',       4,  11, 60, 6),

('CARGO CARRIER PILOT', 4,  12, 60, 6),
('COPORATE PILOT',      4,  12, 30, 6),
('CHARTER PILOT',       4,  12, 60, 6),

('CARGO CARRIER PILOT', 4,  13, 60, 6),
('COPORATE PILOT',      4,  13, 30, 6),
('CHARTER PILOT',       4,  13, 60, 6),

('CARGO CARRIER PILOT', 4,  15, 60, 6),
('COPORATE PILOT',      4,  15, 30, 6),
('CHARTER PILOT',       4,  15, 60, 6),

('CARGO CARRIER PILOT', 4,  16, 60, 6),
('COPORATE PILOT',      4,  16, 30, 6),
('CHARTER PILOT',       4,  16, 60, 6),

('CARGO CARRIER PILOT', 4,  17, 60, 6),
('COPORATE PILOT',      4,  17, 30, 6),
('CHARTER PILOT',       4,  17, 60, 6),

('CARGO CARRIER PILOT', 4,  18, 60, 6),
('COPORATE PILOT',      4,  18, 30, 6),
('CHARTER PILOT',       4,  18, 60, 6),

('CARGO CARRIER PILOT', 4,  20, 60, 6),
('COPORATE PILOT',      4,  20, 30, 6),
('CHARTER PILOT',       4,  20, 60, 6),

('CARGO CARRIER PILOT', 4,  21, 60, 6),
('COPORATE PILOT',      4,  21, 30, 6),
('CHARTER PILOT',       4,  21, 60, 6),

('CARGO CARRIER PILOT', 4,  22, 60, 6),
('COPORATE PILOT',      4,  22, 30, 6),
('CHARTER PILOT',       4,  22, 60, 6),

('CARGO CARRIER PILOT', 4,  23, 60, 6),
('COPORATE PILOT',      4,  23, 30, 6),
('CHARTER PILOT',       4,  23, 60, 6),

-- Sales and Marketing (5)
('REGIONAL SALES MANAGER',  5,  1,  40, 3),
('SALES REPRESENTATIVE',    5,  1,  40, 3),
('AIRLINE MARKETER',        5,  1,  40, 3),
('SALES INTERN',            5,  1,  20, 3),

('REGIONAL SALES MANAGER',  5,  2,  40, 3),
('SALES REPRESENTATIVE',    5,  2,  40, 3),
('AIRLINE MARKETER',        5,  2,  40, 3),
('SALES INTERN',            5,  2,  20, 3),

('REGIONAL SALES MANAGER',  5,  3,  40, 3),
('SALES REPRESENTATIVE',    5,  3,  40, 3),
('AIRLINE MARKETER',        5,  3,  40, 3),
('SALES INTERN',            5,  3,  20, 3),

-- Reservations and Ticketing (6)
('RESERVATION SALES AGENT', 6,  4,  40, 3),
('AIRLINE TICKET AGENT',    6,  4,  40, 3),

('RESERVATION SALES AGENT', 6,  9,  40, 3),
('AIRLINE TICKET AGENT',    6,  9,  40, 3),

('RESERVATION SALES AGENT', 6,  14, 40, 3),
('AIRLINE TICKET AGENT',    6,  14, 40, 3),

('RESERVATION SALES AGENT', 6,  19, 40, 3),
('AIRLINE TICKET AGENT',    6,  19, 40, 3),

-- Finance and Property (7)
('ACCOUNTANT',                7,  1,  40, 5),
('AUDITOR',                   7,  1,  40, 5),
('FINANCE ASSITANT',          7,  1,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  1,  40, 5),
('PAYROLL CLERK',             7,  1,  40, 5),
('FINANCIAL ANALYST',         7,  1,  40, 5),
('PAYROLL MANAGER',           7,  1,  40, 5),
('FINANCE INTERN',            7,  1,  20, 5),

('ACCOUNTANT',                7,  2,  40, 5),
('AUDITOR',                   7,  2,  40, 5),
('FINANCE ASSITANT',          7,  2,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  2,  40, 5),
('PAYROLL CLERK',             7,  2,  40, 5),
('FINANCIAL ANALYST',         7,  2,  40, 5),
('PAYROLL MANAGER',           7,  2,  40, 5),
('FINANCE INTERN',            7,  2,  20, 5),

('ACCOUNTANT',                7,  3,  40, 5),
('AUDITOR',                   7,  3,  40, 5),
('FINANCE ASSITANT',          7,  3,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  3,  40, 5),
('PAYROLL CLERK',             7,  3,  40, 5),
('FINANCIAL ANALYST',         7,  3,  40, 5),
('PAYROLL MANAGER',           7,  3,  40, 5),
('FINANCE INTERN',            7,  3,  20, 5),

-- Information services (8)
('IT SPECIALIST',     8,  1,  40, 3),
('IT INTERN',         8,  1,  20, 3),
('HELP DESK SUPPORT', 8,  1,  40, 3),

('IT SPECIALIST',     8,  2,  40, 3),
('HELP DESK SUPPORT', 8,  2,  40, 3),
('IT INTERN',         8,  2,  20, 3),

('IT SPECIALIST',     8,  3,  40, 3),
('HELP DESK SUPPORT', 8,  3,  40, 3),
('IT INTERN',         8,  3,  20, 3),

-- Personnel (9)
('SECRETARY',                   9,  1,  40, 3),
('MAIL CLERK',                  9,  1,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  1,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  1,  40, 3),
('RECEPTIONIST',                9,  1,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  1,  40, 3),

('SECRETARY',                   9,  2,  40, 3),
('MAIL CLERK',                  9,  2,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  2,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  2,  40, 3),
('RECEPTIONIST',                9,  2,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  2,  40, 3),

('SECRETARY',                   9,  3,  40, 3),
('MAIL CLERK',                  9,  3,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  3,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  3,  40, 3),
('RECEPTIONIST',                9,  3,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  3,  40, 3),

-- Emergency Services (10)
('FIREFIGHTER',           10,  4,  40, 10),
('FIREFIGHTER MEDIC',     10,  4,  40, 10),
('POLICE OFFICER',        10,  4,  40, 10),
('FIRE AND CRASH RESCUE', 10,  4,  30, 10),
('POLICE PATROL OFFICER', 10,  4,  30, 10),

('FIREFIGHTER',           10,  9,  40, 10),
('FIREFIGHTER MEDIC',     10,  9,  40, 10),
('POLICE OFFICER',        10,  9,  40, 10),
('FIRE AND CRASH RESCUE', 10,  9,  30, 10),
('POLICE PATROL OFFICER', 10,  9,  30, 10),

('FIREFIGHTER',           10,  14, 40, 10),
('FIREFIGHTER MEDIC',     10,  14, 40, 10),
('POLICE OFFICER',        10,  14, 40, 10),
('FIRE AND CRASH RESCUE', 10,  14, 30, 10),
('POLICE PATROL OFFICER', 10,  14, 30, 10),

('FIREFIGHTER',           10,  19, 40, 10),
('FIREFIGHTER MEDIC',     10,  19, 40, 10),
('POLICE OFFICER',        10,  19, 40, 10),
('FIRE AND CRASH RESCUE', 10,  19, 30, 10),
('POLICE PATROL OFFICER', 10,  19, 30, 10),

-- Legal (11)
('AVIATION ATTORNEY',  11,  1,  40, 7),
('AVIATION ATTORNEY',  11,  2,  40, 7),
('AVIATION ATTORNEY',  11,  3,  40, 7),

-- Public Relations and Planning (12)
('PUBLIC RELATIONS SPECIALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS GENERALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS MANAGER',    12,  2,  40, 3),
('PUBLIC RELATIONS INTERN',     12,  2,  20, 3),

('HEAD OF ENGINEERING',           2,  2,  40, 9),
('HEAD OF GROUND OPERATIONS',     3,  2,  40, 9),
('HEAD OF FLIGHT OPERATIONS',     4,  2,  40, 9),
('HEAD OF SALES',                 5,  2,  40, 9),
('HEAD OF RESERVATIONS',          6,  2,  40, 9),
('HEAD OF FINANCE',               7,  2,  40, 9),
('HEAD OF INFORMATION SERVICES',  8,  2,  40, 9),
('HEAD OF PERSONNEL MANAGEMENT',  9,  2,  40, 9),
('HEAD OF EMERGENCY SERVICES',    10, 2,  40, 9),
('HEAD OF LEGAL',                 11, 2,  40, 9),
('HEAD OF PUBLIC RELATIONS',      12, 2,  40, 9);


-- Employee Address
INSERT INTO employee_address (street_address, city, zip_code, state, country) VALUES
('123 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('123 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('321 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('555 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('9029 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('765 MAIN ST',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('767 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('876 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8770 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('202 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('101 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('896 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('909 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('920 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('808 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8760 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8755 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('423 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('202 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('101 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('896 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('909 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 SEAWATER LN',     'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8260 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8234 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8754 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('808 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8234 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8754 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SLEEPY HILLS',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 FISHWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MINOR ST',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 LION LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 JUMPY HILLS',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 FISHWATER ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MINOR RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 LION RD',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SLEEPY SLOPES',  'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('423 FISHWATER RD',    'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8777 MAIN ST',        'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('920 LONG LN',         'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 KLEINE DR',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 EINE DR',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 ROADY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 NEIN LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KLEINE DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 EINE DR',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 ROADY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KLEINE DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 EINE DR',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 ROADY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 ROCKY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 BUMPY HILLS',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 POOLWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 DIGGY LN',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 ZEBRA ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 MERRYWEATHER LN', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CHRONO ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('420 CLOUDY DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 MERRYWEATHER LN', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 CHRONO ST',      'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('420 CLOUDY DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 TIME ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 TIME ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 TIME ST',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 STEEL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 STEEL LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A');


-- Employee
INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOHN',      'H',        'SMITH',      '123456789', '1965-01-01',  'M',    '+15553219090', 'jsmith@company.org',     1,      1,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MARY',      NULL,       'ORLEANS',    '987654321', '1970-04-09',  'F',    '+15559990001', 'morleans@company.org',   2,      2,          1000000),
('HARRIS',    NULL,       'BEAUDRY',    '111223333', '1967-04-29',  'M',    '+15559990021', 'hbeaudry@company.org',   3,      3,          NULL),
('ANABEL',    'A',        'NEALIOUS',   '112345678', '1980-01-09',  'F',    '+15559990011', 'anaulious@company.org',  4,      4,          NULL),
('DON',       'E',        'SYLVER',     '112345688', '1969-11-24',  'M',    '+15559980011', 'dsylver@company.org',    5,      5,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BRENDON',   NULL,       'LAMBINO',    '112346689', '1965-11-24',  'M',    '+15559680011', 'blambino@company.org',   6,      6,          1000001),
('MYRTLE',    NULL,       'TRUOG',      '122345688', '1969-12-24',  'F',    '+16559980011', 'mtruog@company.org',     6,      7,          1000001),
('LASZLO',    NULL,       'LUAIN',      '111345688', '1971-02-24',  'M',    '+15567980011', 'lluain@company.org',     6,      8,          1000001);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '117345689', '1984-06-23',  'M',    '+15567980111', NULL,                     7,      9,          NULL),
('LATIFA',    NULL,       'BELTZ',      '117245689', '1984-02-24',  'F',    '+15569980011', NULL,                     8,      10,         NULL),
('ELINA',     NULL,       'HAUTUM',     '117445689', '1983-06-24',  'F',    '+15567900811', NULL,                     9,      11,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '117545689', '1983-08-12',  'M',    '+15567980211', NULL,                     10,     12,         NULL),
('SOLOMON',   'V',        'TERZI',      '117745689', '1984-09-23',  'M',    '+15567980311', NULL,                     11,     13,         NULL),
('QUINCTUS',  NULL,       'HART',       '113345689', '1990-12-19',  'M',    '+15567980411', NULL,                     12,     14,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '118345689', '1987-06-04',  'F',    '+15567980511', NULL,                     13,     15,         NULL),
('LAURENS',   NULL,       'RUSH',       '114345689', '1989-05-03',  'M',    '+15567980611', NULL,                     14,     16,         NULL),
('SHANNA',    'M',        'PLANCK',     '111342689', '1990-04-02',  'F',    '+15567980711', NULL,                     15,     17,         NULL),
('REINALDO',  'S',        'CLARK',      '117355689', '1988-03-01',  'M',    '+15567980811', NULL,                     16,     18,         NULL);


UPDATE employee
SET manager_id = 1000017
WHERE employee_id < 1000017 AND employee_id > 1000007;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PRINCE',    'S',        'BERGFALK',   '100000001', '1984-06-23',  'M',    '+15567180111', NULL,                     17,     19,         NULL),
('RICO',      NULL,       'MILFORD',    '100000002', '1984-02-24',  'M',    '+15569180011', NULL,                     18,     20,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000003', '1983-06-24',  'M',    '+15567100811', NULL,                     19,     21,         NULL),
('BENVENUTO', 'J',        'BRYAN',      '100000004', '1983-08-12',  'M',    '+15567180211', NULL,                     20,     22,         NULL),
('SARA',      'S',        'COKES',      '100000005', '1984-09-23',  'F',    '+15567180311', NULL,                     21,     23,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000006', '1990-12-19',  'F',    '+15567180411', NULL,                     22,     24,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000007', '1987-06-04',  'F',    '+15567180511', NULL,                     23,     25,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000008', '1989-05-03',  'F',    '+15567180611', NULL,                     24,     26,         NULL),
('KYLEE',     'M',        'DARROW',     '100000009', '1990-04-02',  'F',    '+15567180711', NULL,                     25,     27,         NULL),
('SHIRO',     'G',        'DARZI',      '100000010', '1988-03-01',  'M',    '+15567180811', NULL,                     26,     28,         NULL);


UPDATE employee
SET manager_id = 1000027
WHERE employee_id < 1000027 AND employee_id > 1000017;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'B',        'ANKEREN',    '100000011', '1984-06-23',  'M',    '+15566180111', NULL,                     27,     29,         NULL),
('RICO',      NULL,       'MILFORD',    '100000012', '1984-02-24',  'M',    '+15566180011', NULL,                     28,     30,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000013', '1983-06-24',  'M',    '+15566100811', NULL,                     29,     31,         NULL),
('BENVENUTO', 'A',        'BRYAN',      '100000014', '1983-08-12',  'M',    '+15566180211', NULL,                     30,     32,         NULL),
('SARA',      'T',        'COKES',      '100000015', '1984-09-23',  'F',    '+15566180311', NULL,                     31,     33,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000016', '1990-12-19',  'F',    '+15566180411', NULL,                     32,     34,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000017', '1987-06-04',  'F',    '+15566180511', NULL,                     33,     35,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000018', '1989-05-03',  'F',    '+15566180611', NULL,                     34,     36,         NULL),
('KYLEE',     'O',        'DARROW',     '100000019', '1990-04-02',  'F',    '+15566180711', NULL,                     35,     37,         NULL),
('SHIRO',     'K',        'DARZI',      '100000020', '1988-03-01',  'M',    '+15566180811', NULL,                     36,     38,         NULL);


UPDATE employee
SET manager_id = 1000037
WHERE employee_id < 1000037 AND employee_id > 1000027;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '100000031', '1985-06-13',  'M',    '+25567980221', NULL,                     37,     39,         NULL),
('LATIFA',    NULL,       'BELTZ',      '100000032', '1985-02-14',  'F',    '+25569980221', NULL,                     38,     40,         NULL),
('ELINA',     NULL,       'HAUTUM',     '100000033', '1985-06-14',  'F',    '+25567900221', NULL,                     39,     41,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '100000034', '1985-08-12',  'M',    '+25574980221', NULL,                     40,     42,         NULL),
('SOLOMON',   'V',        'TERZI',      '100000035', '1985-09-13',  'M',    '+25574880221', NULL,                     41,     43,         NULL),
('QUINCTUS',  NULL,       'HART',       '100000036', '1995-12-19',  'M',    '+25568980221', NULL,                     42,     44,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '100000037', '1985-06-14',  'F',    '+25577980221', NULL,                     43,     45,         NULL),
('LAURENS',   NULL,       'RUSH',       '100000038', '1985-05-13',  'M',    '+25587980221', NULL,                     44,     46,         NULL),
('SHANNA',    'M',        'PLANCK',     '100000039', '1995-04-12',  'F',    '+25569980221', NULL,                     45,     47,         NULL),
('REINALDO',  'Q',        'HART',       '100000040', '1985-03-11',  'M',    '+25560980221', NULL,                     46,     48,         NULL);


UPDATE employee
SET manager_id = 1000047
WHERE employee_id < 1000047 AND employee_id > 1000037;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAUTVYDAS', 'C',        'LANG',       '100000041', '1986-06-13',  'M',    '+15567980221', NULL,                     47,     49,         NULL),
('JOAKIM',    NULL,       'LEON',       '100000042', '1986-02-14',  'M',    '+15569980221', NULL,                     48,     50,         NULL),
('VALENTIN',  NULL,       'FIORE',      '100000043', '1986-06-14',  'M',    '+15567900221', NULL,                     49,     51,         NULL),
('SHAHIN',    'G',        'HOBBES',     '100000044', '1986-08-12',  'M',    '+15574980221', NULL,                     50,     52,         NULL),
('EVITA',     'I',        'ACHTEROP',   '100000045', '1986-09-13',  'F',    '+15574880221', NULL,                     51,     53,         NULL),
('REINALDO',  'I',        'CLARKE',     '100000046', '1986-03-11',  'M',    '+15560980221', NULL,                     52,     54,         NULL);


UPDATE employee
SET manager_id = employee_id - 1
WHERE employee_id IN (1000049, 1000051, 1000053);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'J',        'DUPUY',      '100000047', '1984-06-23',  'M',    '+15867980221', NULL,                     53,     55,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000048', '1994-02-24',  'M',    '+15869980221', NULL,                     54,     56,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000049', '1984-06-24',  'F',    '+15867900221', NULL,                     55,     57,         NULL),
('LOLA',      'I',        'PATTERSON',  '100000050', '1984-08-22',  'F',    '+15874980221', NULL,                     56,     58,         NULL),
('DEIRDRE',   'R',        'STRANGE',    '100000051', '1984-09-23',  'F',    '+15874880221', NULL,                     57,     59,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000052', '1964-12-29',  'M',    '+15868980221', NULL,                     58,     60,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000053', '1984-06-24',  'F',    '+15877980221', NULL,                     59,     61,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000054', '1964-05-23',  'M',    '+15887980221', NULL,                     60,     62,         NULL),
('VALERIAN',  'M',        'DABNEY',     '100000055', '1994-04-22',  'F',    '+15869580221', NULL,                     61,     63,         NULL),
('LIANE',     'M',        'MARIA',      '100000056', '1994-04-22',  'F',    '+15869380221', NULL,                     62,     64,         NULL),
('TAAVI',     'B',        'HOUBEN',     '100000057', '1984-03-21',  'M',    '+15860980221', NULL,                     63,     65,         NULL);


UPDATE employee
SET manager_id = 1000063
WHERE employee_id < 1000065 AND employee_id > 1000053 AND NOT employee_id = 1000063;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'A',        'DUPUY',      '100000058', '1982-04-23',  'M',    '+15867910221', NULL,                     64,     66,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000059', '1992-12-24',  'M',    '+15869910221', NULL,                     65,     67,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000060', '1982-04-24',  'F',    '+15867510221', NULL,                     66,     68,         NULL),
('LOLA',      'A',        'PATTERSON',  '100000061', '1982-06-22',  'F',    '+15874910221', NULL,                     67,     69,         NULL),
('DEIRDRE',   'A',        'STRANGE',    '100000062', '1982-07-23',  'F',    '+15874810221', NULL,                     68,     70,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000063', '1962-12-29',  'M',    '+15868910221', NULL,                     69,     71,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000064', '1982-04-24',  'F',    '+15877910221', NULL,                     70,     72,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000065', '1962-03-23',  'M',    '+15887910221', NULL,                     71,     73,         NULL),
('VALERIAN',  'A',        'DABNEY',     '100000066', '1992-02-22',  'F',    '+15869510221', NULL,                     72,     74,         NULL),
('BRIGITTA',  'A',        'MATHEWSON',  '100000067', '1992-02-22',  'F',    '+15869310221', NULL,                     73,     75,         NULL),
('TAAVI',     'A',        'HOUBEN',     '100000068', '1982-01-21',  'M',    '+15860910221', NULL,                     74,     76,         NULL);


UPDATE employee
SET manager_id = 1000074
WHERE employee_id < 1000076 AND employee_id > 1000064 AND NOT employee_id = 1000074;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000069', '1988-04-23',  'M',    '+15867910361', NULL,                     75,     77,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000070', '1998-12-24',  'F',    '+15869910361', NULL,                     76,     78,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000071', '1988-04-24',  'F',    '+15867510361', NULL,                     77,     79,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000072', '1988-06-22',  'F',    '+15874910361', NULL,                     78,     80,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000073', '1988-07-23',  'M',    '+15874810361', NULL,                     79,     81,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000074', '1968-12-29',  'M',    '+15868910361', NULL,                     80,     82,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000075', '1988-04-24',  'M',    '+15877910361', NULL,                     81,     83,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000076', '1968-03-23',  'M',    '+15887910361', NULL,                     82,     84,         NULL),
('SUNE',      'P',        'FOSSE',      '100000077', '1998-02-22',  'F',    '+15869510361', NULL,                     83,     85,         NULL),
('GEORGETA',  'L',        'ALLARD',     '100000078', '1998-02-22',  'F',    '+15869310361', NULL,                     84,     86,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000079', '1988-01-21',  'F',    '+15860910361', NULL,                     85,     87,         NULL);


UPDATE employee
SET manager_id = 1000085
WHERE employee_id < 1000087 AND employee_id > 1000075 AND NOT employee_id = 1000085;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000080', '1988-04-23',  'M',    '+25867910361', NULL,                     86,     88,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000081', '1998-12-24',  'F',    '+25869910361', NULL,                     87,     89,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000082', '1988-04-24',  'F',    '+25867510361', NULL,                     88,     90,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000083', '1988-06-22',  'F',    '+25874910361', NULL,                     89,     91,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000084', '1988-07-23',  'M',    '+25874810361', NULL,                     90,     92,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000085', '1968-12-29',  'M',    '+25868910361', NULL,                     91,     93,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000086', '1988-04-24',  'M',    '+25877910361', NULL,                     92,     94,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000087', '1968-03-23',  'M',    '+25887910361', NULL,                     93,     95,         NULL),
('SUNE',      'P',        'FOSSE',      '100000088', '1998-02-22',  'F',    '+25869510361', NULL,                     94,     96,         NULL),
('SANDRA',    'M',        'ALLARD',     '100000089', '1998-02-22',  'F',    '+25869310361', NULL,                     95,     97,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000090', '1988-01-21',  'F',    '+25860910361', NULL,                     96,     98,         NULL);


UPDATE employee
SET manager_id = 1000096
WHERE employee_id < 1000098 AND employee_id > 1000086 AND NOT employee_id = 1000096;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000091', '1988-04-23',  'M',    '+15067910361', NULL,                     97,     99,         1000063),
('KRISTIN',   NULL,       'SCRIVEN',    '100000092', '1998-12-24',  'F',    '+15069910361', NULL,                     98,     100,        1000063),
('MONIKA',    NULL,       'INGESSON',   '100000093', '1988-04-24',  'F',    '+15067510361', NULL,                     99,     101,        1000074),
('VASIA',     'K',        'MIYAZAKI',   '100000094', '1988-06-22',  'F',    '+15074910361', NULL,                     100,    102,        1000074),
('FAIRUZ',    'H',        'BYRD',       '100000095', '1988-07-23',  'M',    '+15074810361', NULL,                     101,    103,        1000085),
('SULEYMAN',  NULL,       'KURZMANN',   '100000096', '1968-12-29',  'M',    '+15068910361', NULL,                     102,    104,        1000085),
('FELIX',     NULL,       'LINDQVIST',  '100000097', '1988-04-24',  'M',    '+25077910361', NULL,                     103,    105,        1000096),
('TSHEPO',    NULL,       'BEST',       '100000098', '1968-03-23',  'M',    '+25087910361', NULL,                     104,    106,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'S',        'CORNELL',    '100000099', '1988-04-23',  'M',    NULL,           NULL,                     105,    107,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000100', '1998-12-24',  'F',    NULL,           NULL,                     106,    108,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000101', '1988-04-24',  'F',    NULL,           NULL,                     107,    109,        NULL),
('VASIA',     'R',        'MIYAZAKI',   '100000102', '1988-06-22',  'F',    NULL,           NULL,                     108,    110,        NULL),
('FAIRUZ',    'Q',        'BYRD',       '100000103', '1988-07-23',  'M',    NULL,           NULL,                     109,    111,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000104', '1968-12-29',  'M',    NULL,           NULL,                     110,    112,        NULL),
('NAMEY',     NULL,       'LINDQVIST',  '100000105', '1988-04-24',  'M',    NULL,           NULL,                     111,    113,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000106', '1988-04-24',  'M',    NULL,           NULL,                     112,    114,        NULL),
('HIDEKI',    'P',        'CORNELL',    '100000107', '1988-04-23',  'M',    NULL,           NULL,                     113,    115,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000108', '1998-12-24',  'F',    NULL,           NULL,                     114,    116,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000109', '1988-04-24',  'F',    NULL,           NULL,                     115,    117,        NULL),
('VASIA',     'O',        'MIYAZAKI',   '100000110', '1988-06-22',  'F',    NULL,           NULL,                     116,    118,        NULL),
('FAIRUZ',    'N',        'BYRD',       '100000111', '1988-07-23',  'M',    NULL,           NULL,                     117,    119,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000112', '1968-12-29',  'M',    NULL,           NULL,                     118,    120,        NULL),
('AMY',       NULL,       'LINDQVIST',  '100000113', '1988-04-24',  'F',    NULL,           NULL,                     119,    121,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000114', '1988-04-24',  'M',    NULL,           NULL,                     120,    122,        NULL),
('HIDEKI',    'M',        'CORNELL',    '100000115', '1988-04-23',  'M',    NULL,           NULL,                     121,    123,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000116', '1998-12-24',  'F',    NULL,           NULL,                     122,    124,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000117', '1988-04-24',  'F',    NULL,           NULL,                     123,    125,        NULL),
('VASIA',     'L',        'MIYAZAKI',   '100000118', '1988-06-22',  'F',    NULL,           NULL,                     124,    126,        NULL),
('FAIRUZ',    'K',        'BYRD',       '100000119', '1988-07-23',  'M',    NULL,           NULL,                     125,    127,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000120', '1968-12-29',  'M',    NULL,           NULL,                     126,    128,        NULL),
('FELIX',     NULL,       'ULG',        '100000121', '1988-04-24',  'M',    NULL,           NULL,                     127,    129,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000122', '1988-04-24',  'M',    NULL,           NULL,                     128,    130,        NULL),
('HIDEKI',    'J',        'CORNELL',    '100000123', '1988-04-23',  'M',    NULL,           NULL,                     129,    131,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000124', '1998-12-24',  'F',    NULL,           NULL,                     130,    132,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000125', '1988-04-24',  'F',    NULL,           NULL,                     131,    133,        NULL),
('VASIA',     'H',        'MIYAZAKI',   '100000126', '1988-06-22',  'F',    NULL,           NULL,                     132,    134,        NULL),
('FAIRUZ',    'I',        'BYRD',       '100000127', '1988-07-23',  'M',    NULL,           NULL,                     133,    135,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000128', '1968-12-29',  'M',    NULL,           NULL,                     134,    136,        NULL),
('FELIX',     NULL,       'KURZMANN',   '100000129', '1988-04-24',  'M',    NULL,           NULL,                     135,    137,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000130', '1988-04-24',  'M',    NULL,           NULL,                     136,    138,        NULL),
('HIDEKI',    'G',        'CORNELL',    '100000131', '1988-04-23',  'M',    NULL,           NULL,                     137,    139,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000132', '1998-12-24',  'F',    NULL,           NULL,                     138,    140,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000133', '1988-04-24',  'F',    NULL,           NULL,                     139,    141,        NULL),
('VASIA',     'F',        'MIYAZAKI',   '100000134', '1988-06-22',  'F',    NULL,           NULL,                     140,    142,        NULL),
('FAIRUZ',    'E',        'BYRD',       '100000135', '1988-07-23',  'M',    NULL,           NULL,                     141,    143,        NULL),
('HERSHALL',  NULL,       'KURZMANN',   '100000136', '1968-12-29',  'M',    NULL,           NULL,                     142,    144,        NULL),
('JEREMY',    NULL,       'LINDQVIST',  '100000137', '1988-04-24',  'M',    NULL,           NULL,                     143,    145,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000138', '1988-04-24',  'M',    NULL,           NULL,                     144,    146,        NULL),
('HIDEKI',    'C',        'CORNELL',    '100000139', '1988-04-23',  'M',    NULL,           NULL,                     145,    147,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000140', '1998-12-24',  'F',    NULL,           NULL,                     146,    148,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000141', '1988-04-24',  'F',    NULL,           NULL,                     147,    149,        NULL),
('VASIA',     'B',        'MIYAZAKI',   '100000142', '1988-06-22',  'F',    NULL,           NULL,                     148,    150,        NULL),
('MARK',      'A',        'BYRD',       '100000143', '1988-07-23',  'M',    NULL,           NULL,                     149,    151,        NULL),
('JOHN',      NULL,       'KURZMANN',   '100000144', '1968-12-29',  'M',    NULL,           NULL,                     150,    152,        NULL),
('KARL',      NULL,       'LINDQVIST',  '100000145', '1988-04-24',  'M',    NULL,           NULL,                     151,    153,        NULL),
('JOHN',      NULL,       'LINDQVIST',  '100000146', '1988-04-24',  'M',    NULL,           NULL,                     152,    154,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PROPSPER',  'S',        'ALFERINK',   '100000147', '1988-04-23',  'M',    NULL,           NULL,                     153,    155,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BEATRICE',  'S',        'ABBADELLI',  '100000148', '1988-04-23',  'F',    NULL,           NULL,                     154,    156,        1000154),
('KUROSH',    NULL,       'ABBADELLI',  '100000149', '1988-04-23',  'M',    NULL,           NULL,                     155,    157,        1000154),
('LUKAS',     NULL,       'ABBADELLI',  '100000150', '1988-04-23',  'M',    NULL,           NULL,                     156,    158,        1000154);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000151', '1988-04-23',  'M',    NULL,           NULL,                     157,    159,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('FRANCO',    'S',        'CALVO',      '100000152', '1989-04-23',  'M',    NULL,           NULL,                     158,    160,        1000158),
('ALVA',      NULL,       'SERAFINI',   '100000153', '1989-05-23',  'F',    NULL,           NULL,                     159,    161,        1000158),
('LUKAS',     NULL,       'CALVO',      '100000154', '1985-08-28',  'M',    NULL,           NULL,                     160,    162,        1000158);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000155', '1988-04-23',  'M',    NULL,           NULL,                     161,    163,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'S',        'JEANS',      '100000156', '1989-04-23',  'M',    NULL,           NULL,                     162,    164,        1000162),
('HARRY',     NULL,       'NOSE',       '100000157', '1989-05-23',  'M',    NULL,           NULL,                     163,    165,        1000162),
('BARNEY',    NULL,       'BILLS',      '100000158', '1985-08-28',  'M',    NULL,           NULL,                     164,    166,        1000162);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'J',        'JEANS',      '100000159', '1989-04-23',  'M',    NULL,           NULL,                     165,    167,        1000063),
('HARRY',     NULL,       'NOSEN',      '100000160', '1989-05-23',  'M',    NULL,           NULL,                     166,    168,        1000063),
('BARNEY',    NULL,       'BILLS',      '100000161', '1985-08-28',  'M',    NULL,           NULL,                     167,    169,        1000074),
('JIMMY',     'P',        'JEANS',      '100000162', '1989-04-23',  'M',    NULL,           NULL,                     168,    170,        1000074),
('BARRY',     NULL,       'NOSE',       '100000163', '1989-05-23',  'M',    NULL,           NULL,                     169,    171,        1000085),
('BARNEY',    NULL,       'BILLS',      '100000164', '1985-08-28',  'M',    NULL,           NULL,                     170,    172,        1000085),
('JIMMOTHY',  'S',        'JENSON',     '100000165', '1989-04-23',  'M',    NULL,           NULL,                     171,    173,        1000096),
('LARRY',     NULL,       'NOSE',       '100000166', '1989-05-23',  'M',    NULL,           NULL,                     172,    174,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANNE',      'S',        'PERROT',     '100000167', '1975-04-23',  'F',    NULL,           NULL,                     173,    175,        NULL),
('SAWDA',     NULL,       'PAPOUTSIS',  '100000168', '1975-05-23',  'F',    NULL,           NULL,                     174,    176,        NULL),
('BARNEY',    NULL,       'DINO',       '100000169', '1974-08-28',  'M',    NULL,           NULL,                     175,    177,        NULL),
('JACOBA',    'A',        'PENA',       '100000170', '1974-04-23',  'M',    NULL,           NULL,                     176,    178,        NULL),
('SEONG',     NULL,       'KOOLS',      '100000171', '1974-05-23',  'F',    NULL,           NULL,                     177,    179,        NULL),
('IKENNA',    NULL,       'ROMILLY',    '100000172', '1974-08-28',  'F',    NULL,           NULL,                     178,    180,        NULL),
('FERNANDO',  'V',        'BRICE',      '100000173', '1974-04-23',  'M',    NULL,           NULL,                     179,    181,        NULL),
('HORACIO',   NULL,       'KURZ',       '100000174', '1974-05-23',  'M',    NULL,           NULL,                     180,    182,        NULL);


UPDATE employee
SET manager_id = 1000179
WHERE employee_id IN (1000176, 1000177, 1000181);


UPDATE employee
SET manager_id = 1000180
WHERE employee_id IN (1000174, 1000175, 1000178, 1000179);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'WILDGRUBE',  '100000175', '1975-04-23',  'F',    NULL,           NULL,                     181,    183,        NULL),
('STARR',     NULL,       'GARNETT',    '100000176', '1975-05-23',  'F',    NULL,           NULL,                     182,    184,        NULL),
('PING',      NULL,       'DINO',       '100000177', '1974-08-28',  'M',    NULL,           NULL,                     183,    185,        NULL),
('JEF',       'C',        'COMO',       '100000178', '1974-04-23',  'M',    NULL,           NULL,                     184,    186,        NULL),
('SEVERINE',  NULL,       'BJARNESEN',  '100000179', '1974-05-23',  'F',    NULL,           NULL,                     185,    187,        NULL),
('HUAN',      NULL,       'LEIFSSON',   '100000180', '1974-08-28',  'M',    NULL,           NULL,                     186,    188,        NULL),
('LINWOOD',   'O',        'COOKE',      '100000181', '1974-04-23',  'M',    NULL,           NULL,                     187,    189,        NULL),
('PEPE',      NULL,       'GARDINER',   '100000182', '1974-05-23',  'M',    NULL,           NULL,                     188,    190,        NULL);


UPDATE employee
SET manager_id = 1000187
WHERE employee_id IN (1000184, 1000185, 1000189);


UPDATE employee
SET manager_id = 1000188
WHERE employee_id IN (1000182, 1000183, 1000186, 1000187);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAISIA',    'S',        'ROSE',       '100000183', '1975-04-23',  'F',    NULL,           NULL,                     189,    191,        NULL),
('OLGA',      NULL,       'SCHULTHEISS','100000184', '1975-05-23',  'F',    NULL,           NULL,                     190,    192,        NULL),
('KYOU',      NULL,       'SUZUKI',     '100000185', '1970-08-28',  'F',    NULL,           NULL,                     191,    193,        NULL),
('ROLLO',     'D',        'SHORT',      '100000186', '1970-04-23',  'M',    NULL,           NULL,                     192,    194,        NULL),
('LEONARDO',  NULL,       'BJARNESEN',  '100000187', '1970-05-23',  'M',    NULL,           NULL,                     193,    195,        NULL),
('HUAN',      NULL,       'ROSE',       '100000188', '1970-08-28',  'M',    NULL,           NULL,                     194,    196,        NULL),
('FLAVIA',    'O',        'MOROZOV',    '100000189', '1970-04-23',  'M',    NULL,           NULL,                     195,    197,        NULL),
('CORINNA',   NULL,       'WERNHER',    '100000190', '1970-05-23',  'M',    NULL,           NULL,                     196,    198,        NULL);


UPDATE employee
SET manager_id = 1000195
WHERE employee_id IN (1000192, 1000193, 1000197);


UPDATE employee
SET manager_id = 1000196
WHERE employee_id IN (1000190, 1000191, 1000194, 1000195);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MAXINE',    'A',        'THAIDHG',    '100000191', '1975-04-23',  'F',    NULL,           NULL,                     197,    199,        NULL),
('MARCEAU',   NULL,       'OTTEN',      '100000192', '2000-05-23',  'M',    NULL,           NULL,                     198,    200,        NULL),
('HARLOW',    NULL,       'ARENDOK',    '100000193', '1970-08-28',  'M',    NULL,           NULL,                     199,    201,        NULL);


UPDATE employee
SET manager_id = 1000198
WHERE employee_id = 1000199;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANDRE',     'K',        'GILBERT',    '100000194', '1975-05-23',  'M',    NULL,           NULL,                     200,    202,        NULL),
('EMIL',      NULL,       'TRAVERSO',   '100000195', '2000-08-23',  'M',    NULL,           NULL,                     201,    203,        NULL),
('SEPHORA',   NULL,       'VILLENEUVE', '100000196', '1971-08-28',  'F',    NULL,           NULL,                     202,    204,        NULL);


UPDATE employee
SET manager_id = 1000201
WHERE employee_id = 1000202;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AFAF',      'S',        'LOWE',       '100000197', '1975-04-23',  'M',    NULL,           NULL,                     203,    205,        NULL),
('MAXIME',    NULL,       'LAMBERT',    '100000198', '2001-08-23',  'M',    NULL,           NULL,                     204,    206,        NULL),
('TERZO',     NULL,       'HERZOG',     '100000199', '1970-08-28',  'F',    NULL,           NULL,                     205,    207,        NULL);


UPDATE employee
SET manager_id = 1000204
WHERE employee_id = 1000205;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'LOWE',       '100000200', '1975-04-23',  'F',    NULL,           NULL,                     206,    208,        NULL),
('STARR',     NULL,       'LAMBERT',    '100000201', '2001-08-23',  'F',    NULL,           NULL,                     207,    209,        NULL),
('PING',      NULL,       'HERZOG',     '100000202', '1970-08-28',  'M',    NULL,           NULL,                     208,    210,        NULL),
('JEF',       'H',        'LOWE',       '100000203', '1975-04-23',  'M',    NULL,           NULL,                     209,    211,        NULL),
('SEVERINE',  NULL,       'LAMBERT',    '100000204', '2001-08-23',  'F',    NULL,           NULL,                     210,    212,        NULL),
('HUAN',      NULL,       'HERZOG',     '100000205', '1970-08-28',  'F',    NULL,           NULL,                     211,    213,        NULL);


UPDATE employee
SET manager_id = 1000210
WHERE employee_id = 1000209;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'P',        'LOWE',       '100000206', '1978-12-01',  'M',    NULL,           NULL,                     212,    214,        NULL),
('RICO',      NULL,       'LAMBERT',    '100000207', '1999-04-02',  'M',    NULL,           NULL,                     213,    215,        NULL),
('DEVARAJ',   NULL,       'HERZOG',     '100000208', '1978-03-03',  'M',    NULL,           NULL,                     214,    216,        NULL),
('BENVENUTO', 'L',        'LOWE',       '100000209', '1978-02-04',  'M',    NULL,           NULL,                     215,    217,        NULL),
('SARA',      NULL,       'LAMBERT',    '100000210', '1999-01-05',  'F',    NULL,           NULL,                     216,    218,        NULL),
('LALE',      NULL,       'HERZOG',     '100000211', '1978-05-06',  'M',    NULL,           NULL,                     217,    219,        NULL);


UPDATE employee
SET manager_id = 1000216
WHERE employee_id = 1000215;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('RAJ',       'D',        'OSBOURNE',   '100000212', '1978-12-01',  'M',    NULL,           NULL,                     218,    220,        NULL),
('SIMONE',    NULL,       'ASIS',       '100000213', '1999-04-02',  'F',    NULL,           NULL,                     219,    221,        NULL),
('JOLINE',    NULL,       'LEEUWENHOEK','100000214', '1978-03-03',  'F',    NULL,           NULL,                     220,    222,        NULL),
('YULIA',     'L',        'THAIDHG',    '100000215', '1978-02-04',  'F',    NULL,           NULL,                     221,    223,        NULL),
('CY',        NULL,       'NEAL',       '100000216', '1999-01-05',  'M',    NULL,           NULL,                     222,    224,        NULL),
('ANDREA',    NULL,       'MCCREERY',   '100000217', '1978-05-06',  'F',    NULL,           NULL,                     223,    225,        NULL);


UPDATE employee
SET manager_id = 1000222
WHERE employee_id = 1000221;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('SIMONE',    NULL,       'MCCREERY',   '100000218', '1999-04-02',  'F',    NULL,           NULL,                     224,    226,        NULL),
('JOLINE',    NULL,       'NEAL',       '100000219', '1978-03-03',  'F',    NULL,           NULL,                     225,    227,        NULL),
('YULIA',     'L',        'SMITH',      '100000220', '1978-02-04',  'F',    NULL,           NULL,                     226,    228,        NULL),
('CY',        NULL,       'ASIS',       '100000221', '1999-01-05',  'M',    NULL,           NULL,                     227,    229,        NULL),
('ANDREA',    NULL,       'OSBOURNE',   '100000222', '1978-05-06',  'F',    NULL,           NULL,                     228,    230,        NULL),

('SUHAIL',    NULL,       'ROSE',       '100000223', '1999-04-02',  'M',    NULL,           NULL,                     229,    231,        NULL),
('NUAN',      NULL,       'SCHULTHEISS','100000224', '1978-03-03',  'M',    NULL,           NULL,                     230,    232,        NULL),
('INNOKENTI', 'L',        'SUZUKI',     '100000225', '1978-02-04',  'M',    NULL,           NULL,                     231,    233,        NULL),
('KENTIGERN', NULL,       'SHORT',      '100000226', '1999-01-05',  'M',    NULL,           NULL,                     232,    234,        NULL),
('RIEN',      NULL,       'BJARNESEN',  '100000227', '1978-05-06',  'M',    NULL,           NULL,                     233,    235,        NULL),

('SUHAIL',    NULL,       'PORCHER',    '100000228', '1999-04-02',  'M',    NULL,           NULL,                     234,    236,        NULL),
('NUAN',      NULL,       'BAUMGARTEN', '100000229', '1978-03-03',  'M',    NULL,           NULL,                     235,    237,        NULL),
('INNOKENTI', 'L',        'MIKHAILOV',  '100000230', '1978-02-04',  'M',    NULL,           NULL,                     236,    238,        NULL),
('KENTIGERN', NULL,       'BAGGI',      '100000231', '1999-01-05',  'M',    NULL,           NULL,                     237,    239,        NULL),
('RIEN',      NULL,       'NOYER',      '100000232', '1978-05-06',  'M',    NULL,           NULL,                     238,    240,        NULL),

('SIMONE',    NULL,       'PORCHER',    '100000233', '1999-04-02',  'F',    NULL,           NULL,                     239,    241,        NULL),
('JOLINE',    NULL,       'BAUMGARTEN', '100000234', '1978-03-03',  'M',    NULL,           NULL,                     240,    242,        NULL),
('YULIA',     'L',        'MIKHAILOV',  '100000235', '1978-02-04',  'M',    NULL,           NULL,                     241,    243,        NULL),
('CY',        NULL,       'BAGGI',      '100000236', '1999-01-05',  'M',    NULL,           NULL,                     242,    244,        NULL),
('ANDREA',    NULL,       'NOYER',      '100000237', '1978-05-06',  'M',    NULL,           NULL,                     243,    245,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('LAWYER',    'D',        'SAWYER',     '100000238', '1978-12-01',  'M',    NULL,           NULL,                     244,    246,        NULL),
('SIMONE',    NULL,       'LAW',        '100000239', '1999-04-02',  'F',    NULL,           NULL,                     245,    247,        NULL),
('JOE',       NULL,       'TURNEY',     '100000240', '1978-03-03',  'M',    NULL,           NULL,                     246,    248,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'SAWYER',     '100000241', '1978-12-01',  'M',    NULL,           NULL,                     247,    249,        NULL),
('NATHAN',    NULL,       'TURNER',     '100000242', '1999-04-02',  'M',    NULL,           NULL,                     248,    250,        NULL),
('ELISE',     NULL,       'STEEL',      '100000243', '1978-03-03',  'F',    NULL,           NULL,                     249,    251,        NULL),
('MARY',      NULL,       'SUE',        '100000244', '1978-03-03',  'F',    NULL,           NULL,                     250,    252,        NULL);


UPDATE employee
SET manager_id = 1000250
WHERE employee_id > 1000247 AND NOT employee_id = 1000250;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'GOLD',       '100000245', '1965-12-01',  'M',    NULL,           'jgold@company.org',      251,    253,        NULL),
('NATHAN',    NULL,       'SILVER',     '100000246', '1966-04-02',  'M',    NULL,           'nsilver@company.org',    252,    254,        NULL),
('ELISE',     NULL,       'BRONZE',     '100000247', '1967-03-14',  'F',    NULL,           'ebronze@company.org',    253,    255,        NULL),
('MARY',      NULL,       'COPPER',     '100000248', '1968-03-04',  'F',    NULL,           'mcopper@company.org',    254,    256,        NULL),
('JOHN',      'K',        'BRASS',      '100000249', '1969-12-11',  'M',    NULL,           'jbrass@company.org',     255,    257,        NULL),
('NEIL',      NULL,       'ZINC',       '100000250', '1965-07-02',  'M',    NULL,           'nzinc@company.org',      256,    258,        NULL),
('ELLEN',     NULL,       'TIN',        '100000251', '1966-03-03',  'F',    NULL,           'etin@company.org',       257,    259,        NULL),
('MYRTLE',    NULL,       'PEWTER',     '100000252', '1967-04-03',  'F',    NULL,           'mpewter@company.org',    258,    260,        NULL),
('JERKYLL',   'G',        'LEAD',       '100000253', '1968-12-06',  'M',    NULL,           'jlead@company.org',      259,    261,        NULL),
('NERRY',     NULL,       'CHROMIUM',   '100000254', '1969-04-02',  'M',    NULL,           'nchromium@company.org',  260,    262,        NULL),
('PENELOPE',  NULL,       'IRON',       '100000255', '1970-03-03',  'F',    NULL,           'eiron@company.org',      261,    263,        NULL);


-- Create department heads
UPDATE department
SET department_head_id = 1000000
WHERE department_id = 1;


UPDATE department
SET department_head_id = 1000252
WHERE department_id = 2;


UPDATE department
SET department_head_id = 1000253
WHERE department_id = 3;


UPDATE department
SET department_head_id = 1000254
WHERE department_id = 4;


UPDATE department
SET department_head_id = 1000255
WHERE department_id = 5;


UPDATE department
SET department_head_id = 1000256
WHERE department_id = 6;


UPDATE department
SET department_head_id = 1000257
WHERE department_id = 7;


UPDATE department
SET department_head_id = 1000258
WHERE department_id = 8;


UPDATE department
SET department_head_id = 1000259
WHERE department_id = 9;


UPDATE department
SET department_head_id = 1000260
WHERE department_id = 10;


UPDATE department
SET department_head_id = 1000261
WHERE department_id = 11;


UPDATE department
SET department_head_id = 1000262
WHERE department_id = 12;


-- Salary
INSERT INTO salary (employee_id, hourly_wage, annual_bonus) VALUES
(1000000, '$375', '$700,000'),
(1000001, '$100', '$250,000'),
(1000002, '$90',  '$200,000'),
(1000003, '$50',  '$120,000'),
(1000004, '$100', '$200,000'),
(1000005, '$35',  '$100,000'),
(1000006, '$35',  '$100,000'),
(1000007, '$35',  '$100,000'),
(1000008, '$30', '$1,000'),
(1000009, '$30', '$1,000'),
(1000010, '$40', '$1,000'),
(1000011, '$30', '$1,000'),
(1000012, '$25', '$1,000'),
(1000013, '$22', '$1,000'),
(1000014, '$22', '$1,000'),
(1000015, '$18', '$1,000'),
(1000016, '$20', '$1,000'),
(1000017, '$40', '$1,000'),
(1000018, '$30', '$1,000'),
(1000019, '$30', '$1,000'),
(1000020, '$40', '$1,000'),
(1000021, '$30', '$1,000'),
(1000022, '$25', '$1,000'),
(1000023, '$22', '$1,000'),
(1000024, '$22', '$1,000'),
(1000025, '$18', '$1,000'),
(1000026, '$20', '$1,000'),
(1000027, '$40', '$1,000'),
(1000028, '$30', '$1,000'),
(1000029, '$30', '$1,000'),
(1000030, '$40', '$1,000'),
(1000031, '$30', '$1,000'),
(1000032, '$25', '$1,000'),
(1000033, '$22', '$1,000'),
(1000034, '$22', '$1,000'),
(1000035, '$18', '$1,000'),
(1000036, '$20', '$1,000'),
(1000037, '$40', '$1,000'),
(1000038, '$30', '$1,000'),
(1000039, '$30', '$1,000'),
(1000040, '$40', '$1,000'),
(1000041, '$30', '$1,000'),
(1000042, '$25', '$1,000'),
(1000043, '$22', '$1,000'),
(1000044, '$22', '$1,000'),
(1000045, '$18', '$1,000'),
(1000046, '$20', '$1,000'),
(1000047, '$40', '$1,000'),
(1000048, '$40', '$5,000'),
(1000049, '$34', '$3,000'),
(1000050, '$42', '$5,000'),
(1000051, '$34', '$3,000'),
(1000052, '$40', '$5,000'),
(1000053, '$34', '$3,000'),
(1000054, '$30', '$1,000'),
(1000055, '$30', '$1,000'),
(1000056, '$40', '$1,000'),
(1000057, '$30', '$1,000'),
(1000058, '$25', '$1,000'),
(1000059, '$22', '$1,000'),
(1000060, '$22', '$1,000'),
(1000061, '$18', '$1,000'),
(1000062, '$20', '$1,000'),
(1000063, '$35', '$1,000'),
(1000064, '$40', '$1,000'),
(1000065, '$30', '$1,000'),
(1000066, '$30', '$1,000'),
(1000067, '$40', '$1,000'),
(1000068, '$30', '$1,000'),
(1000069, '$25', '$1,000'),
(1000070, '$22', '$1,000'),
(1000071, '$22', '$1,000'),
(1000072, '$18', '$1,000'),
(1000073, '$20', '$1,000'),
(1000074, '$35', '$1,000'),
(1000075, '$40', '$1,000'),
(1000076, '$30', '$1,000'),
(1000077, '$30', '$1,000'),
(1000078, '$40', '$1,000'),
(1000079, '$30', '$1,000'),
(1000080, '$25', '$1,000'),
(1000081, '$22', '$1,000'),
(1000082, '$22', '$1,000'),
(1000083, '$18', '$1,000'),
(1000084, '$20', '$1,000'),
(1000085, '$35', '$1,000'),
(1000086, '$40', '$1,000'),
(1000087, '$30', '$1,000'),
(1000088, '$30', '$1,000'),
(1000089, '$40', '$1,000'),
(1000090, '$30', '$1,000'),
(1000091, '$25', '$1,000'),
(1000092, '$22', '$1,000'),
(1000093, '$22', '$1,000'),
(1000094, '$18', '$1,000'),
(1000095, '$20', '$1,000'),
(1000096, '$35', '$1,000'),
(1000097, '$40', '$1,000'),
(1000098, '$30', '$10,000'),
(1000099, '$30', '$10,000'),
(1000100, '$40', '$10,000'),
(1000101, '$30', '$10,000'),
(1000102, '$25', '$10,000'),
(1000103, '$22', '$10,000'),
(1000104, '$22', '$10,000'),
(1000105, '$18', '$10,000'),
(1000106, '$40', '$10,000'),
(1000107, '$40', '$10,000'),
(1000108, '$40', '$10,000'),
(1000109, '$40', '$10,000'),
(1000110, '$40', '$10,000'),
(1000111, '$40', '$10,000'),
(1000112, '$40', '$10,000'),
(1000113, '$40', '$10,000'),
(1000114, '$40', '$10,000'),
(1000115, '$40', '$10,000'),
(1000116, '$40', '$10,000'),
(1000117, '$40', '$10,000'),
(1000118, '$40', '$10,000'),
(1000119, '$40', '$10,000'),
(1000120, '$40', '$10,000'),
(1000121, '$40', '$10,000'),
(1000122, '$40', '$10,000'),
(1000123, '$40', '$10,000'),
(1000124, '$40', '$10,000'),
(1000125, '$40', '$10,000'),
(1000126, '$40', '$10,000'),
(1000127, '$40', '$10,000'),
(1000128, '$40', '$10,000'),
(1000129, '$40', '$10,000'),
(1000130, '$40', '$10,000'),
(1000131, '$40', '$10,000'),
(1000132, '$40', '$10,000'),
(1000133, '$40', '$10,000'),
(1000134, '$40', '$10,000'),
(1000135, '$40', '$10,000'),
(1000136, '$40', '$10,000'),
(1000137, '$40', '$10,000'),
(1000138, '$40', '$10,000'),
(1000139, '$40', '$10,000'),
(1000140, '$40', '$10,000'),
(1000141, '$40', '$10,000'),
(1000142, '$40', '$10,000'),
(1000143, '$40', '$10,000'),
(1000144, '$40', '$10,000'),
(1000145, '$40', '$10,000'),
(1000146, '$40', '$10,000'),
(1000147, '$40', '$10,000'),
(1000148, '$40', '$10,000'),
(1000149, '$40', '$10,000'),
(1000150, '$40', '$10,000'),
(1000151, '$40', '$10,000'),
(1000152, '$40', '$10,000'),
(1000153, '$40', '$10,000'),
(1000154, '$30', '$10,000'),
(1000155, '$30', '$10,000'),
(1000156, '$40', '$10,000'),
(1000157, '$15', '$0'),
(1000158, '$25', '$10,000'),
(1000159, '$22', '$10,000'),
(1000160, '$22', '$10,000'),
(1000161, '$15', '$0'),
(1000162, '$25', '$10,000'),
(1000163, '$22', '$10,000'),
(1000164, '$22', '$10,000'),
(1000165, '$15', '$0'),
(1000166, '$30', '$1,000'),
(1000167, '$30', '$1,000'),
(1000168, '$20', '$1,000'),
(1000169, '$30', '$1,000'),
(1000170, '$25', '$1,000'),
(1000171, '$22', '$1,000'),
(1000172, '$22', '$1,000'),
(1000173, '$18', '$1,000'),
(1000174, '$35', '$2,250'),
(1000175, '$35', '$2,500'),
(1000176, '$28', '$1,000'),
(1000177, '$24', '$1,000'),
(1000178, '$29', '$1,000'),
(1000179, '$31', '$1,000'),
(1000180, '$40', '$1,000'),
(1000181, '$20', '$0'),
(1000182, '$35', '$2,250'),
(1000183, '$35', '$2,500'),
(1000184, '$28', '$1,000'),
(1000185, '$24', '$1,000'),
(1000186, '$29', '$1,000'),
(1000187, '$31', '$1,000'),
(1000188, '$40', '$1,000'),
(1000189, '$20', '$0'),
(1000190, '$35', '$2,250'),
(1000191, '$35', '$2,500'),
(1000192, '$28', '$1,000'),
(1000193, '$24', '$1,000'),
(1000194, '$29', '$1,000'),
(1000195, '$31', '$1,000'),
(1000196, '$40', '$1,000'),
(1000197, '$20', '$0'),
(1000198, '$35', '$2,250'),
(1000199, '$16', '$0'),
(1000200, '$20', '$1,000'),
(1000201, '$28', '$1,000'),
(1000202, '$20', '$1,000'),
(1000203, '$15', '$0'),
(1000204, '$29', '$1,000'),
(1000205, '$20', '$1,000'),
(1000206, '$15.50', '$0'),
(1000207, '$20', '$2,250'),
(1000208, '$20', '$2,250'),
(1000209, '$30', '$2,250'),
(1000210, '$40', '$2,250'),
(1000211, '$20', '$2,250'),
(1000212, '$40', '$2,250'),
(1000213, '$20', '$2,250'),
(1000214, '$20', '$2,250'),
(1000215, '$30', '$2,250'),
(1000216, '$40', '$2,250'),
(1000217, '$20', '$2,250'),
(1000218, '$40', '$2,250'),
(1000219, '$20', '$2,250'),
(1000220, '$20', '$2,250'),
(1000221, '$30', '$2,250'),
(1000222, '$40', '$2,250'),
(1000223, '$20', '$2,250'),
(1000224, '$40', '$2,250'),
(1000225, '$40', '$10,000'),
(1000226, '$40', '$10,000'),
(1000227, '$40', '$10,000'),
(1000228, '$40', '$10,000'),
(1000229, '$40', '$10,000'),
(1000230, '$40', '$10,000'),
(1000231, '$40', '$10,000'),
(1000232, '$40', '$10,000'),
(1000233, '$40', '$10,000'),
(1000234, '$40', '$10,000'),
(1000235, '$40', '$10,000'),
(1000236, '$40', '$10,000'),
(1000237, '$40', '$10,000'),
(1000238, '$40', '$10,000'),
(1000239, '$40', '$10,000'),
(1000240, '$40', '$10,000'),
(1000241, '$40', '$10,000'),
(1000242, '$40', '$10,000'),
(1000243, '$40', '$10,000'),
(1000244, '$40', '$10,000'),
(1000245, '$40', '$10,000'),
(1000246, '$40', '$10,000'),
(1000247, '$40', '$10,000'),
(1000248, '$35', '$10,000'),
(1000249, '$30', '$10,000'),
(1000250, '$40', '$10,000'),
(1000251, '$16', '$0'),
(1000252, '$50', '$90,000'),
(1000253, '$50', '$90,000'),
(1000254, '$50', '$90,000'),
(1000255, '$50', '$90,000'),
(1000256, '$50', '$90,000'),
(1000257, '$50', '$90,000'),
(1000258, '$50', '$90,000'),
(1000259, '$50', '$90,000'),
(1000260, '$50', '$90,000'),
(1000261, '$50', '$90,000'),
(1000262, '$50', '$90,000');


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-01-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-02-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-03-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-04-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 1:57:24 PM */
-- Delete all tables
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DROP TABLE IF EXISTS payroll          CASCADE;
DROP TABLE IF EXISTS benefits         CASCADE;
DROP TABLE IF EXISTS salary           CASCADE;
DROP TABLE IF EXISTS leave            CASCADE;
DROP TABLE IF EXISTS department       CASCADE;
DROP TABLE IF EXISTS job_location     CASCADE;
DROP TABLE IF EXISTS job              CASCADE;
DROP TABLE IF EXISTS employee         CASCADE;
DROP TABLE IF EXISTS employee_address CASCADE;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 1:57:25 PM */
-- Recreate tables from script
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Run these commands in ElephantSQL postgres database in browser tab to recreate starting tables for local testing

CREATE TABLE benefits (
  benefits_package_id        INT          GENERATED ALWAYS AS IDENTITY, 
  amount                     MONEY        NOT NULL,
  stock_options              VARCHAR(100), 
  health_insurance_provider  VARCHAR(100) NOT NULL CHECK(health_insurance_provider ~ '^[A-Z \d]+$'),
  retirement_plan            VARCHAR(100),

  PRIMARY KEY(benefits_package_id)
);


CREATE TABLE employee_address (
  address_id      INT           GENERATED ALWAYS AS IDENTITY,
  street_address  VARCHAR(100)  NOT NULL CHECK(street_address ~ '^[A-Z \/\d#\.,-]+$'),   -- Includes appt/po box info and locality info if applicable
  city            VARCHAR(50)   NOT NULL CHECK(city ~ '^[A-Z ]+$'), -- Also serves as post town if applicable
  zip_code        VARCHAR(16)   CHECK(zip_code ~ '^[\d \-A-Z]+$'), -- Also serves as postcode if applicable
  state           VARCHAR(50)   CHECK(state ~ '^[A-Z ]+$'), -- Also serves as province if applicable
  country         VARCHAR(50)   NOT NULL CHECK(country ~ '^[A-Z ]+$'),   -- Also serves as region if applicable

  PRIMARY KEY(address_id)
);


CREATE TABLE job_location (
  location_id   INT GENERATED ALWAYS AS IDENTITY,
  airport_id    INT,
  address_id    INT NOT NULL,
  flight_id     INT,
  location_name VARCHAR(50),

  PRIMARY KEY(location_id)
);


CREATE TABLE department (
  department_id       INT          GENERATED ALWAYS AS IDENTITY,
  department_name     VARCHAR(50)  NOT NULL CHECK(department_name ~ '^[A-Z ]+$'),
  creation_date       DATE         NOT NULL, 
  department_head_id  INT,

  PRIMARY KEY(department_id)
);


CREATE TABLE job (
  job_id              INT         GENERATED ALWAYS AS IDENTITY, 
  job_title           VARCHAR(50) NOT NULL CHECK(job_title ~ '^[A-Z \-]+$'),
  department_id       INT         NOT NULL, 
  location_id         INT         NOT NULL,
  weekly_hours        INT         DEFAULT 40 CHECK(weekly_hours <= 168),
  benefits_package_id INT         DEFAULT 0 NOT NULL,

  PRIMARY KEY(job_id),
  FOREIGN KEY(department_id)
    REFERENCES department(department_id)
    ON DELETE CASCADE,

  FOREIGN KEY(location_id)
    REFERENCES job_location(location_id)
    ON DELETE CASCADE,

  FOREIGN KEY(benefits_package_id)
    REFERENCES benefits(benefits_package_id)
    ON DELETE SET DEFAULT
);


CREATE TABLE employee (
  employee_id INT           GENERATED ALWAYS AS IDENTITY (START WITH 1000000),
  first_name  VARCHAR(50)   NOT NULL CHECK(first_name ~ '^[A-Z ]+$'),
  m_initial   CHAR(1),  
  last_name   VARCHAR(50)   NOT NULL CHECK(last_name ~ '^[A-Z ]+$'),
  ssn         CHAR(9)       UNIQUE CHECK(ssn ~ '^\d{9}$'),
  dob         DATE          NOT NULL,
  gender      CHAR(1)       NOT NULL CHECK(gender ~ '^[MFO]$'),
  phone       VARCHAR(15)   CHECK(phone ~ '^\+[0-9]+$'),
  email       VARCHAR(100)  UNIQUE CHECK(email ~ '^[\w\.\+]{1,64}@(\w+\.[A-Za-z]+){1,100}$'),
  job_id      INT           DEFAULT 0 NOT NULL,
  address_id  INT           NOT NULL,
  manager_id  INT,

  PRIMARY KEY(employee_id),
  FOREIGN KEY(job_id)
    REFERENCES job(job_id)
    ON DELETE SET DEFAULT,

  FOREIGN KEY(address_id)
    REFERENCES employee_address(address_id),

  FOREIGN KEY(manager_id)
    REFERENCES employee(employee_id)
    ON DELETE SET NULL
);


CREATE TABLE salary (
  salary_id    INT    GENERATED ALWAYS AS IDENTITY,
  employee_id  INT    NOT NULL,
  hourly_wage  MONEY  NOT NULL,
  annual_bonus MONEY  DEFAULT 0 NOT NULL,

  PRIMARY KEY(salary_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE leave (
  leave_id    INT           GENERATED ALWAYS AS IDENTITY,
  employee_id INT           NOT NULL,
  date        DATE          NOT NULL,
  reason      VARCHAR(100)  NOT NULL CHECK(reason ~ '^[A-Z \.\d]+$'),
  status      VARCHAR(50)   NOT NULL CHECK(status ~ '^[A-Z \.\d]+$'),

  PRIMARY KEY(leave_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE payroll (
  payroll_id    INT       GENERATED ALWAYS AS IDENTITY,
  employee_id   INT       NOT NULL, 
  hours_worked  REAL      NOT NULL,
  pay_period    DATE      NOT NULL,
  tax_rate      REAL      NOT NULL,
  gross_income  MONEY     NOT NULL,
  taxed_income  MONEY     NOT NULL,
  net_income    MONEY     NOT NULL,
  
  UNIQUE(employee_id, pay_period),

  PRIMARY KEY(payroll_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


/* DEFAULTS */
ALTER TABLE department
ADD CONSTRAINT fk_head FOREIGN KEY (department_head_id) REFERENCES employee(employee_id);


INSERT INTO benefits OVERRIDING SYSTEM VALUE VALUES(0, 0, 0, 'UNASSIGNED', 0);

INSERT INTO job_location OVERRIDING SYSTEM VALUE VALUES(0, NULL, 0, NULL);

INSERT INTO department OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', '1980-1-1');

INSERT INTO job OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', 0, 0, 0, 0);


/* Initial populated tables */

-- Departments (based on https://www.avjobs.com/history/structure-of-the-airline-industry.asp)
INSERT INTO department (department_name, creation_date) VALUES 
('BOARD OF DIRECTORS',            '1980-01-01'),
('ENGINEERING AND MAINTENANCE',   '1980-01-01'),
('GROUND OPERATIONS',             '1980-01-01'),
('FLIGHT OPERATIONS',             '1980-01-01'),
('SALES AND MARKETING',           '1980-01-01'),
('RESERVATIONS AND TICKETING',    '1980-01-01'),
('FINANCE AND PROPERTY',          '1980-01-01'),
('INFORMATION SERVICES',          '1990-11-08'),
('PERSONNEL',                     '1980-01-01'),
('EMERGENCY SERVICES',            '1980-04-05'),
('LEGAL',                         '1981-03-11'),
('PUBLIC RELATIONS AND PLANNING', '1985-07-20');


-- Benefits
INSERT INTO benefits (amount, stock_options, health_insurance_provider, retirement_plan) VALUES
(1000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS A', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS A', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN A'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(6000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS C', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(10000, 'STOCK OPTIONS D', 'INSURANCE PROVIDER D', 'RETIREMENT PLAN D'),
(4500,  'STOCK OPTIONS D', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN C');


-- Job locations
INSERT INTO job_location (airport_id, address_id, flight_id, location_name) VALUES
(NULL,  1,  NULL, 'OFFICES IN CITY A'),
(NULL,  2,  NULL, 'OFFICES IN CITY B'),
(NULL,  6,  NULL, 'OFFICES IN CITY C'),

(1, 3,  NULL, 'AIRPORT IN CITY A'),
(1, 3,  100,  'AIRPORT IN CITY A'),
(1, 3,  101,  'AIRPORT IN CITY A'),
(1, 3,  102,  'AIRPORT IN CITY A'),
(1, 3,  103,  'AIRPORT IN CITY A'),

(2, 4,  NULL, 'AIRPORT A IN CITY B'),
(2, 4,  200,  'AIRPORT A IN CITY B'),
(2, 4,  201,  'AIRPORT A IN CITY B'),
(2, 4,  202,  'AIRPORT A IN CITY B'),
(2, 4,  203,  'AIRPORT A IN CITY B'),

(3, 5,  NULL, 'AIRPORT B IN CITY B'),
(3, 5,  300,  'AIRPORT B IN CITY B'),
(3, 5,  301,  'AIRPORT B IN CITY B'),
(3, 5,  302,  'AIRPORT B IN CITY B'),
(3, 5,  303,  'AIRPORT B IN CITY B'),

(4, 7,  NULL, 'AIRPORT IN CITY C'),
(4, 7,  400,  'AIRPORT IN CITY C'),
(4, 7,  401,  'AIRPORT IN CITY C'),
(4, 7,  402,  'AIRPORT IN CITY C'),
(4, 7,  403,  'AIRPORT IN CITY C');


-- Jobs (based on https://www.airlinejobfinder.com/members/airline-jobs/)
INSERT INTO job (job_title, department_id, location_id, weekly_hours, benefits_package_id) VALUES
-- Board of Directors (1)
('CHIEF EXECUTIVE OFFICER', 1,  2,  50, 9),
('CHAIRMAN',                1,  2,  40, 9),
('VICE CHAIR',              1,  2,  40, 9),
('BOARD SECRETARY',         1,  2,  40, 9),
('TREASURER',               1,  2,  40, 9),
('BOARD MEMBER',            1,  2,  40, 9),

-- Maintenance and Engineering (2)
('AVIATION MAINTENANCE TECHNICIAN', 2,  4,  40, 2),
('POWERPLANT MECHANIC',             2,  4,  40, 2),
('AIRFRAME MECHANIC',               2,  4,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  4,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  4,  40, 2),
('AIRCRAFT FUELER',                 2,  4,  40, 2),
('AVIONIC TECHNICIAN',              2,  4,  40, 2),
('CABIN MAINTENANCE',               2,  4,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  4,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  4,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  9,  40, 2),
('POWERPLANT MECHANIC',             2,  9,  40, 2),
('AIRFRAME MECHANIC',               2,  9,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  9,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  9,  40, 2),
('AIRCRAFT FUELER',                 2,  9,  40, 2),
('AVIONIC TECHNICIAN',              2,  9,  40, 2),
('CABIN MAINTENANCE',               2,  9,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  9,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  9,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  14,  40, 2),
('POWERPLANT MECHANIC',             2,  14,  40, 2),
('AIRFRAME MECHANIC',               2,  14,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  14,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  14,  40, 2),
('AIRCRAFT FUELER',                 2,  14,  40, 2),
('AVIONIC TECHNICIAN',              2,  14,  40, 2),
('CABIN MAINTENANCE',               2,  14,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  14,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  14,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  19,  40, 2),
('POWERPLANT MECHANIC',             2,  19,  40, 2),
('AIRFRAME MECHANIC',               2,  19,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  19,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  19,  40, 2),
('AIRCRAFT FUELER',                 2,  19,  40, 2),
('AVIONIC TECHNICIAN',              2,  19,  40, 2),
('CABIN MAINTENANCE',               2,  19,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  19,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  19,  40, 2),

-- Ground Operations (3)
('DIRECTOR OF AVIATION',        3, 1, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 1, 40, 3),
('DIRECTOR OF AVIATION',        3, 2, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 2, 40, 3),
('DIRECTOR OF AVIATION',        3, 3, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 3, 40, 3),

('BAGGAGE HANDLER',               3,  4,  40, 5),
('SKYCAP',                        3,  4,  40, 5),
('CONCESSIONS',                   3,  4,  40, 5),
('AIRPORT GUIDE',                 3,  4,  40, 5),
('AIRPORT CUSTODIAN',             3,  4,  40, 1),
('OPERATIONS AGENT',              3,  4,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  4,  40, 3),
('PASSENGER SERVICE AGENT',       3,  4,  40, 3),
('RAMP PLANNER',                  3,  4,  40, 3),
('AIRLINE STATION AGENT',         3,  4,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  4,  40, 7),

('BAGGAGE HANDLER',               3,  9,  40, 5),
('SKYCAP',                        3,  9,  40, 5),
('CONCESSIONS',                   3,  9,  40, 5),
('AIRPORT GUIDE',                 3,  9,  40, 5),
('AIRPORT CUSTODIAN',             3,  9,  40, 1),
('OPERATIONS AGENT',              3,  9,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  9,  40, 3),
('PASSENGER SERVICE AGENT',       3,  9,  40, 3),
('RAMP PLANNER',                  3,  9,  40, 3),
('AIRLINE STATION AGENT',         3,  9,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  9,  40, 7),

('BAGGAGE HANDLER',               3,  14, 40, 5),
('SKYCAP',                        3,  14, 40, 5),
('CONCESSIONS',                   3,  14, 40, 5),
('AIRPORT GUIDE',                 3,  14, 40, 5),
('AIRPORT CUSTODIAN',             3,  14, 40, 1),
('OPERATIONS AGENT',              3,  14, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  14, 40, 3),
('PASSENGER SERVICE AGENT',       3,  14, 40, 3),
('RAMP PLANNER',                  3,  14, 40, 3),
('AIRLINE STATION AGENT',         3,  14, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  14, 40, 7),

('BAGGAGE HANDLER',               3,  19, 40, 5),
('SKYCAP',                        3,  19, 40, 5),
('CONCESSIONS',                   3,  19, 40, 5),
('AIRPORT GUIDE',                 3,  19, 40, 5),
('AIRPORT CUSTODIAN',             3,  19, 40, 1),
('OPERATIONS AGENT',              3,  19, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  19, 40, 3),
('PASSENGER SERVICE AGENT',       3,  19, 40, 3),
('RAMP PLANNER',                  3,  19, 40, 3),
('DISTRICT OPERATIONS MANAGER',   3,  19, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  19, 40, 7),

-- Flight Operations (4)
('FLIGHT DISPATCHER',       4,  4,  40, 6),
('AVIATION METEOROLOGIST',  4,  4,  40, 6),
('FLIGHT DISPATCHER',       4,  9,  40, 6),
('AVIATION METEOROLOGIST',  4,  9,  40, 6),
('FLIGHT DISPATCHER',       4,  14, 40, 6),
('AVIATION METEOROLOGIST',  4,  14, 40, 6),
('FLIGHT DISPATCHER',       4,  19, 40, 6),
('AVIATION METEOROLOGIST',  4,  19, 40, 6),

('CARGO CARRIER PILOT', 4,  5,  60, 6),
('COPORATE PILOT',      4,  5,  30, 6),
('CHARTER PILOT',       4,  5,  60, 6),

('CARGO CARRIER PILOT', 4,  6,  60, 6),
('COPORATE PILOT',      4,  6,  30, 6),
('CHARTER PILOT',       4,  6,  60, 6),

('CARGO CARRIER PILOT', 4,  7,  60, 6),
('COPORATE PILOT',      4,  7,  30, 6),
('CHARTER PILOT',       4,  7,  60, 6),

('CARGO CARRIER PILOT', 4,  8,  60, 6),
('COPORATE PILOT',      4,  8,  30, 6),
('CHARTER PILOT',       4,  8,  60, 6),

('CARGO CARRIER PILOT', 4,  10, 60, 6),
('COPORATE PILOT',      4,  10, 30, 6),
('CHARTER PILOT',       4,  10, 60, 6),

('CARGO CARRIER PILOT', 4,  11, 60, 6),
('COPORATE PILOT',      4,  11, 30, 6),
('CHARTER PILOT',       4,  11, 60, 6),

('CARGO CARRIER PILOT', 4,  12, 60, 6),
('COPORATE PILOT',      4,  12, 30, 6),
('CHARTER PILOT',       4,  12, 60, 6),

('CARGO CARRIER PILOT', 4,  13, 60, 6),
('COPORATE PILOT',      4,  13, 30, 6),
('CHARTER PILOT',       4,  13, 60, 6),

('CARGO CARRIER PILOT', 4,  15, 60, 6),
('COPORATE PILOT',      4,  15, 30, 6),
('CHARTER PILOT',       4,  15, 60, 6),

('CARGO CARRIER PILOT', 4,  16, 60, 6),
('COPORATE PILOT',      4,  16, 30, 6),
('CHARTER PILOT',       4,  16, 60, 6),

('CARGO CARRIER PILOT', 4,  17, 60, 6),
('COPORATE PILOT',      4,  17, 30, 6),
('CHARTER PILOT',       4,  17, 60, 6),

('CARGO CARRIER PILOT', 4,  18, 60, 6),
('COPORATE PILOT',      4,  18, 30, 6),
('CHARTER PILOT',       4,  18, 60, 6),

('CARGO CARRIER PILOT', 4,  20, 60, 6),
('COPORATE PILOT',      4,  20, 30, 6),
('CHARTER PILOT',       4,  20, 60, 6),

('CARGO CARRIER PILOT', 4,  21, 60, 6),
('COPORATE PILOT',      4,  21, 30, 6),
('CHARTER PILOT',       4,  21, 60, 6),

('CARGO CARRIER PILOT', 4,  22, 60, 6),
('COPORATE PILOT',      4,  22, 30, 6),
('CHARTER PILOT',       4,  22, 60, 6),

('CARGO CARRIER PILOT', 4,  23, 60, 6),
('COPORATE PILOT',      4,  23, 30, 6),
('CHARTER PILOT',       4,  23, 60, 6),

-- Sales and Marketing (5)
('REGIONAL SALES MANAGER',  5,  1,  40, 3),
('SALES REPRESENTATIVE',    5,  1,  40, 3),
('AIRLINE MARKETER',        5,  1,  40, 3),
('SALES INTERN',            5,  1,  20, 3),

('REGIONAL SALES MANAGER',  5,  2,  40, 3),
('SALES REPRESENTATIVE',    5,  2,  40, 3),
('AIRLINE MARKETER',        5,  2,  40, 3),
('SALES INTERN',            5,  2,  20, 3),

('REGIONAL SALES MANAGER',  5,  3,  40, 3),
('SALES REPRESENTATIVE',    5,  3,  40, 3),
('AIRLINE MARKETER',        5,  3,  40, 3),
('SALES INTERN',            5,  3,  20, 3),

-- Reservations and Ticketing (6)
('RESERVATION SALES AGENT', 6,  4,  40, 3),
('AIRLINE TICKET AGENT',    6,  4,  40, 3),

('RESERVATION SALES AGENT', 6,  9,  40, 3),
('AIRLINE TICKET AGENT',    6,  9,  40, 3),

('RESERVATION SALES AGENT', 6,  14, 40, 3),
('AIRLINE TICKET AGENT',    6,  14, 40, 3),

('RESERVATION SALES AGENT', 6,  19, 40, 3),
('AIRLINE TICKET AGENT',    6,  19, 40, 3),

-- Finance and Property (7)
('ACCOUNTANT',                7,  1,  40, 5),
('AUDITOR',                   7,  1,  40, 5),
('FINANCE ASSITANT',          7,  1,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  1,  40, 5),
('PAYROLL CLERK',             7,  1,  40, 5),
('FINANCIAL ANALYST',         7,  1,  40, 5),
('PAYROLL MANAGER',           7,  1,  40, 5),
('FINANCE INTERN',            7,  1,  20, 5),

('ACCOUNTANT',                7,  2,  40, 5),
('AUDITOR',                   7,  2,  40, 5),
('FINANCE ASSITANT',          7,  2,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  2,  40, 5),
('PAYROLL CLERK',             7,  2,  40, 5),
('FINANCIAL ANALYST',         7,  2,  40, 5),
('PAYROLL MANAGER',           7,  2,  40, 5),
('FINANCE INTERN',            7,  2,  20, 5),

('ACCOUNTANT',                7,  3,  40, 5),
('AUDITOR',                   7,  3,  40, 5),
('FINANCE ASSITANT',          7,  3,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  3,  40, 5),
('PAYROLL CLERK',             7,  3,  40, 5),
('FINANCIAL ANALYST',         7,  3,  40, 5),
('PAYROLL MANAGER',           7,  3,  40, 5),
('FINANCE INTERN',            7,  3,  20, 5),

-- Information services (8)
('IT SPECIALIST',     8,  1,  40, 3),
('IT INTERN',         8,  1,  20, 3),
('HELP DESK SUPPORT', 8,  1,  40, 3),

('IT SPECIALIST',     8,  2,  40, 3),
('HELP DESK SUPPORT', 8,  2,  40, 3),
('IT INTERN',         8,  2,  20, 3),

('IT SPECIALIST',     8,  3,  40, 3),
('HELP DESK SUPPORT', 8,  3,  40, 3),
('IT INTERN',         8,  3,  20, 3),

-- Personnel (9)
('SECRETARY',                   9,  1,  40, 3),
('MAIL CLERK',                  9,  1,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  1,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  1,  40, 3),
('RECEPTIONIST',                9,  1,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  1,  40, 3),

('SECRETARY',                   9,  2,  40, 3),
('MAIL CLERK',                  9,  2,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  2,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  2,  40, 3),
('RECEPTIONIST',                9,  2,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  2,  40, 3),

('SECRETARY',                   9,  3,  40, 3),
('MAIL CLERK',                  9,  3,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  3,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  3,  40, 3),
('RECEPTIONIST',                9,  3,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  3,  40, 3),

-- Emergency Services (10)
('FIREFIGHTER',           10,  4,  40, 10),
('FIREFIGHTER MEDIC',     10,  4,  40, 10),
('POLICE OFFICER',        10,  4,  40, 10),
('FIRE AND CRASH RESCUE', 10,  4,  30, 10),
('POLICE PATROL OFFICER', 10,  4,  30, 10),

('FIREFIGHTER',           10,  9,  40, 10),
('FIREFIGHTER MEDIC',     10,  9,  40, 10),
('POLICE OFFICER',        10,  9,  40, 10),
('FIRE AND CRASH RESCUE', 10,  9,  30, 10),
('POLICE PATROL OFFICER', 10,  9,  30, 10),

('FIREFIGHTER',           10,  14, 40, 10),
('FIREFIGHTER MEDIC',     10,  14, 40, 10),
('POLICE OFFICER',        10,  14, 40, 10),
('FIRE AND CRASH RESCUE', 10,  14, 30, 10),
('POLICE PATROL OFFICER', 10,  14, 30, 10),

('FIREFIGHTER',           10,  19, 40, 10),
('FIREFIGHTER MEDIC',     10,  19, 40, 10),
('POLICE OFFICER',        10,  19, 40, 10),
('FIRE AND CRASH RESCUE', 10,  19, 30, 10),
('POLICE PATROL OFFICER', 10,  19, 30, 10),

-- Legal (11)
('AVIATION ATTORNEY',  11,  1,  40, 7),
('AVIATION ATTORNEY',  11,  2,  40, 7),
('AVIATION ATTORNEY',  11,  3,  40, 7),

-- Public Relations and Planning (12)
('PUBLIC RELATIONS SPECIALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS GENERALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS MANAGER',    12,  2,  40, 3),
('PUBLIC RELATIONS INTERN',     12,  2,  20, 3),

('HEAD OF ENGINEERING',           2,  2,  40, 9),
('HEAD OF GROUND OPERATIONS',     3,  2,  40, 9),
('HEAD OF FLIGHT OPERATIONS',     4,  2,  40, 9),
('HEAD OF SALES',                 5,  2,  40, 9),
('HEAD OF RESERVATIONS',          6,  2,  40, 9),
('HEAD OF FINANCE',               7,  2,  40, 9),
('HEAD OF INFORMATION SERVICES',  8,  2,  40, 9),
('HEAD OF PERSONNEL MANAGEMENT',  9,  2,  40, 9),
('HEAD OF EMERGENCY SERVICES',    10, 2,  40, 9),
('HEAD OF LEGAL',                 11, 2,  40, 9),
('HEAD OF PUBLIC RELATIONS',      12, 2,  40, 9);


-- Employee Address
INSERT INTO employee_address (street_address, city, zip_code, state, country) VALUES
('123 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('123 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('321 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('555 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('9029 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('765 MAIN ST',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('767 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('876 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8770 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('202 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('101 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('896 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('909 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('920 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('808 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8760 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8755 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('423 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('202 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('101 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('896 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('909 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 SEAWATER LN',     'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8260 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8234 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8754 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('808 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8234 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8754 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SLEEPY HILLS',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 FISHWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MINOR ST',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 LION LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 JUMPY HILLS',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 FISHWATER ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MINOR RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 LION RD',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SLEEPY SLOPES',  'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('423 FISHWATER RD',    'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8777 MAIN ST',        'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('920 LONG LN',         'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 KLEINE DR',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 EINE DR',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 ROADY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 NEIN LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KLEINE DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 EINE DR',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 ROADY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KLEINE DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 EINE DR',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 ROADY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 ROCKY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 BUMPY HILLS',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 POOLWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 DIGGY LN',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 ZEBRA ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 MERRYWEATHER LN', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CHRONO ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('420 CLOUDY DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 MERRYWEATHER LN', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 CHRONO ST',      'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('420 CLOUDY DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 TIME ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 TIME ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 TIME ST',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 STEEL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 STEEL LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A');


-- Employee
INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOHN',      'H',        'SMITH',      '123456789', '1965-01-01',  'M',    '+15553219090', 'jsmith@company.org',     1,      1,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MARY',      NULL,       'ORLEANS',    '987654321', '1970-04-09',  'F',    '+15559990001', 'morleans@company.org',   2,      2,          1000000),
('HARRIS',    NULL,       'BEAUDRY',    '111223333', '1967-04-29',  'M',    '+15559990021', 'hbeaudry@company.org',   3,      3,          NULL),
('ANABEL',    'A',        'NEALIOUS',   '112345678', '1980-01-09',  'F',    '+15559990011', 'anaulious@company.org',  4,      4,          NULL),
('DON',       'E',        'SYLVER',     '112345688', '1969-11-24',  'M',    '+15559980011', 'dsylver@company.org',    5,      5,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BRENDON',   NULL,       'LAMBINO',    '112346689', '1965-11-24',  'M',    '+15559680011', 'blambino@company.org',   6,      6,          1000001),
('MYRTLE',    NULL,       'TRUOG',      '122345688', '1969-12-24',  'F',    '+16559980011', 'mtruog@company.org',     6,      7,          1000001),
('LASZLO',    NULL,       'LUAIN',      '111345688', '1971-02-24',  'M',    '+15567980011', 'lluain@company.org',     6,      8,          1000001);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '117345689', '1984-06-23',  'M',    '+15567980111', NULL,                     7,      9,          NULL),
('LATIFA',    NULL,       'BELTZ',      '117245689', '1984-02-24',  'F',    '+15569980011', NULL,                     8,      10,         NULL),
('ELINA',     NULL,       'HAUTUM',     '117445689', '1983-06-24',  'F',    '+15567900811', NULL,                     9,      11,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '117545689', '1983-08-12',  'M',    '+15567980211', NULL,                     10,     12,         NULL),
('SOLOMON',   'V',        'TERZI',      '117745689', '1984-09-23',  'M',    '+15567980311', NULL,                     11,     13,         NULL),
('QUINCTUS',  NULL,       'HART',       '113345689', '1990-12-19',  'M',    '+15567980411', NULL,                     12,     14,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '118345689', '1987-06-04',  'F',    '+15567980511', NULL,                     13,     15,         NULL),
('LAURENS',   NULL,       'RUSH',       '114345689', '1989-05-03',  'M',    '+15567980611', NULL,                     14,     16,         NULL),
('SHANNA',    'M',        'PLANCK',     '111342689', '1990-04-02',  'F',    '+15567980711', NULL,                     15,     17,         NULL),
('REINALDO',  'S',        'CLARK',      '117355689', '1988-03-01',  'M',    '+15567980811', NULL,                     16,     18,         NULL);


UPDATE employee
SET manager_id = 1000017
WHERE employee_id < 1000017 AND employee_id > 1000007;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PRINCE',    'S',        'BERGFALK',   '100000001', '1984-06-23',  'M',    '+15567180111', NULL,                     17,     19,         NULL),
('RICO',      NULL,       'MILFORD',    '100000002', '1984-02-24',  'M',    '+15569180011', NULL,                     18,     20,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000003', '1983-06-24',  'M',    '+15567100811', NULL,                     19,     21,         NULL),
('BENVENUTO', 'J',        'BRYAN',      '100000004', '1983-08-12',  'M',    '+15567180211', NULL,                     20,     22,         NULL),
('SARA',      'S',        'COKES',      '100000005', '1984-09-23',  'F',    '+15567180311', NULL,                     21,     23,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000006', '1990-12-19',  'F',    '+15567180411', NULL,                     22,     24,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000007', '1987-06-04',  'F',    '+15567180511', NULL,                     23,     25,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000008', '1989-05-03',  'F',    '+15567180611', NULL,                     24,     26,         NULL),
('KYLEE',     'M',        'DARROW',     '100000009', '1990-04-02',  'F',    '+15567180711', NULL,                     25,     27,         NULL),
('SHIRO',     'G',        'DARZI',      '100000010', '1988-03-01',  'M',    '+15567180811', NULL,                     26,     28,         NULL);


UPDATE employee
SET manager_id = 1000027
WHERE employee_id < 1000027 AND employee_id > 1000017;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'B',        'ANKEREN',    '100000011', '1984-06-23',  'M',    '+15566180111', NULL,                     27,     29,         NULL),
('RICO',      NULL,       'MILFORD',    '100000012', '1984-02-24',  'M',    '+15566180011', NULL,                     28,     30,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000013', '1983-06-24',  'M',    '+15566100811', NULL,                     29,     31,         NULL),
('BENVENUTO', 'A',        'BRYAN',      '100000014', '1983-08-12',  'M',    '+15566180211', NULL,                     30,     32,         NULL),
('SARA',      'T',        'COKES',      '100000015', '1984-09-23',  'F',    '+15566180311', NULL,                     31,     33,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000016', '1990-12-19',  'F',    '+15566180411', NULL,                     32,     34,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000017', '1987-06-04',  'F',    '+15566180511', NULL,                     33,     35,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000018', '1989-05-03',  'F',    '+15566180611', NULL,                     34,     36,         NULL),
('KYLEE',     'O',        'DARROW',     '100000019', '1990-04-02',  'F',    '+15566180711', NULL,                     35,     37,         NULL),
('SHIRO',     'K',        'DARZI',      '100000020', '1988-03-01',  'M',    '+15566180811', NULL,                     36,     38,         NULL);


UPDATE employee
SET manager_id = 1000037
WHERE employee_id < 1000037 AND employee_id > 1000027;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '100000031', '1985-06-13',  'M',    '+25567980221', NULL,                     37,     39,         NULL),
('LATIFA',    NULL,       'BELTZ',      '100000032', '1985-02-14',  'F',    '+25569980221', NULL,                     38,     40,         NULL),
('ELINA',     NULL,       'HAUTUM',     '100000033', '1985-06-14',  'F',    '+25567900221', NULL,                     39,     41,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '100000034', '1985-08-12',  'M',    '+25574980221', NULL,                     40,     42,         NULL),
('SOLOMON',   'V',        'TERZI',      '100000035', '1985-09-13',  'M',    '+25574880221', NULL,                     41,     43,         NULL),
('QUINCTUS',  NULL,       'HART',       '100000036', '1995-12-19',  'M',    '+25568980221', NULL,                     42,     44,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '100000037', '1985-06-14',  'F',    '+25577980221', NULL,                     43,     45,         NULL),
('LAURENS',   NULL,       'RUSH',       '100000038', '1985-05-13',  'M',    '+25587980221', NULL,                     44,     46,         NULL),
('SHANNA',    'M',        'PLANCK',     '100000039', '1995-04-12',  'F',    '+25569980221', NULL,                     45,     47,         NULL),
('REINALDO',  'Q',        'HART',       '100000040', '1985-03-11',  'M',    '+25560980221', NULL,                     46,     48,         NULL);


UPDATE employee
SET manager_id = 1000047
WHERE employee_id < 1000047 AND employee_id > 1000037;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAUTVYDAS', 'C',        'LANG',       '100000041', '1986-06-13',  'M',    '+15567980221', NULL,                     47,     49,         NULL),
('JOAKIM',    NULL,       'LEON',       '100000042', '1986-02-14',  'M',    '+15569980221', NULL,                     48,     50,         NULL),
('VALENTIN',  NULL,       'FIORE',      '100000043', '1986-06-14',  'M',    '+15567900221', NULL,                     49,     51,         NULL),
('SHAHIN',    'G',        'HOBBES',     '100000044', '1986-08-12',  'M',    '+15574980221', NULL,                     50,     52,         NULL),
('EVITA',     'I',        'ACHTEROP',   '100000045', '1986-09-13',  'F',    '+15574880221', NULL,                     51,     53,         NULL),
('REINALDO',  'I',        'CLARKE',     '100000046', '1986-03-11',  'M',    '+15560980221', NULL,                     52,     54,         NULL);


UPDATE employee
SET manager_id = employee_id - 1
WHERE employee_id IN (1000049, 1000051, 1000053);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'J',        'DUPUY',      '100000047', '1984-06-23',  'M',    '+15867980221', NULL,                     53,     55,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000048', '1994-02-24',  'M',    '+15869980221', NULL,                     54,     56,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000049', '1984-06-24',  'F',    '+15867900221', NULL,                     55,     57,         NULL),
('LOLA',      'I',        'PATTERSON',  '100000050', '1984-08-22',  'F',    '+15874980221', NULL,                     56,     58,         NULL),
('DEIRDRE',   'R',        'STRANGE',    '100000051', '1984-09-23',  'F',    '+15874880221', NULL,                     57,     59,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000052', '1964-12-29',  'M',    '+15868980221', NULL,                     58,     60,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000053', '1984-06-24',  'F',    '+15877980221', NULL,                     59,     61,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000054', '1964-05-23',  'M',    '+15887980221', NULL,                     60,     62,         NULL),
('VALERIAN',  'M',        'DABNEY',     '100000055', '1994-04-22',  'F',    '+15869580221', NULL,                     61,     63,         NULL),
('LIANE',     'M',        'MARIA',      '100000056', '1994-04-22',  'F',    '+15869380221', NULL,                     62,     64,         NULL),
('TAAVI',     'B',        'HOUBEN',     '100000057', '1984-03-21',  'M',    '+15860980221', NULL,                     63,     65,         NULL);


UPDATE employee
SET manager_id = 1000063
WHERE employee_id < 1000065 AND employee_id > 1000053 AND NOT employee_id = 1000063;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'A',        'DUPUY',      '100000058', '1982-04-23',  'M',    '+15867910221', NULL,                     64,     66,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000059', '1992-12-24',  'M',    '+15869910221', NULL,                     65,     67,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000060', '1982-04-24',  'F',    '+15867510221', NULL,                     66,     68,         NULL),
('LOLA',      'A',        'PATTERSON',  '100000061', '1982-06-22',  'F',    '+15874910221', NULL,                     67,     69,         NULL),
('DEIRDRE',   'A',        'STRANGE',    '100000062', '1982-07-23',  'F',    '+15874810221', NULL,                     68,     70,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000063', '1962-12-29',  'M',    '+15868910221', NULL,                     69,     71,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000064', '1982-04-24',  'F',    '+15877910221', NULL,                     70,     72,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000065', '1962-03-23',  'M',    '+15887910221', NULL,                     71,     73,         NULL),
('VALERIAN',  'A',        'DABNEY',     '100000066', '1992-02-22',  'F',    '+15869510221', NULL,                     72,     74,         NULL),
('BRIGITTA',  'A',        'MATHEWSON',  '100000067', '1992-02-22',  'F',    '+15869310221', NULL,                     73,     75,         NULL),
('TAAVI',     'A',        'HOUBEN',     '100000068', '1982-01-21',  'M',    '+15860910221', NULL,                     74,     76,         NULL);


UPDATE employee
SET manager_id = 1000074
WHERE employee_id < 1000076 AND employee_id > 1000064 AND NOT employee_id = 1000074;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000069', '1988-04-23',  'M',    '+15867910361', NULL,                     75,     77,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000070', '1998-12-24',  'F',    '+15869910361', NULL,                     76,     78,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000071', '1988-04-24',  'F',    '+15867510361', NULL,                     77,     79,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000072', '1988-06-22',  'F',    '+15874910361', NULL,                     78,     80,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000073', '1988-07-23',  'M',    '+15874810361', NULL,                     79,     81,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000074', '1968-12-29',  'M',    '+15868910361', NULL,                     80,     82,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000075', '1988-04-24',  'M',    '+15877910361', NULL,                     81,     83,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000076', '1968-03-23',  'M',    '+15887910361', NULL,                     82,     84,         NULL),
('SUNE',      'P',        'FOSSE',      '100000077', '1998-02-22',  'F',    '+15869510361', NULL,                     83,     85,         NULL),
('GEORGETA',  'L',        'ALLARD',     '100000078', '1998-02-22',  'F',    '+15869310361', NULL,                     84,     86,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000079', '1988-01-21',  'F',    '+15860910361', NULL,                     85,     87,         NULL);


UPDATE employee
SET manager_id = 1000085
WHERE employee_id < 1000087 AND employee_id > 1000075 AND NOT employee_id = 1000085;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000080', '1988-04-23',  'M',    '+25867910361', NULL,                     86,     88,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000081', '1998-12-24',  'F',    '+25869910361', NULL,                     87,     89,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000082', '1988-04-24',  'F',    '+25867510361', NULL,                     88,     90,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000083', '1988-06-22',  'F',    '+25874910361', NULL,                     89,     91,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000084', '1988-07-23',  'M',    '+25874810361', NULL,                     90,     92,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000085', '1968-12-29',  'M',    '+25868910361', NULL,                     91,     93,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000086', '1988-04-24',  'M',    '+25877910361', NULL,                     92,     94,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000087', '1968-03-23',  'M',    '+25887910361', NULL,                     93,     95,         NULL),
('SUNE',      'P',        'FOSSE',      '100000088', '1998-02-22',  'F',    '+25869510361', NULL,                     94,     96,         NULL),
('SANDRA',    'M',        'ALLARD',     '100000089', '1998-02-22',  'F',    '+25869310361', NULL,                     95,     97,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000090', '1988-01-21',  'F',    '+25860910361', NULL,                     96,     98,         NULL);


UPDATE employee
SET manager_id = 1000096
WHERE employee_id < 1000098 AND employee_id > 1000086 AND NOT employee_id = 1000096;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000091', '1988-04-23',  'M',    '+15067910361', NULL,                     97,     99,         1000063),
('KRISTIN',   NULL,       'SCRIVEN',    '100000092', '1998-12-24',  'F',    '+15069910361', NULL,                     98,     100,        1000063),
('MONIKA',    NULL,       'INGESSON',   '100000093', '1988-04-24',  'F',    '+15067510361', NULL,                     99,     101,        1000074),
('VASIA',     'K',        'MIYAZAKI',   '100000094', '1988-06-22',  'F',    '+15074910361', NULL,                     100,    102,        1000074),
('FAIRUZ',    'H',        'BYRD',       '100000095', '1988-07-23',  'M',    '+15074810361', NULL,                     101,    103,        1000085),
('SULEYMAN',  NULL,       'KURZMANN',   '100000096', '1968-12-29',  'M',    '+15068910361', NULL,                     102,    104,        1000085),
('FELIX',     NULL,       'LINDQVIST',  '100000097', '1988-04-24',  'M',    '+25077910361', NULL,                     103,    105,        1000096),
('TSHEPO',    NULL,       'BEST',       '100000098', '1968-03-23',  'M',    '+25087910361', NULL,                     104,    106,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'S',        'CORNELL',    '100000099', '1988-04-23',  'M',    NULL,           NULL,                     105,    107,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000100', '1998-12-24',  'F',    NULL,           NULL,                     106,    108,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000101', '1988-04-24',  'F',    NULL,           NULL,                     107,    109,        NULL),
('VASIA',     'R',        'MIYAZAKI',   '100000102', '1988-06-22',  'F',    NULL,           NULL,                     108,    110,        NULL),
('FAIRUZ',    'Q',        'BYRD',       '100000103', '1988-07-23',  'M',    NULL,           NULL,                     109,    111,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000104', '1968-12-29',  'M',    NULL,           NULL,                     110,    112,        NULL),
('NAMEY',     NULL,       'LINDQVIST',  '100000105', '1988-04-24',  'M',    NULL,           NULL,                     111,    113,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000106', '1988-04-24',  'M',    NULL,           NULL,                     112,    114,        NULL),
('HIDEKI',    'P',        'CORNELL',    '100000107', '1988-04-23',  'M',    NULL,           NULL,                     113,    115,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000108', '1998-12-24',  'F',    NULL,           NULL,                     114,    116,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000109', '1988-04-24',  'F',    NULL,           NULL,                     115,    117,        NULL),
('VASIA',     'O',        'MIYAZAKI',   '100000110', '1988-06-22',  'F',    NULL,           NULL,                     116,    118,        NULL),
('FAIRUZ',    'N',        'BYRD',       '100000111', '1988-07-23',  'M',    NULL,           NULL,                     117,    119,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000112', '1968-12-29',  'M',    NULL,           NULL,                     118,    120,        NULL),
('AMY',       NULL,       'LINDQVIST',  '100000113', '1988-04-24',  'F',    NULL,           NULL,                     119,    121,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000114', '1988-04-24',  'M',    NULL,           NULL,                     120,    122,        NULL),
('HIDEKI',    'M',        'CORNELL',    '100000115', '1988-04-23',  'M',    NULL,           NULL,                     121,    123,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000116', '1998-12-24',  'F',    NULL,           NULL,                     122,    124,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000117', '1988-04-24',  'F',    NULL,           NULL,                     123,    125,        NULL),
('VASIA',     'L',        'MIYAZAKI',   '100000118', '1988-06-22',  'F',    NULL,           NULL,                     124,    126,        NULL),
('FAIRUZ',    'K',        'BYRD',       '100000119', '1988-07-23',  'M',    NULL,           NULL,                     125,    127,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000120', '1968-12-29',  'M',    NULL,           NULL,                     126,    128,        NULL),
('FELIX',     NULL,       'ULG',        '100000121', '1988-04-24',  'M',    NULL,           NULL,                     127,    129,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000122', '1988-04-24',  'M',    NULL,           NULL,                     128,    130,        NULL),
('HIDEKI',    'J',        'CORNELL',    '100000123', '1988-04-23',  'M',    NULL,           NULL,                     129,    131,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000124', '1998-12-24',  'F',    NULL,           NULL,                     130,    132,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000125', '1988-04-24',  'F',    NULL,           NULL,                     131,    133,        NULL),
('VASIA',     'H',        'MIYAZAKI',   '100000126', '1988-06-22',  'F',    NULL,           NULL,                     132,    134,        NULL),
('FAIRUZ',    'I',        'BYRD',       '100000127', '1988-07-23',  'M',    NULL,           NULL,                     133,    135,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000128', '1968-12-29',  'M',    NULL,           NULL,                     134,    136,        NULL),
('FELIX',     NULL,       'KURZMANN',   '100000129', '1988-04-24',  'M',    NULL,           NULL,                     135,    137,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000130', '1988-04-24',  'M',    NULL,           NULL,                     136,    138,        NULL),
('HIDEKI',    'G',        'CORNELL',    '100000131', '1988-04-23',  'M',    NULL,           NULL,                     137,    139,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000132', '1998-12-24',  'F',    NULL,           NULL,                     138,    140,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000133', '1988-04-24',  'F',    NULL,           NULL,                     139,    141,        NULL),
('VASIA',     'F',        'MIYAZAKI',   '100000134', '1988-06-22',  'F',    NULL,           NULL,                     140,    142,        NULL),
('FAIRUZ',    'E',        'BYRD',       '100000135', '1988-07-23',  'M',    NULL,           NULL,                     141,    143,        NULL),
('HERSHALL',  NULL,       'KURZMANN',   '100000136', '1968-12-29',  'M',    NULL,           NULL,                     142,    144,        NULL),
('JEREMY',    NULL,       'LINDQVIST',  '100000137', '1988-04-24',  'M',    NULL,           NULL,                     143,    145,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000138', '1988-04-24',  'M',    NULL,           NULL,                     144,    146,        NULL),
('HIDEKI',    'C',        'CORNELL',    '100000139', '1988-04-23',  'M',    NULL,           NULL,                     145,    147,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000140', '1998-12-24',  'F',    NULL,           NULL,                     146,    148,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000141', '1988-04-24',  'F',    NULL,           NULL,                     147,    149,        NULL),
('VASIA',     'B',        'MIYAZAKI',   '100000142', '1988-06-22',  'F',    NULL,           NULL,                     148,    150,        NULL),
('MARK',      'A',        'BYRD',       '100000143', '1988-07-23',  'M',    NULL,           NULL,                     149,    151,        NULL),
('JOHN',      NULL,       'KURZMANN',   '100000144', '1968-12-29',  'M',    NULL,           NULL,                     150,    152,        NULL),
('KARL',      NULL,       'LINDQVIST',  '100000145', '1988-04-24',  'M',    NULL,           NULL,                     151,    153,        NULL),
('JOHN',      NULL,       'LINDQVIST',  '100000146', '1988-04-24',  'M',    NULL,           NULL,                     152,    154,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PROPSPER',  'S',        'ALFERINK',   '100000147', '1988-04-23',  'M',    NULL,           NULL,                     153,    155,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BEATRICE',  'S',        'ABBADELLI',  '100000148', '1988-04-23',  'F',    NULL,           NULL,                     154,    156,        1000154),
('KUROSH',    NULL,       'ABBADELLI',  '100000149', '1988-04-23',  'M',    NULL,           NULL,                     155,    157,        1000154),
('LUKAS',     NULL,       'ABBADELLI',  '100000150', '1988-04-23',  'M',    NULL,           NULL,                     156,    158,        1000154);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000151', '1988-04-23',  'M',    NULL,           NULL,                     157,    159,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('FRANCO',    'S',        'CALVO',      '100000152', '1989-04-23',  'M',    NULL,           NULL,                     158,    160,        1000158),
('ALVA',      NULL,       'SERAFINI',   '100000153', '1989-05-23',  'F',    NULL,           NULL,                     159,    161,        1000158),
('LUKAS',     NULL,       'CALVO',      '100000154', '1985-08-28',  'M',    NULL,           NULL,                     160,    162,        1000158);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000155', '1988-04-23',  'M',    NULL,           NULL,                     161,    163,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'S',        'JEANS',      '100000156', '1989-04-23',  'M',    NULL,           NULL,                     162,    164,        1000162),
('HARRY',     NULL,       'NOSE',       '100000157', '1989-05-23',  'M',    NULL,           NULL,                     163,    165,        1000162),
('BARNEY',    NULL,       'BILLS',      '100000158', '1985-08-28',  'M',    NULL,           NULL,                     164,    166,        1000162);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'J',        'JEANS',      '100000159', '1989-04-23',  'M',    NULL,           NULL,                     165,    167,        1000063),
('HARRY',     NULL,       'NOSEN',      '100000160', '1989-05-23',  'M',    NULL,           NULL,                     166,    168,        1000063),
('BARNEY',    NULL,       'BILLS',      '100000161', '1985-08-28',  'M',    NULL,           NULL,                     167,    169,        1000074),
('JIMMY',     'P',        'JEANS',      '100000162', '1989-04-23',  'M',    NULL,           NULL,                     168,    170,        1000074),
('BARRY',     NULL,       'NOSE',       '100000163', '1989-05-23',  'M',    NULL,           NULL,                     169,    171,        1000085),
('BARNEY',    NULL,       'BILLS',      '100000164', '1985-08-28',  'M',    NULL,           NULL,                     170,    172,        1000085),
('JIMMOTHY',  'S',        'JENSON',     '100000165', '1989-04-23',  'M',    NULL,           NULL,                     171,    173,        1000096),
('LARRY',     NULL,       'NOSE',       '100000166', '1989-05-23',  'M',    NULL,           NULL,                     172,    174,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANNE',      'S',        'PERROT',     '100000167', '1975-04-23',  'F',    NULL,           NULL,                     173,    175,        NULL),
('SAWDA',     NULL,       'PAPOUTSIS',  '100000168', '1975-05-23',  'F',    NULL,           NULL,                     174,    176,        NULL),
('BARNEY',    NULL,       'DINO',       '100000169', '1974-08-28',  'M',    NULL,           NULL,                     175,    177,        NULL),
('JACOBA',    'A',        'PENA',       '100000170', '1974-04-23',  'M',    NULL,           NULL,                     176,    178,        NULL),
('SEONG',     NULL,       'KOOLS',      '100000171', '1974-05-23',  'F',    NULL,           NULL,                     177,    179,        NULL),
('IKENNA',    NULL,       'ROMILLY',    '100000172', '1974-08-28',  'F',    NULL,           NULL,                     178,    180,        NULL),
('FERNANDO',  'V',        'BRICE',      '100000173', '1974-04-23',  'M',    NULL,           NULL,                     179,    181,        NULL),
('HORACIO',   NULL,       'KURZ',       '100000174', '1974-05-23',  'M',    NULL,           NULL,                     180,    182,        NULL);


UPDATE employee
SET manager_id = 1000179
WHERE employee_id IN (1000176, 1000177, 1000181);


UPDATE employee
SET manager_id = 1000180
WHERE employee_id IN (1000174, 1000175, 1000178, 1000179);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'WILDGRUBE',  '100000175', '1975-04-23',  'F',    NULL,           NULL,                     181,    183,        NULL),
('STARR',     NULL,       'GARNETT',    '100000176', '1975-05-23',  'F',    NULL,           NULL,                     182,    184,        NULL),
('PING',      NULL,       'DINO',       '100000177', '1974-08-28',  'M',    NULL,           NULL,                     183,    185,        NULL),
('JEF',       'C',        'COMO',       '100000178', '1974-04-23',  'M',    NULL,           NULL,                     184,    186,        NULL),
('SEVERINE',  NULL,       'BJARNESEN',  '100000179', '1974-05-23',  'F',    NULL,           NULL,                     185,    187,        NULL),
('HUAN',      NULL,       'LEIFSSON',   '100000180', '1974-08-28',  'M',    NULL,           NULL,                     186,    188,        NULL),
('LINWOOD',   'O',        'COOKE',      '100000181', '1974-04-23',  'M',    NULL,           NULL,                     187,    189,        NULL),
('PEPE',      NULL,       'GARDINER',   '100000182', '1974-05-23',  'M',    NULL,           NULL,                     188,    190,        NULL);


UPDATE employee
SET manager_id = 1000187
WHERE employee_id IN (1000184, 1000185, 1000189);


UPDATE employee
SET manager_id = 1000188
WHERE employee_id IN (1000182, 1000183, 1000186, 1000187);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAISIA',    'S',        'ROSE',       '100000183', '1975-04-23',  'F',    NULL,           NULL,                     189,    191,        NULL),
('OLGA',      NULL,       'SCHULTHEISS','100000184', '1975-05-23',  'F',    NULL,           NULL,                     190,    192,        NULL),
('KYOU',      NULL,       'SUZUKI',     '100000185', '1970-08-28',  'F',    NULL,           NULL,                     191,    193,        NULL),
('ROLLO',     'D',        'SHORT',      '100000186', '1970-04-23',  'M',    NULL,           NULL,                     192,    194,        NULL),
('LEONARDO',  NULL,       'BJARNESEN',  '100000187', '1970-05-23',  'M',    NULL,           NULL,                     193,    195,        NULL),
('HUAN',      NULL,       'ROSE',       '100000188', '1970-08-28',  'M',    NULL,           NULL,                     194,    196,        NULL),
('FLAVIA',    'O',        'MOROZOV',    '100000189', '1970-04-23',  'M',    NULL,           NULL,                     195,    197,        NULL),
('CORINNA',   NULL,       'WERNHER',    '100000190', '1970-05-23',  'M',    NULL,           NULL,                     196,    198,        NULL);


UPDATE employee
SET manager_id = 1000195
WHERE employee_id IN (1000192, 1000193, 1000197);


UPDATE employee
SET manager_id = 1000196
WHERE employee_id IN (1000190, 1000191, 1000194, 1000195);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MAXINE',    'A',        'THAIDHG',    '100000191', '1975-04-23',  'F',    NULL,           NULL,                     197,    199,        NULL),
('MARCEAU',   NULL,       'OTTEN',      '100000192', '2000-05-23',  'M',    NULL,           NULL,                     198,    200,        NULL),
('HARLOW',    NULL,       'ARENDOK',    '100000193', '1970-08-28',  'M',    NULL,           NULL,                     199,    201,        NULL);


UPDATE employee
SET manager_id = 1000198
WHERE employee_id = 1000199;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANDRE',     'K',        'GILBERT',    '100000194', '1975-05-23',  'M',    NULL,           NULL,                     200,    202,        NULL),
('EMIL',      NULL,       'TRAVERSO',   '100000195', '2000-08-23',  'M',    NULL,           NULL,                     201,    203,        NULL),
('SEPHORA',   NULL,       'VILLENEUVE', '100000196', '1971-08-28',  'F',    NULL,           NULL,                     202,    204,        NULL);


UPDATE employee
SET manager_id = 1000201
WHERE employee_id = 1000202;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AFAF',      'S',        'LOWE',       '100000197', '1975-04-23',  'M',    NULL,           NULL,                     203,    205,        NULL),
('MAXIME',    NULL,       'LAMBERT',    '100000198', '2001-08-23',  'M',    NULL,           NULL,                     204,    206,        NULL),
('TERZO',     NULL,       'HERZOG',     '100000199', '1970-08-28',  'F',    NULL,           NULL,                     205,    207,        NULL);


UPDATE employee
SET manager_id = 1000204
WHERE employee_id = 1000205;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'LOWE',       '100000200', '1975-04-23',  'F',    NULL,           NULL,                     206,    208,        NULL),
('STARR',     NULL,       'LAMBERT',    '100000201', '2001-08-23',  'F',    NULL,           NULL,                     207,    209,        NULL),
('PING',      NULL,       'HERZOG',     '100000202', '1970-08-28',  'M',    NULL,           NULL,                     208,    210,        NULL),
('JEF',       'H',        'LOWE',       '100000203', '1975-04-23',  'M',    NULL,           NULL,                     209,    211,        NULL),
('SEVERINE',  NULL,       'LAMBERT',    '100000204', '2001-08-23',  'F',    NULL,           NULL,                     210,    212,        NULL),
('HUAN',      NULL,       'HERZOG',     '100000205', '1970-08-28',  'F',    NULL,           NULL,                     211,    213,        NULL);


UPDATE employee
SET manager_id = 1000210
WHERE employee_id = 1000209;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'P',        'LOWE',       '100000206', '1978-12-01',  'M',    NULL,           NULL,                     212,    214,        NULL),
('RICO',      NULL,       'LAMBERT',    '100000207', '1999-04-02',  'M',    NULL,           NULL,                     213,    215,        NULL),
('DEVARAJ',   NULL,       'HERZOG',     '100000208', '1978-03-03',  'M',    NULL,           NULL,                     214,    216,        NULL),
('BENVENUTO', 'L',        'LOWE',       '100000209', '1978-02-04',  'M',    NULL,           NULL,                     215,    217,        NULL),
('SARA',      NULL,       'LAMBERT',    '100000210', '1999-01-05',  'F',    NULL,           NULL,                     216,    218,        NULL),
('LALE',      NULL,       'HERZOG',     '100000211', '1978-05-06',  'M',    NULL,           NULL,                     217,    219,        NULL);


UPDATE employee
SET manager_id = 1000216
WHERE employee_id = 1000215;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('RAJ',       'D',        'OSBOURNE',   '100000212', '1978-12-01',  'M',    NULL,           NULL,                     218,    220,        NULL),
('SIMONE',    NULL,       'ASIS',       '100000213', '1999-04-02',  'F',    NULL,           NULL,                     219,    221,        NULL),
('JOLINE',    NULL,       'LEEUWENHOEK','100000214', '1978-03-03',  'F',    NULL,           NULL,                     220,    222,        NULL),
('YULIA',     'L',        'THAIDHG',    '100000215', '1978-02-04',  'F',    NULL,           NULL,                     221,    223,        NULL),
('CY',        NULL,       'NEAL',       '100000216', '1999-01-05',  'M',    NULL,           NULL,                     222,    224,        NULL),
('ANDREA',    NULL,       'MCCREERY',   '100000217', '1978-05-06',  'F',    NULL,           NULL,                     223,    225,        NULL);


UPDATE employee
SET manager_id = 1000222
WHERE employee_id = 1000221;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('SIMONE',    NULL,       'MCCREERY',   '100000218', '1999-04-02',  'F',    NULL,           NULL,                     224,    226,        NULL),
('JOLINE',    NULL,       'NEAL',       '100000219', '1978-03-03',  'F',    NULL,           NULL,                     225,    227,        NULL),
('YULIA',     'L',        'SMITH',      '100000220', '1978-02-04',  'F',    NULL,           NULL,                     226,    228,        NULL),
('CY',        NULL,       'ASIS',       '100000221', '1999-01-05',  'M',    NULL,           NULL,                     227,    229,        NULL),
('ANDREA',    NULL,       'OSBOURNE',   '100000222', '1978-05-06',  'F',    NULL,           NULL,                     228,    230,        NULL),

('SUHAIL',    NULL,       'ROSE',       '100000223', '1999-04-02',  'M',    NULL,           NULL,                     229,    231,        NULL),
('NUAN',      NULL,       'SCHULTHEISS','100000224', '1978-03-03',  'M',    NULL,           NULL,                     230,    232,        NULL),
('INNOKENTI', 'L',        'SUZUKI',     '100000225', '1978-02-04',  'M',    NULL,           NULL,                     231,    233,        NULL),
('KENTIGERN', NULL,       'SHORT',      '100000226', '1999-01-05',  'M',    NULL,           NULL,                     232,    234,        NULL),
('RIEN',      NULL,       'BJARNESEN',  '100000227', '1978-05-06',  'M',    NULL,           NULL,                     233,    235,        NULL),

('SUHAIL',    NULL,       'PORCHER',    '100000228', '1999-04-02',  'M',    NULL,           NULL,                     234,    236,        NULL),
('NUAN',      NULL,       'BAUMGARTEN', '100000229', '1978-03-03',  'M',    NULL,           NULL,                     235,    237,        NULL),
('INNOKENTI', 'L',        'MIKHAILOV',  '100000230', '1978-02-04',  'M',    NULL,           NULL,                     236,    238,        NULL),
('KENTIGERN', NULL,       'BAGGI',      '100000231', '1999-01-05',  'M',    NULL,           NULL,                     237,    239,        NULL),
('RIEN',      NULL,       'NOYER',      '100000232', '1978-05-06',  'M',    NULL,           NULL,                     238,    240,        NULL),

('SIMONE',    NULL,       'PORCHER',    '100000233', '1999-04-02',  'F',    NULL,           NULL,                     239,    241,        NULL),
('JOLINE',    NULL,       'BAUMGARTEN', '100000234', '1978-03-03',  'M',    NULL,           NULL,                     240,    242,        NULL),
('YULIA',     'L',        'MIKHAILOV',  '100000235', '1978-02-04',  'M',    NULL,           NULL,                     241,    243,        NULL),
('CY',        NULL,       'BAGGI',      '100000236', '1999-01-05',  'M',    NULL,           NULL,                     242,    244,        NULL),
('ANDREA',    NULL,       'NOYER',      '100000237', '1978-05-06',  'M',    NULL,           NULL,                     243,    245,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('LAWYER',    'D',        'SAWYER',     '100000238', '1978-12-01',  'M',    NULL,           NULL,                     244,    246,        NULL),
('SIMONE',    NULL,       'LAW',        '100000239', '1999-04-02',  'F',    NULL,           NULL,                     245,    247,        NULL),
('JOE',       NULL,       'TURNEY',     '100000240', '1978-03-03',  'M',    NULL,           NULL,                     246,    248,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'SAWYER',     '100000241', '1978-12-01',  'M',    NULL,           NULL,                     247,    249,        NULL),
('NATHAN',    NULL,       'TURNER',     '100000242', '1999-04-02',  'M',    NULL,           NULL,                     248,    250,        NULL),
('ELISE',     NULL,       'STEEL',      '100000243', '1978-03-03',  'F',    NULL,           NULL,                     249,    251,        NULL),
('MARY',      NULL,       'SUE',        '100000244', '1978-03-03',  'F',    NULL,           NULL,                     250,    252,        NULL);


UPDATE employee
SET manager_id = 1000250
WHERE employee_id > 1000247 AND NOT employee_id = 1000250;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'GOLD',       '100000245', '1965-12-01',  'M',    NULL,           'jgold@company.org',      251,    253,        NULL),
('NATHAN',    NULL,       'SILVER',     '100000246', '1966-04-02',  'M',    NULL,           'nsilver@company.org',    252,    254,        NULL),
('ELISE',     NULL,       'BRONZE',     '100000247', '1967-03-14',  'F',    NULL,           'ebronze@company.org',    253,    255,        NULL),
('MARY',      NULL,       'COPPER',     '100000248', '1968-03-04',  'F',    NULL,           'mcopper@company.org',    254,    256,        NULL),
('JOHN',      'K',        'BRASS',      '100000249', '1969-12-11',  'M',    NULL,           'jbrass@company.org',     255,    257,        NULL),
('NEIL',      NULL,       'ZINC',       '100000250', '1965-07-02',  'M',    NULL,           'nzinc@company.org',      256,    258,        NULL),
('ELLEN',     NULL,       'TIN',        '100000251', '1966-03-03',  'F',    NULL,           'etin@company.org',       257,    259,        NULL),
('MYRTLE',    NULL,       'PEWTER',     '100000252', '1967-04-03',  'F',    NULL,           'mpewter@company.org',    258,    260,        NULL),
('JERKYLL',   'G',        'LEAD',       '100000253', '1968-12-06',  'M',    NULL,           'jlead@company.org',      259,    261,        NULL),
('NERRY',     NULL,       'CHROMIUM',   '100000254', '1969-04-02',  'M',    NULL,           'nchromium@company.org',  260,    262,        NULL),
('PENELOPE',  NULL,       'IRON',       '100000255', '1970-03-03',  'F',    NULL,           'eiron@company.org',      261,    263,        NULL);


-- Create department heads
UPDATE department
SET department_head_id = 1000000
WHERE department_id = 1;


UPDATE department
SET department_head_id = 1000252
WHERE department_id = 2;


UPDATE department
SET department_head_id = 1000253
WHERE department_id = 3;


UPDATE department
SET department_head_id = 1000254
WHERE department_id = 4;


UPDATE department
SET department_head_id = 1000255
WHERE department_id = 5;


UPDATE department
SET department_head_id = 1000256
WHERE department_id = 6;


UPDATE department
SET department_head_id = 1000257
WHERE department_id = 7;


UPDATE department
SET department_head_id = 1000258
WHERE department_id = 8;


UPDATE department
SET department_head_id = 1000259
WHERE department_id = 9;


UPDATE department
SET department_head_id = 1000260
WHERE department_id = 10;


UPDATE department
SET department_head_id = 1000261
WHERE department_id = 11;


UPDATE department
SET department_head_id = 1000262
WHERE department_id = 12;


-- Salary
INSERT INTO salary (employee_id, hourly_wage, annual_bonus) VALUES
(1000000, '$375', '$700,000'),
(1000001, '$100', '$250,000'),
(1000002, '$90',  '$200,000'),
(1000003, '$50',  '$120,000'),
(1000004, '$100', '$200,000'),
(1000005, '$35',  '$100,000'),
(1000006, '$35',  '$100,000'),
(1000007, '$35',  '$100,000'),
(1000008, '$30', '$1,000'),
(1000009, '$30', '$1,000'),
(1000010, '$40', '$1,000'),
(1000011, '$30', '$1,000'),
(1000012, '$25', '$1,000'),
(1000013, '$22', '$1,000'),
(1000014, '$22', '$1,000'),
(1000015, '$18', '$1,000'),
(1000016, '$20', '$1,000'),
(1000017, '$40', '$1,000'),
(1000018, '$30', '$1,000'),
(1000019, '$30', '$1,000'),
(1000020, '$40', '$1,000'),
(1000021, '$30', '$1,000'),
(1000022, '$25', '$1,000'),
(1000023, '$22', '$1,000'),
(1000024, '$22', '$1,000'),
(1000025, '$18', '$1,000'),
(1000026, '$20', '$1,000'),
(1000027, '$40', '$1,000'),
(1000028, '$30', '$1,000'),
(1000029, '$30', '$1,000'),
(1000030, '$40', '$1,000'),
(1000031, '$30', '$1,000'),
(1000032, '$25', '$1,000'),
(1000033, '$22', '$1,000'),
(1000034, '$22', '$1,000'),
(1000035, '$18', '$1,000'),
(1000036, '$20', '$1,000'),
(1000037, '$40', '$1,000'),
(1000038, '$30', '$1,000'),
(1000039, '$30', '$1,000'),
(1000040, '$40', '$1,000'),
(1000041, '$30', '$1,000'),
(1000042, '$25', '$1,000'),
(1000043, '$22', '$1,000'),
(1000044, '$22', '$1,000'),
(1000045, '$18', '$1,000'),
(1000046, '$20', '$1,000'),
(1000047, '$40', '$1,000'),
(1000048, '$40', '$5,000'),
(1000049, '$34', '$3,000'),
(1000050, '$42', '$5,000'),
(1000051, '$34', '$3,000'),
(1000052, '$40', '$5,000'),
(1000053, '$34', '$3,000'),
(1000054, '$30', '$1,000'),
(1000055, '$30', '$1,000'),
(1000056, '$40', '$1,000'),
(1000057, '$30', '$1,000'),
(1000058, '$25', '$1,000'),
(1000059, '$22', '$1,000'),
(1000060, '$22', '$1,000'),
(1000061, '$18', '$1,000'),
(1000062, '$20', '$1,000'),
(1000063, '$35', '$1,000'),
(1000064, '$40', '$1,000'),
(1000065, '$30', '$1,000'),
(1000066, '$30', '$1,000'),
(1000067, '$40', '$1,000'),
(1000068, '$30', '$1,000'),
(1000069, '$25', '$1,000'),
(1000070, '$22', '$1,000'),
(1000071, '$22', '$1,000'),
(1000072, '$18', '$1,000'),
(1000073, '$20', '$1,000'),
(1000074, '$35', '$1,000'),
(1000075, '$40', '$1,000'),
(1000076, '$30', '$1,000'),
(1000077, '$30', '$1,000'),
(1000078, '$40', '$1,000'),
(1000079, '$30', '$1,000'),
(1000080, '$25', '$1,000'),
(1000081, '$22', '$1,000'),
(1000082, '$22', '$1,000'),
(1000083, '$18', '$1,000'),
(1000084, '$20', '$1,000'),
(1000085, '$35', '$1,000'),
(1000086, '$40', '$1,000'),
(1000087, '$30', '$1,000'),
(1000088, '$30', '$1,000'),
(1000089, '$40', '$1,000'),
(1000090, '$30', '$1,000'),
(1000091, '$25', '$1,000'),
(1000092, '$22', '$1,000'),
(1000093, '$22', '$1,000'),
(1000094, '$18', '$1,000'),
(1000095, '$20', '$1,000'),
(1000096, '$35', '$1,000'),
(1000097, '$40', '$1,000'),
(1000098, '$30', '$10,000'),
(1000099, '$30', '$10,000'),
(1000100, '$40', '$10,000'),
(1000101, '$30', '$10,000'),
(1000102, '$25', '$10,000'),
(1000103, '$22', '$10,000'),
(1000104, '$22', '$10,000'),
(1000105, '$18', '$10,000'),
(1000106, '$40', '$10,000'),
(1000107, '$40', '$10,000'),
(1000108, '$40', '$10,000'),
(1000109, '$40', '$10,000'),
(1000110, '$40', '$10,000'),
(1000111, '$40', '$10,000'),
(1000112, '$40', '$10,000'),
(1000113, '$40', '$10,000'),
(1000114, '$40', '$10,000'),
(1000115, '$40', '$10,000'),
(1000116, '$40', '$10,000'),
(1000117, '$40', '$10,000'),
(1000118, '$40', '$10,000'),
(1000119, '$40', '$10,000'),
(1000120, '$40', '$10,000'),
(1000121, '$40', '$10,000'),
(1000122, '$40', '$10,000'),
(1000123, '$40', '$10,000'),
(1000124, '$40', '$10,000'),
(1000125, '$40', '$10,000'),
(1000126, '$40', '$10,000'),
(1000127, '$40', '$10,000'),
(1000128, '$40', '$10,000'),
(1000129, '$40', '$10,000'),
(1000130, '$40', '$10,000'),
(1000131, '$40', '$10,000'),
(1000132, '$40', '$10,000'),
(1000133, '$40', '$10,000'),
(1000134, '$40', '$10,000'),
(1000135, '$40', '$10,000'),
(1000136, '$40', '$10,000'),
(1000137, '$40', '$10,000'),
(1000138, '$40', '$10,000'),
(1000139, '$40', '$10,000'),
(1000140, '$40', '$10,000'),
(1000141, '$40', '$10,000'),
(1000142, '$40', '$10,000'),
(1000143, '$40', '$10,000'),
(1000144, '$40', '$10,000'),
(1000145, '$40', '$10,000'),
(1000146, '$40', '$10,000'),
(1000147, '$40', '$10,000'),
(1000148, '$40', '$10,000'),
(1000149, '$40', '$10,000'),
(1000150, '$40', '$10,000'),
(1000151, '$40', '$10,000'),
(1000152, '$40', '$10,000'),
(1000153, '$40', '$10,000'),
(1000154, '$30', '$10,000'),
(1000155, '$30', '$10,000'),
(1000156, '$40', '$10,000'),
(1000157, '$15', '$0'),
(1000158, '$25', '$10,000'),
(1000159, '$22', '$10,000'),
(1000160, '$22', '$10,000'),
(1000161, '$15', '$0'),
(1000162, '$25', '$10,000'),
(1000163, '$22', '$10,000'),
(1000164, '$22', '$10,000'),
(1000165, '$15', '$0'),
(1000166, '$30', '$1,000'),
(1000167, '$30', '$1,000'),
(1000168, '$20', '$1,000'),
(1000169, '$30', '$1,000'),
(1000170, '$25', '$1,000'),
(1000171, '$22', '$1,000'),
(1000172, '$22', '$1,000'),
(1000173, '$18', '$1,000'),
(1000174, '$35', '$2,250'),
(1000175, '$35', '$2,500'),
(1000176, '$28', '$1,000'),
(1000177, '$24', '$1,000'),
(1000178, '$29', '$1,000'),
(1000179, '$31', '$1,000'),
(1000180, '$40', '$1,000'),
(1000181, '$20', '$0'),
(1000182, '$35', '$2,250'),
(1000183, '$35', '$2,500'),
(1000184, '$28', '$1,000'),
(1000185, '$24', '$1,000'),
(1000186, '$29', '$1,000'),
(1000187, '$31', '$1,000'),
(1000188, '$40', '$1,000'),
(1000189, '$20', '$0'),
(1000190, '$35', '$2,250'),
(1000191, '$35', '$2,500'),
(1000192, '$28', '$1,000'),
(1000193, '$24', '$1,000'),
(1000194, '$29', '$1,000'),
(1000195, '$31', '$1,000'),
(1000196, '$40', '$1,000'),
(1000197, '$20', '$0'),
(1000198, '$35', '$2,250'),
(1000199, '$16', '$0'),
(1000200, '$20', '$1,000'),
(1000201, '$28', '$1,000'),
(1000202, '$20', '$1,000'),
(1000203, '$15', '$0'),
(1000204, '$29', '$1,000'),
(1000205, '$20', '$1,000'),
(1000206, '$15.50', '$0'),
(1000207, '$20', '$2,250'),
(1000208, '$20', '$2,250'),
(1000209, '$30', '$2,250'),
(1000210, '$40', '$2,250'),
(1000211, '$20', '$2,250'),
(1000212, '$40', '$2,250'),
(1000213, '$20', '$2,250'),
(1000214, '$20', '$2,250'),
(1000215, '$30', '$2,250'),
(1000216, '$40', '$2,250'),
(1000217, '$20', '$2,250'),
(1000218, '$40', '$2,250'),
(1000219, '$20', '$2,250'),
(1000220, '$20', '$2,250'),
(1000221, '$30', '$2,250'),
(1000222, '$40', '$2,250'),
(1000223, '$20', '$2,250'),
(1000224, '$40', '$2,250'),
(1000225, '$40', '$10,000'),
(1000226, '$40', '$10,000'),
(1000227, '$40', '$10,000'),
(1000228, '$40', '$10,000'),
(1000229, '$40', '$10,000'),
(1000230, '$40', '$10,000'),
(1000231, '$40', '$10,000'),
(1000232, '$40', '$10,000'),
(1000233, '$40', '$10,000'),
(1000234, '$40', '$10,000'),
(1000235, '$40', '$10,000'),
(1000236, '$40', '$10,000'),
(1000237, '$40', '$10,000'),
(1000238, '$40', '$10,000'),
(1000239, '$40', '$10,000'),
(1000240, '$40', '$10,000'),
(1000241, '$40', '$10,000'),
(1000242, '$40', '$10,000'),
(1000243, '$40', '$10,000'),
(1000244, '$40', '$10,000'),
(1000245, '$40', '$10,000'),
(1000246, '$40', '$10,000'),
(1000247, '$40', '$10,000'),
(1000248, '$35', '$10,000'),
(1000249, '$30', '$10,000'),
(1000250, '$40', '$10,000'),
(1000251, '$16', '$0'),
(1000252, '$50', '$90,000'),
(1000253, '$50', '$90,000'),
(1000254, '$50', '$90,000'),
(1000255, '$50', '$90,000'),
(1000256, '$50', '$90,000'),
(1000257, '$50', '$90,000'),
(1000258, '$50', '$90,000'),
(1000259, '$50', '$90,000'),
(1000260, '$50', '$90,000'),
(1000261, '$50', '$90,000'),
(1000262, '$50', '$90,000');


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-01-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-02-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-03-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-04-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 1:58:02 PM */
-- Delete all tables
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DROP TABLE IF EXISTS payroll          CASCADE;
DROP TABLE IF EXISTS benefits         CASCADE;
DROP TABLE IF EXISTS salary           CASCADE;
DROP TABLE IF EXISTS leave            CASCADE;
DROP TABLE IF EXISTS department       CASCADE;
DROP TABLE IF EXISTS job_location     CASCADE;
DROP TABLE IF EXISTS job              CASCADE;
DROP TABLE IF EXISTS employee         CASCADE;
DROP TABLE IF EXISTS employee_address CASCADE;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 1:58:03 PM */
-- Recreate tables from script
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Run these commands in ElephantSQL postgres database in browser tab to recreate starting tables for local testing

CREATE TABLE benefits (
  benefits_package_id        INT          GENERATED ALWAYS AS IDENTITY, 
  amount                     MONEY        NOT NULL,
  stock_options              VARCHAR(100), 
  health_insurance_provider  VARCHAR(100) NOT NULL CHECK(health_insurance_provider ~ '^[A-Z \d]+$'),
  retirement_plan            VARCHAR(100),

  PRIMARY KEY(benefits_package_id)
);


CREATE TABLE employee_address (
  address_id      INT           GENERATED ALWAYS AS IDENTITY,
  street_address  VARCHAR(100)  NOT NULL CHECK(street_address ~ '^[A-Z \/\d#\.,-]+$'),   -- Includes appt/po box info and locality info if applicable
  city            VARCHAR(50)   NOT NULL CHECK(city ~ '^[A-Z ]+$'), -- Also serves as post town if applicable
  zip_code        VARCHAR(16)   CHECK(zip_code ~ '^[\d \-A-Z]+$'), -- Also serves as postcode if applicable
  state           VARCHAR(50)   CHECK(state ~ '^[A-Z ]+$'), -- Also serves as province if applicable
  country         VARCHAR(50)   NOT NULL CHECK(country ~ '^[A-Z ]+$'),   -- Also serves as region if applicable

  PRIMARY KEY(address_id)
);


CREATE TABLE job_location (
  location_id   INT GENERATED ALWAYS AS IDENTITY,
  airport_id    INT,
  address_id    INT NOT NULL,
  flight_id     INT,
  location_name VARCHAR(50),

  PRIMARY KEY(location_id)
);


CREATE TABLE department (
  department_id       INT          GENERATED ALWAYS AS IDENTITY,
  department_name     VARCHAR(50)  NOT NULL CHECK(department_name ~ '^[A-Z ]+$'),
  creation_date       DATE         NOT NULL, 
  department_head_id  INT,

  PRIMARY KEY(department_id)
);


CREATE TABLE job (
  job_id              INT         GENERATED ALWAYS AS IDENTITY, 
  job_title           VARCHAR(50) NOT NULL CHECK(job_title ~ '^[A-Z \-]+$'),
  department_id       INT         NOT NULL, 
  location_id         INT         NOT NULL,
  weekly_hours        INT         DEFAULT 40 CHECK(weekly_hours <= 168),
  benefits_package_id INT         DEFAULT 0 NOT NULL,

  PRIMARY KEY(job_id),
  FOREIGN KEY(department_id)
    REFERENCES department(department_id)
    ON DELETE CASCADE,

  FOREIGN KEY(location_id)
    REFERENCES job_location(location_id)
    ON DELETE CASCADE,

  FOREIGN KEY(benefits_package_id)
    REFERENCES benefits(benefits_package_id)
    ON DELETE SET DEFAULT
);


CREATE TABLE employee (
  employee_id INT           GENERATED ALWAYS AS IDENTITY (START WITH 1000000),
  first_name  VARCHAR(50)   NOT NULL CHECK(first_name ~ '^[A-Z ]+$'),
  m_initial   CHAR(1),  
  last_name   VARCHAR(50)   NOT NULL CHECK(last_name ~ '^[A-Z ]+$'),
  ssn         CHAR(9)       UNIQUE CHECK(ssn ~ '^\d{9}$'),
  dob         DATE          NOT NULL,
  gender      CHAR(1)       NOT NULL CHECK(gender ~ '^[MFO]$'),
  phone       VARCHAR(15)   CHECK(phone ~ '^\+[0-9]+$'),
  email       VARCHAR(100)  UNIQUE CHECK(email ~ '^[\w\.\+]{1,64}@(\w+\.[A-Za-z]+){1,100}$'),
  job_id      INT           DEFAULT 0 NOT NULL,
  address_id  INT           NOT NULL,
  manager_id  INT,

  PRIMARY KEY(employee_id),
  FOREIGN KEY(job_id)
    REFERENCES job(job_id)
    ON DELETE SET DEFAULT,

  FOREIGN KEY(address_id)
    REFERENCES employee_address(address_id),

  FOREIGN KEY(manager_id)
    REFERENCES employee(employee_id)
    ON DELETE SET NULL
);


CREATE TABLE salary (
  salary_id    INT    GENERATED ALWAYS AS IDENTITY,
  employee_id  INT    NOT NULL,
  hourly_wage  MONEY  NOT NULL,
  annual_bonus MONEY  DEFAULT 0 NOT NULL,

  PRIMARY KEY(salary_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE leave (
  leave_id    INT           GENERATED ALWAYS AS IDENTITY,
  employee_id INT           NOT NULL,
  date        DATE          NOT NULL,
  reason      VARCHAR(100)  NOT NULL CHECK(reason ~ '^[A-Z \.\d]+$'),
  status      VARCHAR(50)   NOT NULL CHECK(status ~ '^[A-Z \.\d]+$'),

  PRIMARY KEY(leave_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE payroll (
  payroll_id    INT       GENERATED ALWAYS AS IDENTITY,
  employee_id   INT       NOT NULL, 
  hours_worked  REAL      NOT NULL,
  pay_period    DATE      NOT NULL,
  tax_rate      REAL      NOT NULL,
  gross_income  MONEY     NOT NULL,
  taxed_income  MONEY     NOT NULL,
  net_income    MONEY     NOT NULL,
  
  UNIQUE(employee_id, pay_period),

  PRIMARY KEY(payroll_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


/* DEFAULTS */
ALTER TABLE department
ADD CONSTRAINT fk_head FOREIGN KEY (department_head_id) REFERENCES employee(employee_id);


INSERT INTO benefits OVERRIDING SYSTEM VALUE VALUES(0, 0, 0, 'UNASSIGNED', 0);

INSERT INTO job_location OVERRIDING SYSTEM VALUE VALUES(0, NULL, 0, NULL);

INSERT INTO department OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', '1980-1-1');

INSERT INTO job OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', 0, 0, 0, 0);


/* Initial populated tables */

-- Departments (based on https://www.avjobs.com/history/structure-of-the-airline-industry.asp)
INSERT INTO department (department_name, creation_date) VALUES 
('BOARD OF DIRECTORS',            '1980-01-01'),
('ENGINEERING AND MAINTENANCE',   '1980-01-01'),
('GROUND OPERATIONS',             '1980-01-01'),
('FLIGHT OPERATIONS',             '1980-01-01'),
('SALES AND MARKETING',           '1980-01-01'),
('RESERVATIONS AND TICKETING',    '1980-01-01'),
('FINANCE AND PROPERTY',          '1980-01-01'),
('INFORMATION SERVICES',          '1990-11-08'),
('PERSONNEL',                     '1980-01-01'),
('EMERGENCY SERVICES',            '1980-04-05'),
('LEGAL',                         '1981-03-11'),
('PUBLIC RELATIONS AND PLANNING', '1985-07-20');


-- Benefits
INSERT INTO benefits (amount, stock_options, health_insurance_provider, retirement_plan) VALUES
(1000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS A', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS A', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN A'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(6000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS C', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(10000, 'STOCK OPTIONS D', 'INSURANCE PROVIDER D', 'RETIREMENT PLAN D'),
(4500,  'STOCK OPTIONS D', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN C');


-- Job locations
INSERT INTO job_location (airport_id, address_id, flight_id, location_name) VALUES
(NULL,  1,  NULL, 'OFFICES IN CITY A'),
(NULL,  2,  NULL, 'OFFICES IN CITY B'),
(NULL,  6,  NULL, 'OFFICES IN CITY C'),

(1, 3,  NULL, 'AIRPORT IN CITY A'),
(1, 3,  100,  'AIRPORT IN CITY A'),
(1, 3,  101,  'AIRPORT IN CITY A'),
(1, 3,  102,  'AIRPORT IN CITY A'),
(1, 3,  103,  'AIRPORT IN CITY A'),

(2, 4,  NULL, 'AIRPORT A IN CITY B'),
(2, 4,  200,  'AIRPORT A IN CITY B'),
(2, 4,  201,  'AIRPORT A IN CITY B'),
(2, 4,  202,  'AIRPORT A IN CITY B'),
(2, 4,  203,  'AIRPORT A IN CITY B'),

(3, 5,  NULL, 'AIRPORT B IN CITY B'),
(3, 5,  300,  'AIRPORT B IN CITY B'),
(3, 5,  301,  'AIRPORT B IN CITY B'),
(3, 5,  302,  'AIRPORT B IN CITY B'),
(3, 5,  303,  'AIRPORT B IN CITY B'),

(4, 7,  NULL, 'AIRPORT IN CITY C'),
(4, 7,  400,  'AIRPORT IN CITY C'),
(4, 7,  401,  'AIRPORT IN CITY C'),
(4, 7,  402,  'AIRPORT IN CITY C'),
(4, 7,  403,  'AIRPORT IN CITY C');


-- Jobs (based on https://www.airlinejobfinder.com/members/airline-jobs/)
INSERT INTO job (job_title, department_id, location_id, weekly_hours, benefits_package_id) VALUES
-- Board of Directors (1)
('CHIEF EXECUTIVE OFFICER', 1,  2,  50, 9),
('CHAIRMAN',                1,  2,  40, 9),
('VICE CHAIR',              1,  2,  40, 9),
('BOARD SECRETARY',         1,  2,  40, 9),
('TREASURER',               1,  2,  40, 9),
('BOARD MEMBER',            1,  2,  40, 9),

-- Maintenance and Engineering (2)
('AVIATION MAINTENANCE TECHNICIAN', 2,  4,  40, 2),
('POWERPLANT MECHANIC',             2,  4,  40, 2),
('AIRFRAME MECHANIC',               2,  4,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  4,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  4,  40, 2),
('AIRCRAFT FUELER',                 2,  4,  40, 2),
('AVIONIC TECHNICIAN',              2,  4,  40, 2),
('CABIN MAINTENANCE',               2,  4,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  4,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  4,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  9,  40, 2),
('POWERPLANT MECHANIC',             2,  9,  40, 2),
('AIRFRAME MECHANIC',               2,  9,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  9,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  9,  40, 2),
('AIRCRAFT FUELER',                 2,  9,  40, 2),
('AVIONIC TECHNICIAN',              2,  9,  40, 2),
('CABIN MAINTENANCE',               2,  9,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  9,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  9,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  14,  40, 2),
('POWERPLANT MECHANIC',             2,  14,  40, 2),
('AIRFRAME MECHANIC',               2,  14,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  14,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  14,  40, 2),
('AIRCRAFT FUELER',                 2,  14,  40, 2),
('AVIONIC TECHNICIAN',              2,  14,  40, 2),
('CABIN MAINTENANCE',               2,  14,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  14,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  14,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  19,  40, 2),
('POWERPLANT MECHANIC',             2,  19,  40, 2),
('AIRFRAME MECHANIC',               2,  19,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  19,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  19,  40, 2),
('AIRCRAFT FUELER',                 2,  19,  40, 2),
('AVIONIC TECHNICIAN',              2,  19,  40, 2),
('CABIN MAINTENANCE',               2,  19,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  19,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  19,  40, 2),

-- Ground Operations (3)
('DIRECTOR OF AVIATION',        3, 1, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 1, 40, 3),
('DIRECTOR OF AVIATION',        3, 2, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 2, 40, 3),
('DIRECTOR OF AVIATION',        3, 3, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 3, 40, 3),

('BAGGAGE HANDLER',               3,  4,  40, 5),
('SKYCAP',                        3,  4,  40, 5),
('CONCESSIONS',                   3,  4,  40, 5),
('AIRPORT GUIDE',                 3,  4,  40, 5),
('AIRPORT CUSTODIAN',             3,  4,  40, 1),
('OPERATIONS AGENT',              3,  4,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  4,  40, 3),
('PASSENGER SERVICE AGENT',       3,  4,  40, 3),
('RAMP PLANNER',                  3,  4,  40, 3),
('AIRLINE STATION AGENT',         3,  4,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  4,  40, 7),

('BAGGAGE HANDLER',               3,  9,  40, 5),
('SKYCAP',                        3,  9,  40, 5),
('CONCESSIONS',                   3,  9,  40, 5),
('AIRPORT GUIDE',                 3,  9,  40, 5),
('AIRPORT CUSTODIAN',             3,  9,  40, 1),
('OPERATIONS AGENT',              3,  9,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  9,  40, 3),
('PASSENGER SERVICE AGENT',       3,  9,  40, 3),
('RAMP PLANNER',                  3,  9,  40, 3),
('AIRLINE STATION AGENT',         3,  9,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  9,  40, 7),

('BAGGAGE HANDLER',               3,  14, 40, 5),
('SKYCAP',                        3,  14, 40, 5),
('CONCESSIONS',                   3,  14, 40, 5),
('AIRPORT GUIDE',                 3,  14, 40, 5),
('AIRPORT CUSTODIAN',             3,  14, 40, 1),
('OPERATIONS AGENT',              3,  14, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  14, 40, 3),
('PASSENGER SERVICE AGENT',       3,  14, 40, 3),
('RAMP PLANNER',                  3,  14, 40, 3),
('AIRLINE STATION AGENT',         3,  14, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  14, 40, 7),

('BAGGAGE HANDLER',               3,  19, 40, 5),
('SKYCAP',                        3,  19, 40, 5),
('CONCESSIONS',                   3,  19, 40, 5),
('AIRPORT GUIDE',                 3,  19, 40, 5),
('AIRPORT CUSTODIAN',             3,  19, 40, 1),
('OPERATIONS AGENT',              3,  19, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  19, 40, 3),
('PASSENGER SERVICE AGENT',       3,  19, 40, 3),
('RAMP PLANNER',                  3,  19, 40, 3),
('DISTRICT OPERATIONS MANAGER',   3,  19, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  19, 40, 7),

-- Flight Operations (4)
('FLIGHT DISPATCHER',       4,  4,  40, 6),
('AVIATION METEOROLOGIST',  4,  4,  40, 6),
('FLIGHT DISPATCHER',       4,  9,  40, 6),
('AVIATION METEOROLOGIST',  4,  9,  40, 6),
('FLIGHT DISPATCHER',       4,  14, 40, 6),
('AVIATION METEOROLOGIST',  4,  14, 40, 6),
('FLIGHT DISPATCHER',       4,  19, 40, 6),
('AVIATION METEOROLOGIST',  4,  19, 40, 6),

('CARGO CARRIER PILOT', 4,  5,  60, 6),
('COPORATE PILOT',      4,  5,  30, 6),
('CHARTER PILOT',       4,  5,  60, 6),

('CARGO CARRIER PILOT', 4,  6,  60, 6),
('COPORATE PILOT',      4,  6,  30, 6),
('CHARTER PILOT',       4,  6,  60, 6),

('CARGO CARRIER PILOT', 4,  7,  60, 6),
('COPORATE PILOT',      4,  7,  30, 6),
('CHARTER PILOT',       4,  7,  60, 6),

('CARGO CARRIER PILOT', 4,  8,  60, 6),
('COPORATE PILOT',      4,  8,  30, 6),
('CHARTER PILOT',       4,  8,  60, 6),

('CARGO CARRIER PILOT', 4,  10, 60, 6),
('COPORATE PILOT',      4,  10, 30, 6),
('CHARTER PILOT',       4,  10, 60, 6),

('CARGO CARRIER PILOT', 4,  11, 60, 6),
('COPORATE PILOT',      4,  11, 30, 6),
('CHARTER PILOT',       4,  11, 60, 6),

('CARGO CARRIER PILOT', 4,  12, 60, 6),
('COPORATE PILOT',      4,  12, 30, 6),
('CHARTER PILOT',       4,  12, 60, 6),

('CARGO CARRIER PILOT', 4,  13, 60, 6),
('COPORATE PILOT',      4,  13, 30, 6),
('CHARTER PILOT',       4,  13, 60, 6),

('CARGO CARRIER PILOT', 4,  15, 60, 6),
('COPORATE PILOT',      4,  15, 30, 6),
('CHARTER PILOT',       4,  15, 60, 6),

('CARGO CARRIER PILOT', 4,  16, 60, 6),
('COPORATE PILOT',      4,  16, 30, 6),
('CHARTER PILOT',       4,  16, 60, 6),

('CARGO CARRIER PILOT', 4,  17, 60, 6),
('COPORATE PILOT',      4,  17, 30, 6),
('CHARTER PILOT',       4,  17, 60, 6),

('CARGO CARRIER PILOT', 4,  18, 60, 6),
('COPORATE PILOT',      4,  18, 30, 6),
('CHARTER PILOT',       4,  18, 60, 6),

('CARGO CARRIER PILOT', 4,  20, 60, 6),
('COPORATE PILOT',      4,  20, 30, 6),
('CHARTER PILOT',       4,  20, 60, 6),

('CARGO CARRIER PILOT', 4,  21, 60, 6),
('COPORATE PILOT',      4,  21, 30, 6),
('CHARTER PILOT',       4,  21, 60, 6),

('CARGO CARRIER PILOT', 4,  22, 60, 6),
('COPORATE PILOT',      4,  22, 30, 6),
('CHARTER PILOT',       4,  22, 60, 6),

('CARGO CARRIER PILOT', 4,  23, 60, 6),
('COPORATE PILOT',      4,  23, 30, 6),
('CHARTER PILOT',       4,  23, 60, 6),

-- Sales and Marketing (5)
('REGIONAL SALES MANAGER',  5,  1,  40, 3),
('SALES REPRESENTATIVE',    5,  1,  40, 3),
('AIRLINE MARKETER',        5,  1,  40, 3),
('SALES INTERN',            5,  1,  20, 3),

('REGIONAL SALES MANAGER',  5,  2,  40, 3),
('SALES REPRESENTATIVE',    5,  2,  40, 3),
('AIRLINE MARKETER',        5,  2,  40, 3),
('SALES INTERN',            5,  2,  20, 3),

('REGIONAL SALES MANAGER',  5,  3,  40, 3),
('SALES REPRESENTATIVE',    5,  3,  40, 3),
('AIRLINE MARKETER',        5,  3,  40, 3),
('SALES INTERN',            5,  3,  20, 3),

-- Reservations and Ticketing (6)
('RESERVATION SALES AGENT', 6,  4,  40, 3),
('AIRLINE TICKET AGENT',    6,  4,  40, 3),

('RESERVATION SALES AGENT', 6,  9,  40, 3),
('AIRLINE TICKET AGENT',    6,  9,  40, 3),

('RESERVATION SALES AGENT', 6,  14, 40, 3),
('AIRLINE TICKET AGENT',    6,  14, 40, 3),

('RESERVATION SALES AGENT', 6,  19, 40, 3),
('AIRLINE TICKET AGENT',    6,  19, 40, 3),

-- Finance and Property (7)
('ACCOUNTANT',                7,  1,  40, 5),
('AUDITOR',                   7,  1,  40, 5),
('FINANCE ASSITANT',          7,  1,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  1,  40, 5),
('PAYROLL CLERK',             7,  1,  40, 5),
('FINANCIAL ANALYST',         7,  1,  40, 5),
('PAYROLL MANAGER',           7,  1,  40, 5),
('FINANCE INTERN',            7,  1,  20, 5),

('ACCOUNTANT',                7,  2,  40, 5),
('AUDITOR',                   7,  2,  40, 5),
('FINANCE ASSITANT',          7,  2,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  2,  40, 5),
('PAYROLL CLERK',             7,  2,  40, 5),
('FINANCIAL ANALYST',         7,  2,  40, 5),
('PAYROLL MANAGER',           7,  2,  40, 5),
('FINANCE INTERN',            7,  2,  20, 5),

('ACCOUNTANT',                7,  3,  40, 5),
('AUDITOR',                   7,  3,  40, 5),
('FINANCE ASSITANT',          7,  3,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  3,  40, 5),
('PAYROLL CLERK',             7,  3,  40, 5),
('FINANCIAL ANALYST',         7,  3,  40, 5),
('PAYROLL MANAGER',           7,  3,  40, 5),
('FINANCE INTERN',            7,  3,  20, 5),

-- Information services (8)
('IT SPECIALIST',     8,  1,  40, 3),
('IT INTERN',         8,  1,  20, 3),
('HELP DESK SUPPORT', 8,  1,  40, 3),

('IT SPECIALIST',     8,  2,  40, 3),
('HELP DESK SUPPORT', 8,  2,  40, 3),
('IT INTERN',         8,  2,  20, 3),

('IT SPECIALIST',     8,  3,  40, 3),
('HELP DESK SUPPORT', 8,  3,  40, 3),
('IT INTERN',         8,  3,  20, 3),

-- Personnel (9)
('SECRETARY',                   9,  1,  40, 3),
('MAIL CLERK',                  9,  1,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  1,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  1,  40, 3),
('RECEPTIONIST',                9,  1,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  1,  40, 3),

('SECRETARY',                   9,  2,  40, 3),
('MAIL CLERK',                  9,  2,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  2,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  2,  40, 3),
('RECEPTIONIST',                9,  2,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  2,  40, 3),

('SECRETARY',                   9,  3,  40, 3),
('MAIL CLERK',                  9,  3,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  3,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  3,  40, 3),
('RECEPTIONIST',                9,  3,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  3,  40, 3),

-- Emergency Services (10)
('FIREFIGHTER',           10,  4,  40, 10),
('FIREFIGHTER MEDIC',     10,  4,  40, 10),
('POLICE OFFICER',        10,  4,  40, 10),
('FIRE AND CRASH RESCUE', 10,  4,  30, 10),
('POLICE PATROL OFFICER', 10,  4,  30, 10),

('FIREFIGHTER',           10,  9,  40, 10),
('FIREFIGHTER MEDIC',     10,  9,  40, 10),
('POLICE OFFICER',        10,  9,  40, 10),
('FIRE AND CRASH RESCUE', 10,  9,  30, 10),
('POLICE PATROL OFFICER', 10,  9,  30, 10),

('FIREFIGHTER',           10,  14, 40, 10),
('FIREFIGHTER MEDIC',     10,  14, 40, 10),
('POLICE OFFICER',        10,  14, 40, 10),
('FIRE AND CRASH RESCUE', 10,  14, 30, 10),
('POLICE PATROL OFFICER', 10,  14, 30, 10),

('FIREFIGHTER',           10,  19, 40, 10),
('FIREFIGHTER MEDIC',     10,  19, 40, 10),
('POLICE OFFICER',        10,  19, 40, 10),
('FIRE AND CRASH RESCUE', 10,  19, 30, 10),
('POLICE PATROL OFFICER', 10,  19, 30, 10),

-- Legal (11)
('AVIATION ATTORNEY',  11,  1,  40, 7),
('AVIATION ATTORNEY',  11,  2,  40, 7),
('AVIATION ATTORNEY',  11,  3,  40, 7),

-- Public Relations and Planning (12)
('PUBLIC RELATIONS SPECIALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS GENERALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS MANAGER',    12,  2,  40, 3),
('PUBLIC RELATIONS INTERN',     12,  2,  20, 3),

('HEAD OF ENGINEERING',           2,  2,  40, 9),
('HEAD OF GROUND OPERATIONS',     3,  2,  40, 9),
('HEAD OF FLIGHT OPERATIONS',     4,  2,  40, 9),
('HEAD OF SALES',                 5,  2,  40, 9),
('HEAD OF RESERVATIONS',          6,  2,  40, 9),
('HEAD OF FINANCE',               7,  2,  40, 9),
('HEAD OF INFORMATION SERVICES',  8,  2,  40, 9),
('HEAD OF PERSONNEL MANAGEMENT',  9,  2,  40, 9),
('HEAD OF EMERGENCY SERVICES',    10, 2,  40, 9),
('HEAD OF LEGAL',                 11, 2,  40, 9),
('HEAD OF PUBLIC RELATIONS',      12, 2,  40, 9);


-- Employee Address
INSERT INTO employee_address (street_address, city, zip_code, state, country) VALUES
('123 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('123 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('321 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('555 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('9029 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('765 MAIN ST',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('767 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('876 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8770 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('202 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('101 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('896 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('909 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('920 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('808 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8760 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8755 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('423 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('202 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('101 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('896 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('909 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 SEAWATER LN',     'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8260 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8234 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8754 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('808 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8234 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8754 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SLEEPY HILLS',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 FISHWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MINOR ST',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 LION LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 JUMPY HILLS',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 FISHWATER ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MINOR RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 LION RD',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SLEEPY SLOPES',  'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('423 FISHWATER RD',    'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8777 MAIN ST',        'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('920 LONG LN',         'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 KLEINE DR',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 EINE DR',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 ROADY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 NEIN LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KLEINE DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 EINE DR',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 ROADY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KLEINE DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 EINE DR',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 ROADY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 ROCKY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 BUMPY HILLS',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 POOLWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 DIGGY LN',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 ZEBRA ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 MERRYWEATHER LN', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CHRONO ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('420 CLOUDY DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 MERRYWEATHER LN', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 CHRONO ST',      'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('420 CLOUDY DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 TIME ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 TIME ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 TIME ST',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 STEEL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 STEEL LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A');


-- Employee
INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOHN',      'H',        'SMITH',      '123456789', '1965-01-01',  'M',    '+15553219090', 'jsmith@company.org',     1,      1,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MARY',      NULL,       'ORLEANS',    '987654321', '1970-04-09',  'F',    '+15559990001', 'morleans@company.org',   2,      2,          1000000),
('HARRIS',    NULL,       'BEAUDRY',    '111223333', '1967-04-29',  'M',    '+15559990021', 'hbeaudry@company.org',   3,      3,          NULL),
('ANABEL',    'A',        'NEALIOUS',   '112345678', '1980-01-09',  'F',    '+15559990011', 'anaulious@company.org',  4,      4,          NULL),
('DON',       'E',        'SYLVER',     '112345688', '1969-11-24',  'M',    '+15559980011', 'dsylver@company.org',    5,      5,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BRENDON',   NULL,       'LAMBINO',    '112346689', '1965-11-24',  'M',    '+15559680011', 'blambino@company.org',   6,      6,          1000001),
('MYRTLE',    NULL,       'TRUOG',      '122345688', '1969-12-24',  'F',    '+16559980011', 'mtruog@company.org',     6,      7,          1000001),
('LASZLO',    NULL,       'LUAIN',      '111345688', '1971-02-24',  'M',    '+15567980011', 'lluain@company.org',     6,      8,          1000001);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '117345689', '1984-06-23',  'M',    '+15567980111', NULL,                     7,      9,          NULL),
('LATIFA',    NULL,       'BELTZ',      '117245689', '1984-02-24',  'F',    '+15569980011', NULL,                     8,      10,         NULL),
('ELINA',     NULL,       'HAUTUM',     '117445689', '1983-06-24',  'F',    '+15567900811', NULL,                     9,      11,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '117545689', '1983-08-12',  'M',    '+15567980211', NULL,                     10,     12,         NULL),
('SOLOMON',   'V',        'TERZI',      '117745689', '1984-09-23',  'M',    '+15567980311', NULL,                     11,     13,         NULL),
('QUINCTUS',  NULL,       'HART',       '113345689', '1990-12-19',  'M',    '+15567980411', NULL,                     12,     14,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '118345689', '1987-06-04',  'F',    '+15567980511', NULL,                     13,     15,         NULL),
('LAURENS',   NULL,       'RUSH',       '114345689', '1989-05-03',  'M',    '+15567980611', NULL,                     14,     16,         NULL),
('SHANNA',    'M',        'PLANCK',     '111342689', '1990-04-02',  'F',    '+15567980711', NULL,                     15,     17,         NULL),
('REINALDO',  'S',        'CLARK',      '117355689', '1988-03-01',  'M',    '+15567980811', NULL,                     16,     18,         NULL);


UPDATE employee
SET manager_id = 1000017
WHERE employee_id < 1000017 AND employee_id > 1000007;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PRINCE',    'S',        'BERGFALK',   '100000001', '1984-06-23',  'M',    '+15567180111', NULL,                     17,     19,         NULL),
('RICO',      NULL,       'MILFORD',    '100000002', '1984-02-24',  'M',    '+15569180011', NULL,                     18,     20,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000003', '1983-06-24',  'M',    '+15567100811', NULL,                     19,     21,         NULL),
('BENVENUTO', 'J',        'BRYAN',      '100000004', '1983-08-12',  'M',    '+15567180211', NULL,                     20,     22,         NULL),
('SARA',      'S',        'COKES',      '100000005', '1984-09-23',  'F',    '+15567180311', NULL,                     21,     23,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000006', '1990-12-19',  'F',    '+15567180411', NULL,                     22,     24,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000007', '1987-06-04',  'F',    '+15567180511', NULL,                     23,     25,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000008', '1989-05-03',  'F',    '+15567180611', NULL,                     24,     26,         NULL),
('KYLEE',     'M',        'DARROW',     '100000009', '1990-04-02',  'F',    '+15567180711', NULL,                     25,     27,         NULL),
('SHIRO',     'G',        'DARZI',      '100000010', '1988-03-01',  'M',    '+15567180811', NULL,                     26,     28,         NULL);


UPDATE employee
SET manager_id = 1000027
WHERE employee_id < 1000027 AND employee_id > 1000017;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'B',        'ANKEREN',    '100000011', '1984-06-23',  'M',    '+15566180111', NULL,                     27,     29,         NULL),
('RICO',      NULL,       'MILFORD',    '100000012', '1984-02-24',  'M',    '+15566180011', NULL,                     28,     30,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000013', '1983-06-24',  'M',    '+15566100811', NULL,                     29,     31,         NULL),
('BENVENUTO', 'A',        'BRYAN',      '100000014', '1983-08-12',  'M',    '+15566180211', NULL,                     30,     32,         NULL),
('SARA',      'T',        'COKES',      '100000015', '1984-09-23',  'F',    '+15566180311', NULL,                     31,     33,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000016', '1990-12-19',  'F',    '+15566180411', NULL,                     32,     34,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000017', '1987-06-04',  'F',    '+15566180511', NULL,                     33,     35,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000018', '1989-05-03',  'F',    '+15566180611', NULL,                     34,     36,         NULL),
('KYLEE',     'O',        'DARROW',     '100000019', '1990-04-02',  'F',    '+15566180711', NULL,                     35,     37,         NULL),
('SHIRO',     'K',        'DARZI',      '100000020', '1988-03-01',  'M',    '+15566180811', NULL,                     36,     38,         NULL);


UPDATE employee
SET manager_id = 1000037
WHERE employee_id < 1000037 AND employee_id > 1000027;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '100000031', '1985-06-13',  'M',    '+25567980221', NULL,                     37,     39,         NULL),
('LATIFA',    NULL,       'BELTZ',      '100000032', '1985-02-14',  'F',    '+25569980221', NULL,                     38,     40,         NULL),
('ELINA',     NULL,       'HAUTUM',     '100000033', '1985-06-14',  'F',    '+25567900221', NULL,                     39,     41,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '100000034', '1985-08-12',  'M',    '+25574980221', NULL,                     40,     42,         NULL),
('SOLOMON',   'V',        'TERZI',      '100000035', '1985-09-13',  'M',    '+25574880221', NULL,                     41,     43,         NULL),
('QUINCTUS',  NULL,       'HART',       '100000036', '1995-12-19',  'M',    '+25568980221', NULL,                     42,     44,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '100000037', '1985-06-14',  'F',    '+25577980221', NULL,                     43,     45,         NULL),
('LAURENS',   NULL,       'RUSH',       '100000038', '1985-05-13',  'M',    '+25587980221', NULL,                     44,     46,         NULL),
('SHANNA',    'M',        'PLANCK',     '100000039', '1995-04-12',  'F',    '+25569980221', NULL,                     45,     47,         NULL),
('REINALDO',  'Q',        'HART',       '100000040', '1985-03-11',  'M',    '+25560980221', NULL,                     46,     48,         NULL);


UPDATE employee
SET manager_id = 1000047
WHERE employee_id < 1000047 AND employee_id > 1000037;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAUTVYDAS', 'C',        'LANG',       '100000041', '1986-06-13',  'M',    '+15567980221', NULL,                     47,     49,         NULL),
('JOAKIM',    NULL,       'LEON',       '100000042', '1986-02-14',  'M',    '+15569980221', NULL,                     48,     50,         NULL),
('VALENTIN',  NULL,       'FIORE',      '100000043', '1986-06-14',  'M',    '+15567900221', NULL,                     49,     51,         NULL),
('SHAHIN',    'G',        'HOBBES',     '100000044', '1986-08-12',  'M',    '+15574980221', NULL,                     50,     52,         NULL),
('EVITA',     'I',        'ACHTEROP',   '100000045', '1986-09-13',  'F',    '+15574880221', NULL,                     51,     53,         NULL),
('REINALDO',  'I',        'CLARKE',     '100000046', '1986-03-11',  'M',    '+15560980221', NULL,                     52,     54,         NULL);


UPDATE employee
SET manager_id = employee_id - 1
WHERE employee_id IN (1000049, 1000051, 1000053);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'J',        'DUPUY',      '100000047', '1984-06-23',  'M',    '+15867980221', NULL,                     53,     55,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000048', '1994-02-24',  'M',    '+15869980221', NULL,                     54,     56,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000049', '1984-06-24',  'F',    '+15867900221', NULL,                     55,     57,         NULL),
('LOLA',      'I',        'PATTERSON',  '100000050', '1984-08-22',  'F',    '+15874980221', NULL,                     56,     58,         NULL),
('DEIRDRE',   'R',        'STRANGE',    '100000051', '1984-09-23',  'F',    '+15874880221', NULL,                     57,     59,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000052', '1964-12-29',  'M',    '+15868980221', NULL,                     58,     60,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000053', '1984-06-24',  'F',    '+15877980221', NULL,                     59,     61,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000054', '1964-05-23',  'M',    '+15887980221', NULL,                     60,     62,         NULL),
('VALERIAN',  'M',        'DABNEY',     '100000055', '1994-04-22',  'F',    '+15869580221', NULL,                     61,     63,         NULL),
('LIANE',     'M',        'MARIA',      '100000056', '1994-04-22',  'F',    '+15869380221', NULL,                     62,     64,         NULL),
('TAAVI',     'B',        'HOUBEN',     '100000057', '1984-03-21',  'M',    '+15860980221', NULL,                     63,     65,         NULL);


UPDATE employee
SET manager_id = 1000063
WHERE employee_id < 1000065 AND employee_id > 1000053 AND NOT employee_id = 1000063;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'A',        'DUPUY',      '100000058', '1982-04-23',  'M',    '+15867910221', NULL,                     64,     66,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000059', '1992-12-24',  'M',    '+15869910221', NULL,                     65,     67,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000060', '1982-04-24',  'F',    '+15867510221', NULL,                     66,     68,         NULL),
('LOLA',      'A',        'PATTERSON',  '100000061', '1982-06-22',  'F',    '+15874910221', NULL,                     67,     69,         NULL),
('DEIRDRE',   'A',        'STRANGE',    '100000062', '1982-07-23',  'F',    '+15874810221', NULL,                     68,     70,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000063', '1962-12-29',  'M',    '+15868910221', NULL,                     69,     71,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000064', '1982-04-24',  'F',    '+15877910221', NULL,                     70,     72,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000065', '1962-03-23',  'M',    '+15887910221', NULL,                     71,     73,         NULL),
('VALERIAN',  'A',        'DABNEY',     '100000066', '1992-02-22',  'F',    '+15869510221', NULL,                     72,     74,         NULL),
('BRIGITTA',  'A',        'MATHEWSON',  '100000067', '1992-02-22',  'F',    '+15869310221', NULL,                     73,     75,         NULL),
('TAAVI',     'A',        'HOUBEN',     '100000068', '1982-01-21',  'M',    '+15860910221', NULL,                     74,     76,         NULL);


UPDATE employee
SET manager_id = 1000074
WHERE employee_id < 1000076 AND employee_id > 1000064 AND NOT employee_id = 1000074;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000069', '1988-04-23',  'M',    '+15867910361', NULL,                     75,     77,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000070', '1998-12-24',  'F',    '+15869910361', NULL,                     76,     78,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000071', '1988-04-24',  'F',    '+15867510361', NULL,                     77,     79,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000072', '1988-06-22',  'F',    '+15874910361', NULL,                     78,     80,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000073', '1988-07-23',  'M',    '+15874810361', NULL,                     79,     81,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000074', '1968-12-29',  'M',    '+15868910361', NULL,                     80,     82,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000075', '1988-04-24',  'M',    '+15877910361', NULL,                     81,     83,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000076', '1968-03-23',  'M',    '+15887910361', NULL,                     82,     84,         NULL),
('SUNE',      'P',        'FOSSE',      '100000077', '1998-02-22',  'F',    '+15869510361', NULL,                     83,     85,         NULL),
('GEORGETA',  'L',        'ALLARD',     '100000078', '1998-02-22',  'F',    '+15869310361', NULL,                     84,     86,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000079', '1988-01-21',  'F',    '+15860910361', NULL,                     85,     87,         NULL);


UPDATE employee
SET manager_id = 1000085
WHERE employee_id < 1000087 AND employee_id > 1000075 AND NOT employee_id = 1000085;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000080', '1988-04-23',  'M',    '+25867910361', NULL,                     86,     88,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000081', '1998-12-24',  'F',    '+25869910361', NULL,                     87,     89,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000082', '1988-04-24',  'F',    '+25867510361', NULL,                     88,     90,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000083', '1988-06-22',  'F',    '+25874910361', NULL,                     89,     91,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000084', '1988-07-23',  'M',    '+25874810361', NULL,                     90,     92,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000085', '1968-12-29',  'M',    '+25868910361', NULL,                     91,     93,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000086', '1988-04-24',  'M',    '+25877910361', NULL,                     92,     94,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000087', '1968-03-23',  'M',    '+25887910361', NULL,                     93,     95,         NULL),
('SUNE',      'P',        'FOSSE',      '100000088', '1998-02-22',  'F',    '+25869510361', NULL,                     94,     96,         NULL),
('SANDRA',    'M',        'ALLARD',     '100000089', '1998-02-22',  'F',    '+25869310361', NULL,                     95,     97,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000090', '1988-01-21',  'F',    '+25860910361', NULL,                     96,     98,         NULL);


UPDATE employee
SET manager_id = 1000096
WHERE employee_id < 1000098 AND employee_id > 1000086 AND NOT employee_id = 1000096;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000091', '1988-04-23',  'M',    '+15067910361', NULL,                     97,     99,         1000063),
('KRISTIN',   NULL,       'SCRIVEN',    '100000092', '1998-12-24',  'F',    '+15069910361', NULL,                     98,     100,        1000063),
('MONIKA',    NULL,       'INGESSON',   '100000093', '1988-04-24',  'F',    '+15067510361', NULL,                     99,     101,        1000074),
('VASIA',     'K',        'MIYAZAKI',   '100000094', '1988-06-22',  'F',    '+15074910361', NULL,                     100,    102,        1000074),
('FAIRUZ',    'H',        'BYRD',       '100000095', '1988-07-23',  'M',    '+15074810361', NULL,                     101,    103,        1000085),
('SULEYMAN',  NULL,       'KURZMANN',   '100000096', '1968-12-29',  'M',    '+15068910361', NULL,                     102,    104,        1000085),
('FELIX',     NULL,       'LINDQVIST',  '100000097', '1988-04-24',  'M',    '+25077910361', NULL,                     103,    105,        1000096),
('TSHEPO',    NULL,       'BEST',       '100000098', '1968-03-23',  'M',    '+25087910361', NULL,                     104,    106,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'S',        'CORNELL',    '100000099', '1988-04-23',  'M',    NULL,           NULL,                     105,    107,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000100', '1998-12-24',  'F',    NULL,           NULL,                     106,    108,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000101', '1988-04-24',  'F',    NULL,           NULL,                     107,    109,        NULL),
('VASIA',     'R',        'MIYAZAKI',   '100000102', '1988-06-22',  'F',    NULL,           NULL,                     108,    110,        NULL),
('FAIRUZ',    'Q',        'BYRD',       '100000103', '1988-07-23',  'M',    NULL,           NULL,                     109,    111,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000104', '1968-12-29',  'M',    NULL,           NULL,                     110,    112,        NULL),
('NAMEY',     NULL,       'LINDQVIST',  '100000105', '1988-04-24',  'M',    NULL,           NULL,                     111,    113,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000106', '1988-04-24',  'M',    NULL,           NULL,                     112,    114,        NULL),
('HIDEKI',    'P',        'CORNELL',    '100000107', '1988-04-23',  'M',    NULL,           NULL,                     113,    115,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000108', '1998-12-24',  'F',    NULL,           NULL,                     114,    116,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000109', '1988-04-24',  'F',    NULL,           NULL,                     115,    117,        NULL),
('VASIA',     'O',        'MIYAZAKI',   '100000110', '1988-06-22',  'F',    NULL,           NULL,                     116,    118,        NULL),
('FAIRUZ',    'N',        'BYRD',       '100000111', '1988-07-23',  'M',    NULL,           NULL,                     117,    119,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000112', '1968-12-29',  'M',    NULL,           NULL,                     118,    120,        NULL),
('AMY',       NULL,       'LINDQVIST',  '100000113', '1988-04-24',  'F',    NULL,           NULL,                     119,    121,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000114', '1988-04-24',  'M',    NULL,           NULL,                     120,    122,        NULL),
('HIDEKI',    'M',        'CORNELL',    '100000115', '1988-04-23',  'M',    NULL,           NULL,                     121,    123,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000116', '1998-12-24',  'F',    NULL,           NULL,                     122,    124,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000117', '1988-04-24',  'F',    NULL,           NULL,                     123,    125,        NULL),
('VASIA',     'L',        'MIYAZAKI',   '100000118', '1988-06-22',  'F',    NULL,           NULL,                     124,    126,        NULL),
('FAIRUZ',    'K',        'BYRD',       '100000119', '1988-07-23',  'M',    NULL,           NULL,                     125,    127,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000120', '1968-12-29',  'M',    NULL,           NULL,                     126,    128,        NULL),
('FELIX',     NULL,       'ULG',        '100000121', '1988-04-24',  'M',    NULL,           NULL,                     127,    129,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000122', '1988-04-24',  'M',    NULL,           NULL,                     128,    130,        NULL),
('HIDEKI',    'J',        'CORNELL',    '100000123', '1988-04-23',  'M',    NULL,           NULL,                     129,    131,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000124', '1998-12-24',  'F',    NULL,           NULL,                     130,    132,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000125', '1988-04-24',  'F',    NULL,           NULL,                     131,    133,        NULL),
('VASIA',     'H',        'MIYAZAKI',   '100000126', '1988-06-22',  'F',    NULL,           NULL,                     132,    134,        NULL),
('FAIRUZ',    'I',        'BYRD',       '100000127', '1988-07-23',  'M',    NULL,           NULL,                     133,    135,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000128', '1968-12-29',  'M',    NULL,           NULL,                     134,    136,        NULL),
('FELIX',     NULL,       'KURZMANN',   '100000129', '1988-04-24',  'M',    NULL,           NULL,                     135,    137,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000130', '1988-04-24',  'M',    NULL,           NULL,                     136,    138,        NULL),
('HIDEKI',    'G',        'CORNELL',    '100000131', '1988-04-23',  'M',    NULL,           NULL,                     137,    139,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000132', '1998-12-24',  'F',    NULL,           NULL,                     138,    140,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000133', '1988-04-24',  'F',    NULL,           NULL,                     139,    141,        NULL),
('VASIA',     'F',        'MIYAZAKI',   '100000134', '1988-06-22',  'F',    NULL,           NULL,                     140,    142,        NULL),
('FAIRUZ',    'E',        'BYRD',       '100000135', '1988-07-23',  'M',    NULL,           NULL,                     141,    143,        NULL),
('HERSHALL',  NULL,       'KURZMANN',   '100000136', '1968-12-29',  'M',    NULL,           NULL,                     142,    144,        NULL),
('JEREMY',    NULL,       'LINDQVIST',  '100000137', '1988-04-24',  'M',    NULL,           NULL,                     143,    145,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000138', '1988-04-24',  'M',    NULL,           NULL,                     144,    146,        NULL),
('HIDEKI',    'C',        'CORNELL',    '100000139', '1988-04-23',  'M',    NULL,           NULL,                     145,    147,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000140', '1998-12-24',  'F',    NULL,           NULL,                     146,    148,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000141', '1988-04-24',  'F',    NULL,           NULL,                     147,    149,        NULL),
('VASIA',     'B',        'MIYAZAKI',   '100000142', '1988-06-22',  'F',    NULL,           NULL,                     148,    150,        NULL),
('MARK',      'A',        'BYRD',       '100000143', '1988-07-23',  'M',    NULL,           NULL,                     149,    151,        NULL),
('JOHN',      NULL,       'KURZMANN',   '100000144', '1968-12-29',  'M',    NULL,           NULL,                     150,    152,        NULL),
('KARL',      NULL,       'LINDQVIST',  '100000145', '1988-04-24',  'M',    NULL,           NULL,                     151,    153,        NULL),
('JOHN',      NULL,       'LINDQVIST',  '100000146', '1988-04-24',  'M',    NULL,           NULL,                     152,    154,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PROPSPER',  'S',        'ALFERINK',   '100000147', '1988-04-23',  'M',    NULL,           NULL,                     153,    155,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BEATRICE',  'S',        'ABBADELLI',  '100000148', '1988-04-23',  'F',    NULL,           NULL,                     154,    156,        1000154),
('KUROSH',    NULL,       'ABBADELLI',  '100000149', '1988-04-23',  'M',    NULL,           NULL,                     155,    157,        1000154),
('LUKAS',     NULL,       'ABBADELLI',  '100000150', '1988-04-23',  'M',    NULL,           NULL,                     156,    158,        1000154);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000151', '1988-04-23',  'M',    NULL,           NULL,                     157,    159,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('FRANCO',    'S',        'CALVO',      '100000152', '1989-04-23',  'M',    NULL,           NULL,                     158,    160,        1000158),
('ALVA',      NULL,       'SERAFINI',   '100000153', '1989-05-23',  'F',    NULL,           NULL,                     159,    161,        1000158),
('LUKAS',     NULL,       'CALVO',      '100000154', '1985-08-28',  'M',    NULL,           NULL,                     160,    162,        1000158);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000155', '1988-04-23',  'M',    NULL,           NULL,                     161,    163,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'S',        'JEANS',      '100000156', '1989-04-23',  'M',    NULL,           NULL,                     162,    164,        1000162),
('HARRY',     NULL,       'NOSE',       '100000157', '1989-05-23',  'M',    NULL,           NULL,                     163,    165,        1000162),
('BARNEY',    NULL,       'BILLS',      '100000158', '1985-08-28',  'M',    NULL,           NULL,                     164,    166,        1000162);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'J',        'JEANS',      '100000159', '1989-04-23',  'M',    NULL,           NULL,                     165,    167,        1000063),
('HARRY',     NULL,       'NOSEN',      '100000160', '1989-05-23',  'M',    NULL,           NULL,                     166,    168,        1000063),
('BARNEY',    NULL,       'BILLS',      '100000161', '1985-08-28',  'M',    NULL,           NULL,                     167,    169,        1000074),
('JIMMY',     'P',        'JEANS',      '100000162', '1989-04-23',  'M',    NULL,           NULL,                     168,    170,        1000074),
('BARRY',     NULL,       'NOSE',       '100000163', '1989-05-23',  'M',    NULL,           NULL,                     169,    171,        1000085),
('BARNEY',    NULL,       'BILLS',      '100000164', '1985-08-28',  'M',    NULL,           NULL,                     170,    172,        1000085),
('JIMMOTHY',  'S',        'JENSON',     '100000165', '1989-04-23',  'M',    NULL,           NULL,                     171,    173,        1000096),
('LARRY',     NULL,       'NOSE',       '100000166', '1989-05-23',  'M',    NULL,           NULL,                     172,    174,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANNE',      'S',        'PERROT',     '100000167', '1975-04-23',  'F',    NULL,           NULL,                     173,    175,        NULL),
('SAWDA',     NULL,       'PAPOUTSIS',  '100000168', '1975-05-23',  'F',    NULL,           NULL,                     174,    176,        NULL),
('BARNEY',    NULL,       'DINO',       '100000169', '1974-08-28',  'M',    NULL,           NULL,                     175,    177,        NULL),
('JACOBA',    'A',        'PENA',       '100000170', '1974-04-23',  'M',    NULL,           NULL,                     176,    178,        NULL),
('SEONG',     NULL,       'KOOLS',      '100000171', '1974-05-23',  'F',    NULL,           NULL,                     177,    179,        NULL),
('IKENNA',    NULL,       'ROMILLY',    '100000172', '1974-08-28',  'F',    NULL,           NULL,                     178,    180,        NULL),
('FERNANDO',  'V',        'BRICE',      '100000173', '1974-04-23',  'M',    NULL,           NULL,                     179,    181,        NULL),
('HORACIO',   NULL,       'KURZ',       '100000174', '1974-05-23',  'M',    NULL,           NULL,                     180,    182,        NULL);


UPDATE employee
SET manager_id = 1000179
WHERE employee_id IN (1000176, 1000177, 1000181);


UPDATE employee
SET manager_id = 1000180
WHERE employee_id IN (1000174, 1000175, 1000178, 1000179);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'WILDGRUBE',  '100000175', '1975-04-23',  'F',    NULL,           NULL,                     181,    183,        NULL),
('STARR',     NULL,       'GARNETT',    '100000176', '1975-05-23',  'F',    NULL,           NULL,                     182,    184,        NULL),
('PING',      NULL,       'DINO',       '100000177', '1974-08-28',  'M',    NULL,           NULL,                     183,    185,        NULL),
('JEF',       'C',        'COMO',       '100000178', '1974-04-23',  'M',    NULL,           NULL,                     184,    186,        NULL),
('SEVERINE',  NULL,       'BJARNESEN',  '100000179', '1974-05-23',  'F',    NULL,           NULL,                     185,    187,        NULL),
('HUAN',      NULL,       'LEIFSSON',   '100000180', '1974-08-28',  'M',    NULL,           NULL,                     186,    188,        NULL),
('LINWOOD',   'O',        'COOKE',      '100000181', '1974-04-23',  'M',    NULL,           NULL,                     187,    189,        NULL),
('PEPE',      NULL,       'GARDINER',   '100000182', '1974-05-23',  'M',    NULL,           NULL,                     188,    190,        NULL);


UPDATE employee
SET manager_id = 1000187
WHERE employee_id IN (1000184, 1000185, 1000189);


UPDATE employee
SET manager_id = 1000188
WHERE employee_id IN (1000182, 1000183, 1000186, 1000187);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAISIA',    'S',        'ROSE',       '100000183', '1975-04-23',  'F',    NULL,           NULL,                     189,    191,        NULL),
('OLGA',      NULL,       'SCHULTHEISS','100000184', '1975-05-23',  'F',    NULL,           NULL,                     190,    192,        NULL),
('KYOU',      NULL,       'SUZUKI',     '100000185', '1970-08-28',  'F',    NULL,           NULL,                     191,    193,        NULL),
('ROLLO',     'D',        'SHORT',      '100000186', '1970-04-23',  'M',    NULL,           NULL,                     192,    194,        NULL),
('LEONARDO',  NULL,       'BJARNESEN',  '100000187', '1970-05-23',  'M',    NULL,           NULL,                     193,    195,        NULL),
('HUAN',      NULL,       'ROSE',       '100000188', '1970-08-28',  'M',    NULL,           NULL,                     194,    196,        NULL),
('FLAVIA',    'O',        'MOROZOV',    '100000189', '1970-04-23',  'M',    NULL,           NULL,                     195,    197,        NULL),
('CORINNA',   NULL,       'WERNHER',    '100000190', '1970-05-23',  'M',    NULL,           NULL,                     196,    198,        NULL);


UPDATE employee
SET manager_id = 1000195
WHERE employee_id IN (1000192, 1000193, 1000197);


UPDATE employee
SET manager_id = 1000196
WHERE employee_id IN (1000190, 1000191, 1000194, 1000195);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MAXINE',    'A',        'THAIDHG',    '100000191', '1975-04-23',  'F',    NULL,           NULL,                     197,    199,        NULL),
('MARCEAU',   NULL,       'OTTEN',      '100000192', '2000-05-23',  'M',    NULL,           NULL,                     198,    200,        NULL),
('HARLOW',    NULL,       'ARENDOK',    '100000193', '1970-08-28',  'M',    NULL,           NULL,                     199,    201,        NULL);


UPDATE employee
SET manager_id = 1000198
WHERE employee_id = 1000199;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANDRE',     'K',        'GILBERT',    '100000194', '1975-05-23',  'M',    NULL,           NULL,                     200,    202,        NULL),
('EMIL',      NULL,       'TRAVERSO',   '100000195', '2000-08-23',  'M',    NULL,           NULL,                     201,    203,        NULL),
('SEPHORA',   NULL,       'VILLENEUVE', '100000196', '1971-08-28',  'F',    NULL,           NULL,                     202,    204,        NULL);


UPDATE employee
SET manager_id = 1000201
WHERE employee_id = 1000202;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AFAF',      'S',        'LOWE',       '100000197', '1975-04-23',  'M',    NULL,           NULL,                     203,    205,        NULL),
('MAXIME',    NULL,       'LAMBERT',    '100000198', '2001-08-23',  'M',    NULL,           NULL,                     204,    206,        NULL),
('TERZO',     NULL,       'HERZOG',     '100000199', '1970-08-28',  'F',    NULL,           NULL,                     205,    207,        NULL);


UPDATE employee
SET manager_id = 1000204
WHERE employee_id = 1000205;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'LOWE',       '100000200', '1975-04-23',  'F',    NULL,           NULL,                     206,    208,        NULL),
('STARR',     NULL,       'LAMBERT',    '100000201', '2001-08-23',  'F',    NULL,           NULL,                     207,    209,        NULL),
('PING',      NULL,       'HERZOG',     '100000202', '1970-08-28',  'M',    NULL,           NULL,                     208,    210,        NULL),
('JEF',       'H',        'LOWE',       '100000203', '1975-04-23',  'M',    NULL,           NULL,                     209,    211,        NULL),
('SEVERINE',  NULL,       'LAMBERT',    '100000204', '2001-08-23',  'F',    NULL,           NULL,                     210,    212,        NULL),
('HUAN',      NULL,       'HERZOG',     '100000205', '1970-08-28',  'F',    NULL,           NULL,                     211,    213,        NULL);


UPDATE employee
SET manager_id = 1000210
WHERE employee_id = 1000209;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'P',        'LOWE',       '100000206', '1978-12-01',  'M',    NULL,           NULL,                     212,    214,        NULL),
('RICO',      NULL,       'LAMBERT',    '100000207', '1999-04-02',  'M',    NULL,           NULL,                     213,    215,        NULL),
('DEVARAJ',   NULL,       'HERZOG',     '100000208', '1978-03-03',  'M',    NULL,           NULL,                     214,    216,        NULL),
('BENVENUTO', 'L',        'LOWE',       '100000209', '1978-02-04',  'M',    NULL,           NULL,                     215,    217,        NULL),
('SARA',      NULL,       'LAMBERT',    '100000210', '1999-01-05',  'F',    NULL,           NULL,                     216,    218,        NULL),
('LALE',      NULL,       'HERZOG',     '100000211', '1978-05-06',  'M',    NULL,           NULL,                     217,    219,        NULL);


UPDATE employee
SET manager_id = 1000216
WHERE employee_id = 1000215;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('RAJ',       'D',        'OSBOURNE',   '100000212', '1978-12-01',  'M',    NULL,           NULL,                     218,    220,        NULL),
('SIMONE',    NULL,       'ASIS',       '100000213', '1999-04-02',  'F',    NULL,           NULL,                     219,    221,        NULL),
('JOLINE',    NULL,       'LEEUWENHOEK','100000214', '1978-03-03',  'F',    NULL,           NULL,                     220,    222,        NULL),
('YULIA',     'L',        'THAIDHG',    '100000215', '1978-02-04',  'F',    NULL,           NULL,                     221,    223,        NULL),
('CY',        NULL,       'NEAL',       '100000216', '1999-01-05',  'M',    NULL,           NULL,                     222,    224,        NULL),
('ANDREA',    NULL,       'MCCREERY',   '100000217', '1978-05-06',  'F',    NULL,           NULL,                     223,    225,        NULL);


UPDATE employee
SET manager_id = 1000222
WHERE employee_id = 1000221;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('SIMONE',    NULL,       'MCCREERY',   '100000218', '1999-04-02',  'F',    NULL,           NULL,                     224,    226,        NULL),
('JOLINE',    NULL,       'NEAL',       '100000219', '1978-03-03',  'F',    NULL,           NULL,                     225,    227,        NULL),
('YULIA',     'L',        'SMITH',      '100000220', '1978-02-04',  'F',    NULL,           NULL,                     226,    228,        NULL),
('CY',        NULL,       'ASIS',       '100000221', '1999-01-05',  'M',    NULL,           NULL,                     227,    229,        NULL),
('ANDREA',    NULL,       'OSBOURNE',   '100000222', '1978-05-06',  'F',    NULL,           NULL,                     228,    230,        NULL),

('SUHAIL',    NULL,       'ROSE',       '100000223', '1999-04-02',  'M',    NULL,           NULL,                     229,    231,        NULL),
('NUAN',      NULL,       'SCHULTHEISS','100000224', '1978-03-03',  'M',    NULL,           NULL,                     230,    232,        NULL),
('INNOKENTI', 'L',        'SUZUKI',     '100000225', '1978-02-04',  'M',    NULL,           NULL,                     231,    233,        NULL),
('KENTIGERN', NULL,       'SHORT',      '100000226', '1999-01-05',  'M',    NULL,           NULL,                     232,    234,        NULL),
('RIEN',      NULL,       'BJARNESEN',  '100000227', '1978-05-06',  'M',    NULL,           NULL,                     233,    235,        NULL),

('SUHAIL',    NULL,       'PORCHER',    '100000228', '1999-04-02',  'M',    NULL,           NULL,                     234,    236,        NULL),
('NUAN',      NULL,       'BAUMGARTEN', '100000229', '1978-03-03',  'M',    NULL,           NULL,                     235,    237,        NULL),
('INNOKENTI', 'L',        'MIKHAILOV',  '100000230', '1978-02-04',  'M',    NULL,           NULL,                     236,    238,        NULL),
('KENTIGERN', NULL,       'BAGGI',      '100000231', '1999-01-05',  'M',    NULL,           NULL,                     237,    239,        NULL),
('RIEN',      NULL,       'NOYER',      '100000232', '1978-05-06',  'M',    NULL,           NULL,                     238,    240,        NULL),

('SIMONE',    NULL,       'PORCHER',    '100000233', '1999-04-02',  'F',    NULL,           NULL,                     239,    241,        NULL),
('JOLINE',    NULL,       'BAUMGARTEN', '100000234', '1978-03-03',  'M',    NULL,           NULL,                     240,    242,        NULL),
('YULIA',     'L',        'MIKHAILOV',  '100000235', '1978-02-04',  'M',    NULL,           NULL,                     241,    243,        NULL),
('CY',        NULL,       'BAGGI',      '100000236', '1999-01-05',  'M',    NULL,           NULL,                     242,    244,        NULL),
('ANDREA',    NULL,       'NOYER',      '100000237', '1978-05-06',  'M',    NULL,           NULL,                     243,    245,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('LAWYER',    'D',        'SAWYER',     '100000238', '1978-12-01',  'M',    NULL,           NULL,                     244,    246,        NULL),
('SIMONE',    NULL,       'LAW',        '100000239', '1999-04-02',  'F',    NULL,           NULL,                     245,    247,        NULL),
('JOE',       NULL,       'TURNEY',     '100000240', '1978-03-03',  'M',    NULL,           NULL,                     246,    248,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'SAWYER',     '100000241', '1978-12-01',  'M',    NULL,           NULL,                     247,    249,        NULL),
('NATHAN',    NULL,       'TURNER',     '100000242', '1999-04-02',  'M',    NULL,           NULL,                     248,    250,        NULL),
('ELISE',     NULL,       'STEEL',      '100000243', '1978-03-03',  'F',    NULL,           NULL,                     249,    251,        NULL),
('MARY',      NULL,       'SUE',        '100000244', '1978-03-03',  'F',    NULL,           NULL,                     250,    252,        NULL);


UPDATE employee
SET manager_id = 1000250
WHERE employee_id > 1000247 AND NOT employee_id = 1000250;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'GOLD',       '100000245', '1965-12-01',  'M',    NULL,           'jgold@company.org',      251,    253,        NULL),
('NATHAN',    NULL,       'SILVER',     '100000246', '1966-04-02',  'M',    NULL,           'nsilver@company.org',    252,    254,        NULL),
('ELISE',     NULL,       'BRONZE',     '100000247', '1967-03-14',  'F',    NULL,           'ebronze@company.org',    253,    255,        NULL),
('MARY',      NULL,       'COPPER',     '100000248', '1968-03-04',  'F',    NULL,           'mcopper@company.org',    254,    256,        NULL),
('JOHN',      'K',        'BRASS',      '100000249', '1969-12-11',  'M',    NULL,           'jbrass@company.org',     255,    257,        NULL),
('NEIL',      NULL,       'ZINC',       '100000250', '1965-07-02',  'M',    NULL,           'nzinc@company.org',      256,    258,        NULL),
('ELLEN',     NULL,       'TIN',        '100000251', '1966-03-03',  'F',    NULL,           'etin@company.org',       257,    259,        NULL),
('MYRTLE',    NULL,       'PEWTER',     '100000252', '1967-04-03',  'F',    NULL,           'mpewter@company.org',    258,    260,        NULL),
('JERKYLL',   'G',        'LEAD',       '100000253', '1968-12-06',  'M',    NULL,           'jlead@company.org',      259,    261,        NULL),
('NERRY',     NULL,       'CHROMIUM',   '100000254', '1969-04-02',  'M',    NULL,           'nchromium@company.org',  260,    262,        NULL),
('PENELOPE',  NULL,       'IRON',       '100000255', '1970-03-03',  'F',    NULL,           'eiron@company.org',      261,    263,        NULL);


-- Create department heads
UPDATE department
SET department_head_id = 1000000
WHERE department_id = 1;


UPDATE department
SET department_head_id = 1000252
WHERE department_id = 2;


UPDATE department
SET department_head_id = 1000253
WHERE department_id = 3;


UPDATE department
SET department_head_id = 1000254
WHERE department_id = 4;


UPDATE department
SET department_head_id = 1000255
WHERE department_id = 5;


UPDATE department
SET department_head_id = 1000256
WHERE department_id = 6;


UPDATE department
SET department_head_id = 1000257
WHERE department_id = 7;


UPDATE department
SET department_head_id = 1000258
WHERE department_id = 8;


UPDATE department
SET department_head_id = 1000259
WHERE department_id = 9;


UPDATE department
SET department_head_id = 1000260
WHERE department_id = 10;


UPDATE department
SET department_head_id = 1000261
WHERE department_id = 11;


UPDATE department
SET department_head_id = 1000262
WHERE department_id = 12;


-- Salary
INSERT INTO salary (employee_id, hourly_wage, annual_bonus) VALUES
(1000000, '$375', '$700,000'),
(1000001, '$100', '$250,000'),
(1000002, '$90',  '$200,000'),
(1000003, '$50',  '$120,000'),
(1000004, '$100', '$200,000'),
(1000005, '$35',  '$100,000'),
(1000006, '$35',  '$100,000'),
(1000007, '$35',  '$100,000'),
(1000008, '$30', '$1,000'),
(1000009, '$30', '$1,000'),
(1000010, '$40', '$1,000'),
(1000011, '$30', '$1,000'),
(1000012, '$25', '$1,000'),
(1000013, '$22', '$1,000'),
(1000014, '$22', '$1,000'),
(1000015, '$18', '$1,000'),
(1000016, '$20', '$1,000'),
(1000017, '$40', '$1,000'),
(1000018, '$30', '$1,000'),
(1000019, '$30', '$1,000'),
(1000020, '$40', '$1,000'),
(1000021, '$30', '$1,000'),
(1000022, '$25', '$1,000'),
(1000023, '$22', '$1,000'),
(1000024, '$22', '$1,000'),
(1000025, '$18', '$1,000'),
(1000026, '$20', '$1,000'),
(1000027, '$40', '$1,000'),
(1000028, '$30', '$1,000'),
(1000029, '$30', '$1,000'),
(1000030, '$40', '$1,000'),
(1000031, '$30', '$1,000'),
(1000032, '$25', '$1,000'),
(1000033, '$22', '$1,000'),
(1000034, '$22', '$1,000'),
(1000035, '$18', '$1,000'),
(1000036, '$20', '$1,000'),
(1000037, '$40', '$1,000'),
(1000038, '$30', '$1,000'),
(1000039, '$30', '$1,000'),
(1000040, '$40', '$1,000'),
(1000041, '$30', '$1,000'),
(1000042, '$25', '$1,000'),
(1000043, '$22', '$1,000'),
(1000044, '$22', '$1,000'),
(1000045, '$18', '$1,000'),
(1000046, '$20', '$1,000'),
(1000047, '$40', '$1,000'),
(1000048, '$40', '$5,000'),
(1000049, '$34', '$3,000'),
(1000050, '$42', '$5,000'),
(1000051, '$34', '$3,000'),
(1000052, '$40', '$5,000'),
(1000053, '$34', '$3,000'),
(1000054, '$30', '$1,000'),
(1000055, '$30', '$1,000'),
(1000056, '$40', '$1,000'),
(1000057, '$30', '$1,000'),
(1000058, '$25', '$1,000'),
(1000059, '$22', '$1,000'),
(1000060, '$22', '$1,000'),
(1000061, '$18', '$1,000'),
(1000062, '$20', '$1,000'),
(1000063, '$35', '$1,000'),
(1000064, '$40', '$1,000'),
(1000065, '$30', '$1,000'),
(1000066, '$30', '$1,000'),
(1000067, '$40', '$1,000'),
(1000068, '$30', '$1,000'),
(1000069, '$25', '$1,000'),
(1000070, '$22', '$1,000'),
(1000071, '$22', '$1,000'),
(1000072, '$18', '$1,000'),
(1000073, '$20', '$1,000'),
(1000074, '$35', '$1,000'),
(1000075, '$40', '$1,000'),
(1000076, '$30', '$1,000'),
(1000077, '$30', '$1,000'),
(1000078, '$40', '$1,000'),
(1000079, '$30', '$1,000'),
(1000080, '$25', '$1,000'),
(1000081, '$22', '$1,000'),
(1000082, '$22', '$1,000'),
(1000083, '$18', '$1,000'),
(1000084, '$20', '$1,000'),
(1000085, '$35', '$1,000'),
(1000086, '$40', '$1,000'),
(1000087, '$30', '$1,000'),
(1000088, '$30', '$1,000'),
(1000089, '$40', '$1,000'),
(1000090, '$30', '$1,000'),
(1000091, '$25', '$1,000'),
(1000092, '$22', '$1,000'),
(1000093, '$22', '$1,000'),
(1000094, '$18', '$1,000'),
(1000095, '$20', '$1,000'),
(1000096, '$35', '$1,000'),
(1000097, '$40', '$1,000'),
(1000098, '$30', '$10,000'),
(1000099, '$30', '$10,000'),
(1000100, '$40', '$10,000'),
(1000101, '$30', '$10,000'),
(1000102, '$25', '$10,000'),
(1000103, '$22', '$10,000'),
(1000104, '$22', '$10,000'),
(1000105, '$18', '$10,000'),
(1000106, '$40', '$10,000'),
(1000107, '$40', '$10,000'),
(1000108, '$40', '$10,000'),
(1000109, '$40', '$10,000'),
(1000110, '$40', '$10,000'),
(1000111, '$40', '$10,000'),
(1000112, '$40', '$10,000'),
(1000113, '$40', '$10,000'),
(1000114, '$40', '$10,000'),
(1000115, '$40', '$10,000'),
(1000116, '$40', '$10,000'),
(1000117, '$40', '$10,000'),
(1000118, '$40', '$10,000'),
(1000119, '$40', '$10,000'),
(1000120, '$40', '$10,000'),
(1000121, '$40', '$10,000'),
(1000122, '$40', '$10,000'),
(1000123, '$40', '$10,000'),
(1000124, '$40', '$10,000'),
(1000125, '$40', '$10,000'),
(1000126, '$40', '$10,000'),
(1000127, '$40', '$10,000'),
(1000128, '$40', '$10,000'),
(1000129, '$40', '$10,000'),
(1000130, '$40', '$10,000'),
(1000131, '$40', '$10,000'),
(1000132, '$40', '$10,000'),
(1000133, '$40', '$10,000'),
(1000134, '$40', '$10,000'),
(1000135, '$40', '$10,000'),
(1000136, '$40', '$10,000'),
(1000137, '$40', '$10,000'),
(1000138, '$40', '$10,000'),
(1000139, '$40', '$10,000'),
(1000140, '$40', '$10,000'),
(1000141, '$40', '$10,000'),
(1000142, '$40', '$10,000'),
(1000143, '$40', '$10,000'),
(1000144, '$40', '$10,000'),
(1000145, '$40', '$10,000'),
(1000146, '$40', '$10,000'),
(1000147, '$40', '$10,000'),
(1000148, '$40', '$10,000'),
(1000149, '$40', '$10,000'),
(1000150, '$40', '$10,000'),
(1000151, '$40', '$10,000'),
(1000152, '$40', '$10,000'),
(1000153, '$40', '$10,000'),
(1000154, '$30', '$10,000'),
(1000155, '$30', '$10,000'),
(1000156, '$40', '$10,000'),
(1000157, '$15', '$0'),
(1000158, '$25', '$10,000'),
(1000159, '$22', '$10,000'),
(1000160, '$22', '$10,000'),
(1000161, '$15', '$0'),
(1000162, '$25', '$10,000'),
(1000163, '$22', '$10,000'),
(1000164, '$22', '$10,000'),
(1000165, '$15', '$0'),
(1000166, '$30', '$1,000'),
(1000167, '$30', '$1,000'),
(1000168, '$20', '$1,000'),
(1000169, '$30', '$1,000'),
(1000170, '$25', '$1,000'),
(1000171, '$22', '$1,000'),
(1000172, '$22', '$1,000'),
(1000173, '$18', '$1,000'),
(1000174, '$35', '$2,250'),
(1000175, '$35', '$2,500'),
(1000176, '$28', '$1,000'),
(1000177, '$24', '$1,000'),
(1000178, '$29', '$1,000'),
(1000179, '$31', '$1,000'),
(1000180, '$40', '$1,000'),
(1000181, '$20', '$0'),
(1000182, '$35', '$2,250'),
(1000183, '$35', '$2,500'),
(1000184, '$28', '$1,000'),
(1000185, '$24', '$1,000'),
(1000186, '$29', '$1,000'),
(1000187, '$31', '$1,000'),
(1000188, '$40', '$1,000'),
(1000189, '$20', '$0'),
(1000190, '$35', '$2,250'),
(1000191, '$35', '$2,500'),
(1000192, '$28', '$1,000'),
(1000193, '$24', '$1,000'),
(1000194, '$29', '$1,000'),
(1000195, '$31', '$1,000'),
(1000196, '$40', '$1,000'),
(1000197, '$20', '$0'),
(1000198, '$35', '$2,250'),
(1000199, '$16', '$0'),
(1000200, '$20', '$1,000'),
(1000201, '$28', '$1,000'),
(1000202, '$20', '$1,000'),
(1000203, '$15', '$0'),
(1000204, '$29', '$1,000'),
(1000205, '$20', '$1,000'),
(1000206, '$15.50', '$0'),
(1000207, '$20', '$2,250'),
(1000208, '$20', '$2,250'),
(1000209, '$30', '$2,250'),
(1000210, '$40', '$2,250'),
(1000211, '$20', '$2,250'),
(1000212, '$40', '$2,250'),
(1000213, '$20', '$2,250'),
(1000214, '$20', '$2,250'),
(1000215, '$30', '$2,250'),
(1000216, '$40', '$2,250'),
(1000217, '$20', '$2,250'),
(1000218, '$40', '$2,250'),
(1000219, '$20', '$2,250'),
(1000220, '$20', '$2,250'),
(1000221, '$30', '$2,250'),
(1000222, '$40', '$2,250'),
(1000223, '$20', '$2,250'),
(1000224, '$40', '$2,250'),
(1000225, '$40', '$10,000'),
(1000226, '$40', '$10,000'),
(1000227, '$40', '$10,000'),
(1000228, '$40', '$10,000'),
(1000229, '$40', '$10,000'),
(1000230, '$40', '$10,000'),
(1000231, '$40', '$10,000'),
(1000232, '$40', '$10,000'),
(1000233, '$40', '$10,000'),
(1000234, '$40', '$10,000'),
(1000235, '$40', '$10,000'),
(1000236, '$40', '$10,000'),
(1000237, '$40', '$10,000'),
(1000238, '$40', '$10,000'),
(1000239, '$40', '$10,000'),
(1000240, '$40', '$10,000'),
(1000241, '$40', '$10,000'),
(1000242, '$40', '$10,000'),
(1000243, '$40', '$10,000'),
(1000244, '$40', '$10,000'),
(1000245, '$40', '$10,000'),
(1000246, '$40', '$10,000'),
(1000247, '$40', '$10,000'),
(1000248, '$35', '$10,000'),
(1000249, '$30', '$10,000'),
(1000250, '$40', '$10,000'),
(1000251, '$16', '$0'),
(1000252, '$50', '$90,000'),
(1000253, '$50', '$90,000'),
(1000254, '$50', '$90,000'),
(1000255, '$50', '$90,000'),
(1000256, '$50', '$90,000'),
(1000257, '$50', '$90,000'),
(1000258, '$50', '$90,000'),
(1000259, '$50', '$90,000'),
(1000260, '$50', '$90,000'),
(1000261, '$50', '$90,000'),
(1000262, '$50', '$90,000');


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-01-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-02-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-03-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-04-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 2:45:39 PM */
-- Create new employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('12345 SEVENTH STREET','HOUSTON','UNITED STATES','28822','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,job_id,manager_id)
VALUES ('SYED','RIZVI','2000-01-01','M','267','123456789','+18328323322','syed.a.rizvi@email.com','9','1000000')
RETURNING employee_id;
ROLLBACK;

/* 12/1/2021, 2:46:06 PM */
-- Create new employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO employee_address (street_address,city,country,zip_code,state)
VALUES ('12345 SEVENTH STREET','HOUSTON','UNITED STATES','28822','TEXAS')
RETURNING address_id;
INSERT INTO employee (first_name,last_name,dob,gender,address_id,ssn,phone,email,job_id,manager_id)
VALUES ('SYED','RIZVI','2000-01-01','M','268','123456677','+18328323322','syed.a.rizvi@email.com','9','1000000')
RETURNING employee_id;
INSERT INTO salary (employee_id,hourly_wage,annual_bonus)
VALUES ('1000264','18.00','2000');
COMMIT;
END TRANSACTION;

/* 12/1/2021, 2:59:44 PM */
-- Update employee details
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Check employee exists
SELECT employee_id
FROM employee
WHERE employee_id = '1000009';
UPDATE employee
SET
	m_initial = 'K'
WHERE employee_id = '1000009';
UPDATE salary
SET
	hourly_wage = '25.00'
WHERE employee_id = '1000009';
COMMIT;
END TRANSACTION;

/* 12/1/2021, 3:00:47 PM */
-- Delete employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DELETE FROM employee
WHERE employee_id = '1000009'
COMMIT;
END TRANSACTION;

/* 12/1/2021, 3:35:14 PM */
-- Delete all tables
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DROP TABLE IF EXISTS payroll          CASCADE;
DROP TABLE IF EXISTS benefits         CASCADE;
DROP TABLE IF EXISTS salary           CASCADE;
DROP TABLE IF EXISTS leave            CASCADE;
DROP TABLE IF EXISTS department       CASCADE;
DROP TABLE IF EXISTS job_location     CASCADE;
DROP TABLE IF EXISTS job              CASCADE;
DROP TABLE IF EXISTS employee         CASCADE;
DROP TABLE IF EXISTS employee_address CASCADE;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 3:35:14 PM */
-- Recreate tables from script
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Run these commands in ElephantSQL postgres database in browser tab to recreate starting tables for local testing

CREATE TABLE benefits (
  benefits_package_id        INT          GENERATED ALWAYS AS IDENTITY, 
  amount                     MONEY        NOT NULL,
  stock_options              VARCHAR(100), 
  health_insurance_provider  VARCHAR(100) NOT NULL CHECK(health_insurance_provider ~ '^[A-Z \d]+$'),
  retirement_plan            VARCHAR(100),

  PRIMARY KEY(benefits_package_id)
);


CREATE TABLE employee_address (
  address_id      INT           GENERATED ALWAYS AS IDENTITY,
  street_address  VARCHAR(100)  NOT NULL CHECK(street_address ~ '^[A-Z \/\d#\.,-]+$'),   -- Includes appt/po box info and locality info if applicable
  city            VARCHAR(50)   NOT NULL CHECK(city ~ '^[A-Z ]+$'), -- Also serves as post town if applicable
  zip_code        VARCHAR(16)   CHECK(zip_code ~ '^[\d \-A-Z]+$'), -- Also serves as postcode if applicable
  state           VARCHAR(50)   CHECK(state ~ '^[A-Z ]+$'), -- Also serves as province if applicable
  country         VARCHAR(50)   NOT NULL CHECK(country ~ '^[A-Z ]+$'),   -- Also serves as region if applicable

  PRIMARY KEY(address_id)
);


CREATE TABLE job_location (
  location_id   INT GENERATED ALWAYS AS IDENTITY,
  airport_id    INT,
  address_id    INT NOT NULL,
  flight_id     INT,
  location_name VARCHAR(50),

  PRIMARY KEY(location_id)
);


CREATE TABLE department (
  department_id       INT          GENERATED ALWAYS AS IDENTITY,
  department_name     VARCHAR(50)  NOT NULL CHECK(department_name ~ '^[A-Z ]+$'),
  creation_date       DATE         NOT NULL, 
  department_head_id  INT,

  PRIMARY KEY(department_id)
);


CREATE TABLE job (
  job_id              INT         GENERATED ALWAYS AS IDENTITY, 
  job_title           VARCHAR(50) NOT NULL CHECK(job_title ~ '^[A-Z \-]+$'),
  department_id       INT         NOT NULL, 
  location_id         INT         NOT NULL,
  weekly_hours        INT         DEFAULT 40 CHECK(weekly_hours <= 168),
  benefits_package_id INT         DEFAULT 0 NOT NULL,

  PRIMARY KEY(job_id),
  FOREIGN KEY(department_id)
    REFERENCES department(department_id)
    ON DELETE CASCADE,

  FOREIGN KEY(location_id)
    REFERENCES job_location(location_id)
    ON DELETE CASCADE,

  FOREIGN KEY(benefits_package_id)
    REFERENCES benefits(benefits_package_id)
    ON DELETE SET DEFAULT
);


CREATE TABLE employee (
  employee_id INT           GENERATED ALWAYS AS IDENTITY (START WITH 1000000),
  first_name  VARCHAR(50)   NOT NULL CHECK(first_name ~ '^[A-Z ]+$'),
  m_initial   CHAR(1),  
  last_name   VARCHAR(50)   NOT NULL CHECK(last_name ~ '^[A-Z ]+$'),
  ssn         CHAR(9)       UNIQUE CHECK(ssn ~ '^\d{9}$'),
  dob         DATE          NOT NULL,
  gender      CHAR(1)       NOT NULL CHECK(gender ~ '^[MFO]$'),
  phone       VARCHAR(15)   CHECK(phone ~ '^\+[0-9]+$'),
  email       VARCHAR(100)  UNIQUE CHECK(email ~ '^[\w\.\+]{1,64}@(\w+\.[A-Za-z]+){1,100}$'),
  job_id      INT           DEFAULT 0 NOT NULL,
  address_id  INT           NOT NULL,
  manager_id  INT,

  PRIMARY KEY(employee_id),
  FOREIGN KEY(job_id)
    REFERENCES job(job_id)
    ON DELETE SET DEFAULT,

  FOREIGN KEY(address_id)
    REFERENCES employee_address(address_id),

  FOREIGN KEY(manager_id)
    REFERENCES employee(employee_id)
    ON DELETE SET NULL
);


CREATE TABLE salary (
  salary_id    INT    GENERATED ALWAYS AS IDENTITY,
  employee_id  INT    NOT NULL,
  hourly_wage  MONEY  NOT NULL,
  annual_bonus MONEY  DEFAULT 0 NOT NULL,

  PRIMARY KEY(salary_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE leave (
  leave_id    INT           GENERATED ALWAYS AS IDENTITY,
  employee_id INT           NOT NULL,
  date        DATE          NOT NULL,
  reason      VARCHAR(100)  NOT NULL CHECK(reason ~ '^[A-Z \.\d]+$'),
  status      VARCHAR(50)   NOT NULL CHECK(status ~ '^[A-Z \.\d]+$'),

  PRIMARY KEY(leave_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE payroll (
  payroll_id    INT       GENERATED ALWAYS AS IDENTITY,
  employee_id   INT       NOT NULL, 
  hours_worked  REAL      NOT NULL,
  pay_period    DATE      NOT NULL,
  tax_rate      REAL      NOT NULL,
  gross_income  MONEY     NOT NULL,
  taxed_income  MONEY     NOT NULL,
  net_income    MONEY     NOT NULL,
  
  UNIQUE(employee_id, pay_period),

  PRIMARY KEY(payroll_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


/* DEFAULTS */
ALTER TABLE department
ADD CONSTRAINT fk_head FOREIGN KEY (department_head_id) REFERENCES employee(employee_id);


INSERT INTO benefits OVERRIDING SYSTEM VALUE VALUES(0, 0, 0, 'UNASSIGNED', 0);

INSERT INTO job_location OVERRIDING SYSTEM VALUE VALUES(0, NULL, 0, NULL);

INSERT INTO department OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', '1980-1-1');

INSERT INTO job OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', 0, 0, 0, 0);


/* Initial populated tables */

-- Departments (based on https://www.avjobs.com/history/structure-of-the-airline-industry.asp)
INSERT INTO department (department_name, creation_date) VALUES 
('BOARD OF DIRECTORS',            '1980-01-01'),
('ENGINEERING AND MAINTENANCE',   '1980-01-01'),
('GROUND OPERATIONS',             '1980-01-01'),
('FLIGHT OPERATIONS',             '1980-01-01'),
('SALES AND MARKETING',           '1980-01-01'),
('RESERVATIONS AND TICKETING',    '1980-01-01'),
('FINANCE AND PROPERTY',          '1980-01-01'),
('INFORMATION SERVICES',          '1990-11-08'),
('PERSONNEL',                     '1980-01-01'),
('EMERGENCY SERVICES',            '1980-04-05'),
('LEGAL',                         '1981-03-11'),
('PUBLIC RELATIONS AND PLANNING', '1985-07-20');


-- Benefits
INSERT INTO benefits (amount, stock_options, health_insurance_provider, retirement_plan) VALUES
(1000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS A', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS A', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN A'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(6000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS C', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(10000, 'STOCK OPTIONS D', 'INSURANCE PROVIDER D', 'RETIREMENT PLAN D'),
(4500,  'STOCK OPTIONS D', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN C');


-- Job locations
INSERT INTO job_location (airport_id, address_id, flight_id, location_name) VALUES
(NULL,  1,  NULL, 'OFFICES IN CITY A'),
(NULL,  2,  NULL, 'OFFICES IN CITY B'),
(NULL,  6,  NULL, 'OFFICES IN CITY C'),

(1, 3,  NULL, 'AIRPORT IN CITY A'),
(1, 3,  100,  'AIRPORT IN CITY A'),
(1, 3,  101,  'AIRPORT IN CITY A'),
(1, 3,  102,  'AIRPORT IN CITY A'),
(1, 3,  103,  'AIRPORT IN CITY A'),

(2, 4,  NULL, 'AIRPORT A IN CITY B'),
(2, 4,  200,  'AIRPORT A IN CITY B'),
(2, 4,  201,  'AIRPORT A IN CITY B'),
(2, 4,  202,  'AIRPORT A IN CITY B'),
(2, 4,  203,  'AIRPORT A IN CITY B'),

(3, 5,  NULL, 'AIRPORT B IN CITY B'),
(3, 5,  300,  'AIRPORT B IN CITY B'),
(3, 5,  301,  'AIRPORT B IN CITY B'),
(3, 5,  302,  'AIRPORT B IN CITY B'),
(3, 5,  303,  'AIRPORT B IN CITY B'),

(4, 7,  NULL, 'AIRPORT IN CITY C'),
(4, 7,  400,  'AIRPORT IN CITY C'),
(4, 7,  401,  'AIRPORT IN CITY C'),
(4, 7,  402,  'AIRPORT IN CITY C'),
(4, 7,  403,  'AIRPORT IN CITY C');


-- Jobs (based on https://www.airlinejobfinder.com/members/airline-jobs/)
INSERT INTO job (job_title, department_id, location_id, weekly_hours, benefits_package_id) VALUES
-- Board of Directors (1)
('CHIEF EXECUTIVE OFFICER', 1,  2,  50, 9),
('CHAIRMAN',                1,  2,  40, 9),
('VICE CHAIR',              1,  2,  40, 9),
('BOARD SECRETARY',         1,  2,  40, 9),
('TREASURER',               1,  2,  40, 9),
('BOARD MEMBER',            1,  2,  40, 9),

-- Maintenance and Engineering (2)
('AVIATION MAINTENANCE TECHNICIAN', 2,  4,  40, 2),
('POWERPLANT MECHANIC',             2,  4,  40, 2),
('AIRFRAME MECHANIC',               2,  4,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  4,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  4,  40, 2),
('AIRCRAFT FUELER',                 2,  4,  40, 2),
('AVIONIC TECHNICIAN',              2,  4,  40, 2),
('CABIN MAINTENANCE',               2,  4,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  4,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  4,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  9,  40, 2),
('POWERPLANT MECHANIC',             2,  9,  40, 2),
('AIRFRAME MECHANIC',               2,  9,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  9,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  9,  40, 2),
('AIRCRAFT FUELER',                 2,  9,  40, 2),
('AVIONIC TECHNICIAN',              2,  9,  40, 2),
('CABIN MAINTENANCE',               2,  9,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  9,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  9,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  14,  40, 2),
('POWERPLANT MECHANIC',             2,  14,  40, 2),
('AIRFRAME MECHANIC',               2,  14,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  14,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  14,  40, 2),
('AIRCRAFT FUELER',                 2,  14,  40, 2),
('AVIONIC TECHNICIAN',              2,  14,  40, 2),
('CABIN MAINTENANCE',               2,  14,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  14,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  14,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  19,  40, 2),
('POWERPLANT MECHANIC',             2,  19,  40, 2),
('AIRFRAME MECHANIC',               2,  19,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  19,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  19,  40, 2),
('AIRCRAFT FUELER',                 2,  19,  40, 2),
('AVIONIC TECHNICIAN',              2,  19,  40, 2),
('CABIN MAINTENANCE',               2,  19,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  19,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  19,  40, 2),

-- Ground Operations (3)
('DIRECTOR OF AVIATION',        3, 1, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 1, 40, 3),
('DIRECTOR OF AVIATION',        3, 2, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 2, 40, 3),
('DIRECTOR OF AVIATION',        3, 3, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 3, 40, 3),

('BAGGAGE HANDLER',               3,  4,  40, 5),
('SKYCAP',                        3,  4,  40, 5),
('CONCESSIONS',                   3,  4,  40, 5),
('AIRPORT GUIDE',                 3,  4,  40, 5),
('AIRPORT CUSTODIAN',             3,  4,  40, 1),
('OPERATIONS AGENT',              3,  4,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  4,  40, 3),
('PASSENGER SERVICE AGENT',       3,  4,  40, 3),
('RAMP PLANNER',                  3,  4,  40, 3),
('AIRLINE STATION AGENT',         3,  4,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  4,  40, 7),

('BAGGAGE HANDLER',               3,  9,  40, 5),
('SKYCAP',                        3,  9,  40, 5),
('CONCESSIONS',                   3,  9,  40, 5),
('AIRPORT GUIDE',                 3,  9,  40, 5),
('AIRPORT CUSTODIAN',             3,  9,  40, 1),
('OPERATIONS AGENT',              3,  9,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  9,  40, 3),
('PASSENGER SERVICE AGENT',       3,  9,  40, 3),
('RAMP PLANNER',                  3,  9,  40, 3),
('AIRLINE STATION AGENT',         3,  9,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  9,  40, 7),

('BAGGAGE HANDLER',               3,  14, 40, 5),
('SKYCAP',                        3,  14, 40, 5),
('CONCESSIONS',                   3,  14, 40, 5),
('AIRPORT GUIDE',                 3,  14, 40, 5),
('AIRPORT CUSTODIAN',             3,  14, 40, 1),
('OPERATIONS AGENT',              3,  14, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  14, 40, 3),
('PASSENGER SERVICE AGENT',       3,  14, 40, 3),
('RAMP PLANNER',                  3,  14, 40, 3),
('AIRLINE STATION AGENT',         3,  14, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  14, 40, 7),

('BAGGAGE HANDLER',               3,  19, 40, 5),
('SKYCAP',                        3,  19, 40, 5),
('CONCESSIONS',                   3,  19, 40, 5),
('AIRPORT GUIDE',                 3,  19, 40, 5),
('AIRPORT CUSTODIAN',             3,  19, 40, 1),
('OPERATIONS AGENT',              3,  19, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  19, 40, 3),
('PASSENGER SERVICE AGENT',       3,  19, 40, 3),
('RAMP PLANNER',                  3,  19, 40, 3),
('DISTRICT OPERATIONS MANAGER',   3,  19, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  19, 40, 7),

-- Flight Operations (4)
('FLIGHT DISPATCHER',       4,  4,  40, 6),
('AVIATION METEOROLOGIST',  4,  4,  40, 6),
('FLIGHT DISPATCHER',       4,  9,  40, 6),
('AVIATION METEOROLOGIST',  4,  9,  40, 6),
('FLIGHT DISPATCHER',       4,  14, 40, 6),
('AVIATION METEOROLOGIST',  4,  14, 40, 6),
('FLIGHT DISPATCHER',       4,  19, 40, 6),
('AVIATION METEOROLOGIST',  4,  19, 40, 6),

('CARGO CARRIER PILOT', 4,  5,  60, 6),
('COPORATE PILOT',      4,  5,  30, 6),
('CHARTER PILOT',       4,  5,  60, 6),

('CARGO CARRIER PILOT', 4,  6,  60, 6),
('COPORATE PILOT',      4,  6,  30, 6),
('CHARTER PILOT',       4,  6,  60, 6),

('CARGO CARRIER PILOT', 4,  7,  60, 6),
('COPORATE PILOT',      4,  7,  30, 6),
('CHARTER PILOT',       4,  7,  60, 6),

('CARGO CARRIER PILOT', 4,  8,  60, 6),
('COPORATE PILOT',      4,  8,  30, 6),
('CHARTER PILOT',       4,  8,  60, 6),

('CARGO CARRIER PILOT', 4,  10, 60, 6),
('COPORATE PILOT',      4,  10, 30, 6),
('CHARTER PILOT',       4,  10, 60, 6),

('CARGO CARRIER PILOT', 4,  11, 60, 6),
('COPORATE PILOT',      4,  11, 30, 6),
('CHARTER PILOT',       4,  11, 60, 6),

('CARGO CARRIER PILOT', 4,  12, 60, 6),
('COPORATE PILOT',      4,  12, 30, 6),
('CHARTER PILOT',       4,  12, 60, 6),

('CARGO CARRIER PILOT', 4,  13, 60, 6),
('COPORATE PILOT',      4,  13, 30, 6),
('CHARTER PILOT',       4,  13, 60, 6),

('CARGO CARRIER PILOT', 4,  15, 60, 6),
('COPORATE PILOT',      4,  15, 30, 6),
('CHARTER PILOT',       4,  15, 60, 6),

('CARGO CARRIER PILOT', 4,  16, 60, 6),
('COPORATE PILOT',      4,  16, 30, 6),
('CHARTER PILOT',       4,  16, 60, 6),

('CARGO CARRIER PILOT', 4,  17, 60, 6),
('COPORATE PILOT',      4,  17, 30, 6),
('CHARTER PILOT',       4,  17, 60, 6),

('CARGO CARRIER PILOT', 4,  18, 60, 6),
('COPORATE PILOT',      4,  18, 30, 6),
('CHARTER PILOT',       4,  18, 60, 6),

('CARGO CARRIER PILOT', 4,  20, 60, 6),
('COPORATE PILOT',      4,  20, 30, 6),
('CHARTER PILOT',       4,  20, 60, 6),

('CARGO CARRIER PILOT', 4,  21, 60, 6),
('COPORATE PILOT',      4,  21, 30, 6),
('CHARTER PILOT',       4,  21, 60, 6),

('CARGO CARRIER PILOT', 4,  22, 60, 6),
('COPORATE PILOT',      4,  22, 30, 6),
('CHARTER PILOT',       4,  22, 60, 6),

('CARGO CARRIER PILOT', 4,  23, 60, 6),
('COPORATE PILOT',      4,  23, 30, 6),
('CHARTER PILOT',       4,  23, 60, 6),

-- Sales and Marketing (5)
('REGIONAL SALES MANAGER',  5,  1,  40, 3),
('SALES REPRESENTATIVE',    5,  1,  40, 3),
('AIRLINE MARKETER',        5,  1,  40, 3),
('SALES INTERN',            5,  1,  20, 3),

('REGIONAL SALES MANAGER',  5,  2,  40, 3),
('SALES REPRESENTATIVE',    5,  2,  40, 3),
('AIRLINE MARKETER',        5,  2,  40, 3),
('SALES INTERN',            5,  2,  20, 3),

('REGIONAL SALES MANAGER',  5,  3,  40, 3),
('SALES REPRESENTATIVE',    5,  3,  40, 3),
('AIRLINE MARKETER',        5,  3,  40, 3),
('SALES INTERN',            5,  3,  20, 3),

-- Reservations and Ticketing (6)
('RESERVATION SALES AGENT', 6,  4,  40, 3),
('AIRLINE TICKET AGENT',    6,  4,  40, 3),

('RESERVATION SALES AGENT', 6,  9,  40, 3),
('AIRLINE TICKET AGENT',    6,  9,  40, 3),

('RESERVATION SALES AGENT', 6,  14, 40, 3),
('AIRLINE TICKET AGENT',    6,  14, 40, 3),

('RESERVATION SALES AGENT', 6,  19, 40, 3),
('AIRLINE TICKET AGENT',    6,  19, 40, 3),

-- Finance and Property (7)
('ACCOUNTANT',                7,  1,  40, 5),
('AUDITOR',                   7,  1,  40, 5),
('FINANCE ASSITANT',          7,  1,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  1,  40, 5),
('PAYROLL CLERK',             7,  1,  40, 5),
('FINANCIAL ANALYST',         7,  1,  40, 5),
('PAYROLL MANAGER',           7,  1,  40, 5),
('FINANCE INTERN',            7,  1,  20, 5),

('ACCOUNTANT',                7,  2,  40, 5),
('AUDITOR',                   7,  2,  40, 5),
('FINANCE ASSITANT',          7,  2,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  2,  40, 5),
('PAYROLL CLERK',             7,  2,  40, 5),
('FINANCIAL ANALYST',         7,  2,  40, 5),
('PAYROLL MANAGER',           7,  2,  40, 5),
('FINANCE INTERN',            7,  2,  20, 5),

('ACCOUNTANT',                7,  3,  40, 5),
('AUDITOR',                   7,  3,  40, 5),
('FINANCE ASSITANT',          7,  3,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  3,  40, 5),
('PAYROLL CLERK',             7,  3,  40, 5),
('FINANCIAL ANALYST',         7,  3,  40, 5),
('PAYROLL MANAGER',           7,  3,  40, 5),
('FINANCE INTERN',            7,  3,  20, 5),

-- Information services (8)
('IT SPECIALIST',     8,  1,  40, 3),
('IT INTERN',         8,  1,  20, 3),
('HELP DESK SUPPORT', 8,  1,  40, 3),

('IT SPECIALIST',     8,  2,  40, 3),
('HELP DESK SUPPORT', 8,  2,  40, 3),
('IT INTERN',         8,  2,  20, 3),

('IT SPECIALIST',     8,  3,  40, 3),
('HELP DESK SUPPORT', 8,  3,  40, 3),
('IT INTERN',         8,  3,  20, 3),

-- Personnel (9)
('SECRETARY',                   9,  1,  40, 3),
('MAIL CLERK',                  9,  1,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  1,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  1,  40, 3),
('RECEPTIONIST',                9,  1,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  1,  40, 3),

('SECRETARY',                   9,  2,  40, 3),
('MAIL CLERK',                  9,  2,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  2,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  2,  40, 3),
('RECEPTIONIST',                9,  2,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  2,  40, 3),

('SECRETARY',                   9,  3,  40, 3),
('MAIL CLERK',                  9,  3,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  3,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  3,  40, 3),
('RECEPTIONIST',                9,  3,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  3,  40, 3),

-- Emergency Services (10)
('FIREFIGHTER',           10,  4,  40, 10),
('FIREFIGHTER MEDIC',     10,  4,  40, 10),
('POLICE OFFICER',        10,  4,  40, 10),
('FIRE AND CRASH RESCUE', 10,  4,  30, 10),
('POLICE PATROL OFFICER', 10,  4,  30, 10),

('FIREFIGHTER',           10,  9,  40, 10),
('FIREFIGHTER MEDIC',     10,  9,  40, 10),
('POLICE OFFICER',        10,  9,  40, 10),
('FIRE AND CRASH RESCUE', 10,  9,  30, 10),
('POLICE PATROL OFFICER', 10,  9,  30, 10),

('FIREFIGHTER',           10,  14, 40, 10),
('FIREFIGHTER MEDIC',     10,  14, 40, 10),
('POLICE OFFICER',        10,  14, 40, 10),
('FIRE AND CRASH RESCUE', 10,  14, 30, 10),
('POLICE PATROL OFFICER', 10,  14, 30, 10),

('FIREFIGHTER',           10,  19, 40, 10),
('FIREFIGHTER MEDIC',     10,  19, 40, 10),
('POLICE OFFICER',        10,  19, 40, 10),
('FIRE AND CRASH RESCUE', 10,  19, 30, 10),
('POLICE PATROL OFFICER', 10,  19, 30, 10),

-- Legal (11)
('AVIATION ATTORNEY',  11,  1,  40, 7),
('AVIATION ATTORNEY',  11,  2,  40, 7),
('AVIATION ATTORNEY',  11,  3,  40, 7),

-- Public Relations and Planning (12)
('PUBLIC RELATIONS SPECIALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS GENERALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS MANAGER',    12,  2,  40, 3),
('PUBLIC RELATIONS INTERN',     12,  2,  20, 3),

('HEAD OF ENGINEERING',           2,  2,  40, 9),
('HEAD OF GROUND OPERATIONS',     3,  2,  40, 9),
('HEAD OF FLIGHT OPERATIONS',     4,  2,  40, 9),
('HEAD OF SALES',                 5,  2,  40, 9),
('HEAD OF RESERVATIONS',          6,  2,  40, 9),
('HEAD OF FINANCE',               7,  2,  40, 9),
('HEAD OF INFORMATION SERVICES',  8,  2,  40, 9),
('HEAD OF PERSONNEL MANAGEMENT',  9,  2,  40, 9),
('HEAD OF EMERGENCY SERVICES',    10, 2,  40, 9),
('HEAD OF LEGAL',                 11, 2,  40, 9),
('HEAD OF PUBLIC RELATIONS',      12, 2,  40, 9);


-- Employee Address
INSERT INTO employee_address (street_address, city, zip_code, state, country) VALUES
('123 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('123 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('321 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('555 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('9029 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('765 MAIN ST',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('767 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('876 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8770 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('202 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('101 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('896 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('909 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('920 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('808 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8760 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8755 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('423 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('202 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('101 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('896 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('909 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 SEAWATER LN',     'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8260 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8234 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8754 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('808 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8234 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8754 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SLEEPY HILLS',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 FISHWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MINOR ST',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 LION LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 JUMPY HILLS',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 FISHWATER ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MINOR RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 LION RD',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SLEEPY SLOPES',  'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('423 FISHWATER RD',    'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8777 MAIN ST',        'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('920 LONG LN',         'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 KLEINE DR',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 EINE DR',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 ROADY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 NEIN LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KLEINE DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 EINE DR',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 ROADY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KLEINE DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 EINE DR',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 ROADY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 ROCKY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 BUMPY HILLS',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 POOLWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 DIGGY LN',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 ZEBRA ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 MERRYWEATHER LN', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CHRONO ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('420 CLOUDY DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 MERRYWEATHER LN', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 CHRONO ST',      'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('420 CLOUDY DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 TIME ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 TIME ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 TIME ST',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 STEEL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 STEEL LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A');


-- Employee
INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOHN',      'H',        'SMITH',      '123456789', '1965-01-01',  'M',    '+15553219090', 'jsmith@company.org',     1,      1,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MARY',      NULL,       'ORLEANS',    '987654321', '1970-04-09',  'F',    '+15559990001', 'morleans@company.org',   2,      2,          1000000),
('HARRIS',    NULL,       'BEAUDRY',    '111223333', '1967-04-29',  'M',    '+15559990021', 'hbeaudry@company.org',   3,      3,          NULL),
('ANABEL',    'A',        'NEALIOUS',   '112345678', '1980-01-09',  'F',    '+15559990011', 'anaulious@company.org',  4,      4,          NULL),
('DON',       'E',        'SYLVER',     '112345688', '1969-11-24',  'M',    '+15559980011', 'dsylver@company.org',    5,      5,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BRENDON',   NULL,       'LAMBINO',    '112346689', '1965-11-24',  'M',    '+15559680011', 'blambino@company.org',   6,      6,          1000001),
('MYRTLE',    NULL,       'TRUOG',      '122345688', '1969-12-24',  'F',    '+16559980011', 'mtruog@company.org',     6,      7,          1000001),
('LASZLO',    NULL,       'LUAIN',      '111345688', '1971-02-24',  'M',    '+15567980011', 'lluain@company.org',     6,      8,          1000001);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '117345689', '1984-06-23',  'M',    '+15567980111', NULL,                     7,      9,          NULL),
('LATIFA',    NULL,       'BELTZ',      '117245689', '1984-02-24',  'F',    '+15569980011', NULL,                     8,      10,         NULL),
('ELINA',     NULL,       'HAUTUM',     '117445689', '1983-06-24',  'F',    '+15567900811', NULL,                     9,      11,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '117545689', '1983-08-12',  'M',    '+15567980211', NULL,                     10,     12,         NULL),
('SOLOMON',   'V',        'TERZI',      '117745689', '1984-09-23',  'M',    '+15567980311', NULL,                     11,     13,         NULL),
('QUINCTUS',  NULL,       'HART',       '113345689', '1990-12-19',  'M',    '+15567980411', NULL,                     12,     14,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '118345689', '1987-06-04',  'F',    '+15567980511', NULL,                     13,     15,         NULL),
('LAURENS',   NULL,       'RUSH',       '114345689', '1989-05-03',  'M',    '+15567980611', NULL,                     14,     16,         NULL),
('SHANNA',    'M',        'PLANCK',     '111342689', '1990-04-02',  'F',    '+15567980711', NULL,                     15,     17,         NULL),
('REINALDO',  'S',        'CLARK',      '117355689', '1988-03-01',  'M',    '+15567980811', NULL,                     16,     18,         NULL);


UPDATE employee
SET manager_id = 1000017
WHERE employee_id < 1000017 AND employee_id > 1000007;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PRINCE',    'S',        'BERGFALK',   '100000001', '1984-06-23',  'M',    '+15567180111', NULL,                     17,     19,         NULL),
('RICO',      NULL,       'MILFORD',    '100000002', '1984-02-24',  'M',    '+15569180011', NULL,                     18,     20,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000003', '1983-06-24',  'M',    '+15567100811', NULL,                     19,     21,         NULL),
('BENVENUTO', 'J',        'BRYAN',      '100000004', '1983-08-12',  'M',    '+15567180211', NULL,                     20,     22,         NULL),
('SARA',      'S',        'COKES',      '100000005', '1984-09-23',  'F',    '+15567180311', NULL,                     21,     23,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000006', '1990-12-19',  'F',    '+15567180411', NULL,                     22,     24,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000007', '1987-06-04',  'F',    '+15567180511', NULL,                     23,     25,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000008', '1989-05-03',  'F',    '+15567180611', NULL,                     24,     26,         NULL),
('KYLEE',     'M',        'DARROW',     '100000009', '1990-04-02',  'F',    '+15567180711', NULL,                     25,     27,         NULL),
('SHIRO',     'G',        'DARZI',      '100000010', '1988-03-01',  'M',    '+15567180811', NULL,                     26,     28,         NULL);


UPDATE employee
SET manager_id = 1000027
WHERE employee_id < 1000027 AND employee_id > 1000017;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'B',        'ANKEREN',    '100000011', '1984-06-23',  'M',    '+15566180111', NULL,                     27,     29,         NULL),
('RICO',      NULL,       'MILFORD',    '100000012', '1984-02-24',  'M',    '+15566180011', NULL,                     28,     30,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000013', '1983-06-24',  'M',    '+15566100811', NULL,                     29,     31,         NULL),
('BENVENUTO', 'A',        'BRYAN',      '100000014', '1983-08-12',  'M',    '+15566180211', NULL,                     30,     32,         NULL),
('SARA',      'T',        'COKES',      '100000015', '1984-09-23',  'F',    '+15566180311', NULL,                     31,     33,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000016', '1990-12-19',  'F',    '+15566180411', NULL,                     32,     34,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000017', '1987-06-04',  'F',    '+15566180511', NULL,                     33,     35,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000018', '1989-05-03',  'F',    '+15566180611', NULL,                     34,     36,         NULL),
('KYLEE',     'O',        'DARROW',     '100000019', '1990-04-02',  'F',    '+15566180711', NULL,                     35,     37,         NULL),
('SHIRO',     'K',        'DARZI',      '100000020', '1988-03-01',  'M',    '+15566180811', NULL,                     36,     38,         NULL);


UPDATE employee
SET manager_id = 1000037
WHERE employee_id < 1000037 AND employee_id > 1000027;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '100000031', '1985-06-13',  'M',    '+25567980221', NULL,                     37,     39,         NULL),
('LATIFA',    NULL,       'BELTZ',      '100000032', '1985-02-14',  'F',    '+25569980221', NULL,                     38,     40,         NULL),
('ELINA',     NULL,       'HAUTUM',     '100000033', '1985-06-14',  'F',    '+25567900221', NULL,                     39,     41,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '100000034', '1985-08-12',  'M',    '+25574980221', NULL,                     40,     42,         NULL),
('SOLOMON',   'V',        'TERZI',      '100000035', '1985-09-13',  'M',    '+25574880221', NULL,                     41,     43,         NULL),
('QUINCTUS',  NULL,       'HART',       '100000036', '1995-12-19',  'M',    '+25568980221', NULL,                     42,     44,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '100000037', '1985-06-14',  'F',    '+25577980221', NULL,                     43,     45,         NULL),
('LAURENS',   NULL,       'RUSH',       '100000038', '1985-05-13',  'M',    '+25587980221', NULL,                     44,     46,         NULL),
('SHANNA',    'M',        'PLANCK',     '100000039', '1995-04-12',  'F',    '+25569980221', NULL,                     45,     47,         NULL),
('REINALDO',  'Q',        'HART',       '100000040', '1985-03-11',  'M',    '+25560980221', NULL,                     46,     48,         NULL);


UPDATE employee
SET manager_id = 1000047
WHERE employee_id < 1000047 AND employee_id > 1000037;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAUTVYDAS', 'C',        'LANG',       '100000041', '1986-06-13',  'M',    '+15567980221', NULL,                     47,     49,         NULL),
('JOAKIM',    NULL,       'LEON',       '100000042', '1986-02-14',  'M',    '+15569980221', NULL,                     48,     50,         NULL),
('VALENTIN',  NULL,       'FIORE',      '100000043', '1986-06-14',  'M',    '+15567900221', NULL,                     49,     51,         NULL),
('SHAHIN',    'G',        'HOBBES',     '100000044', '1986-08-12',  'M',    '+15574980221', NULL,                     50,     52,         NULL),
('EVITA',     'I',        'ACHTEROP',   '100000045', '1986-09-13',  'F',    '+15574880221', NULL,                     51,     53,         NULL),
('REINALDO',  'I',        'CLARKE',     '100000046', '1986-03-11',  'M',    '+15560980221', NULL,                     52,     54,         NULL);


UPDATE employee
SET manager_id = employee_id - 1
WHERE employee_id IN (1000049, 1000051, 1000053);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'J',        'DUPUY',      '100000047', '1984-06-23',  'M',    '+15867980221', NULL,                     53,     55,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000048', '1994-02-24',  'M',    '+15869980221', NULL,                     54,     56,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000049', '1984-06-24',  'F',    '+15867900221', NULL,                     55,     57,         NULL),
('LOLA',      'I',        'PATTERSON',  '100000050', '1984-08-22',  'F',    '+15874980221', NULL,                     56,     58,         NULL),
('DEIRDRE',   'R',        'STRANGE',    '100000051', '1984-09-23',  'F',    '+15874880221', NULL,                     57,     59,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000052', '1964-12-29',  'M',    '+15868980221', NULL,                     58,     60,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000053', '1984-06-24',  'F',    '+15877980221', NULL,                     59,     61,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000054', '1964-05-23',  'M',    '+15887980221', NULL,                     60,     62,         NULL),
('VALERIAN',  'M',        'DABNEY',     '100000055', '1994-04-22',  'F',    '+15869580221', NULL,                     61,     63,         NULL),
('LIANE',     'M',        'MARIA',      '100000056', '1994-04-22',  'F',    '+15869380221', NULL,                     62,     64,         NULL),
('TAAVI',     'B',        'HOUBEN',     '100000057', '1984-03-21',  'M',    '+15860980221', NULL,                     63,     65,         NULL);


UPDATE employee
SET manager_id = 1000063
WHERE employee_id < 1000065 AND employee_id > 1000053 AND NOT employee_id = 1000063;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'A',        'DUPUY',      '100000058', '1982-04-23',  'M',    '+15867910221', NULL,                     64,     66,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000059', '1992-12-24',  'M',    '+15869910221', NULL,                     65,     67,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000060', '1982-04-24',  'F',    '+15867510221', NULL,                     66,     68,         NULL),
('LOLA',      'A',        'PATTERSON',  '100000061', '1982-06-22',  'F',    '+15874910221', NULL,                     67,     69,         NULL),
('DEIRDRE',   'A',        'STRANGE',    '100000062', '1982-07-23',  'F',    '+15874810221', NULL,                     68,     70,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000063', '1962-12-29',  'M',    '+15868910221', NULL,                     69,     71,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000064', '1982-04-24',  'F',    '+15877910221', NULL,                     70,     72,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000065', '1962-03-23',  'M',    '+15887910221', NULL,                     71,     73,         NULL),
('VALERIAN',  'A',        'DABNEY',     '100000066', '1992-02-22',  'F',    '+15869510221', NULL,                     72,     74,         NULL),
('BRIGITTA',  'A',        'MATHEWSON',  '100000067', '1992-02-22',  'F',    '+15869310221', NULL,                     73,     75,         NULL),
('TAAVI',     'A',        'HOUBEN',     '100000068', '1982-01-21',  'M',    '+15860910221', NULL,                     74,     76,         NULL);


UPDATE employee
SET manager_id = 1000074
WHERE employee_id < 1000076 AND employee_id > 1000064 AND NOT employee_id = 1000074;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000069', '1988-04-23',  'M',    '+15867910361', NULL,                     75,     77,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000070', '1998-12-24',  'F',    '+15869910361', NULL,                     76,     78,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000071', '1988-04-24',  'F',    '+15867510361', NULL,                     77,     79,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000072', '1988-06-22',  'F',    '+15874910361', NULL,                     78,     80,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000073', '1988-07-23',  'M',    '+15874810361', NULL,                     79,     81,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000074', '1968-12-29',  'M',    '+15868910361', NULL,                     80,     82,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000075', '1988-04-24',  'M',    '+15877910361', NULL,                     81,     83,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000076', '1968-03-23',  'M',    '+15887910361', NULL,                     82,     84,         NULL),
('SUNE',      'P',        'FOSSE',      '100000077', '1998-02-22',  'F',    '+15869510361', NULL,                     83,     85,         NULL),
('GEORGETA',  'L',        'ALLARD',     '100000078', '1998-02-22',  'F',    '+15869310361', NULL,                     84,     86,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000079', '1988-01-21',  'F',    '+15860910361', NULL,                     85,     87,         NULL);


UPDATE employee
SET manager_id = 1000085
WHERE employee_id < 1000087 AND employee_id > 1000075 AND NOT employee_id = 1000085;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000080', '1988-04-23',  'M',    '+25867910361', NULL,                     86,     88,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000081', '1998-12-24',  'F',    '+25869910361', NULL,                     87,     89,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000082', '1988-04-24',  'F',    '+25867510361', NULL,                     88,     90,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000083', '1988-06-22',  'F',    '+25874910361', NULL,                     89,     91,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000084', '1988-07-23',  'M',    '+25874810361', NULL,                     90,     92,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000085', '1968-12-29',  'M',    '+25868910361', NULL,                     91,     93,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000086', '1988-04-24',  'M',    '+25877910361', NULL,                     92,     94,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000087', '1968-03-23',  'M',    '+25887910361', NULL,                     93,     95,         NULL),
('SUNE',      'P',        'FOSSE',      '100000088', '1998-02-22',  'F',    '+25869510361', NULL,                     94,     96,         NULL),
('SANDRA',    'M',        'ALLARD',     '100000089', '1998-02-22',  'F',    '+25869310361', NULL,                     95,     97,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000090', '1988-01-21',  'F',    '+25860910361', NULL,                     96,     98,         NULL);


UPDATE employee
SET manager_id = 1000096
WHERE employee_id < 1000098 AND employee_id > 1000086 AND NOT employee_id = 1000096;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000091', '1988-04-23',  'M',    '+15067910361', NULL,                     97,     99,         1000063),
('KRISTIN',   NULL,       'SCRIVEN',    '100000092', '1998-12-24',  'F',    '+15069910361', NULL,                     98,     100,        1000063),
('MONIKA',    NULL,       'INGESSON',   '100000093', '1988-04-24',  'F',    '+15067510361', NULL,                     99,     101,        1000074),
('VASIA',     'K',        'MIYAZAKI',   '100000094', '1988-06-22',  'F',    '+15074910361', NULL,                     100,    102,        1000074),
('FAIRUZ',    'H',        'BYRD',       '100000095', '1988-07-23',  'M',    '+15074810361', NULL,                     101,    103,        1000085),
('SULEYMAN',  NULL,       'KURZMANN',   '100000096', '1968-12-29',  'M',    '+15068910361', NULL,                     102,    104,        1000085),
('FELIX',     NULL,       'LINDQVIST',  '100000097', '1988-04-24',  'M',    '+25077910361', NULL,                     103,    105,        1000096),
('TSHEPO',    NULL,       'BEST',       '100000098', '1968-03-23',  'M',    '+25087910361', NULL,                     104,    106,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'S',        'CORNELL',    '100000099', '1988-04-23',  'M',    NULL,           NULL,                     105,    107,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000100', '1998-12-24',  'F',    NULL,           NULL,                     106,    108,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000101', '1988-04-24',  'F',    NULL,           NULL,                     107,    109,        NULL),
('VASIA',     'R',        'MIYAZAKI',   '100000102', '1988-06-22',  'F',    NULL,           NULL,                     108,    110,        NULL),
('FAIRUZ',    'Q',        'BYRD',       '100000103', '1988-07-23',  'M',    NULL,           NULL,                     109,    111,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000104', '1968-12-29',  'M',    NULL,           NULL,                     110,    112,        NULL),
('NAMEY',     NULL,       'LINDQVIST',  '100000105', '1988-04-24',  'M',    NULL,           NULL,                     111,    113,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000106', '1988-04-24',  'M',    NULL,           NULL,                     112,    114,        NULL),
('HIDEKI',    'P',        'CORNELL',    '100000107', '1988-04-23',  'M',    NULL,           NULL,                     113,    115,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000108', '1998-12-24',  'F',    NULL,           NULL,                     114,    116,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000109', '1988-04-24',  'F',    NULL,           NULL,                     115,    117,        NULL),
('VASIA',     'O',        'MIYAZAKI',   '100000110', '1988-06-22',  'F',    NULL,           NULL,                     116,    118,        NULL),
('FAIRUZ',    'N',        'BYRD',       '100000111', '1988-07-23',  'M',    NULL,           NULL,                     117,    119,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000112', '1968-12-29',  'M',    NULL,           NULL,                     118,    120,        NULL),
('AMY',       NULL,       'LINDQVIST',  '100000113', '1988-04-24',  'F',    NULL,           NULL,                     119,    121,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000114', '1988-04-24',  'M',    NULL,           NULL,                     120,    122,        NULL),
('HIDEKI',    'M',        'CORNELL',    '100000115', '1988-04-23',  'M',    NULL,           NULL,                     121,    123,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000116', '1998-12-24',  'F',    NULL,           NULL,                     122,    124,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000117', '1988-04-24',  'F',    NULL,           NULL,                     123,    125,        NULL),
('VASIA',     'L',        'MIYAZAKI',   '100000118', '1988-06-22',  'F',    NULL,           NULL,                     124,    126,        NULL),
('FAIRUZ',    'K',        'BYRD',       '100000119', '1988-07-23',  'M',    NULL,           NULL,                     125,    127,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000120', '1968-12-29',  'M',    NULL,           NULL,                     126,    128,        NULL),
('FELIX',     NULL,       'ULG',        '100000121', '1988-04-24',  'M',    NULL,           NULL,                     127,    129,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000122', '1988-04-24',  'M',    NULL,           NULL,                     128,    130,        NULL),
('HIDEKI',    'J',        'CORNELL',    '100000123', '1988-04-23',  'M',    NULL,           NULL,                     129,    131,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000124', '1998-12-24',  'F',    NULL,           NULL,                     130,    132,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000125', '1988-04-24',  'F',    NULL,           NULL,                     131,    133,        NULL),
('VASIA',     'H',        'MIYAZAKI',   '100000126', '1988-06-22',  'F',    NULL,           NULL,                     132,    134,        NULL),
('FAIRUZ',    'I',        'BYRD',       '100000127', '1988-07-23',  'M',    NULL,           NULL,                     133,    135,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000128', '1968-12-29',  'M',    NULL,           NULL,                     134,    136,        NULL),
('FELIX',     NULL,       'KURZMANN',   '100000129', '1988-04-24',  'M',    NULL,           NULL,                     135,    137,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000130', '1988-04-24',  'M',    NULL,           NULL,                     136,    138,        NULL),
('HIDEKI',    'G',        'CORNELL',    '100000131', '1988-04-23',  'M',    NULL,           NULL,                     137,    139,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000132', '1998-12-24',  'F',    NULL,           NULL,                     138,    140,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000133', '1988-04-24',  'F',    NULL,           NULL,                     139,    141,        NULL),
('VASIA',     'F',        'MIYAZAKI',   '100000134', '1988-06-22',  'F',    NULL,           NULL,                     140,    142,        NULL),
('FAIRUZ',    'E',        'BYRD',       '100000135', '1988-07-23',  'M',    NULL,           NULL,                     141,    143,        NULL),
('HERSHALL',  NULL,       'KURZMANN',   '100000136', '1968-12-29',  'M',    NULL,           NULL,                     142,    144,        NULL),
('JEREMY',    NULL,       'LINDQVIST',  '100000137', '1988-04-24',  'M',    NULL,           NULL,                     143,    145,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000138', '1988-04-24',  'M',    NULL,           NULL,                     144,    146,        NULL),
('HIDEKI',    'C',        'CORNELL',    '100000139', '1988-04-23',  'M',    NULL,           NULL,                     145,    147,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000140', '1998-12-24',  'F',    NULL,           NULL,                     146,    148,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000141', '1988-04-24',  'F',    NULL,           NULL,                     147,    149,        NULL),
('VASIA',     'B',        'MIYAZAKI',   '100000142', '1988-06-22',  'F',    NULL,           NULL,                     148,    150,        NULL),
('MARK',      'A',        'BYRD',       '100000143', '1988-07-23',  'M',    NULL,           NULL,                     149,    151,        NULL),
('JOHN',      NULL,       'KURZMANN',   '100000144', '1968-12-29',  'M',    NULL,           NULL,                     150,    152,        NULL),
('KARL',      NULL,       'LINDQVIST',  '100000145', '1988-04-24',  'M',    NULL,           NULL,                     151,    153,        NULL),
('JOHN',      NULL,       'LINDQVIST',  '100000146', '1988-04-24',  'M',    NULL,           NULL,                     152,    154,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PROPSPER',  'S',        'ALFERINK',   '100000147', '1988-04-23',  'M',    NULL,           NULL,                     153,    155,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BEATRICE',  'S',        'ABBADELLI',  '100000148', '1988-04-23',  'F',    NULL,           NULL,                     154,    156,        1000154),
('KUROSH',    NULL,       'ABBADELLI',  '100000149', '1988-04-23',  'M',    NULL,           NULL,                     155,    157,        1000154),
('LUKAS',     NULL,       'ABBADELLI',  '100000150', '1988-04-23',  'M',    NULL,           NULL,                     156,    158,        1000154);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000151', '1988-04-23',  'M',    NULL,           NULL,                     157,    159,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('FRANCO',    'S',        'CALVO',      '100000152', '1989-04-23',  'M',    NULL,           NULL,                     158,    160,        1000158),
('ALVA',      NULL,       'SERAFINI',   '100000153', '1989-05-23',  'F',    NULL,           NULL,                     159,    161,        1000158),
('LUKAS',     NULL,       'CALVO',      '100000154', '1985-08-28',  'M',    NULL,           NULL,                     160,    162,        1000158);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000155', '1988-04-23',  'M',    NULL,           NULL,                     161,    163,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'S',        'JEANS',      '100000156', '1989-04-23',  'M',    NULL,           NULL,                     162,    164,        1000162),
('HARRY',     NULL,       'NOSE',       '100000157', '1989-05-23',  'M',    NULL,           NULL,                     163,    165,        1000162),
('BARNEY',    NULL,       'BILLS',      '100000158', '1985-08-28',  'M',    NULL,           NULL,                     164,    166,        1000162);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'J',        'JEANS',      '100000159', '1989-04-23',  'M',    NULL,           NULL,                     165,    167,        1000063),
('HARRY',     NULL,       'NOSEN',      '100000160', '1989-05-23',  'M',    NULL,           NULL,                     166,    168,        1000063),
('BARNEY',    NULL,       'BILLS',      '100000161', '1985-08-28',  'M',    NULL,           NULL,                     167,    169,        1000074),
('JIMMY',     'P',        'JEANS',      '100000162', '1989-04-23',  'M',    NULL,           NULL,                     168,    170,        1000074),
('BARRY',     NULL,       'NOSE',       '100000163', '1989-05-23',  'M',    NULL,           NULL,                     169,    171,        1000085),
('BARNEY',    NULL,       'BILLS',      '100000164', '1985-08-28',  'M',    NULL,           NULL,                     170,    172,        1000085),
('JIMMOTHY',  'S',        'JENSON',     '100000165', '1989-04-23',  'M',    NULL,           NULL,                     171,    173,        1000096),
('LARRY',     NULL,       'NOSE',       '100000166', '1989-05-23',  'M',    NULL,           NULL,                     172,    174,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANNE',      'S',        'PERROT',     '100000167', '1975-04-23',  'F',    NULL,           NULL,                     173,    175,        NULL),
('SAWDA',     NULL,       'PAPOUTSIS',  '100000168', '1975-05-23',  'F',    NULL,           NULL,                     174,    176,        NULL),
('BARNEY',    NULL,       'DINO',       '100000169', '1974-08-28',  'M',    NULL,           NULL,                     175,    177,        NULL),
('JACOBA',    'A',        'PENA',       '100000170', '1974-04-23',  'M',    NULL,           NULL,                     176,    178,        NULL),
('SEONG',     NULL,       'KOOLS',      '100000171', '1974-05-23',  'F',    NULL,           NULL,                     177,    179,        NULL),
('IKENNA',    NULL,       'ROMILLY',    '100000172', '1974-08-28',  'F',    NULL,           NULL,                     178,    180,        NULL),
('FERNANDO',  'V',        'BRICE',      '100000173', '1974-04-23',  'M',    NULL,           NULL,                     179,    181,        NULL),
('HORACIO',   NULL,       'KURZ',       '100000174', '1974-05-23',  'M',    NULL,           NULL,                     180,    182,        NULL);


UPDATE employee
SET manager_id = 1000179
WHERE employee_id IN (1000176, 1000177, 1000181);


UPDATE employee
SET manager_id = 1000180
WHERE employee_id IN (1000174, 1000175, 1000178, 1000179);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'WILDGRUBE',  '100000175', '1975-04-23',  'F',    NULL,           NULL,                     181,    183,        NULL),
('STARR',     NULL,       'GARNETT',    '100000176', '1975-05-23',  'F',    NULL,           NULL,                     182,    184,        NULL),
('PING',      NULL,       'DINO',       '100000177', '1974-08-28',  'M',    NULL,           NULL,                     183,    185,        NULL),
('JEF',       'C',        'COMO',       '100000178', '1974-04-23',  'M',    NULL,           NULL,                     184,    186,        NULL),
('SEVERINE',  NULL,       'BJARNESEN',  '100000179', '1974-05-23',  'F',    NULL,           NULL,                     185,    187,        NULL),
('HUAN',      NULL,       'LEIFSSON',   '100000180', '1974-08-28',  'M',    NULL,           NULL,                     186,    188,        NULL),
('LINWOOD',   'O',        'COOKE',      '100000181', '1974-04-23',  'M',    NULL,           NULL,                     187,    189,        NULL),
('PEPE',      NULL,       'GARDINER',   '100000182', '1974-05-23',  'M',    NULL,           NULL,                     188,    190,        NULL);


UPDATE employee
SET manager_id = 1000187
WHERE employee_id IN (1000184, 1000185, 1000189);


UPDATE employee
SET manager_id = 1000188
WHERE employee_id IN (1000182, 1000183, 1000186, 1000187);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAISIA',    'S',        'ROSE',       '100000183', '1975-04-23',  'F',    NULL,           NULL,                     189,    191,        NULL),
('OLGA',      NULL,       'SCHULTHEISS','100000184', '1975-05-23',  'F',    NULL,           NULL,                     190,    192,        NULL),
('KYOU',      NULL,       'SUZUKI',     '100000185', '1970-08-28',  'F',    NULL,           NULL,                     191,    193,        NULL),
('ROLLO',     'D',        'SHORT',      '100000186', '1970-04-23',  'M',    NULL,           NULL,                     192,    194,        NULL),
('LEONARDO',  NULL,       'BJARNESEN',  '100000187', '1970-05-23',  'M',    NULL,           NULL,                     193,    195,        NULL),
('HUAN',      NULL,       'ROSE',       '100000188', '1970-08-28',  'M',    NULL,           NULL,                     194,    196,        NULL),
('FLAVIA',    'O',        'MOROZOV',    '100000189', '1970-04-23',  'M',    NULL,           NULL,                     195,    197,        NULL),
('CORINNA',   NULL,       'WERNHER',    '100000190', '1970-05-23',  'M',    NULL,           NULL,                     196,    198,        NULL);


UPDATE employee
SET manager_id = 1000195
WHERE employee_id IN (1000192, 1000193, 1000197);


UPDATE employee
SET manager_id = 1000196
WHERE employee_id IN (1000190, 1000191, 1000194, 1000195);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MAXINE',    'A',        'THAIDHG',    '100000191', '1975-04-23',  'F',    NULL,           NULL,                     197,    199,        NULL),
('MARCEAU',   NULL,       'OTTEN',      '100000192', '2000-05-23',  'M',    NULL,           NULL,                     198,    200,        NULL),
('HARLOW',    NULL,       'ARENDOK',    '100000193', '1970-08-28',  'M',    NULL,           NULL,                     199,    201,        NULL);


UPDATE employee
SET manager_id = 1000198
WHERE employee_id = 1000199;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANDRE',     'K',        'GILBERT',    '100000194', '1975-05-23',  'M',    NULL,           NULL,                     200,    202,        NULL),
('EMIL',      NULL,       'TRAVERSO',   '100000195', '2000-08-23',  'M',    NULL,           NULL,                     201,    203,        NULL),
('SEPHORA',   NULL,       'VILLENEUVE', '100000196', '1971-08-28',  'F',    NULL,           NULL,                     202,    204,        NULL);


UPDATE employee
SET manager_id = 1000201
WHERE employee_id = 1000202;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AFAF',      'S',        'LOWE',       '100000197', '1975-04-23',  'M',    NULL,           NULL,                     203,    205,        NULL),
('MAXIME',    NULL,       'LAMBERT',    '100000198', '2001-08-23',  'M',    NULL,           NULL,                     204,    206,        NULL),
('TERZO',     NULL,       'HERZOG',     '100000199', '1970-08-28',  'F',    NULL,           NULL,                     205,    207,        NULL);


UPDATE employee
SET manager_id = 1000204
WHERE employee_id = 1000205;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'LOWE',       '100000200', '1975-04-23',  'F',    NULL,           NULL,                     206,    208,        NULL),
('STARR',     NULL,       'LAMBERT',    '100000201', '2001-08-23',  'F',    NULL,           NULL,                     207,    209,        NULL),
('PING',      NULL,       'HERZOG',     '100000202', '1970-08-28',  'M',    NULL,           NULL,                     208,    210,        NULL),
('JEF',       'H',        'LOWE',       '100000203', '1975-04-23',  'M',    NULL,           NULL,                     209,    211,        NULL),
('SEVERINE',  NULL,       'LAMBERT',    '100000204', '2001-08-23',  'F',    NULL,           NULL,                     210,    212,        NULL),
('HUAN',      NULL,       'HERZOG',     '100000205', '1970-08-28',  'F',    NULL,           NULL,                     211,    213,        NULL);


UPDATE employee
SET manager_id = 1000210
WHERE employee_id = 1000209;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'P',        'LOWE',       '100000206', '1978-12-01',  'M',    NULL,           NULL,                     212,    214,        NULL),
('RICO',      NULL,       'LAMBERT',    '100000207', '1999-04-02',  'M',    NULL,           NULL,                     213,    215,        NULL),
('DEVARAJ',   NULL,       'HERZOG',     '100000208', '1978-03-03',  'M',    NULL,           NULL,                     214,    216,        NULL),
('BENVENUTO', 'L',        'LOWE',       '100000209', '1978-02-04',  'M',    NULL,           NULL,                     215,    217,        NULL),
('SARA',      NULL,       'LAMBERT',    '100000210', '1999-01-05',  'F',    NULL,           NULL,                     216,    218,        NULL),
('LALE',      NULL,       'HERZOG',     '100000211', '1978-05-06',  'M',    NULL,           NULL,                     217,    219,        NULL);


UPDATE employee
SET manager_id = 1000216
WHERE employee_id = 1000215;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('RAJ',       'D',        'OSBOURNE',   '100000212', '1978-12-01',  'M',    NULL,           NULL,                     218,    220,        NULL),
('SIMONE',    NULL,       'ASIS',       '100000213', '1999-04-02',  'F',    NULL,           NULL,                     219,    221,        NULL),
('JOLINE',    NULL,       'LEEUWENHOEK','100000214', '1978-03-03',  'F',    NULL,           NULL,                     220,    222,        NULL),
('YULIA',     'L',        'THAIDHG',    '100000215', '1978-02-04',  'F',    NULL,           NULL,                     221,    223,        NULL),
('CY',        NULL,       'NEAL',       '100000216', '1999-01-05',  'M',    NULL,           NULL,                     222,    224,        NULL),
('ANDREA',    NULL,       'MCCREERY',   '100000217', '1978-05-06',  'F',    NULL,           NULL,                     223,    225,        NULL);


UPDATE employee
SET manager_id = 1000222
WHERE employee_id = 1000221;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('SIMONE',    NULL,       'MCCREERY',   '100000218', '1999-04-02',  'F',    NULL,           NULL,                     224,    226,        NULL),
('JOLINE',    NULL,       'NEAL',       '100000219', '1978-03-03',  'F',    NULL,           NULL,                     225,    227,        NULL),
('YULIA',     'L',        'SMITH',      '100000220', '1978-02-04',  'F',    NULL,           NULL,                     226,    228,        NULL),
('CY',        NULL,       'ASIS',       '100000221', '1999-01-05',  'M',    NULL,           NULL,                     227,    229,        NULL),
('ANDREA',    NULL,       'OSBOURNE',   '100000222', '1978-05-06',  'F',    NULL,           NULL,                     228,    230,        NULL),

('SUHAIL',    NULL,       'ROSE',       '100000223', '1999-04-02',  'M',    NULL,           NULL,                     229,    231,        NULL),
('NUAN',      NULL,       'SCHULTHEISS','100000224', '1978-03-03',  'M',    NULL,           NULL,                     230,    232,        NULL),
('INNOKENTI', 'L',        'SUZUKI',     '100000225', '1978-02-04',  'M',    NULL,           NULL,                     231,    233,        NULL),
('KENTIGERN', NULL,       'SHORT',      '100000226', '1999-01-05',  'M',    NULL,           NULL,                     232,    234,        NULL),
('RIEN',      NULL,       'BJARNESEN',  '100000227', '1978-05-06',  'M',    NULL,           NULL,                     233,    235,        NULL),

('SUHAIL',    NULL,       'PORCHER',    '100000228', '1999-04-02',  'M',    NULL,           NULL,                     234,    236,        NULL),
('NUAN',      NULL,       'BAUMGARTEN', '100000229', '1978-03-03',  'M',    NULL,           NULL,                     235,    237,        NULL),
('INNOKENTI', 'L',        'MIKHAILOV',  '100000230', '1978-02-04',  'M',    NULL,           NULL,                     236,    238,        NULL),
('KENTIGERN', NULL,       'BAGGI',      '100000231', '1999-01-05',  'M',    NULL,           NULL,                     237,    239,        NULL),
('RIEN',      NULL,       'NOYER',      '100000232', '1978-05-06',  'M',    NULL,           NULL,                     238,    240,        NULL),

('SIMONE',    NULL,       'PORCHER',    '100000233', '1999-04-02',  'F',    NULL,           NULL,                     239,    241,        NULL),
('JOLINE',    NULL,       'BAUMGARTEN', '100000234', '1978-03-03',  'M',    NULL,           NULL,                     240,    242,        NULL),
('YULIA',     'L',        'MIKHAILOV',  '100000235', '1978-02-04',  'M',    NULL,           NULL,                     241,    243,        NULL),
('CY',        NULL,       'BAGGI',      '100000236', '1999-01-05',  'M',    NULL,           NULL,                     242,    244,        NULL),
('ANDREA',    NULL,       'NOYER',      '100000237', '1978-05-06',  'M',    NULL,           NULL,                     243,    245,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('LAWYER',    'D',        'SAWYER',     '100000238', '1978-12-01',  'M',    NULL,           NULL,                     244,    246,        NULL),
('SIMONE',    NULL,       'LAW',        '100000239', '1999-04-02',  'F',    NULL,           NULL,                     245,    247,        NULL),
('JOE',       NULL,       'TURNEY',     '100000240', '1978-03-03',  'M',    NULL,           NULL,                     246,    248,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'SAWYER',     '100000241', '1978-12-01',  'M',    NULL,           NULL,                     247,    249,        NULL),
('NATHAN',    NULL,       'TURNER',     '100000242', '1999-04-02',  'M',    NULL,           NULL,                     248,    250,        NULL),
('ELISE',     NULL,       'STEEL',      '100000243', '1978-03-03',  'F',    NULL,           NULL,                     249,    251,        NULL),
('MARY',      NULL,       'SUE',        '100000244', '1978-03-03',  'F',    NULL,           NULL,                     250,    252,        NULL);


UPDATE employee
SET manager_id = 1000250
WHERE employee_id > 1000247 AND NOT employee_id = 1000250;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'GOLD',       '100000245', '1965-12-01',  'M',    NULL,           'jgold@company.org',      251,    253,        NULL),
('NATHAN',    NULL,       'SILVER',     '100000246', '1966-04-02',  'M',    NULL,           'nsilver@company.org',    252,    254,        NULL),
('ELISE',     NULL,       'BRONZE',     '100000247', '1967-03-14',  'F',    NULL,           'ebronze@company.org',    253,    255,        NULL),
('MARY',      NULL,       'COPPER',     '100000248', '1968-03-04',  'F',    NULL,           'mcopper@company.org',    254,    256,        NULL),
('JOHN',      'K',        'BRASS',      '100000249', '1969-12-11',  'M',    NULL,           'jbrass@company.org',     255,    257,        NULL),
('NEIL',      NULL,       'ZINC',       '100000250', '1965-07-02',  'M',    NULL,           'nzinc@company.org',      256,    258,        NULL),
('ELLEN',     NULL,       'TIN',        '100000251', '1966-03-03',  'F',    NULL,           'etin@company.org',       257,    259,        NULL),
('MYRTLE',    NULL,       'PEWTER',     '100000252', '1967-04-03',  'F',    NULL,           'mpewter@company.org',    258,    260,        NULL),
('JERKYLL',   'G',        'LEAD',       '100000253', '1968-12-06',  'M',    NULL,           'jlead@company.org',      259,    261,        NULL),
('NERRY',     NULL,       'CHROMIUM',   '100000254', '1969-04-02',  'M',    NULL,           'nchromium@company.org',  260,    262,        NULL),
('PENELOPE',  NULL,       'IRON',       '100000255', '1970-03-03',  'F',    NULL,           'eiron@company.org',      261,    263,        NULL);


-- Create department heads
UPDATE department
SET department_head_id = 1000000
WHERE department_id = 1;


UPDATE department
SET department_head_id = 1000252
WHERE department_id = 2;


UPDATE department
SET department_head_id = 1000253
WHERE department_id = 3;


UPDATE department
SET department_head_id = 1000254
WHERE department_id = 4;


UPDATE department
SET department_head_id = 1000255
WHERE department_id = 5;


UPDATE department
SET department_head_id = 1000256
WHERE department_id = 6;


UPDATE department
SET department_head_id = 1000257
WHERE department_id = 7;


UPDATE department
SET department_head_id = 1000258
WHERE department_id = 8;


UPDATE department
SET department_head_id = 1000259
WHERE department_id = 9;


UPDATE department
SET department_head_id = 1000260
WHERE department_id = 10;


UPDATE department
SET department_head_id = 1000261
WHERE department_id = 11;


UPDATE department
SET department_head_id = 1000262
WHERE department_id = 12;


-- Salary
INSERT INTO salary (employee_id, hourly_wage, annual_bonus) VALUES
(1000000, '$375', '$700,000'),
(1000001, '$100', '$250,000'),
(1000002, '$90',  '$200,000'),
(1000003, '$50',  '$120,000'),
(1000004, '$100', '$200,000'),
(1000005, '$35',  '$100,000'),
(1000006, '$35',  '$100,000'),
(1000007, '$35',  '$100,000'),
(1000008, '$30', '$1,000'),
(1000009, '$30', '$1,000'),
(1000010, '$40', '$1,000'),
(1000011, '$30', '$1,000'),
(1000012, '$25', '$1,000'),
(1000013, '$22', '$1,000'),
(1000014, '$22', '$1,000'),
(1000015, '$18', '$1,000'),
(1000016, '$20', '$1,000'),
(1000017, '$40', '$1,000'),
(1000018, '$30', '$1,000'),
(1000019, '$30', '$1,000'),
(1000020, '$40', '$1,000'),
(1000021, '$30', '$1,000'),
(1000022, '$25', '$1,000'),
(1000023, '$22', '$1,000'),
(1000024, '$22', '$1,000'),
(1000025, '$18', '$1,000'),
(1000026, '$20', '$1,000'),
(1000027, '$40', '$1,000'),
(1000028, '$30', '$1,000'),
(1000029, '$30', '$1,000'),
(1000030, '$40', '$1,000'),
(1000031, '$30', '$1,000'),
(1000032, '$25', '$1,000'),
(1000033, '$22', '$1,000'),
(1000034, '$22', '$1,000'),
(1000035, '$18', '$1,000'),
(1000036, '$20', '$1,000'),
(1000037, '$40', '$1,000'),
(1000038, '$30', '$1,000'),
(1000039, '$30', '$1,000'),
(1000040, '$40', '$1,000'),
(1000041, '$30', '$1,000'),
(1000042, '$25', '$1,000'),
(1000043, '$22', '$1,000'),
(1000044, '$22', '$1,000'),
(1000045, '$18', '$1,000'),
(1000046, '$20', '$1,000'),
(1000047, '$40', '$1,000'),
(1000048, '$40', '$5,000'),
(1000049, '$34', '$3,000'),
(1000050, '$42', '$5,000'),
(1000051, '$34', '$3,000'),
(1000052, '$40', '$5,000'),
(1000053, '$34', '$3,000'),
(1000054, '$30', '$1,000'),
(1000055, '$30', '$1,000'),
(1000056, '$40', '$1,000'),
(1000057, '$30', '$1,000'),
(1000058, '$25', '$1,000'),
(1000059, '$22', '$1,000'),
(1000060, '$22', '$1,000'),
(1000061, '$18', '$1,000'),
(1000062, '$20', '$1,000'),
(1000063, '$35', '$1,000'),
(1000064, '$40', '$1,000'),
(1000065, '$30', '$1,000'),
(1000066, '$30', '$1,000'),
(1000067, '$40', '$1,000'),
(1000068, '$30', '$1,000'),
(1000069, '$25', '$1,000'),
(1000070, '$22', '$1,000'),
(1000071, '$22', '$1,000'),
(1000072, '$18', '$1,000'),
(1000073, '$20', '$1,000'),
(1000074, '$35', '$1,000'),
(1000075, '$40', '$1,000'),
(1000076, '$30', '$1,000'),
(1000077, '$30', '$1,000'),
(1000078, '$40', '$1,000'),
(1000079, '$30', '$1,000'),
(1000080, '$25', '$1,000'),
(1000081, '$22', '$1,000'),
(1000082, '$22', '$1,000'),
(1000083, '$18', '$1,000'),
(1000084, '$20', '$1,000'),
(1000085, '$35', '$1,000'),
(1000086, '$40', '$1,000'),
(1000087, '$30', '$1,000'),
(1000088, '$30', '$1,000'),
(1000089, '$40', '$1,000'),
(1000090, '$30', '$1,000'),
(1000091, '$25', '$1,000'),
(1000092, '$22', '$1,000'),
(1000093, '$22', '$1,000'),
(1000094, '$18', '$1,000'),
(1000095, '$20', '$1,000'),
(1000096, '$35', '$1,000'),
(1000097, '$40', '$1,000'),
(1000098, '$30', '$10,000'),
(1000099, '$30', '$10,000'),
(1000100, '$40', '$10,000'),
(1000101, '$30', '$10,000'),
(1000102, '$25', '$10,000'),
(1000103, '$22', '$10,000'),
(1000104, '$22', '$10,000'),
(1000105, '$18', '$10,000'),
(1000106, '$40', '$10,000'),
(1000107, '$40', '$10,000'),
(1000108, '$40', '$10,000'),
(1000109, '$40', '$10,000'),
(1000110, '$40', '$10,000'),
(1000111, '$40', '$10,000'),
(1000112, '$40', '$10,000'),
(1000113, '$40', '$10,000'),
(1000114, '$40', '$10,000'),
(1000115, '$40', '$10,000'),
(1000116, '$40', '$10,000'),
(1000117, '$40', '$10,000'),
(1000118, '$40', '$10,000'),
(1000119, '$40', '$10,000'),
(1000120, '$40', '$10,000'),
(1000121, '$40', '$10,000'),
(1000122, '$40', '$10,000'),
(1000123, '$40', '$10,000'),
(1000124, '$40', '$10,000'),
(1000125, '$40', '$10,000'),
(1000126, '$40', '$10,000'),
(1000127, '$40', '$10,000'),
(1000128, '$40', '$10,000'),
(1000129, '$40', '$10,000'),
(1000130, '$40', '$10,000'),
(1000131, '$40', '$10,000'),
(1000132, '$40', '$10,000'),
(1000133, '$40', '$10,000'),
(1000134, '$40', '$10,000'),
(1000135, '$40', '$10,000'),
(1000136, '$40', '$10,000'),
(1000137, '$40', '$10,000'),
(1000138, '$40', '$10,000'),
(1000139, '$40', '$10,000'),
(1000140, '$40', '$10,000'),
(1000141, '$40', '$10,000'),
(1000142, '$40', '$10,000'),
(1000143, '$40', '$10,000'),
(1000144, '$40', '$10,000'),
(1000145, '$40', '$10,000'),
(1000146, '$40', '$10,000'),
(1000147, '$40', '$10,000'),
(1000148, '$40', '$10,000'),
(1000149, '$40', '$10,000'),
(1000150, '$40', '$10,000'),
(1000151, '$40', '$10,000'),
(1000152, '$40', '$10,000'),
(1000153, '$40', '$10,000'),
(1000154, '$30', '$10,000'),
(1000155, '$30', '$10,000'),
(1000156, '$40', '$10,000'),
(1000157, '$15', '$0'),
(1000158, '$25', '$10,000'),
(1000159, '$22', '$10,000'),
(1000160, '$22', '$10,000'),
(1000161, '$15', '$0'),
(1000162, '$25', '$10,000'),
(1000163, '$22', '$10,000'),
(1000164, '$22', '$10,000'),
(1000165, '$15', '$0'),
(1000166, '$30', '$1,000'),
(1000167, '$30', '$1,000'),
(1000168, '$20', '$1,000'),
(1000169, '$30', '$1,000'),
(1000170, '$25', '$1,000'),
(1000171, '$22', '$1,000'),
(1000172, '$22', '$1,000'),
(1000173, '$18', '$1,000'),
(1000174, '$35', '$2,250'),
(1000175, '$35', '$2,500'),
(1000176, '$28', '$1,000'),
(1000177, '$24', '$1,000'),
(1000178, '$29', '$1,000'),
(1000179, '$31', '$1,000'),
(1000180, '$40', '$1,000'),
(1000181, '$20', '$0'),
(1000182, '$35', '$2,250'),
(1000183, '$35', '$2,500'),
(1000184, '$28', '$1,000'),
(1000185, '$24', '$1,000'),
(1000186, '$29', '$1,000'),
(1000187, '$31', '$1,000'),
(1000188, '$40', '$1,000'),
(1000189, '$20', '$0'),
(1000190, '$35', '$2,250'),
(1000191, '$35', '$2,500'),
(1000192, '$28', '$1,000'),
(1000193, '$24', '$1,000'),
(1000194, '$29', '$1,000'),
(1000195, '$31', '$1,000'),
(1000196, '$40', '$1,000'),
(1000197, '$20', '$0'),
(1000198, '$35', '$2,250'),
(1000199, '$16', '$0'),
(1000200, '$20', '$1,000'),
(1000201, '$28', '$1,000'),
(1000202, '$20', '$1,000'),
(1000203, '$15', '$0'),
(1000204, '$29', '$1,000'),
(1000205, '$20', '$1,000'),
(1000206, '$15.50', '$0'),
(1000207, '$20', '$2,250'),
(1000208, '$20', '$2,250'),
(1000209, '$30', '$2,250'),
(1000210, '$40', '$2,250'),
(1000211, '$20', '$2,250'),
(1000212, '$40', '$2,250'),
(1000213, '$20', '$2,250'),
(1000214, '$20', '$2,250'),
(1000215, '$30', '$2,250'),
(1000216, '$40', '$2,250'),
(1000217, '$20', '$2,250'),
(1000218, '$40', '$2,250'),
(1000219, '$20', '$2,250'),
(1000220, '$20', '$2,250'),
(1000221, '$30', '$2,250'),
(1000222, '$40', '$2,250'),
(1000223, '$20', '$2,250'),
(1000224, '$40', '$2,250'),
(1000225, '$40', '$10,000'),
(1000226, '$40', '$10,000'),
(1000227, '$40', '$10,000'),
(1000228, '$40', '$10,000'),
(1000229, '$40', '$10,000'),
(1000230, '$40', '$10,000'),
(1000231, '$40', '$10,000'),
(1000232, '$40', '$10,000'),
(1000233, '$40', '$10,000'),
(1000234, '$40', '$10,000'),
(1000235, '$40', '$10,000'),
(1000236, '$40', '$10,000'),
(1000237, '$40', '$10,000'),
(1000238, '$40', '$10,000'),
(1000239, '$40', '$10,000'),
(1000240, '$40', '$10,000'),
(1000241, '$40', '$10,000'),
(1000242, '$40', '$10,000'),
(1000243, '$40', '$10,000'),
(1000244, '$40', '$10,000'),
(1000245, '$40', '$10,000'),
(1000246, '$40', '$10,000'),
(1000247, '$40', '$10,000'),
(1000248, '$35', '$10,000'),
(1000249, '$30', '$10,000'),
(1000250, '$40', '$10,000'),
(1000251, '$16', '$0'),
(1000252, '$50', '$90,000'),
(1000253, '$50', '$90,000'),
(1000254, '$50', '$90,000'),
(1000255, '$50', '$90,000'),
(1000256, '$50', '$90,000'),
(1000257, '$50', '$90,000'),
(1000258, '$50', '$90,000'),
(1000259, '$50', '$90,000'),
(1000260, '$50', '$90,000'),
(1000261, '$50', '$90,000'),
(1000262, '$50', '$90,000');


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-01-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-02-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-03-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-04-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 3:41:56 PM */
-- Update benefits package details
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Check benefits package exists
SELECT benefits_package_id
FROM benefits
WHERE benefits_package_id = '2';

UPDATE benefits
SET
	health_insurance_provider = 'ALL STATE'
WHERE benefits_package_id = '2'
RETURNING benefits_package_id;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 3:44:56 PM */
-- Update employee details
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Check employee exists
SELECT employee_id
FROM employee
WHERE employee_id = '1000004';
UPDATE employee
SET
	last_name = 'SILVER',
	job_id = '6'
WHERE employee_id = '1000004';
COMMIT;
END TRANSACTION;

/* 12/1/2021, 3:47:06 PM */
-- Create new benefits package
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO benefits (health_insurance_provider,amount,stock_options,retirement_plan)
VALUES ('ALL STATE','5000','NASDAQ','2050 RETIREMENT B')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 3:57:36 PM */
-- Create a new payroll entry for every assigned employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '2021-01-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc
RETURNING *;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 3:59:22 PM */
-- Delete all tables
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DROP TABLE IF EXISTS payroll          CASCADE;
DROP TABLE IF EXISTS benefits         CASCADE;
DROP TABLE IF EXISTS salary           CASCADE;
DROP TABLE IF EXISTS leave            CASCADE;
DROP TABLE IF EXISTS department       CASCADE;
DROP TABLE IF EXISTS job_location     CASCADE;
DROP TABLE IF EXISTS job              CASCADE;
DROP TABLE IF EXISTS employee         CASCADE;
DROP TABLE IF EXISTS employee_address CASCADE;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 3:59:23 PM */
-- Recreate tables from script
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Run these commands in ElephantSQL postgres database in browser tab to recreate starting tables for local testing

CREATE TABLE benefits (
  benefits_package_id        INT          GENERATED ALWAYS AS IDENTITY, 
  amount                     MONEY        NOT NULL,
  stock_options              VARCHAR(100), 
  health_insurance_provider  VARCHAR(100) NOT NULL CHECK(health_insurance_provider ~ '^[A-Z \d]+$'),
  retirement_plan            VARCHAR(100),

  PRIMARY KEY(benefits_package_id)
);


CREATE TABLE employee_address (
  address_id      INT           GENERATED ALWAYS AS IDENTITY,
  street_address  VARCHAR(100)  NOT NULL CHECK(street_address ~ '^[A-Z \/\d#\.,-]+$'),   -- Includes appt/po box info and locality info if applicable
  city            VARCHAR(50)   NOT NULL CHECK(city ~ '^[A-Z ]+$'), -- Also serves as post town if applicable
  zip_code        VARCHAR(16)   CHECK(zip_code ~ '^[\d \-A-Z]+$'), -- Also serves as postcode if applicable
  state           VARCHAR(50)   CHECK(state ~ '^[A-Z ]+$'), -- Also serves as province if applicable
  country         VARCHAR(50)   NOT NULL CHECK(country ~ '^[A-Z ]+$'),   -- Also serves as region if applicable

  PRIMARY KEY(address_id)
);


CREATE TABLE job_location (
  location_id   INT GENERATED ALWAYS AS IDENTITY,
  airport_id    INT,
  address_id    INT NOT NULL,
  flight_id     INT,
  location_name VARCHAR(50),

  PRIMARY KEY(location_id)
);


CREATE TABLE department (
  department_id       INT          GENERATED ALWAYS AS IDENTITY,
  department_name     VARCHAR(50)  NOT NULL CHECK(department_name ~ '^[A-Z ]+$'),
  creation_date       DATE         NOT NULL, 
  department_head_id  INT,

  PRIMARY KEY(department_id)
);


CREATE TABLE job (
  job_id              INT         GENERATED ALWAYS AS IDENTITY, 
  job_title           VARCHAR(50) NOT NULL CHECK(job_title ~ '^[A-Z \-]+$'),
  department_id       INT         NOT NULL, 
  location_id         INT         NOT NULL,
  weekly_hours        INT         DEFAULT 40 CHECK(weekly_hours <= 168),
  benefits_package_id INT         DEFAULT 0 NOT NULL,

  PRIMARY KEY(job_id),
  FOREIGN KEY(department_id)
    REFERENCES department(department_id)
    ON DELETE CASCADE,

  FOREIGN KEY(location_id)
    REFERENCES job_location(location_id)
    ON DELETE CASCADE,

  FOREIGN KEY(benefits_package_id)
    REFERENCES benefits(benefits_package_id)
    ON DELETE SET DEFAULT
);


CREATE TABLE employee (
  employee_id INT           GENERATED ALWAYS AS IDENTITY (START WITH 1000000),
  first_name  VARCHAR(50)   NOT NULL CHECK(first_name ~ '^[A-Z ]+$'),
  m_initial   CHAR(1),  
  last_name   VARCHAR(50)   NOT NULL CHECK(last_name ~ '^[A-Z ]+$'),
  ssn         CHAR(9)       UNIQUE CHECK(ssn ~ '^\d{9}$'),
  dob         DATE          NOT NULL,
  gender      CHAR(1)       NOT NULL CHECK(gender ~ '^[MFO]$'),
  phone       VARCHAR(15)   CHECK(phone ~ '^\+[0-9]+$'),
  email       VARCHAR(100)  UNIQUE CHECK(email ~ '^[\w\.\+]{1,64}@(\w+\.[A-Za-z]+){1,100}$'),
  job_id      INT           DEFAULT 0 NOT NULL,
  address_id  INT           NOT NULL,
  manager_id  INT,

  PRIMARY KEY(employee_id),
  FOREIGN KEY(job_id)
    REFERENCES job(job_id)
    ON DELETE SET DEFAULT,

  FOREIGN KEY(address_id)
    REFERENCES employee_address(address_id),

  FOREIGN KEY(manager_id)
    REFERENCES employee(employee_id)
    ON DELETE SET NULL
);


CREATE TABLE salary (
  salary_id    INT    GENERATED ALWAYS AS IDENTITY,
  employee_id  INT    NOT NULL,
  hourly_wage  MONEY  NOT NULL,
  annual_bonus MONEY  DEFAULT 0 NOT NULL,

  PRIMARY KEY(salary_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE leave (
  leave_id    INT           GENERATED ALWAYS AS IDENTITY,
  employee_id INT           NOT NULL,
  date        DATE          NOT NULL,
  reason      VARCHAR(100)  NOT NULL CHECK(reason ~ '^[A-Z \.\d]+$'),
  status      VARCHAR(50)   NOT NULL CHECK(status ~ '^[A-Z \.\d]+$'),

  PRIMARY KEY(leave_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE payroll (
  payroll_id    INT       GENERATED ALWAYS AS IDENTITY,
  employee_id   INT       NOT NULL, 
  hours_worked  REAL      NOT NULL,
  pay_period    DATE      NOT NULL,
  tax_rate      REAL      NOT NULL,
  gross_income  MONEY     NOT NULL,
  taxed_income  MONEY     NOT NULL,
  net_income    MONEY     NOT NULL,
  
  UNIQUE(employee_id, pay_period),

  PRIMARY KEY(payroll_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


/* DEFAULTS */
ALTER TABLE department
ADD CONSTRAINT fk_head FOREIGN KEY (department_head_id) REFERENCES employee(employee_id);


INSERT INTO benefits OVERRIDING SYSTEM VALUE VALUES(0, 0, 0, 'UNASSIGNED', 0);

INSERT INTO job_location OVERRIDING SYSTEM VALUE VALUES(0, NULL, 0, NULL);

INSERT INTO department OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', '1980-1-1');

INSERT INTO job OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', 0, 0, 0, 0);


/* Initial populated tables */

-- Departments (based on https://www.avjobs.com/history/structure-of-the-airline-industry.asp)
INSERT INTO department (department_name, creation_date) VALUES 
('BOARD OF DIRECTORS',            '1980-01-01'),
('ENGINEERING AND MAINTENANCE',   '1980-01-01'),
('GROUND OPERATIONS',             '1980-01-01'),
('FLIGHT OPERATIONS',             '1980-01-01'),
('SALES AND MARKETING',           '1980-01-01'),
('RESERVATIONS AND TICKETING',    '1980-01-01'),
('FINANCE AND PROPERTY',          '1980-01-01'),
('INFORMATION SERVICES',          '1990-11-08'),
('PERSONNEL',                     '1980-01-01'),
('EMERGENCY SERVICES',            '1980-04-05'),
('LEGAL',                         '1981-03-11'),
('PUBLIC RELATIONS AND PLANNING', '1985-07-20');


-- Benefits
INSERT INTO benefits (amount, stock_options, health_insurance_provider, retirement_plan) VALUES
(1000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS A', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS A', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN A'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(6000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS C', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(10000, 'STOCK OPTIONS D', 'INSURANCE PROVIDER D', 'RETIREMENT PLAN D'),
(4500,  'STOCK OPTIONS D', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN C');


-- Job locations
INSERT INTO job_location (airport_id, address_id, flight_id, location_name) VALUES
(NULL,  1,  NULL, 'OFFICES IN CITY A'),
(NULL,  2,  NULL, 'OFFICES IN CITY B'),
(NULL,  6,  NULL, 'OFFICES IN CITY C'),

(1, 3,  NULL, 'AIRPORT IN CITY A'),
(1, 3,  100,  'AIRPORT IN CITY A'),
(1, 3,  101,  'AIRPORT IN CITY A'),
(1, 3,  102,  'AIRPORT IN CITY A'),
(1, 3,  103,  'AIRPORT IN CITY A'),

(2, 4,  NULL, 'AIRPORT A IN CITY B'),
(2, 4,  200,  'AIRPORT A IN CITY B'),
(2, 4,  201,  'AIRPORT A IN CITY B'),
(2, 4,  202,  'AIRPORT A IN CITY B'),
(2, 4,  203,  'AIRPORT A IN CITY B'),

(3, 5,  NULL, 'AIRPORT B IN CITY B'),
(3, 5,  300,  'AIRPORT B IN CITY B'),
(3, 5,  301,  'AIRPORT B IN CITY B'),
(3, 5,  302,  'AIRPORT B IN CITY B'),
(3, 5,  303,  'AIRPORT B IN CITY B'),

(4, 7,  NULL, 'AIRPORT IN CITY C'),
(4, 7,  400,  'AIRPORT IN CITY C'),
(4, 7,  401,  'AIRPORT IN CITY C'),
(4, 7,  402,  'AIRPORT IN CITY C'),
(4, 7,  403,  'AIRPORT IN CITY C');


-- Jobs (based on https://www.airlinejobfinder.com/members/airline-jobs/)
INSERT INTO job (job_title, department_id, location_id, weekly_hours, benefits_package_id) VALUES
-- Board of Directors (1)
('CHIEF EXECUTIVE OFFICER', 1,  2,  50, 9),
('CHAIRMAN',                1,  2,  40, 9),
('VICE CHAIR',              1,  2,  40, 9),
('BOARD SECRETARY',         1,  2,  40, 9),
('TREASURER',               1,  2,  40, 9),
('BOARD MEMBER',            1,  2,  40, 9),

-- Maintenance and Engineering (2)
('AVIATION MAINTENANCE TECHNICIAN', 2,  4,  40, 2),
('POWERPLANT MECHANIC',             2,  4,  40, 2),
('AIRFRAME MECHANIC',               2,  4,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  4,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  4,  40, 2),
('AIRCRAFT FUELER',                 2,  4,  40, 2),
('AVIONIC TECHNICIAN',              2,  4,  40, 2),
('CABIN MAINTENANCE',               2,  4,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  4,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  4,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  9,  40, 2),
('POWERPLANT MECHANIC',             2,  9,  40, 2),
('AIRFRAME MECHANIC',               2,  9,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  9,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  9,  40, 2),
('AIRCRAFT FUELER',                 2,  9,  40, 2),
('AVIONIC TECHNICIAN',              2,  9,  40, 2),
('CABIN MAINTENANCE',               2,  9,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  9,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  9,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  14,  40, 2),
('POWERPLANT MECHANIC',             2,  14,  40, 2),
('AIRFRAME MECHANIC',               2,  14,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  14,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  14,  40, 2),
('AIRCRAFT FUELER',                 2,  14,  40, 2),
('AVIONIC TECHNICIAN',              2,  14,  40, 2),
('CABIN MAINTENANCE',               2,  14,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  14,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  14,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  19,  40, 2),
('POWERPLANT MECHANIC',             2,  19,  40, 2),
('AIRFRAME MECHANIC',               2,  19,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  19,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  19,  40, 2),
('AIRCRAFT FUELER',                 2,  19,  40, 2),
('AVIONIC TECHNICIAN',              2,  19,  40, 2),
('CABIN MAINTENANCE',               2,  19,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  19,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  19,  40, 2),

-- Ground Operations (3)
('DIRECTOR OF AVIATION',        3, 1, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 1, 40, 3),
('DIRECTOR OF AVIATION',        3, 2, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 2, 40, 3),
('DIRECTOR OF AVIATION',        3, 3, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 3, 40, 3),

('BAGGAGE HANDLER',               3,  4,  40, 5),
('SKYCAP',                        3,  4,  40, 5),
('CONCESSIONS',                   3,  4,  40, 5),
('AIRPORT GUIDE',                 3,  4,  40, 5),
('AIRPORT CUSTODIAN',             3,  4,  40, 1),
('OPERATIONS AGENT',              3,  4,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  4,  40, 3),
('PASSENGER SERVICE AGENT',       3,  4,  40, 3),
('RAMP PLANNER',                  3,  4,  40, 3),
('AIRLINE STATION AGENT',         3,  4,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  4,  40, 7),

('BAGGAGE HANDLER',               3,  9,  40, 5),
('SKYCAP',                        3,  9,  40, 5),
('CONCESSIONS',                   3,  9,  40, 5),
('AIRPORT GUIDE',                 3,  9,  40, 5),
('AIRPORT CUSTODIAN',             3,  9,  40, 1),
('OPERATIONS AGENT',              3,  9,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  9,  40, 3),
('PASSENGER SERVICE AGENT',       3,  9,  40, 3),
('RAMP PLANNER',                  3,  9,  40, 3),
('AIRLINE STATION AGENT',         3,  9,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  9,  40, 7),

('BAGGAGE HANDLER',               3,  14, 40, 5),
('SKYCAP',                        3,  14, 40, 5),
('CONCESSIONS',                   3,  14, 40, 5),
('AIRPORT GUIDE',                 3,  14, 40, 5),
('AIRPORT CUSTODIAN',             3,  14, 40, 1),
('OPERATIONS AGENT',              3,  14, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  14, 40, 3),
('PASSENGER SERVICE AGENT',       3,  14, 40, 3),
('RAMP PLANNER',                  3,  14, 40, 3),
('AIRLINE STATION AGENT',         3,  14, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  14, 40, 7),

('BAGGAGE HANDLER',               3,  19, 40, 5),
('SKYCAP',                        3,  19, 40, 5),
('CONCESSIONS',                   3,  19, 40, 5),
('AIRPORT GUIDE',                 3,  19, 40, 5),
('AIRPORT CUSTODIAN',             3,  19, 40, 1),
('OPERATIONS AGENT',              3,  19, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  19, 40, 3),
('PASSENGER SERVICE AGENT',       3,  19, 40, 3),
('RAMP PLANNER',                  3,  19, 40, 3),
('DISTRICT OPERATIONS MANAGER',   3,  19, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  19, 40, 7),

-- Flight Operations (4)
('FLIGHT DISPATCHER',       4,  4,  40, 6),
('AVIATION METEOROLOGIST',  4,  4,  40, 6),
('FLIGHT DISPATCHER',       4,  9,  40, 6),
('AVIATION METEOROLOGIST',  4,  9,  40, 6),
('FLIGHT DISPATCHER',       4,  14, 40, 6),
('AVIATION METEOROLOGIST',  4,  14, 40, 6),
('FLIGHT DISPATCHER',       4,  19, 40, 6),
('AVIATION METEOROLOGIST',  4,  19, 40, 6),

('CARGO CARRIER PILOT', 4,  5,  60, 6),
('COPORATE PILOT',      4,  5,  30, 6),
('CHARTER PILOT',       4,  5,  60, 6),

('CARGO CARRIER PILOT', 4,  6,  60, 6),
('COPORATE PILOT',      4,  6,  30, 6),
('CHARTER PILOT',       4,  6,  60, 6),

('CARGO CARRIER PILOT', 4,  7,  60, 6),
('COPORATE PILOT',      4,  7,  30, 6),
('CHARTER PILOT',       4,  7,  60, 6),

('CARGO CARRIER PILOT', 4,  8,  60, 6),
('COPORATE PILOT',      4,  8,  30, 6),
('CHARTER PILOT',       4,  8,  60, 6),

('CARGO CARRIER PILOT', 4,  10, 60, 6),
('COPORATE PILOT',      4,  10, 30, 6),
('CHARTER PILOT',       4,  10, 60, 6),

('CARGO CARRIER PILOT', 4,  11, 60, 6),
('COPORATE PILOT',      4,  11, 30, 6),
('CHARTER PILOT',       4,  11, 60, 6),

('CARGO CARRIER PILOT', 4,  12, 60, 6),
('COPORATE PILOT',      4,  12, 30, 6),
('CHARTER PILOT',       4,  12, 60, 6),

('CARGO CARRIER PILOT', 4,  13, 60, 6),
('COPORATE PILOT',      4,  13, 30, 6),
('CHARTER PILOT',       4,  13, 60, 6),

('CARGO CARRIER PILOT', 4,  15, 60, 6),
('COPORATE PILOT',      4,  15, 30, 6),
('CHARTER PILOT',       4,  15, 60, 6),

('CARGO CARRIER PILOT', 4,  16, 60, 6),
('COPORATE PILOT',      4,  16, 30, 6),
('CHARTER PILOT',       4,  16, 60, 6),

('CARGO CARRIER PILOT', 4,  17, 60, 6),
('COPORATE PILOT',      4,  17, 30, 6),
('CHARTER PILOT',       4,  17, 60, 6),

('CARGO CARRIER PILOT', 4,  18, 60, 6),
('COPORATE PILOT',      4,  18, 30, 6),
('CHARTER PILOT',       4,  18, 60, 6),

('CARGO CARRIER PILOT', 4,  20, 60, 6),
('COPORATE PILOT',      4,  20, 30, 6),
('CHARTER PILOT',       4,  20, 60, 6),

('CARGO CARRIER PILOT', 4,  21, 60, 6),
('COPORATE PILOT',      4,  21, 30, 6),
('CHARTER PILOT',       4,  21, 60, 6),

('CARGO CARRIER PILOT', 4,  22, 60, 6),
('COPORATE PILOT',      4,  22, 30, 6),
('CHARTER PILOT',       4,  22, 60, 6),

('CARGO CARRIER PILOT', 4,  23, 60, 6),
('COPORATE PILOT',      4,  23, 30, 6),
('CHARTER PILOT',       4,  23, 60, 6),

-- Sales and Marketing (5)
('REGIONAL SALES MANAGER',  5,  1,  40, 3),
('SALES REPRESENTATIVE',    5,  1,  40, 3),
('AIRLINE MARKETER',        5,  1,  40, 3),
('SALES INTERN',            5,  1,  20, 3),

('REGIONAL SALES MANAGER',  5,  2,  40, 3),
('SALES REPRESENTATIVE',    5,  2,  40, 3),
('AIRLINE MARKETER',        5,  2,  40, 3),
('SALES INTERN',            5,  2,  20, 3),

('REGIONAL SALES MANAGER',  5,  3,  40, 3),
('SALES REPRESENTATIVE',    5,  3,  40, 3),
('AIRLINE MARKETER',        5,  3,  40, 3),
('SALES INTERN',            5,  3,  20, 3),

-- Reservations and Ticketing (6)
('RESERVATION SALES AGENT', 6,  4,  40, 3),
('AIRLINE TICKET AGENT',    6,  4,  40, 3),

('RESERVATION SALES AGENT', 6,  9,  40, 3),
('AIRLINE TICKET AGENT',    6,  9,  40, 3),

('RESERVATION SALES AGENT', 6,  14, 40, 3),
('AIRLINE TICKET AGENT',    6,  14, 40, 3),

('RESERVATION SALES AGENT', 6,  19, 40, 3),
('AIRLINE TICKET AGENT',    6,  19, 40, 3),

-- Finance and Property (7)
('ACCOUNTANT',                7,  1,  40, 5),
('AUDITOR',                   7,  1,  40, 5),
('FINANCE ASSITANT',          7,  1,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  1,  40, 5),
('PAYROLL CLERK',             7,  1,  40, 5),
('FINANCIAL ANALYST',         7,  1,  40, 5),
('PAYROLL MANAGER',           7,  1,  40, 5),
('FINANCE INTERN',            7,  1,  20, 5),

('ACCOUNTANT',                7,  2,  40, 5),
('AUDITOR',                   7,  2,  40, 5),
('FINANCE ASSITANT',          7,  2,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  2,  40, 5),
('PAYROLL CLERK',             7,  2,  40, 5),
('FINANCIAL ANALYST',         7,  2,  40, 5),
('PAYROLL MANAGER',           7,  2,  40, 5),
('FINANCE INTERN',            7,  2,  20, 5),

('ACCOUNTANT',                7,  3,  40, 5),
('AUDITOR',                   7,  3,  40, 5),
('FINANCE ASSITANT',          7,  3,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  3,  40, 5),
('PAYROLL CLERK',             7,  3,  40, 5),
('FINANCIAL ANALYST',         7,  3,  40, 5),
('PAYROLL MANAGER',           7,  3,  40, 5),
('FINANCE INTERN',            7,  3,  20, 5),

-- Information services (8)
('IT SPECIALIST',     8,  1,  40, 3),
('IT INTERN',         8,  1,  20, 3),
('HELP DESK SUPPORT', 8,  1,  40, 3),

('IT SPECIALIST',     8,  2,  40, 3),
('HELP DESK SUPPORT', 8,  2,  40, 3),
('IT INTERN',         8,  2,  20, 3),

('IT SPECIALIST',     8,  3,  40, 3),
('HELP DESK SUPPORT', 8,  3,  40, 3),
('IT INTERN',         8,  3,  20, 3),

-- Personnel (9)
('SECRETARY',                   9,  1,  40, 3),
('MAIL CLERK',                  9,  1,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  1,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  1,  40, 3),
('RECEPTIONIST',                9,  1,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  1,  40, 3),

('SECRETARY',                   9,  2,  40, 3),
('MAIL CLERK',                  9,  2,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  2,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  2,  40, 3),
('RECEPTIONIST',                9,  2,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  2,  40, 3),

('SECRETARY',                   9,  3,  40, 3),
('MAIL CLERK',                  9,  3,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  3,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  3,  40, 3),
('RECEPTIONIST',                9,  3,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  3,  40, 3),

-- Emergency Services (10)
('FIREFIGHTER',           10,  4,  40, 10),
('FIREFIGHTER MEDIC',     10,  4,  40, 10),
('POLICE OFFICER',        10,  4,  40, 10),
('FIRE AND CRASH RESCUE', 10,  4,  30, 10),
('POLICE PATROL OFFICER', 10,  4,  30, 10),

('FIREFIGHTER',           10,  9,  40, 10),
('FIREFIGHTER MEDIC',     10,  9,  40, 10),
('POLICE OFFICER',        10,  9,  40, 10),
('FIRE AND CRASH RESCUE', 10,  9,  30, 10),
('POLICE PATROL OFFICER', 10,  9,  30, 10),

('FIREFIGHTER',           10,  14, 40, 10),
('FIREFIGHTER MEDIC',     10,  14, 40, 10),
('POLICE OFFICER',        10,  14, 40, 10),
('FIRE AND CRASH RESCUE', 10,  14, 30, 10),
('POLICE PATROL OFFICER', 10,  14, 30, 10),

('FIREFIGHTER',           10,  19, 40, 10),
('FIREFIGHTER MEDIC',     10,  19, 40, 10),
('POLICE OFFICER',        10,  19, 40, 10),
('FIRE AND CRASH RESCUE', 10,  19, 30, 10),
('POLICE PATROL OFFICER', 10,  19, 30, 10),

-- Legal (11)
('AVIATION ATTORNEY',  11,  1,  40, 7),
('AVIATION ATTORNEY',  11,  2,  40, 7),
('AVIATION ATTORNEY',  11,  3,  40, 7),

-- Public Relations and Planning (12)
('PUBLIC RELATIONS SPECIALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS GENERALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS MANAGER',    12,  2,  40, 3),
('PUBLIC RELATIONS INTERN',     12,  2,  20, 3),

('HEAD OF ENGINEERING',           2,  2,  40, 9),
('HEAD OF GROUND OPERATIONS',     3,  2,  40, 9),
('HEAD OF FLIGHT OPERATIONS',     4,  2,  40, 9),
('HEAD OF SALES',                 5,  2,  40, 9),
('HEAD OF RESERVATIONS',          6,  2,  40, 9),
('HEAD OF FINANCE',               7,  2,  40, 9),
('HEAD OF INFORMATION SERVICES',  8,  2,  40, 9),
('HEAD OF PERSONNEL MANAGEMENT',  9,  2,  40, 9),
('HEAD OF EMERGENCY SERVICES',    10, 2,  40, 9),
('HEAD OF LEGAL',                 11, 2,  40, 9),
('HEAD OF PUBLIC RELATIONS',      12, 2,  40, 9);


-- Employee Address
INSERT INTO employee_address (street_address, city, zip_code, state, country) VALUES
('123 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('123 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('321 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('555 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('9029 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('765 MAIN ST',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('767 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('876 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8770 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('202 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('101 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('896 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('909 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('920 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('808 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8760 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8755 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('423 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('202 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('101 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('896 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('909 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 SEAWATER LN',     'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8260 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8234 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8754 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('808 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8234 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8754 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SLEEPY HILLS',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 FISHWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MINOR ST',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 LION LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 JUMPY HILLS',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 FISHWATER ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MINOR RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 LION RD',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SLEEPY SLOPES',  'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('423 FISHWATER RD',    'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8777 MAIN ST',        'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('920 LONG LN',         'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 KLEINE DR',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 EINE DR',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 ROADY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 NEIN LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KLEINE DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 EINE DR',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 ROADY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KLEINE DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 EINE DR',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 ROADY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 ROCKY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 BUMPY HILLS',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 POOLWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 DIGGY LN',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 ZEBRA ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 MERRYWEATHER LN', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CHRONO ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('420 CLOUDY DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 MERRYWEATHER LN', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 CHRONO ST',      'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('420 CLOUDY DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 TIME ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 TIME ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 TIME ST',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 STEEL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 STEEL LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A');


-- Employee
INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOHN',      'H',        'SMITH',      '123456789', '1965-01-01',  'M',    '+15553219090', 'jsmith@company.org',     1,      1,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MARY',      NULL,       'ORLEANS',    '987654321', '1970-04-09',  'F',    '+15559990001', 'morleans@company.org',   2,      2,          1000000),
('HARRIS',    NULL,       'BEAUDRY',    '111223333', '1967-04-29',  'M',    '+15559990021', 'hbeaudry@company.org',   3,      3,          NULL),
('ANABEL',    'A',        'NEALIOUS',   '112345678', '1980-01-09',  'F',    '+15559990011', 'anaulious@company.org',  4,      4,          NULL),
('DON',       'E',        'SYLVER',     '112345688', '1969-11-24',  'M',    '+15559980011', 'dsylver@company.org',    5,      5,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BRENDON',   NULL,       'LAMBINO',    '112346689', '1965-11-24',  'M',    '+15559680011', 'blambino@company.org',   6,      6,          1000001),
('MYRTLE',    NULL,       'TRUOG',      '122345688', '1969-12-24',  'F',    '+16559980011', 'mtruog@company.org',     6,      7,          1000001),
('LASZLO',    NULL,       'LUAIN',      '111345688', '1971-02-24',  'M',    '+15567980011', 'lluain@company.org',     6,      8,          1000001);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '117345689', '1984-06-23',  'M',    '+15567980111', NULL,                     7,      9,          NULL),
('LATIFA',    NULL,       'BELTZ',      '117245689', '1984-02-24',  'F',    '+15569980011', NULL,                     8,      10,         NULL),
('ELINA',     NULL,       'HAUTUM',     '117445689', '1983-06-24',  'F',    '+15567900811', NULL,                     9,      11,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '117545689', '1983-08-12',  'M',    '+15567980211', NULL,                     10,     12,         NULL),
('SOLOMON',   'V',        'TERZI',      '117745689', '1984-09-23',  'M',    '+15567980311', NULL,                     11,     13,         NULL),
('QUINCTUS',  NULL,       'HART',       '113345689', '1990-12-19',  'M',    '+15567980411', NULL,                     12,     14,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '118345689', '1987-06-04',  'F',    '+15567980511', NULL,                     13,     15,         NULL),
('LAURENS',   NULL,       'RUSH',       '114345689', '1989-05-03',  'M',    '+15567980611', NULL,                     14,     16,         NULL),
('SHANNA',    'M',        'PLANCK',     '111342689', '1990-04-02',  'F',    '+15567980711', NULL,                     15,     17,         NULL),
('REINALDO',  'S',        'CLARK',      '117355689', '1988-03-01',  'M',    '+15567980811', NULL,                     16,     18,         NULL);


UPDATE employee
SET manager_id = 1000017
WHERE employee_id < 1000017 AND employee_id > 1000007;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PRINCE',    'S',        'BERGFALK',   '100000001', '1984-06-23',  'M',    '+15567180111', NULL,                     17,     19,         NULL),
('RICO',      NULL,       'MILFORD',    '100000002', '1984-02-24',  'M',    '+15569180011', NULL,                     18,     20,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000003', '1983-06-24',  'M',    '+15567100811', NULL,                     19,     21,         NULL),
('BENVENUTO', 'J',        'BRYAN',      '100000004', '1983-08-12',  'M',    '+15567180211', NULL,                     20,     22,         NULL),
('SARA',      'S',        'COKES',      '100000005', '1984-09-23',  'F',    '+15567180311', NULL,                     21,     23,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000006', '1990-12-19',  'F',    '+15567180411', NULL,                     22,     24,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000007', '1987-06-04',  'F',    '+15567180511', NULL,                     23,     25,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000008', '1989-05-03',  'F',    '+15567180611', NULL,                     24,     26,         NULL),
('KYLEE',     'M',        'DARROW',     '100000009', '1990-04-02',  'F',    '+15567180711', NULL,                     25,     27,         NULL),
('SHIRO',     'G',        'DARZI',      '100000010', '1988-03-01',  'M',    '+15567180811', NULL,                     26,     28,         NULL);


UPDATE employee
SET manager_id = 1000027
WHERE employee_id < 1000027 AND employee_id > 1000017;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'B',        'ANKEREN',    '100000011', '1984-06-23',  'M',    '+15566180111', NULL,                     27,     29,         NULL),
('RICO',      NULL,       'MILFORD',    '100000012', '1984-02-24',  'M',    '+15566180011', NULL,                     28,     30,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000013', '1983-06-24',  'M',    '+15566100811', NULL,                     29,     31,         NULL),
('BENVENUTO', 'A',        'BRYAN',      '100000014', '1983-08-12',  'M',    '+15566180211', NULL,                     30,     32,         NULL),
('SARA',      'T',        'COKES',      '100000015', '1984-09-23',  'F',    '+15566180311', NULL,                     31,     33,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000016', '1990-12-19',  'F',    '+15566180411', NULL,                     32,     34,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000017', '1987-06-04',  'F',    '+15566180511', NULL,                     33,     35,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000018', '1989-05-03',  'F',    '+15566180611', NULL,                     34,     36,         NULL),
('KYLEE',     'O',        'DARROW',     '100000019', '1990-04-02',  'F',    '+15566180711', NULL,                     35,     37,         NULL),
('SHIRO',     'K',        'DARZI',      '100000020', '1988-03-01',  'M',    '+15566180811', NULL,                     36,     38,         NULL);


UPDATE employee
SET manager_id = 1000037
WHERE employee_id < 1000037 AND employee_id > 1000027;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '100000031', '1985-06-13',  'M',    '+25567980221', NULL,                     37,     39,         NULL),
('LATIFA',    NULL,       'BELTZ',      '100000032', '1985-02-14',  'F',    '+25569980221', NULL,                     38,     40,         NULL),
('ELINA',     NULL,       'HAUTUM',     '100000033', '1985-06-14',  'F',    '+25567900221', NULL,                     39,     41,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '100000034', '1985-08-12',  'M',    '+25574980221', NULL,                     40,     42,         NULL),
('SOLOMON',   'V',        'TERZI',      '100000035', '1985-09-13',  'M',    '+25574880221', NULL,                     41,     43,         NULL),
('QUINCTUS',  NULL,       'HART',       '100000036', '1995-12-19',  'M',    '+25568980221', NULL,                     42,     44,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '100000037', '1985-06-14',  'F',    '+25577980221', NULL,                     43,     45,         NULL),
('LAURENS',   NULL,       'RUSH',       '100000038', '1985-05-13',  'M',    '+25587980221', NULL,                     44,     46,         NULL),
('SHANNA',    'M',        'PLANCK',     '100000039', '1995-04-12',  'F',    '+25569980221', NULL,                     45,     47,         NULL),
('REINALDO',  'Q',        'HART',       '100000040', '1985-03-11',  'M',    '+25560980221', NULL,                     46,     48,         NULL);


UPDATE employee
SET manager_id = 1000047
WHERE employee_id < 1000047 AND employee_id > 1000037;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAUTVYDAS', 'C',        'LANG',       '100000041', '1986-06-13',  'M',    '+15567980221', NULL,                     47,     49,         NULL),
('JOAKIM',    NULL,       'LEON',       '100000042', '1986-02-14',  'M',    '+15569980221', NULL,                     48,     50,         NULL),
('VALENTIN',  NULL,       'FIORE',      '100000043', '1986-06-14',  'M',    '+15567900221', NULL,                     49,     51,         NULL),
('SHAHIN',    'G',        'HOBBES',     '100000044', '1986-08-12',  'M',    '+15574980221', NULL,                     50,     52,         NULL),
('EVITA',     'I',        'ACHTEROP',   '100000045', '1986-09-13',  'F',    '+15574880221', NULL,                     51,     53,         NULL),
('REINALDO',  'I',        'CLARKE',     '100000046', '1986-03-11',  'M',    '+15560980221', NULL,                     52,     54,         NULL);


UPDATE employee
SET manager_id = employee_id - 1
WHERE employee_id IN (1000049, 1000051, 1000053);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'J',        'DUPUY',      '100000047', '1984-06-23',  'M',    '+15867980221', NULL,                     53,     55,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000048', '1994-02-24',  'M',    '+15869980221', NULL,                     54,     56,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000049', '1984-06-24',  'F',    '+15867900221', NULL,                     55,     57,         NULL),
('LOLA',      'I',        'PATTERSON',  '100000050', '1984-08-22',  'F',    '+15874980221', NULL,                     56,     58,         NULL),
('DEIRDRE',   'R',        'STRANGE',    '100000051', '1984-09-23',  'F',    '+15874880221', NULL,                     57,     59,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000052', '1964-12-29',  'M',    '+15868980221', NULL,                     58,     60,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000053', '1984-06-24',  'F',    '+15877980221', NULL,                     59,     61,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000054', '1964-05-23',  'M',    '+15887980221', NULL,                     60,     62,         NULL),
('VALERIAN',  'M',        'DABNEY',     '100000055', '1994-04-22',  'F',    '+15869580221', NULL,                     61,     63,         NULL),
('LIANE',     'M',        'MARIA',      '100000056', '1994-04-22',  'F',    '+15869380221', NULL,                     62,     64,         NULL),
('TAAVI',     'B',        'HOUBEN',     '100000057', '1984-03-21',  'M',    '+15860980221', NULL,                     63,     65,         NULL);


UPDATE employee
SET manager_id = 1000063
WHERE employee_id < 1000065 AND employee_id > 1000053 AND NOT employee_id = 1000063;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'A',        'DUPUY',      '100000058', '1982-04-23',  'M',    '+15867910221', NULL,                     64,     66,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000059', '1992-12-24',  'M',    '+15869910221', NULL,                     65,     67,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000060', '1982-04-24',  'F',    '+15867510221', NULL,                     66,     68,         NULL),
('LOLA',      'A',        'PATTERSON',  '100000061', '1982-06-22',  'F',    '+15874910221', NULL,                     67,     69,         NULL),
('DEIRDRE',   'A',        'STRANGE',    '100000062', '1982-07-23',  'F',    '+15874810221', NULL,                     68,     70,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000063', '1962-12-29',  'M',    '+15868910221', NULL,                     69,     71,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000064', '1982-04-24',  'F',    '+15877910221', NULL,                     70,     72,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000065', '1962-03-23',  'M',    '+15887910221', NULL,                     71,     73,         NULL),
('VALERIAN',  'A',        'DABNEY',     '100000066', '1992-02-22',  'F',    '+15869510221', NULL,                     72,     74,         NULL),
('BRIGITTA',  'A',        'MATHEWSON',  '100000067', '1992-02-22',  'F',    '+15869310221', NULL,                     73,     75,         NULL),
('TAAVI',     'A',        'HOUBEN',     '100000068', '1982-01-21',  'M',    '+15860910221', NULL,                     74,     76,         NULL);


UPDATE employee
SET manager_id = 1000074
WHERE employee_id < 1000076 AND employee_id > 1000064 AND NOT employee_id = 1000074;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000069', '1988-04-23',  'M',    '+15867910361', NULL,                     75,     77,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000070', '1998-12-24',  'F',    '+15869910361', NULL,                     76,     78,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000071', '1988-04-24',  'F',    '+15867510361', NULL,                     77,     79,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000072', '1988-06-22',  'F',    '+15874910361', NULL,                     78,     80,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000073', '1988-07-23',  'M',    '+15874810361', NULL,                     79,     81,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000074', '1968-12-29',  'M',    '+15868910361', NULL,                     80,     82,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000075', '1988-04-24',  'M',    '+15877910361', NULL,                     81,     83,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000076', '1968-03-23',  'M',    '+15887910361', NULL,                     82,     84,         NULL),
('SUNE',      'P',        'FOSSE',      '100000077', '1998-02-22',  'F',    '+15869510361', NULL,                     83,     85,         NULL),
('GEORGETA',  'L',        'ALLARD',     '100000078', '1998-02-22',  'F',    '+15869310361', NULL,                     84,     86,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000079', '1988-01-21',  'F',    '+15860910361', NULL,                     85,     87,         NULL);


UPDATE employee
SET manager_id = 1000085
WHERE employee_id < 1000087 AND employee_id > 1000075 AND NOT employee_id = 1000085;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000080', '1988-04-23',  'M',    '+25867910361', NULL,                     86,     88,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000081', '1998-12-24',  'F',    '+25869910361', NULL,                     87,     89,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000082', '1988-04-24',  'F',    '+25867510361', NULL,                     88,     90,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000083', '1988-06-22',  'F',    '+25874910361', NULL,                     89,     91,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000084', '1988-07-23',  'M',    '+25874810361', NULL,                     90,     92,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000085', '1968-12-29',  'M',    '+25868910361', NULL,                     91,     93,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000086', '1988-04-24',  'M',    '+25877910361', NULL,                     92,     94,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000087', '1968-03-23',  'M',    '+25887910361', NULL,                     93,     95,         NULL),
('SUNE',      'P',        'FOSSE',      '100000088', '1998-02-22',  'F',    '+25869510361', NULL,                     94,     96,         NULL),
('SANDRA',    'M',        'ALLARD',     '100000089', '1998-02-22',  'F',    '+25869310361', NULL,                     95,     97,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000090', '1988-01-21',  'F',    '+25860910361', NULL,                     96,     98,         NULL);


UPDATE employee
SET manager_id = 1000096
WHERE employee_id < 1000098 AND employee_id > 1000086 AND NOT employee_id = 1000096;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000091', '1988-04-23',  'M',    '+15067910361', NULL,                     97,     99,         1000063),
('KRISTIN',   NULL,       'SCRIVEN',    '100000092', '1998-12-24',  'F',    '+15069910361', NULL,                     98,     100,        1000063),
('MONIKA',    NULL,       'INGESSON',   '100000093', '1988-04-24',  'F',    '+15067510361', NULL,                     99,     101,        1000074),
('VASIA',     'K',        'MIYAZAKI',   '100000094', '1988-06-22',  'F',    '+15074910361', NULL,                     100,    102,        1000074),
('FAIRUZ',    'H',        'BYRD',       '100000095', '1988-07-23',  'M',    '+15074810361', NULL,                     101,    103,        1000085),
('SULEYMAN',  NULL,       'KURZMANN',   '100000096', '1968-12-29',  'M',    '+15068910361', NULL,                     102,    104,        1000085),
('FELIX',     NULL,       'LINDQVIST',  '100000097', '1988-04-24',  'M',    '+25077910361', NULL,                     103,    105,        1000096),
('TSHEPO',    NULL,       'BEST',       '100000098', '1968-03-23',  'M',    '+25087910361', NULL,                     104,    106,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'S',        'CORNELL',    '100000099', '1988-04-23',  'M',    NULL,           NULL,                     105,    107,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000100', '1998-12-24',  'F',    NULL,           NULL,                     106,    108,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000101', '1988-04-24',  'F',    NULL,           NULL,                     107,    109,        NULL),
('VASIA',     'R',        'MIYAZAKI',   '100000102', '1988-06-22',  'F',    NULL,           NULL,                     108,    110,        NULL),
('FAIRUZ',    'Q',        'BYRD',       '100000103', '1988-07-23',  'M',    NULL,           NULL,                     109,    111,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000104', '1968-12-29',  'M',    NULL,           NULL,                     110,    112,        NULL),
('NAMEY',     NULL,       'LINDQVIST',  '100000105', '1988-04-24',  'M',    NULL,           NULL,                     111,    113,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000106', '1988-04-24',  'M',    NULL,           NULL,                     112,    114,        NULL),
('HIDEKI',    'P',        'CORNELL',    '100000107', '1988-04-23',  'M',    NULL,           NULL,                     113,    115,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000108', '1998-12-24',  'F',    NULL,           NULL,                     114,    116,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000109', '1988-04-24',  'F',    NULL,           NULL,                     115,    117,        NULL),
('VASIA',     'O',        'MIYAZAKI',   '100000110', '1988-06-22',  'F',    NULL,           NULL,                     116,    118,        NULL),
('FAIRUZ',    'N',        'BYRD',       '100000111', '1988-07-23',  'M',    NULL,           NULL,                     117,    119,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000112', '1968-12-29',  'M',    NULL,           NULL,                     118,    120,        NULL),
('AMY',       NULL,       'LINDQVIST',  '100000113', '1988-04-24',  'F',    NULL,           NULL,                     119,    121,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000114', '1988-04-24',  'M',    NULL,           NULL,                     120,    122,        NULL),
('HIDEKI',    'M',        'CORNELL',    '100000115', '1988-04-23',  'M',    NULL,           NULL,                     121,    123,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000116', '1998-12-24',  'F',    NULL,           NULL,                     122,    124,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000117', '1988-04-24',  'F',    NULL,           NULL,                     123,    125,        NULL),
('VASIA',     'L',        'MIYAZAKI',   '100000118', '1988-06-22',  'F',    NULL,           NULL,                     124,    126,        NULL),
('FAIRUZ',    'K',        'BYRD',       '100000119', '1988-07-23',  'M',    NULL,           NULL,                     125,    127,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000120', '1968-12-29',  'M',    NULL,           NULL,                     126,    128,        NULL),
('FELIX',     NULL,       'ULG',        '100000121', '1988-04-24',  'M',    NULL,           NULL,                     127,    129,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000122', '1988-04-24',  'M',    NULL,           NULL,                     128,    130,        NULL),
('HIDEKI',    'J',        'CORNELL',    '100000123', '1988-04-23',  'M',    NULL,           NULL,                     129,    131,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000124', '1998-12-24',  'F',    NULL,           NULL,                     130,    132,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000125', '1988-04-24',  'F',    NULL,           NULL,                     131,    133,        NULL),
('VASIA',     'H',        'MIYAZAKI',   '100000126', '1988-06-22',  'F',    NULL,           NULL,                     132,    134,        NULL),
('FAIRUZ',    'I',        'BYRD',       '100000127', '1988-07-23',  'M',    NULL,           NULL,                     133,    135,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000128', '1968-12-29',  'M',    NULL,           NULL,                     134,    136,        NULL),
('FELIX',     NULL,       'KURZMANN',   '100000129', '1988-04-24',  'M',    NULL,           NULL,                     135,    137,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000130', '1988-04-24',  'M',    NULL,           NULL,                     136,    138,        NULL),
('HIDEKI',    'G',        'CORNELL',    '100000131', '1988-04-23',  'M',    NULL,           NULL,                     137,    139,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000132', '1998-12-24',  'F',    NULL,           NULL,                     138,    140,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000133', '1988-04-24',  'F',    NULL,           NULL,                     139,    141,        NULL),
('VASIA',     'F',        'MIYAZAKI',   '100000134', '1988-06-22',  'F',    NULL,           NULL,                     140,    142,        NULL),
('FAIRUZ',    'E',        'BYRD',       '100000135', '1988-07-23',  'M',    NULL,           NULL,                     141,    143,        NULL),
('HERSHALL',  NULL,       'KURZMANN',   '100000136', '1968-12-29',  'M',    NULL,           NULL,                     142,    144,        NULL),
('JEREMY',    NULL,       'LINDQVIST',  '100000137', '1988-04-24',  'M',    NULL,           NULL,                     143,    145,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000138', '1988-04-24',  'M',    NULL,           NULL,                     144,    146,        NULL),
('HIDEKI',    'C',        'CORNELL',    '100000139', '1988-04-23',  'M',    NULL,           NULL,                     145,    147,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000140', '1998-12-24',  'F',    NULL,           NULL,                     146,    148,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000141', '1988-04-24',  'F',    NULL,           NULL,                     147,    149,        NULL),
('VASIA',     'B',        'MIYAZAKI',   '100000142', '1988-06-22',  'F',    NULL,           NULL,                     148,    150,        NULL),
('MARK',      'A',        'BYRD',       '100000143', '1988-07-23',  'M',    NULL,           NULL,                     149,    151,        NULL),
('JOHN',      NULL,       'KURZMANN',   '100000144', '1968-12-29',  'M',    NULL,           NULL,                     150,    152,        NULL),
('KARL',      NULL,       'LINDQVIST',  '100000145', '1988-04-24',  'M',    NULL,           NULL,                     151,    153,        NULL),
('JOHN',      NULL,       'LINDQVIST',  '100000146', '1988-04-24',  'M',    NULL,           NULL,                     152,    154,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PROPSPER',  'S',        'ALFERINK',   '100000147', '1988-04-23',  'M',    NULL,           NULL,                     153,    155,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BEATRICE',  'S',        'ABBADELLI',  '100000148', '1988-04-23',  'F',    NULL,           NULL,                     154,    156,        1000154),
('KUROSH',    NULL,       'ABBADELLI',  '100000149', '1988-04-23',  'M',    NULL,           NULL,                     155,    157,        1000154),
('LUKAS',     NULL,       'ABBADELLI',  '100000150', '1988-04-23',  'M',    NULL,           NULL,                     156,    158,        1000154);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000151', '1988-04-23',  'M',    NULL,           NULL,                     157,    159,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('FRANCO',    'S',        'CALVO',      '100000152', '1989-04-23',  'M',    NULL,           NULL,                     158,    160,        1000158),
('ALVA',      NULL,       'SERAFINI',   '100000153', '1989-05-23',  'F',    NULL,           NULL,                     159,    161,        1000158),
('LUKAS',     NULL,       'CALVO',      '100000154', '1985-08-28',  'M',    NULL,           NULL,                     160,    162,        1000158);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000155', '1988-04-23',  'M',    NULL,           NULL,                     161,    163,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'S',        'JEANS',      '100000156', '1989-04-23',  'M',    NULL,           NULL,                     162,    164,        1000162),
('HARRY',     NULL,       'NOSE',       '100000157', '1989-05-23',  'M',    NULL,           NULL,                     163,    165,        1000162),
('BARNEY',    NULL,       'BILLS',      '100000158', '1985-08-28',  'M',    NULL,           NULL,                     164,    166,        1000162);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'J',        'JEANS',      '100000159', '1989-04-23',  'M',    NULL,           NULL,                     165,    167,        1000063),
('HARRY',     NULL,       'NOSEN',      '100000160', '1989-05-23',  'M',    NULL,           NULL,                     166,    168,        1000063),
('BARNEY',    NULL,       'BILLS',      '100000161', '1985-08-28',  'M',    NULL,           NULL,                     167,    169,        1000074),
('JIMMY',     'P',        'JEANS',      '100000162', '1989-04-23',  'M',    NULL,           NULL,                     168,    170,        1000074),
('BARRY',     NULL,       'NOSE',       '100000163', '1989-05-23',  'M',    NULL,           NULL,                     169,    171,        1000085),
('BARNEY',    NULL,       'BILLS',      '100000164', '1985-08-28',  'M',    NULL,           NULL,                     170,    172,        1000085),
('JIMMOTHY',  'S',        'JENSON',     '100000165', '1989-04-23',  'M',    NULL,           NULL,                     171,    173,        1000096),
('LARRY',     NULL,       'NOSE',       '100000166', '1989-05-23',  'M',    NULL,           NULL,                     172,    174,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANNE',      'S',        'PERROT',     '100000167', '1975-04-23',  'F',    NULL,           NULL,                     173,    175,        NULL),
('SAWDA',     NULL,       'PAPOUTSIS',  '100000168', '1975-05-23',  'F',    NULL,           NULL,                     174,    176,        NULL),
('BARNEY',    NULL,       'DINO',       '100000169', '1974-08-28',  'M',    NULL,           NULL,                     175,    177,        NULL),
('JACOBA',    'A',        'PENA',       '100000170', '1974-04-23',  'M',    NULL,           NULL,                     176,    178,        NULL),
('SEONG',     NULL,       'KOOLS',      '100000171', '1974-05-23',  'F',    NULL,           NULL,                     177,    179,        NULL),
('IKENNA',    NULL,       'ROMILLY',    '100000172', '1974-08-28',  'F',    NULL,           NULL,                     178,    180,        NULL),
('FERNANDO',  'V',        'BRICE',      '100000173', '1974-04-23',  'M',    NULL,           NULL,                     179,    181,        NULL),
('HORACIO',   NULL,       'KURZ',       '100000174', '1974-05-23',  'M',    NULL,           NULL,                     180,    182,        NULL);


UPDATE employee
SET manager_id = 1000179
WHERE employee_id IN (1000176, 1000177, 1000181);


UPDATE employee
SET manager_id = 1000180
WHERE employee_id IN (1000174, 1000175, 1000178, 1000179);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'WILDGRUBE',  '100000175', '1975-04-23',  'F',    NULL,           NULL,                     181,    183,        NULL),
('STARR',     NULL,       'GARNETT',    '100000176', '1975-05-23',  'F',    NULL,           NULL,                     182,    184,        NULL),
('PING',      NULL,       'DINO',       '100000177', '1974-08-28',  'M',    NULL,           NULL,                     183,    185,        NULL),
('JEF',       'C',        'COMO',       '100000178', '1974-04-23',  'M',    NULL,           NULL,                     184,    186,        NULL),
('SEVERINE',  NULL,       'BJARNESEN',  '100000179', '1974-05-23',  'F',    NULL,           NULL,                     185,    187,        NULL),
('HUAN',      NULL,       'LEIFSSON',   '100000180', '1974-08-28',  'M',    NULL,           NULL,                     186,    188,        NULL),
('LINWOOD',   'O',        'COOKE',      '100000181', '1974-04-23',  'M',    NULL,           NULL,                     187,    189,        NULL),
('PEPE',      NULL,       'GARDINER',   '100000182', '1974-05-23',  'M',    NULL,           NULL,                     188,    190,        NULL);


UPDATE employee
SET manager_id = 1000187
WHERE employee_id IN (1000184, 1000185, 1000189);


UPDATE employee
SET manager_id = 1000188
WHERE employee_id IN (1000182, 1000183, 1000186, 1000187);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAISIA',    'S',        'ROSE',       '100000183', '1975-04-23',  'F',    NULL,           NULL,                     189,    191,        NULL),
('OLGA',      NULL,       'SCHULTHEISS','100000184', '1975-05-23',  'F',    NULL,           NULL,                     190,    192,        NULL),
('KYOU',      NULL,       'SUZUKI',     '100000185', '1970-08-28',  'F',    NULL,           NULL,                     191,    193,        NULL),
('ROLLO',     'D',        'SHORT',      '100000186', '1970-04-23',  'M',    NULL,           NULL,                     192,    194,        NULL),
('LEONARDO',  NULL,       'BJARNESEN',  '100000187', '1970-05-23',  'M',    NULL,           NULL,                     193,    195,        NULL),
('HUAN',      NULL,       'ROSE',       '100000188', '1970-08-28',  'M',    NULL,           NULL,                     194,    196,        NULL),
('FLAVIA',    'O',        'MOROZOV',    '100000189', '1970-04-23',  'M',    NULL,           NULL,                     195,    197,        NULL),
('CORINNA',   NULL,       'WERNHER',    '100000190', '1970-05-23',  'M',    NULL,           NULL,                     196,    198,        NULL);


UPDATE employee
SET manager_id = 1000195
WHERE employee_id IN (1000192, 1000193, 1000197);


UPDATE employee
SET manager_id = 1000196
WHERE employee_id IN (1000190, 1000191, 1000194, 1000195);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MAXINE',    'A',        'THAIDHG',    '100000191', '1975-04-23',  'F',    NULL,           NULL,                     197,    199,        NULL),
('MARCEAU',   NULL,       'OTTEN',      '100000192', '2000-05-23',  'M',    NULL,           NULL,                     198,    200,        NULL),
('HARLOW',    NULL,       'ARENDOK',    '100000193', '1970-08-28',  'M',    NULL,           NULL,                     199,    201,        NULL);


UPDATE employee
SET manager_id = 1000198
WHERE employee_id = 1000199;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANDRE',     'K',        'GILBERT',    '100000194', '1975-05-23',  'M',    NULL,           NULL,                     200,    202,        NULL),
('EMIL',      NULL,       'TRAVERSO',   '100000195', '2000-08-23',  'M',    NULL,           NULL,                     201,    203,        NULL),
('SEPHORA',   NULL,       'VILLENEUVE', '100000196', '1971-08-28',  'F',    NULL,           NULL,                     202,    204,        NULL);


UPDATE employee
SET manager_id = 1000201
WHERE employee_id = 1000202;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AFAF',      'S',        'LOWE',       '100000197', '1975-04-23',  'M',    NULL,           NULL,                     203,    205,        NULL),
('MAXIME',    NULL,       'LAMBERT',    '100000198', '2001-08-23',  'M',    NULL,           NULL,                     204,    206,        NULL),
('TERZO',     NULL,       'HERZOG',     '100000199', '1970-08-28',  'F',    NULL,           NULL,                     205,    207,        NULL);


UPDATE employee
SET manager_id = 1000204
WHERE employee_id = 1000205;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'LOWE',       '100000200', '1975-04-23',  'F',    NULL,           NULL,                     206,    208,        NULL),
('STARR',     NULL,       'LAMBERT',    '100000201', '2001-08-23',  'F',    NULL,           NULL,                     207,    209,        NULL),
('PING',      NULL,       'HERZOG',     '100000202', '1970-08-28',  'M',    NULL,           NULL,                     208,    210,        NULL),
('JEF',       'H',        'LOWE',       '100000203', '1975-04-23',  'M',    NULL,           NULL,                     209,    211,        NULL),
('SEVERINE',  NULL,       'LAMBERT',    '100000204', '2001-08-23',  'F',    NULL,           NULL,                     210,    212,        NULL),
('HUAN',      NULL,       'HERZOG',     '100000205', '1970-08-28',  'F',    NULL,           NULL,                     211,    213,        NULL);


UPDATE employee
SET manager_id = 1000210
WHERE employee_id = 1000209;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'P',        'LOWE',       '100000206', '1978-12-01',  'M',    NULL,           NULL,                     212,    214,        NULL),
('RICO',      NULL,       'LAMBERT',    '100000207', '1999-04-02',  'M',    NULL,           NULL,                     213,    215,        NULL),
('DEVARAJ',   NULL,       'HERZOG',     '100000208', '1978-03-03',  'M',    NULL,           NULL,                     214,    216,        NULL),
('BENVENUTO', 'L',        'LOWE',       '100000209', '1978-02-04',  'M',    NULL,           NULL,                     215,    217,        NULL),
('SARA',      NULL,       'LAMBERT',    '100000210', '1999-01-05',  'F',    NULL,           NULL,                     216,    218,        NULL),
('LALE',      NULL,       'HERZOG',     '100000211', '1978-05-06',  'M',    NULL,           NULL,                     217,    219,        NULL);


UPDATE employee
SET manager_id = 1000216
WHERE employee_id = 1000215;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('RAJ',       'D',        'OSBOURNE',   '100000212', '1978-12-01',  'M',    NULL,           NULL,                     218,    220,        NULL),
('SIMONE',    NULL,       'ASIS',       '100000213', '1999-04-02',  'F',    NULL,           NULL,                     219,    221,        NULL),
('JOLINE',    NULL,       'LEEUWENHOEK','100000214', '1978-03-03',  'F',    NULL,           NULL,                     220,    222,        NULL),
('YULIA',     'L',        'THAIDHG',    '100000215', '1978-02-04',  'F',    NULL,           NULL,                     221,    223,        NULL),
('CY',        NULL,       'NEAL',       '100000216', '1999-01-05',  'M',    NULL,           NULL,                     222,    224,        NULL),
('ANDREA',    NULL,       'MCCREERY',   '100000217', '1978-05-06',  'F',    NULL,           NULL,                     223,    225,        NULL);


UPDATE employee
SET manager_id = 1000222
WHERE employee_id = 1000221;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('SIMONE',    NULL,       'MCCREERY',   '100000218', '1999-04-02',  'F',    NULL,           NULL,                     224,    226,        NULL),
('JOLINE',    NULL,       'NEAL',       '100000219', '1978-03-03',  'F',    NULL,           NULL,                     225,    227,        NULL),
('YULIA',     'L',        'SMITH',      '100000220', '1978-02-04',  'F',    NULL,           NULL,                     226,    228,        NULL),
('CY',        NULL,       'ASIS',       '100000221', '1999-01-05',  'M',    NULL,           NULL,                     227,    229,        NULL),
('ANDREA',    NULL,       'OSBOURNE',   '100000222', '1978-05-06',  'F',    NULL,           NULL,                     228,    230,        NULL),

('SUHAIL',    NULL,       'ROSE',       '100000223', '1999-04-02',  'M',    NULL,           NULL,                     229,    231,        NULL),
('NUAN',      NULL,       'SCHULTHEISS','100000224', '1978-03-03',  'M',    NULL,           NULL,                     230,    232,        NULL),
('INNOKENTI', 'L',        'SUZUKI',     '100000225', '1978-02-04',  'M',    NULL,           NULL,                     231,    233,        NULL),
('KENTIGERN', NULL,       'SHORT',      '100000226', '1999-01-05',  'M',    NULL,           NULL,                     232,    234,        NULL),
('RIEN',      NULL,       'BJARNESEN',  '100000227', '1978-05-06',  'M',    NULL,           NULL,                     233,    235,        NULL),

('SUHAIL',    NULL,       'PORCHER',    '100000228', '1999-04-02',  'M',    NULL,           NULL,                     234,    236,        NULL),
('NUAN',      NULL,       'BAUMGARTEN', '100000229', '1978-03-03',  'M',    NULL,           NULL,                     235,    237,        NULL),
('INNOKENTI', 'L',        'MIKHAILOV',  '100000230', '1978-02-04',  'M',    NULL,           NULL,                     236,    238,        NULL),
('KENTIGERN', NULL,       'BAGGI',      '100000231', '1999-01-05',  'M',    NULL,           NULL,                     237,    239,        NULL),
('RIEN',      NULL,       'NOYER',      '100000232', '1978-05-06',  'M',    NULL,           NULL,                     238,    240,        NULL),

('SIMONE',    NULL,       'PORCHER',    '100000233', '1999-04-02',  'F',    NULL,           NULL,                     239,    241,        NULL),
('JOLINE',    NULL,       'BAUMGARTEN', '100000234', '1978-03-03',  'M',    NULL,           NULL,                     240,    242,        NULL),
('YULIA',     'L',        'MIKHAILOV',  '100000235', '1978-02-04',  'M',    NULL,           NULL,                     241,    243,        NULL),
('CY',        NULL,       'BAGGI',      '100000236', '1999-01-05',  'M',    NULL,           NULL,                     242,    244,        NULL),
('ANDREA',    NULL,       'NOYER',      '100000237', '1978-05-06',  'M',    NULL,           NULL,                     243,    245,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('LAWYER',    'D',        'SAWYER',     '100000238', '1978-12-01',  'M',    NULL,           NULL,                     244,    246,        NULL),
('SIMONE',    NULL,       'LAW',        '100000239', '1999-04-02',  'F',    NULL,           NULL,                     245,    247,        NULL),
('JOE',       NULL,       'TURNEY',     '100000240', '1978-03-03',  'M',    NULL,           NULL,                     246,    248,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'SAWYER',     '100000241', '1978-12-01',  'M',    NULL,           NULL,                     247,    249,        NULL),
('NATHAN',    NULL,       'TURNER',     '100000242', '1999-04-02',  'M',    NULL,           NULL,                     248,    250,        NULL),
('ELISE',     NULL,       'STEEL',      '100000243', '1978-03-03',  'F',    NULL,           NULL,                     249,    251,        NULL),
('MARY',      NULL,       'SUE',        '100000244', '1978-03-03',  'F',    NULL,           NULL,                     250,    252,        NULL);


UPDATE employee
SET manager_id = 1000250
WHERE employee_id > 1000247 AND NOT employee_id = 1000250;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'GOLD',       '100000245', '1965-12-01',  'M',    NULL,           'jgold@company.org',      251,    253,        NULL),
('NATHAN',    NULL,       'SILVER',     '100000246', '1966-04-02',  'M',    NULL,           'nsilver@company.org',    252,    254,        NULL),
('ELISE',     NULL,       'BRONZE',     '100000247', '1967-03-14',  'F',    NULL,           'ebronze@company.org',    253,    255,        NULL),
('MARY',      NULL,       'COPPER',     '100000248', '1968-03-04',  'F',    NULL,           'mcopper@company.org',    254,    256,        NULL),
('JOHN',      'K',        'BRASS',      '100000249', '1969-12-11',  'M',    NULL,           'jbrass@company.org',     255,    257,        NULL),
('NEIL',      NULL,       'ZINC',       '100000250', '1965-07-02',  'M',    NULL,           'nzinc@company.org',      256,    258,        NULL),
('ELLEN',     NULL,       'TIN',        '100000251', '1966-03-03',  'F',    NULL,           'etin@company.org',       257,    259,        NULL),
('MYRTLE',    NULL,       'PEWTER',     '100000252', '1967-04-03',  'F',    NULL,           'mpewter@company.org',    258,    260,        NULL),
('JERKYLL',   'G',        'LEAD',       '100000253', '1968-12-06',  'M',    NULL,           'jlead@company.org',      259,    261,        NULL),
('NERRY',     NULL,       'CHROMIUM',   '100000254', '1969-04-02',  'M',    NULL,           'nchromium@company.org',  260,    262,        NULL),
('PENELOPE',  NULL,       'IRON',       '100000255', '1970-03-03',  'F',    NULL,           'eiron@company.org',      261,    263,        NULL);


-- Create department heads
UPDATE department
SET department_head_id = 1000000
WHERE department_id = 1;


UPDATE department
SET department_head_id = 1000252
WHERE department_id = 2;


UPDATE department
SET department_head_id = 1000253
WHERE department_id = 3;


UPDATE department
SET department_head_id = 1000254
WHERE department_id = 4;


UPDATE department
SET department_head_id = 1000255
WHERE department_id = 5;


UPDATE department
SET department_head_id = 1000256
WHERE department_id = 6;


UPDATE department
SET department_head_id = 1000257
WHERE department_id = 7;


UPDATE department
SET department_head_id = 1000258
WHERE department_id = 8;


UPDATE department
SET department_head_id = 1000259
WHERE department_id = 9;


UPDATE department
SET department_head_id = 1000260
WHERE department_id = 10;


UPDATE department
SET department_head_id = 1000261
WHERE department_id = 11;


UPDATE department
SET department_head_id = 1000262
WHERE department_id = 12;


-- Salary
INSERT INTO salary (employee_id, hourly_wage, annual_bonus) VALUES
(1000000, '$375', '$700,000'),
(1000001, '$100', '$250,000'),
(1000002, '$90',  '$200,000'),
(1000003, '$50',  '$120,000'),
(1000004, '$100', '$200,000'),
(1000005, '$35',  '$100,000'),
(1000006, '$35',  '$100,000'),
(1000007, '$35',  '$100,000'),
(1000008, '$30', '$1,000'),
(1000009, '$30', '$1,000'),
(1000010, '$40', '$1,000'),
(1000011, '$30', '$1,000'),
(1000012, '$25', '$1,000'),
(1000013, '$22', '$1,000'),
(1000014, '$22', '$1,000'),
(1000015, '$18', '$1,000'),
(1000016, '$20', '$1,000'),
(1000017, '$40', '$1,000'),
(1000018, '$30', '$1,000'),
(1000019, '$30', '$1,000'),
(1000020, '$40', '$1,000'),
(1000021, '$30', '$1,000'),
(1000022, '$25', '$1,000'),
(1000023, '$22', '$1,000'),
(1000024, '$22', '$1,000'),
(1000025, '$18', '$1,000'),
(1000026, '$20', '$1,000'),
(1000027, '$40', '$1,000'),
(1000028, '$30', '$1,000'),
(1000029, '$30', '$1,000'),
(1000030, '$40', '$1,000'),
(1000031, '$30', '$1,000'),
(1000032, '$25', '$1,000'),
(1000033, '$22', '$1,000'),
(1000034, '$22', '$1,000'),
(1000035, '$18', '$1,000'),
(1000036, '$20', '$1,000'),
(1000037, '$40', '$1,000'),
(1000038, '$30', '$1,000'),
(1000039, '$30', '$1,000'),
(1000040, '$40', '$1,000'),
(1000041, '$30', '$1,000'),
(1000042, '$25', '$1,000'),
(1000043, '$22', '$1,000'),
(1000044, '$22', '$1,000'),
(1000045, '$18', '$1,000'),
(1000046, '$20', '$1,000'),
(1000047, '$40', '$1,000'),
(1000048, '$40', '$5,000'),
(1000049, '$34', '$3,000'),
(1000050, '$42', '$5,000'),
(1000051, '$34', '$3,000'),
(1000052, '$40', '$5,000'),
(1000053, '$34', '$3,000'),
(1000054, '$30', '$1,000'),
(1000055, '$30', '$1,000'),
(1000056, '$40', '$1,000'),
(1000057, '$30', '$1,000'),
(1000058, '$25', '$1,000'),
(1000059, '$22', '$1,000'),
(1000060, '$22', '$1,000'),
(1000061, '$18', '$1,000'),
(1000062, '$20', '$1,000'),
(1000063, '$35', '$1,000'),
(1000064, '$40', '$1,000'),
(1000065, '$30', '$1,000'),
(1000066, '$30', '$1,000'),
(1000067, '$40', '$1,000'),
(1000068, '$30', '$1,000'),
(1000069, '$25', '$1,000'),
(1000070, '$22', '$1,000'),
(1000071, '$22', '$1,000'),
(1000072, '$18', '$1,000'),
(1000073, '$20', '$1,000'),
(1000074, '$35', '$1,000'),
(1000075, '$40', '$1,000'),
(1000076, '$30', '$1,000'),
(1000077, '$30', '$1,000'),
(1000078, '$40', '$1,000'),
(1000079, '$30', '$1,000'),
(1000080, '$25', '$1,000'),
(1000081, '$22', '$1,000'),
(1000082, '$22', '$1,000'),
(1000083, '$18', '$1,000'),
(1000084, '$20', '$1,000'),
(1000085, '$35', '$1,000'),
(1000086, '$40', '$1,000'),
(1000087, '$30', '$1,000'),
(1000088, '$30', '$1,000'),
(1000089, '$40', '$1,000'),
(1000090, '$30', '$1,000'),
(1000091, '$25', '$1,000'),
(1000092, '$22', '$1,000'),
(1000093, '$22', '$1,000'),
(1000094, '$18', '$1,000'),
(1000095, '$20', '$1,000'),
(1000096, '$35', '$1,000'),
(1000097, '$40', '$1,000'),
(1000098, '$30', '$10,000'),
(1000099, '$30', '$10,000'),
(1000100, '$40', '$10,000'),
(1000101, '$30', '$10,000'),
(1000102, '$25', '$10,000'),
(1000103, '$22', '$10,000'),
(1000104, '$22', '$10,000'),
(1000105, '$18', '$10,000'),
(1000106, '$40', '$10,000'),
(1000107, '$40', '$10,000'),
(1000108, '$40', '$10,000'),
(1000109, '$40', '$10,000'),
(1000110, '$40', '$10,000'),
(1000111, '$40', '$10,000'),
(1000112, '$40', '$10,000'),
(1000113, '$40', '$10,000'),
(1000114, '$40', '$10,000'),
(1000115, '$40', '$10,000'),
(1000116, '$40', '$10,000'),
(1000117, '$40', '$10,000'),
(1000118, '$40', '$10,000'),
(1000119, '$40', '$10,000'),
(1000120, '$40', '$10,000'),
(1000121, '$40', '$10,000'),
(1000122, '$40', '$10,000'),
(1000123, '$40', '$10,000'),
(1000124, '$40', '$10,000'),
(1000125, '$40', '$10,000'),
(1000126, '$40', '$10,000'),
(1000127, '$40', '$10,000'),
(1000128, '$40', '$10,000'),
(1000129, '$40', '$10,000'),
(1000130, '$40', '$10,000'),
(1000131, '$40', '$10,000'),
(1000132, '$40', '$10,000'),
(1000133, '$40', '$10,000'),
(1000134, '$40', '$10,000'),
(1000135, '$40', '$10,000'),
(1000136, '$40', '$10,000'),
(1000137, '$40', '$10,000'),
(1000138, '$40', '$10,000'),
(1000139, '$40', '$10,000'),
(1000140, '$40', '$10,000'),
(1000141, '$40', '$10,000'),
(1000142, '$40', '$10,000'),
(1000143, '$40', '$10,000'),
(1000144, '$40', '$10,000'),
(1000145, '$40', '$10,000'),
(1000146, '$40', '$10,000'),
(1000147, '$40', '$10,000'),
(1000148, '$40', '$10,000'),
(1000149, '$40', '$10,000'),
(1000150, '$40', '$10,000'),
(1000151, '$40', '$10,000'),
(1000152, '$40', '$10,000'),
(1000153, '$40', '$10,000'),
(1000154, '$30', '$10,000'),
(1000155, '$30', '$10,000'),
(1000156, '$40', '$10,000'),
(1000157, '$15', '$0'),
(1000158, '$25', '$10,000'),
(1000159, '$22', '$10,000'),
(1000160, '$22', '$10,000'),
(1000161, '$15', '$0'),
(1000162, '$25', '$10,000'),
(1000163, '$22', '$10,000'),
(1000164, '$22', '$10,000'),
(1000165, '$15', '$0'),
(1000166, '$30', '$1,000'),
(1000167, '$30', '$1,000'),
(1000168, '$20', '$1,000'),
(1000169, '$30', '$1,000'),
(1000170, '$25', '$1,000'),
(1000171, '$22', '$1,000'),
(1000172, '$22', '$1,000'),
(1000173, '$18', '$1,000'),
(1000174, '$35', '$2,250'),
(1000175, '$35', '$2,500'),
(1000176, '$28', '$1,000'),
(1000177, '$24', '$1,000'),
(1000178, '$29', '$1,000'),
(1000179, '$31', '$1,000'),
(1000180, '$40', '$1,000'),
(1000181, '$20', '$0'),
(1000182, '$35', '$2,250'),
(1000183, '$35', '$2,500'),
(1000184, '$28', '$1,000'),
(1000185, '$24', '$1,000'),
(1000186, '$29', '$1,000'),
(1000187, '$31', '$1,000'),
(1000188, '$40', '$1,000'),
(1000189, '$20', '$0'),
(1000190, '$35', '$2,250'),
(1000191, '$35', '$2,500'),
(1000192, '$28', '$1,000'),
(1000193, '$24', '$1,000'),
(1000194, '$29', '$1,000'),
(1000195, '$31', '$1,000'),
(1000196, '$40', '$1,000'),
(1000197, '$20', '$0'),
(1000198, '$35', '$2,250'),
(1000199, '$16', '$0'),
(1000200, '$20', '$1,000'),
(1000201, '$28', '$1,000'),
(1000202, '$20', '$1,000'),
(1000203, '$15', '$0'),
(1000204, '$29', '$1,000'),
(1000205, '$20', '$1,000'),
(1000206, '$15.50', '$0'),
(1000207, '$20', '$2,250'),
(1000208, '$20', '$2,250'),
(1000209, '$30', '$2,250'),
(1000210, '$40', '$2,250'),
(1000211, '$20', '$2,250'),
(1000212, '$40', '$2,250'),
(1000213, '$20', '$2,250'),
(1000214, '$20', '$2,250'),
(1000215, '$30', '$2,250'),
(1000216, '$40', '$2,250'),
(1000217, '$20', '$2,250'),
(1000218, '$40', '$2,250'),
(1000219, '$20', '$2,250'),
(1000220, '$20', '$2,250'),
(1000221, '$30', '$2,250'),
(1000222, '$40', '$2,250'),
(1000223, '$20', '$2,250'),
(1000224, '$40', '$2,250'),
(1000225, '$40', '$10,000'),
(1000226, '$40', '$10,000'),
(1000227, '$40', '$10,000'),
(1000228, '$40', '$10,000'),
(1000229, '$40', '$10,000'),
(1000230, '$40', '$10,000'),
(1000231, '$40', '$10,000'),
(1000232, '$40', '$10,000'),
(1000233, '$40', '$10,000'),
(1000234, '$40', '$10,000'),
(1000235, '$40', '$10,000'),
(1000236, '$40', '$10,000'),
(1000237, '$40', '$10,000'),
(1000238, '$40', '$10,000'),
(1000239, '$40', '$10,000'),
(1000240, '$40', '$10,000'),
(1000241, '$40', '$10,000'),
(1000242, '$40', '$10,000'),
(1000243, '$40', '$10,000'),
(1000244, '$40', '$10,000'),
(1000245, '$40', '$10,000'),
(1000246, '$40', '$10,000'),
(1000247, '$40', '$10,000'),
(1000248, '$35', '$10,000'),
(1000249, '$30', '$10,000'),
(1000250, '$40', '$10,000'),
(1000251, '$16', '$0'),
(1000252, '$50', '$90,000'),
(1000253, '$50', '$90,000'),
(1000254, '$50', '$90,000'),
(1000255, '$50', '$90,000'),
(1000256, '$50', '$90,000'),
(1000257, '$50', '$90,000'),
(1000258, '$50', '$90,000'),
(1000259, '$50', '$90,000'),
(1000260, '$50', '$90,000'),
(1000261, '$50', '$90,000'),
(1000262, '$50', '$90,000');


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-01-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-02-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-03-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-04-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 4:56:10 PM */
-- Update employee details
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Check employee exists
SELECT employee_id
FROM employee
WHERE employee_id = '1000004';
UPDATE employee
SET
	last_name = 'SILVER'
WHERE employee_id = '1000004';
COMMIT;
END TRANSACTION;

/* 12/1/2021, 4:56:52 PM */
-- Create new benefits package
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO benefits (health_insurance_provider,amount,stock_options,retirement_plan)
VALUES ('ALL STATE','5000','NASDAQ','2050 RETIREMENT')
RETURNING *;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 4:57:58 PM */
-- Create a new payroll entry for every assigned employee
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '2020-01-01'::DATE AS pay_period, '.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc
RETURNING *;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 4:58:19 PM */
-- Delete all tables
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DROP TABLE IF EXISTS payroll          CASCADE;
DROP TABLE IF EXISTS benefits         CASCADE;
DROP TABLE IF EXISTS salary           CASCADE;
DROP TABLE IF EXISTS leave            CASCADE;
DROP TABLE IF EXISTS department       CASCADE;
DROP TABLE IF EXISTS job_location     CASCADE;
DROP TABLE IF EXISTS job              CASCADE;
DROP TABLE IF EXISTS employee         CASCADE;
DROP TABLE IF EXISTS employee_address CASCADE;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 4:58:20 PM */
-- Recreate tables from script
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Run these commands in ElephantSQL postgres database in browser tab to recreate starting tables for local testing

CREATE TABLE benefits (
  benefits_package_id        INT          GENERATED ALWAYS AS IDENTITY, 
  amount                     MONEY        NOT NULL,
  stock_options              VARCHAR(100), 
  health_insurance_provider  VARCHAR(100) NOT NULL CHECK(health_insurance_provider ~ '^[A-Z \d]+$'),
  retirement_plan            VARCHAR(100),

  PRIMARY KEY(benefits_package_id)
);


CREATE TABLE employee_address (
  address_id      INT           GENERATED ALWAYS AS IDENTITY,
  street_address  VARCHAR(100)  NOT NULL CHECK(street_address ~ '^[A-Z \/\d#\.,-]+$'),   -- Includes appt/po box info and locality info if applicable
  city            VARCHAR(50)   NOT NULL CHECK(city ~ '^[A-Z ]+$'), -- Also serves as post town if applicable
  zip_code        VARCHAR(16)   CHECK(zip_code ~ '^[\d \-A-Z]+$'), -- Also serves as postcode if applicable
  state           VARCHAR(50)   CHECK(state ~ '^[A-Z ]+$'), -- Also serves as province if applicable
  country         VARCHAR(50)   NOT NULL CHECK(country ~ '^[A-Z ]+$'),   -- Also serves as region if applicable

  PRIMARY KEY(address_id)
);


CREATE TABLE job_location (
  location_id   INT GENERATED ALWAYS AS IDENTITY,
  airport_id    INT,
  address_id    INT NOT NULL,
  flight_id     INT,
  location_name VARCHAR(50),

  PRIMARY KEY(location_id)
);


CREATE TABLE department (
  department_id       INT          GENERATED ALWAYS AS IDENTITY,
  department_name     VARCHAR(50)  NOT NULL CHECK(department_name ~ '^[A-Z ]+$'),
  creation_date       DATE         NOT NULL, 
  department_head_id  INT,

  PRIMARY KEY(department_id)
);


CREATE TABLE job (
  job_id              INT         GENERATED ALWAYS AS IDENTITY, 
  job_title           VARCHAR(50) NOT NULL CHECK(job_title ~ '^[A-Z \-]+$'),
  department_id       INT         NOT NULL, 
  location_id         INT         NOT NULL,
  weekly_hours        INT         DEFAULT 40 CHECK(weekly_hours <= 168),
  benefits_package_id INT         DEFAULT 0 NOT NULL,

  PRIMARY KEY(job_id),
  FOREIGN KEY(department_id)
    REFERENCES department(department_id)
    ON DELETE CASCADE,

  FOREIGN KEY(location_id)
    REFERENCES job_location(location_id)
    ON DELETE CASCADE,

  FOREIGN KEY(benefits_package_id)
    REFERENCES benefits(benefits_package_id)
    ON DELETE SET DEFAULT
);


CREATE TABLE employee (
  employee_id INT           GENERATED ALWAYS AS IDENTITY (START WITH 1000000),
  first_name  VARCHAR(50)   NOT NULL CHECK(first_name ~ '^[A-Z ]+$'),
  m_initial   CHAR(1),  
  last_name   VARCHAR(50)   NOT NULL CHECK(last_name ~ '^[A-Z ]+$'),
  ssn         CHAR(9)       UNIQUE CHECK(ssn ~ '^\d{9}$'),
  dob         DATE          NOT NULL,
  gender      CHAR(1)       NOT NULL CHECK(gender ~ '^[MFO]$'),
  phone       VARCHAR(15)   CHECK(phone ~ '^\+[0-9]+$'),
  email       VARCHAR(100)  UNIQUE CHECK(email ~ '^[\w\.\+]{1,64}@(\w+\.[A-Za-z]+){1,100}$'),
  job_id      INT           DEFAULT 0 NOT NULL,
  address_id  INT           NOT NULL,
  manager_id  INT,

  PRIMARY KEY(employee_id),
  FOREIGN KEY(job_id)
    REFERENCES job(job_id)
    ON DELETE SET DEFAULT,

  FOREIGN KEY(address_id)
    REFERENCES employee_address(address_id),

  FOREIGN KEY(manager_id)
    REFERENCES employee(employee_id)
    ON DELETE SET NULL
);


CREATE TABLE salary (
  salary_id    INT    GENERATED ALWAYS AS IDENTITY,
  employee_id  INT    NOT NULL,
  hourly_wage  MONEY  NOT NULL,
  annual_bonus MONEY  DEFAULT 0 NOT NULL,

  PRIMARY KEY(salary_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE leave (
  leave_id    INT           GENERATED ALWAYS AS IDENTITY,
  employee_id INT           NOT NULL,
  date        DATE          NOT NULL,
  reason      VARCHAR(100)  NOT NULL CHECK(reason ~ '^[A-Z \.\d]+$'),
  status      VARCHAR(50)   NOT NULL CHECK(status ~ '^[A-Z \.\d]+$'),

  PRIMARY KEY(leave_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE payroll (
  payroll_id    INT       GENERATED ALWAYS AS IDENTITY,
  employee_id   INT       NOT NULL, 
  hours_worked  REAL      NOT NULL,
  pay_period    DATE      NOT NULL,
  tax_rate      REAL      NOT NULL,
  gross_income  MONEY     NOT NULL,
  taxed_income  MONEY     NOT NULL,
  net_income    MONEY     NOT NULL,
  
  UNIQUE(employee_id, pay_period),

  PRIMARY KEY(payroll_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


/* DEFAULTS */
ALTER TABLE department
ADD CONSTRAINT fk_head FOREIGN KEY (department_head_id) REFERENCES employee(employee_id);


INSERT INTO benefits OVERRIDING SYSTEM VALUE VALUES(0, 0, 0, 'UNASSIGNED', 0);

INSERT INTO job_location OVERRIDING SYSTEM VALUE VALUES(0, NULL, 0, NULL);

INSERT INTO department OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', '1980-1-1');

INSERT INTO job OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', 0, 0, 0, 0);


/* Initial populated tables */

-- Departments (based on https://www.avjobs.com/history/structure-of-the-airline-industry.asp)
INSERT INTO department (department_name, creation_date) VALUES 
('BOARD OF DIRECTORS',            '1980-01-01'),
('ENGINEERING AND MAINTENANCE',   '1980-01-01'),
('GROUND OPERATIONS',             '1980-01-01'),
('FLIGHT OPERATIONS',             '1980-01-01'),
('SALES AND MARKETING',           '1980-01-01'),
('RESERVATIONS AND TICKETING',    '1980-01-01'),
('FINANCE AND PROPERTY',          '1980-01-01'),
('INFORMATION SERVICES',          '1990-11-08'),
('PERSONNEL',                     '1980-01-01'),
('EMERGENCY SERVICES',            '1980-04-05'),
('LEGAL',                         '1981-03-11'),
('PUBLIC RELATIONS AND PLANNING', '1985-07-20');


-- Benefits
INSERT INTO benefits (amount, stock_options, health_insurance_provider, retirement_plan) VALUES
(1000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS A', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS A', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN A'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(6000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS C', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(10000, 'STOCK OPTIONS D', 'INSURANCE PROVIDER D', 'RETIREMENT PLAN D'),
(4500,  'STOCK OPTIONS D', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN C');


-- Job locations
INSERT INTO job_location (airport_id, address_id, flight_id, location_name) VALUES
(NULL,  1,  NULL, 'OFFICES IN CITY A'),
(NULL,  2,  NULL, 'OFFICES IN CITY B'),
(NULL,  6,  NULL, 'OFFICES IN CITY C'),

(1, 3,  NULL, 'AIRPORT IN CITY A'),
(1, 3,  100,  'AIRPORT IN CITY A'),
(1, 3,  101,  'AIRPORT IN CITY A'),
(1, 3,  102,  'AIRPORT IN CITY A'),
(1, 3,  103,  'AIRPORT IN CITY A'),

(2, 4,  NULL, 'AIRPORT A IN CITY B'),
(2, 4,  200,  'AIRPORT A IN CITY B'),
(2, 4,  201,  'AIRPORT A IN CITY B'),
(2, 4,  202,  'AIRPORT A IN CITY B'),
(2, 4,  203,  'AIRPORT A IN CITY B'),

(3, 5,  NULL, 'AIRPORT B IN CITY B'),
(3, 5,  300,  'AIRPORT B IN CITY B'),
(3, 5,  301,  'AIRPORT B IN CITY B'),
(3, 5,  302,  'AIRPORT B IN CITY B'),
(3, 5,  303,  'AIRPORT B IN CITY B'),

(4, 7,  NULL, 'AIRPORT IN CITY C'),
(4, 7,  400,  'AIRPORT IN CITY C'),
(4, 7,  401,  'AIRPORT IN CITY C'),
(4, 7,  402,  'AIRPORT IN CITY C'),
(4, 7,  403,  'AIRPORT IN CITY C');


-- Jobs (based on https://www.airlinejobfinder.com/members/airline-jobs/)
INSERT INTO job (job_title, department_id, location_id, weekly_hours, benefits_package_id) VALUES
-- Board of Directors (1)
('CHIEF EXECUTIVE OFFICER', 1,  2,  50, 9),
('CHAIRMAN',                1,  2,  40, 9),
('VICE CHAIR',              1,  2,  40, 9),
('BOARD SECRETARY',         1,  2,  40, 9),
('TREASURER',               1,  2,  40, 9),
('BOARD MEMBER',            1,  2,  40, 9),

-- Maintenance and Engineering (2)
('AVIATION MAINTENANCE TECHNICIAN', 2,  4,  40, 2),
('POWERPLANT MECHANIC',             2,  4,  40, 2),
('AIRFRAME MECHANIC',               2,  4,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  4,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  4,  40, 2),
('AIRCRAFT FUELER',                 2,  4,  40, 2),
('AVIONIC TECHNICIAN',              2,  4,  40, 2),
('CABIN MAINTENANCE',               2,  4,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  4,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  4,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  9,  40, 2),
('POWERPLANT MECHANIC',             2,  9,  40, 2),
('AIRFRAME MECHANIC',               2,  9,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  9,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  9,  40, 2),
('AIRCRAFT FUELER',                 2,  9,  40, 2),
('AVIONIC TECHNICIAN',              2,  9,  40, 2),
('CABIN MAINTENANCE',               2,  9,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  9,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  9,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  14,  40, 2),
('POWERPLANT MECHANIC',             2,  14,  40, 2),
('AIRFRAME MECHANIC',               2,  14,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  14,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  14,  40, 2),
('AIRCRAFT FUELER',                 2,  14,  40, 2),
('AVIONIC TECHNICIAN',              2,  14,  40, 2),
('CABIN MAINTENANCE',               2,  14,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  14,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  14,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  19,  40, 2),
('POWERPLANT MECHANIC',             2,  19,  40, 2),
('AIRFRAME MECHANIC',               2,  19,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  19,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  19,  40, 2),
('AIRCRAFT FUELER',                 2,  19,  40, 2),
('AVIONIC TECHNICIAN',              2,  19,  40, 2),
('CABIN MAINTENANCE',               2,  19,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  19,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  19,  40, 2),

-- Ground Operations (3)
('DIRECTOR OF AVIATION',        3, 1, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 1, 40, 3),
('DIRECTOR OF AVIATION',        3, 2, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 2, 40, 3),
('DIRECTOR OF AVIATION',        3, 3, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 3, 40, 3),

('BAGGAGE HANDLER',               3,  4,  40, 5),
('SKYCAP',                        3,  4,  40, 5),
('CONCESSIONS',                   3,  4,  40, 5),
('AIRPORT GUIDE',                 3,  4,  40, 5),
('AIRPORT CUSTODIAN',             3,  4,  40, 1),
('OPERATIONS AGENT',              3,  4,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  4,  40, 3),
('PASSENGER SERVICE AGENT',       3,  4,  40, 3),
('RAMP PLANNER',                  3,  4,  40, 3),
('AIRLINE STATION AGENT',         3,  4,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  4,  40, 7),

('BAGGAGE HANDLER',               3,  9,  40, 5),
('SKYCAP',                        3,  9,  40, 5),
('CONCESSIONS',                   3,  9,  40, 5),
('AIRPORT GUIDE',                 3,  9,  40, 5),
('AIRPORT CUSTODIAN',             3,  9,  40, 1),
('OPERATIONS AGENT',              3,  9,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  9,  40, 3),
('PASSENGER SERVICE AGENT',       3,  9,  40, 3),
('RAMP PLANNER',                  3,  9,  40, 3),
('AIRLINE STATION AGENT',         3,  9,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  9,  40, 7),

('BAGGAGE HANDLER',               3,  14, 40, 5),
('SKYCAP',                        3,  14, 40, 5),
('CONCESSIONS',                   3,  14, 40, 5),
('AIRPORT GUIDE',                 3,  14, 40, 5),
('AIRPORT CUSTODIAN',             3,  14, 40, 1),
('OPERATIONS AGENT',              3,  14, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  14, 40, 3),
('PASSENGER SERVICE AGENT',       3,  14, 40, 3),
('RAMP PLANNER',                  3,  14, 40, 3),
('AIRLINE STATION AGENT',         3,  14, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  14, 40, 7),

('BAGGAGE HANDLER',               3,  19, 40, 5),
('SKYCAP',                        3,  19, 40, 5),
('CONCESSIONS',                   3,  19, 40, 5),
('AIRPORT GUIDE',                 3,  19, 40, 5),
('AIRPORT CUSTODIAN',             3,  19, 40, 1),
('OPERATIONS AGENT',              3,  19, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  19, 40, 3),
('PASSENGER SERVICE AGENT',       3,  19, 40, 3),
('RAMP PLANNER',                  3,  19, 40, 3),
('DISTRICT OPERATIONS MANAGER',   3,  19, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  19, 40, 7),

-- Flight Operations (4)
('FLIGHT DISPATCHER',       4,  4,  40, 6),
('AVIATION METEOROLOGIST',  4,  4,  40, 6),
('FLIGHT DISPATCHER',       4,  9,  40, 6),
('AVIATION METEOROLOGIST',  4,  9,  40, 6),
('FLIGHT DISPATCHER',       4,  14, 40, 6),
('AVIATION METEOROLOGIST',  4,  14, 40, 6),
('FLIGHT DISPATCHER',       4,  19, 40, 6),
('AVIATION METEOROLOGIST',  4,  19, 40, 6),

('CARGO CARRIER PILOT', 4,  5,  60, 6),
('COPORATE PILOT',      4,  5,  30, 6),
('CHARTER PILOT',       4,  5,  60, 6),

('CARGO CARRIER PILOT', 4,  6,  60, 6),
('COPORATE PILOT',      4,  6,  30, 6),
('CHARTER PILOT',       4,  6,  60, 6),

('CARGO CARRIER PILOT', 4,  7,  60, 6),
('COPORATE PILOT',      4,  7,  30, 6),
('CHARTER PILOT',       4,  7,  60, 6),

('CARGO CARRIER PILOT', 4,  8,  60, 6),
('COPORATE PILOT',      4,  8,  30, 6),
('CHARTER PILOT',       4,  8,  60, 6),

('CARGO CARRIER PILOT', 4,  10, 60, 6),
('COPORATE PILOT',      4,  10, 30, 6),
('CHARTER PILOT',       4,  10, 60, 6),

('CARGO CARRIER PILOT', 4,  11, 60, 6),
('COPORATE PILOT',      4,  11, 30, 6),
('CHARTER PILOT',       4,  11, 60, 6),

('CARGO CARRIER PILOT', 4,  12, 60, 6),
('COPORATE PILOT',      4,  12, 30, 6),
('CHARTER PILOT',       4,  12, 60, 6),

('CARGO CARRIER PILOT', 4,  13, 60, 6),
('COPORATE PILOT',      4,  13, 30, 6),
('CHARTER PILOT',       4,  13, 60, 6),

('CARGO CARRIER PILOT', 4,  15, 60, 6),
('COPORATE PILOT',      4,  15, 30, 6),
('CHARTER PILOT',       4,  15, 60, 6),

('CARGO CARRIER PILOT', 4,  16, 60, 6),
('COPORATE PILOT',      4,  16, 30, 6),
('CHARTER PILOT',       4,  16, 60, 6),

('CARGO CARRIER PILOT', 4,  17, 60, 6),
('COPORATE PILOT',      4,  17, 30, 6),
('CHARTER PILOT',       4,  17, 60, 6),

('CARGO CARRIER PILOT', 4,  18, 60, 6),
('COPORATE PILOT',      4,  18, 30, 6),
('CHARTER PILOT',       4,  18, 60, 6),

('CARGO CARRIER PILOT', 4,  20, 60, 6),
('COPORATE PILOT',      4,  20, 30, 6),
('CHARTER PILOT',       4,  20, 60, 6),

('CARGO CARRIER PILOT', 4,  21, 60, 6),
('COPORATE PILOT',      4,  21, 30, 6),
('CHARTER PILOT',       4,  21, 60, 6),

('CARGO CARRIER PILOT', 4,  22, 60, 6),
('COPORATE PILOT',      4,  22, 30, 6),
('CHARTER PILOT',       4,  22, 60, 6),

('CARGO CARRIER PILOT', 4,  23, 60, 6),
('COPORATE PILOT',      4,  23, 30, 6),
('CHARTER PILOT',       4,  23, 60, 6),

-- Sales and Marketing (5)
('REGIONAL SALES MANAGER',  5,  1,  40, 3),
('SALES REPRESENTATIVE',    5,  1,  40, 3),
('AIRLINE MARKETER',        5,  1,  40, 3),
('SALES INTERN',            5,  1,  20, 3),

('REGIONAL SALES MANAGER',  5,  2,  40, 3),
('SALES REPRESENTATIVE',    5,  2,  40, 3),
('AIRLINE MARKETER',        5,  2,  40, 3),
('SALES INTERN',            5,  2,  20, 3),

('REGIONAL SALES MANAGER',  5,  3,  40, 3),
('SALES REPRESENTATIVE',    5,  3,  40, 3),
('AIRLINE MARKETER',        5,  3,  40, 3),
('SALES INTERN',            5,  3,  20, 3),

-- Reservations and Ticketing (6)
('RESERVATION SALES AGENT', 6,  4,  40, 3),
('AIRLINE TICKET AGENT',    6,  4,  40, 3),

('RESERVATION SALES AGENT', 6,  9,  40, 3),
('AIRLINE TICKET AGENT',    6,  9,  40, 3),

('RESERVATION SALES AGENT', 6,  14, 40, 3),
('AIRLINE TICKET AGENT',    6,  14, 40, 3),

('RESERVATION SALES AGENT', 6,  19, 40, 3),
('AIRLINE TICKET AGENT',    6,  19, 40, 3),

-- Finance and Property (7)
('ACCOUNTANT',                7,  1,  40, 5),
('AUDITOR',                   7,  1,  40, 5),
('FINANCE ASSITANT',          7,  1,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  1,  40, 5),
('PAYROLL CLERK',             7,  1,  40, 5),
('FINANCIAL ANALYST',         7,  1,  40, 5),
('PAYROLL MANAGER',           7,  1,  40, 5),
('FINANCE INTERN',            7,  1,  20, 5),

('ACCOUNTANT',                7,  2,  40, 5),
('AUDITOR',                   7,  2,  40, 5),
('FINANCE ASSITANT',          7,  2,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  2,  40, 5),
('PAYROLL CLERK',             7,  2,  40, 5),
('FINANCIAL ANALYST',         7,  2,  40, 5),
('PAYROLL MANAGER',           7,  2,  40, 5),
('FINANCE INTERN',            7,  2,  20, 5),

('ACCOUNTANT',                7,  3,  40, 5),
('AUDITOR',                   7,  3,  40, 5),
('FINANCE ASSITANT',          7,  3,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  3,  40, 5),
('PAYROLL CLERK',             7,  3,  40, 5),
('FINANCIAL ANALYST',         7,  3,  40, 5),
('PAYROLL MANAGER',           7,  3,  40, 5),
('FINANCE INTERN',            7,  3,  20, 5),

-- Information services (8)
('IT SPECIALIST',     8,  1,  40, 3),
('IT INTERN',         8,  1,  20, 3),
('HELP DESK SUPPORT', 8,  1,  40, 3),

('IT SPECIALIST',     8,  2,  40, 3),
('HELP DESK SUPPORT', 8,  2,  40, 3),
('IT INTERN',         8,  2,  20, 3),

('IT SPECIALIST',     8,  3,  40, 3),
('HELP DESK SUPPORT', 8,  3,  40, 3),
('IT INTERN',         8,  3,  20, 3),

-- Personnel (9)
('SECRETARY',                   9,  1,  40, 3),
('MAIL CLERK',                  9,  1,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  1,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  1,  40, 3),
('RECEPTIONIST',                9,  1,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  1,  40, 3),

('SECRETARY',                   9,  2,  40, 3),
('MAIL CLERK',                  9,  2,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  2,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  2,  40, 3),
('RECEPTIONIST',                9,  2,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  2,  40, 3),

('SECRETARY',                   9,  3,  40, 3),
('MAIL CLERK',                  9,  3,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  3,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  3,  40, 3),
('RECEPTIONIST',                9,  3,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  3,  40, 3),

-- Emergency Services (10)
('FIREFIGHTER',           10,  4,  40, 10),
('FIREFIGHTER MEDIC',     10,  4,  40, 10),
('POLICE OFFICER',        10,  4,  40, 10),
('FIRE AND CRASH RESCUE', 10,  4,  30, 10),
('POLICE PATROL OFFICER', 10,  4,  30, 10),

('FIREFIGHTER',           10,  9,  40, 10),
('FIREFIGHTER MEDIC',     10,  9,  40, 10),
('POLICE OFFICER',        10,  9,  40, 10),
('FIRE AND CRASH RESCUE', 10,  9,  30, 10),
('POLICE PATROL OFFICER', 10,  9,  30, 10),

('FIREFIGHTER',           10,  14, 40, 10),
('FIREFIGHTER MEDIC',     10,  14, 40, 10),
('POLICE OFFICER',        10,  14, 40, 10),
('FIRE AND CRASH RESCUE', 10,  14, 30, 10),
('POLICE PATROL OFFICER', 10,  14, 30, 10),

('FIREFIGHTER',           10,  19, 40, 10),
('FIREFIGHTER MEDIC',     10,  19, 40, 10),
('POLICE OFFICER',        10,  19, 40, 10),
('FIRE AND CRASH RESCUE', 10,  19, 30, 10),
('POLICE PATROL OFFICER', 10,  19, 30, 10),

-- Legal (11)
('AVIATION ATTORNEY',  11,  1,  40, 7),
('AVIATION ATTORNEY',  11,  2,  40, 7),
('AVIATION ATTORNEY',  11,  3,  40, 7),

-- Public Relations and Planning (12)
('PUBLIC RELATIONS SPECIALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS GENERALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS MANAGER',    12,  2,  40, 3),
('PUBLIC RELATIONS INTERN',     12,  2,  20, 3),

('HEAD OF ENGINEERING',           2,  2,  40, 9),
('HEAD OF GROUND OPERATIONS',     3,  2,  40, 9),
('HEAD OF FLIGHT OPERATIONS',     4,  2,  40, 9),
('HEAD OF SALES',                 5,  2,  40, 9),
('HEAD OF RESERVATIONS',          6,  2,  40, 9),
('HEAD OF FINANCE',               7,  2,  40, 9),
('HEAD OF INFORMATION SERVICES',  8,  2,  40, 9),
('HEAD OF PERSONNEL MANAGEMENT',  9,  2,  40, 9),
('HEAD OF EMERGENCY SERVICES',    10, 2,  40, 9),
('HEAD OF LEGAL',                 11, 2,  40, 9),
('HEAD OF PUBLIC RELATIONS',      12, 2,  40, 9);


-- Employee Address
INSERT INTO employee_address (street_address, city, zip_code, state, country) VALUES
('123 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('123 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('321 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('555 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('9029 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('765 MAIN ST',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('767 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('876 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8770 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('202 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('101 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('896 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('909 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('920 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('808 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8760 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8755 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('423 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('202 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('101 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('896 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('909 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 SEAWATER LN',     'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8260 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8234 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8754 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('808 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8234 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8754 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SLEEPY HILLS',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 FISHWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MINOR ST',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 LION LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 JUMPY HILLS',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 FISHWATER ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MINOR RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 LION RD',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SLEEPY SLOPES',  'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('423 FISHWATER RD',    'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8777 MAIN ST',        'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('920 LONG LN',         'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 KLEINE DR',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 EINE DR',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 ROADY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 NEIN LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KLEINE DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 EINE DR',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 ROADY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KLEINE DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 EINE DR',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 ROADY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 ROCKY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 BUMPY HILLS',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 POOLWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 DIGGY LN',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 ZEBRA ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 MERRYWEATHER LN', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CHRONO ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('420 CLOUDY DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 MERRYWEATHER LN', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 CHRONO ST',      'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('420 CLOUDY DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 TIME ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 TIME ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 TIME ST',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 STEEL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 STEEL LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A');


-- Employee
INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOHN',      'H',        'SMITH',      '123456789', '1965-01-01',  'M',    '+15553219090', 'jsmith@company.org',     1,      1,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MARY',      NULL,       'ORLEANS',    '987654321', '1970-04-09',  'F',    '+15559990001', 'morleans@company.org',   2,      2,          1000000),
('HARRIS',    NULL,       'BEAUDRY',    '111223333', '1967-04-29',  'M',    '+15559990021', 'hbeaudry@company.org',   3,      3,          NULL),
('ANABEL',    'A',        'NEALIOUS',   '112345678', '1980-01-09',  'F',    '+15559990011', 'anaulious@company.org',  4,      4,          NULL),
('DON',       'E',        'SYLVER',     '112345688', '1969-11-24',  'M',    '+15559980011', 'dsylver@company.org',    5,      5,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BRENDON',   NULL,       'LAMBINO',    '112346689', '1965-11-24',  'M',    '+15559680011', 'blambino@company.org',   6,      6,          1000001),
('MYRTLE',    NULL,       'TRUOG',      '122345688', '1969-12-24',  'F',    '+16559980011', 'mtruog@company.org',     6,      7,          1000001),
('LASZLO',    NULL,       'LUAIN',      '111345688', '1971-02-24',  'M',    '+15567980011', 'lluain@company.org',     6,      8,          1000001);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '117345689', '1984-06-23',  'M',    '+15567980111', NULL,                     7,      9,          NULL),
('LATIFA',    NULL,       'BELTZ',      '117245689', '1984-02-24',  'F',    '+15569980011', NULL,                     8,      10,         NULL),
('ELINA',     NULL,       'HAUTUM',     '117445689', '1983-06-24',  'F',    '+15567900811', NULL,                     9,      11,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '117545689', '1983-08-12',  'M',    '+15567980211', NULL,                     10,     12,         NULL),
('SOLOMON',   'V',        'TERZI',      '117745689', '1984-09-23',  'M',    '+15567980311', NULL,                     11,     13,         NULL),
('QUINCTUS',  NULL,       'HART',       '113345689', '1990-12-19',  'M',    '+15567980411', NULL,                     12,     14,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '118345689', '1987-06-04',  'F',    '+15567980511', NULL,                     13,     15,         NULL),
('LAURENS',   NULL,       'RUSH',       '114345689', '1989-05-03',  'M',    '+15567980611', NULL,                     14,     16,         NULL),
('SHANNA',    'M',        'PLANCK',     '111342689', '1990-04-02',  'F',    '+15567980711', NULL,                     15,     17,         NULL),
('REINALDO',  'S',        'CLARK',      '117355689', '1988-03-01',  'M',    '+15567980811', NULL,                     16,     18,         NULL);


UPDATE employee
SET manager_id = 1000017
WHERE employee_id < 1000017 AND employee_id > 1000007;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PRINCE',    'S',        'BERGFALK',   '100000001', '1984-06-23',  'M',    '+15567180111', NULL,                     17,     19,         NULL),
('RICO',      NULL,       'MILFORD',    '100000002', '1984-02-24',  'M',    '+15569180011', NULL,                     18,     20,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000003', '1983-06-24',  'M',    '+15567100811', NULL,                     19,     21,         NULL),
('BENVENUTO', 'J',        'BRYAN',      '100000004', '1983-08-12',  'M',    '+15567180211', NULL,                     20,     22,         NULL),
('SARA',      'S',        'COKES',      '100000005', '1984-09-23',  'F',    '+15567180311', NULL,                     21,     23,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000006', '1990-12-19',  'F',    '+15567180411', NULL,                     22,     24,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000007', '1987-06-04',  'F',    '+15567180511', NULL,                     23,     25,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000008', '1989-05-03',  'F',    '+15567180611', NULL,                     24,     26,         NULL),
('KYLEE',     'M',        'DARROW',     '100000009', '1990-04-02',  'F',    '+15567180711', NULL,                     25,     27,         NULL),
('SHIRO',     'G',        'DARZI',      '100000010', '1988-03-01',  'M',    '+15567180811', NULL,                     26,     28,         NULL);


UPDATE employee
SET manager_id = 1000027
WHERE employee_id < 1000027 AND employee_id > 1000017;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'B',        'ANKEREN',    '100000011', '1984-06-23',  'M',    '+15566180111', NULL,                     27,     29,         NULL),
('RICO',      NULL,       'MILFORD',    '100000012', '1984-02-24',  'M',    '+15566180011', NULL,                     28,     30,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000013', '1983-06-24',  'M',    '+15566100811', NULL,                     29,     31,         NULL),
('BENVENUTO', 'A',        'BRYAN',      '100000014', '1983-08-12',  'M',    '+15566180211', NULL,                     30,     32,         NULL),
('SARA',      'T',        'COKES',      '100000015', '1984-09-23',  'F',    '+15566180311', NULL,                     31,     33,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000016', '1990-12-19',  'F',    '+15566180411', NULL,                     32,     34,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000017', '1987-06-04',  'F',    '+15566180511', NULL,                     33,     35,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000018', '1989-05-03',  'F',    '+15566180611', NULL,                     34,     36,         NULL),
('KYLEE',     'O',        'DARROW',     '100000019', '1990-04-02',  'F',    '+15566180711', NULL,                     35,     37,         NULL),
('SHIRO',     'K',        'DARZI',      '100000020', '1988-03-01',  'M',    '+15566180811', NULL,                     36,     38,         NULL);


UPDATE employee
SET manager_id = 1000037
WHERE employee_id < 1000037 AND employee_id > 1000027;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '100000031', '1985-06-13',  'M',    '+25567980221', NULL,                     37,     39,         NULL),
('LATIFA',    NULL,       'BELTZ',      '100000032', '1985-02-14',  'F',    '+25569980221', NULL,                     38,     40,         NULL),
('ELINA',     NULL,       'HAUTUM',     '100000033', '1985-06-14',  'F',    '+25567900221', NULL,                     39,     41,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '100000034', '1985-08-12',  'M',    '+25574980221', NULL,                     40,     42,         NULL),
('SOLOMON',   'V',        'TERZI',      '100000035', '1985-09-13',  'M',    '+25574880221', NULL,                     41,     43,         NULL),
('QUINCTUS',  NULL,       'HART',       '100000036', '1995-12-19',  'M',    '+25568980221', NULL,                     42,     44,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '100000037', '1985-06-14',  'F',    '+25577980221', NULL,                     43,     45,         NULL),
('LAURENS',   NULL,       'RUSH',       '100000038', '1985-05-13',  'M',    '+25587980221', NULL,                     44,     46,         NULL),
('SHANNA',    'M',        'PLANCK',     '100000039', '1995-04-12',  'F',    '+25569980221', NULL,                     45,     47,         NULL),
('REINALDO',  'Q',        'HART',       '100000040', '1985-03-11',  'M',    '+25560980221', NULL,                     46,     48,         NULL);


UPDATE employee
SET manager_id = 1000047
WHERE employee_id < 1000047 AND employee_id > 1000037;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAUTVYDAS', 'C',        'LANG',       '100000041', '1986-06-13',  'M',    '+15567980221', NULL,                     47,     49,         NULL),
('JOAKIM',    NULL,       'LEON',       '100000042', '1986-02-14',  'M',    '+15569980221', NULL,                     48,     50,         NULL),
('VALENTIN',  NULL,       'FIORE',      '100000043', '1986-06-14',  'M',    '+15567900221', NULL,                     49,     51,         NULL),
('SHAHIN',    'G',        'HOBBES',     '100000044', '1986-08-12',  'M',    '+15574980221', NULL,                     50,     52,         NULL),
('EVITA',     'I',        'ACHTEROP',   '100000045', '1986-09-13',  'F',    '+15574880221', NULL,                     51,     53,         NULL),
('REINALDO',  'I',        'CLARKE',     '100000046', '1986-03-11',  'M',    '+15560980221', NULL,                     52,     54,         NULL);


UPDATE employee
SET manager_id = employee_id - 1
WHERE employee_id IN (1000049, 1000051, 1000053);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'J',        'DUPUY',      '100000047', '1984-06-23',  'M',    '+15867980221', NULL,                     53,     55,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000048', '1994-02-24',  'M',    '+15869980221', NULL,                     54,     56,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000049', '1984-06-24',  'F',    '+15867900221', NULL,                     55,     57,         NULL),
('LOLA',      'I',        'PATTERSON',  '100000050', '1984-08-22',  'F',    '+15874980221', NULL,                     56,     58,         NULL),
('DEIRDRE',   'R',        'STRANGE',    '100000051', '1984-09-23',  'F',    '+15874880221', NULL,                     57,     59,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000052', '1964-12-29',  'M',    '+15868980221', NULL,                     58,     60,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000053', '1984-06-24',  'F',    '+15877980221', NULL,                     59,     61,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000054', '1964-05-23',  'M',    '+15887980221', NULL,                     60,     62,         NULL),
('VALERIAN',  'M',        'DABNEY',     '100000055', '1994-04-22',  'F',    '+15869580221', NULL,                     61,     63,         NULL),
('LIANE',     'M',        'MARIA',      '100000056', '1994-04-22',  'F',    '+15869380221', NULL,                     62,     64,         NULL),
('TAAVI',     'B',        'HOUBEN',     '100000057', '1984-03-21',  'M',    '+15860980221', NULL,                     63,     65,         NULL);


UPDATE employee
SET manager_id = 1000063
WHERE employee_id < 1000065 AND employee_id > 1000053 AND NOT employee_id = 1000063;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'A',        'DUPUY',      '100000058', '1982-04-23',  'M',    '+15867910221', NULL,                     64,     66,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000059', '1992-12-24',  'M',    '+15869910221', NULL,                     65,     67,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000060', '1982-04-24',  'F',    '+15867510221', NULL,                     66,     68,         NULL),
('LOLA',      'A',        'PATTERSON',  '100000061', '1982-06-22',  'F',    '+15874910221', NULL,                     67,     69,         NULL),
('DEIRDRE',   'A',        'STRANGE',    '100000062', '1982-07-23',  'F',    '+15874810221', NULL,                     68,     70,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000063', '1962-12-29',  'M',    '+15868910221', NULL,                     69,     71,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000064', '1982-04-24',  'F',    '+15877910221', NULL,                     70,     72,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000065', '1962-03-23',  'M',    '+15887910221', NULL,                     71,     73,         NULL),
('VALERIAN',  'A',        'DABNEY',     '100000066', '1992-02-22',  'F',    '+15869510221', NULL,                     72,     74,         NULL),
('BRIGITTA',  'A',        'MATHEWSON',  '100000067', '1992-02-22',  'F',    '+15869310221', NULL,                     73,     75,         NULL),
('TAAVI',     'A',        'HOUBEN',     '100000068', '1982-01-21',  'M',    '+15860910221', NULL,                     74,     76,         NULL);


UPDATE employee
SET manager_id = 1000074
WHERE employee_id < 1000076 AND employee_id > 1000064 AND NOT employee_id = 1000074;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000069', '1988-04-23',  'M',    '+15867910361', NULL,                     75,     77,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000070', '1998-12-24',  'F',    '+15869910361', NULL,                     76,     78,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000071', '1988-04-24',  'F',    '+15867510361', NULL,                     77,     79,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000072', '1988-06-22',  'F',    '+15874910361', NULL,                     78,     80,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000073', '1988-07-23',  'M',    '+15874810361', NULL,                     79,     81,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000074', '1968-12-29',  'M',    '+15868910361', NULL,                     80,     82,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000075', '1988-04-24',  'M',    '+15877910361', NULL,                     81,     83,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000076', '1968-03-23',  'M',    '+15887910361', NULL,                     82,     84,         NULL),
('SUNE',      'P',        'FOSSE',      '100000077', '1998-02-22',  'F',    '+15869510361', NULL,                     83,     85,         NULL),
('GEORGETA',  'L',        'ALLARD',     '100000078', '1998-02-22',  'F',    '+15869310361', NULL,                     84,     86,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000079', '1988-01-21',  'F',    '+15860910361', NULL,                     85,     87,         NULL);


UPDATE employee
SET manager_id = 1000085
WHERE employee_id < 1000087 AND employee_id > 1000075 AND NOT employee_id = 1000085;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000080', '1988-04-23',  'M',    '+25867910361', NULL,                     86,     88,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000081', '1998-12-24',  'F',    '+25869910361', NULL,                     87,     89,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000082', '1988-04-24',  'F',    '+25867510361', NULL,                     88,     90,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000083', '1988-06-22',  'F',    '+25874910361', NULL,                     89,     91,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000084', '1988-07-23',  'M',    '+25874810361', NULL,                     90,     92,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000085', '1968-12-29',  'M',    '+25868910361', NULL,                     91,     93,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000086', '1988-04-24',  'M',    '+25877910361', NULL,                     92,     94,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000087', '1968-03-23',  'M',    '+25887910361', NULL,                     93,     95,         NULL),
('SUNE',      'P',        'FOSSE',      '100000088', '1998-02-22',  'F',    '+25869510361', NULL,                     94,     96,         NULL),
('SANDRA',    'M',        'ALLARD',     '100000089', '1998-02-22',  'F',    '+25869310361', NULL,                     95,     97,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000090', '1988-01-21',  'F',    '+25860910361', NULL,                     96,     98,         NULL);


UPDATE employee
SET manager_id = 1000096
WHERE employee_id < 1000098 AND employee_id > 1000086 AND NOT employee_id = 1000096;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000091', '1988-04-23',  'M',    '+15067910361', NULL,                     97,     99,         1000063),
('KRISTIN',   NULL,       'SCRIVEN',    '100000092', '1998-12-24',  'F',    '+15069910361', NULL,                     98,     100,        1000063),
('MONIKA',    NULL,       'INGESSON',   '100000093', '1988-04-24',  'F',    '+15067510361', NULL,                     99,     101,        1000074),
('VASIA',     'K',        'MIYAZAKI',   '100000094', '1988-06-22',  'F',    '+15074910361', NULL,                     100,    102,        1000074),
('FAIRUZ',    'H',        'BYRD',       '100000095', '1988-07-23',  'M',    '+15074810361', NULL,                     101,    103,        1000085),
('SULEYMAN',  NULL,       'KURZMANN',   '100000096', '1968-12-29',  'M',    '+15068910361', NULL,                     102,    104,        1000085),
('FELIX',     NULL,       'LINDQVIST',  '100000097', '1988-04-24',  'M',    '+25077910361', NULL,                     103,    105,        1000096),
('TSHEPO',    NULL,       'BEST',       '100000098', '1968-03-23',  'M',    '+25087910361', NULL,                     104,    106,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'S',        'CORNELL',    '100000099', '1988-04-23',  'M',    NULL,           NULL,                     105,    107,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000100', '1998-12-24',  'F',    NULL,           NULL,                     106,    108,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000101', '1988-04-24',  'F',    NULL,           NULL,                     107,    109,        NULL),
('VASIA',     'R',        'MIYAZAKI',   '100000102', '1988-06-22',  'F',    NULL,           NULL,                     108,    110,        NULL),
('FAIRUZ',    'Q',        'BYRD',       '100000103', '1988-07-23',  'M',    NULL,           NULL,                     109,    111,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000104', '1968-12-29',  'M',    NULL,           NULL,                     110,    112,        NULL),
('NAMEY',     NULL,       'LINDQVIST',  '100000105', '1988-04-24',  'M',    NULL,           NULL,                     111,    113,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000106', '1988-04-24',  'M',    NULL,           NULL,                     112,    114,        NULL),
('HIDEKI',    'P',        'CORNELL',    '100000107', '1988-04-23',  'M',    NULL,           NULL,                     113,    115,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000108', '1998-12-24',  'F',    NULL,           NULL,                     114,    116,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000109', '1988-04-24',  'F',    NULL,           NULL,                     115,    117,        NULL),
('VASIA',     'O',        'MIYAZAKI',   '100000110', '1988-06-22',  'F',    NULL,           NULL,                     116,    118,        NULL),
('FAIRUZ',    'N',        'BYRD',       '100000111', '1988-07-23',  'M',    NULL,           NULL,                     117,    119,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000112', '1968-12-29',  'M',    NULL,           NULL,                     118,    120,        NULL),
('AMY',       NULL,       'LINDQVIST',  '100000113', '1988-04-24',  'F',    NULL,           NULL,                     119,    121,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000114', '1988-04-24',  'M',    NULL,           NULL,                     120,    122,        NULL),
('HIDEKI',    'M',        'CORNELL',    '100000115', '1988-04-23',  'M',    NULL,           NULL,                     121,    123,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000116', '1998-12-24',  'F',    NULL,           NULL,                     122,    124,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000117', '1988-04-24',  'F',    NULL,           NULL,                     123,    125,        NULL),
('VASIA',     'L',        'MIYAZAKI',   '100000118', '1988-06-22',  'F',    NULL,           NULL,                     124,    126,        NULL),
('FAIRUZ',    'K',        'BYRD',       '100000119', '1988-07-23',  'M',    NULL,           NULL,                     125,    127,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000120', '1968-12-29',  'M',    NULL,           NULL,                     126,    128,        NULL),
('FELIX',     NULL,       'ULG',        '100000121', '1988-04-24',  'M',    NULL,           NULL,                     127,    129,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000122', '1988-04-24',  'M',    NULL,           NULL,                     128,    130,        NULL),
('HIDEKI',    'J',        'CORNELL',    '100000123', '1988-04-23',  'M',    NULL,           NULL,                     129,    131,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000124', '1998-12-24',  'F',    NULL,           NULL,                     130,    132,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000125', '1988-04-24',  'F',    NULL,           NULL,                     131,    133,        NULL),
('VASIA',     'H',        'MIYAZAKI',   '100000126', '1988-06-22',  'F',    NULL,           NULL,                     132,    134,        NULL),
('FAIRUZ',    'I',        'BYRD',       '100000127', '1988-07-23',  'M',    NULL,           NULL,                     133,    135,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000128', '1968-12-29',  'M',    NULL,           NULL,                     134,    136,        NULL),
('FELIX',     NULL,       'KURZMANN',   '100000129', '1988-04-24',  'M',    NULL,           NULL,                     135,    137,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000130', '1988-04-24',  'M',    NULL,           NULL,                     136,    138,        NULL),
('HIDEKI',    'G',        'CORNELL',    '100000131', '1988-04-23',  'M',    NULL,           NULL,                     137,    139,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000132', '1998-12-24',  'F',    NULL,           NULL,                     138,    140,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000133', '1988-04-24',  'F',    NULL,           NULL,                     139,    141,        NULL),
('VASIA',     'F',        'MIYAZAKI',   '100000134', '1988-06-22',  'F',    NULL,           NULL,                     140,    142,        NULL),
('FAIRUZ',    'E',        'BYRD',       '100000135', '1988-07-23',  'M',    NULL,           NULL,                     141,    143,        NULL),
('HERSHALL',  NULL,       'KURZMANN',   '100000136', '1968-12-29',  'M',    NULL,           NULL,                     142,    144,        NULL),
('JEREMY',    NULL,       'LINDQVIST',  '100000137', '1988-04-24',  'M',    NULL,           NULL,                     143,    145,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000138', '1988-04-24',  'M',    NULL,           NULL,                     144,    146,        NULL),
('HIDEKI',    'C',        'CORNELL',    '100000139', '1988-04-23',  'M',    NULL,           NULL,                     145,    147,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000140', '1998-12-24',  'F',    NULL,           NULL,                     146,    148,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000141', '1988-04-24',  'F',    NULL,           NULL,                     147,    149,        NULL),
('VASIA',     'B',        'MIYAZAKI',   '100000142', '1988-06-22',  'F',    NULL,           NULL,                     148,    150,        NULL),
('MARK',      'A',        'BYRD',       '100000143', '1988-07-23',  'M',    NULL,           NULL,                     149,    151,        NULL),
('JOHN',      NULL,       'KURZMANN',   '100000144', '1968-12-29',  'M',    NULL,           NULL,                     150,    152,        NULL),
('KARL',      NULL,       'LINDQVIST',  '100000145', '1988-04-24',  'M',    NULL,           NULL,                     151,    153,        NULL),
('JOHN',      NULL,       'LINDQVIST',  '100000146', '1988-04-24',  'M',    NULL,           NULL,                     152,    154,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PROPSPER',  'S',        'ALFERINK',   '100000147', '1988-04-23',  'M',    NULL,           NULL,                     153,    155,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BEATRICE',  'S',        'ABBADELLI',  '100000148', '1988-04-23',  'F',    NULL,           NULL,                     154,    156,        1000154),
('KUROSH',    NULL,       'ABBADELLI',  '100000149', '1988-04-23',  'M',    NULL,           NULL,                     155,    157,        1000154),
('LUKAS',     NULL,       'ABBADELLI',  '100000150', '1988-04-23',  'M',    NULL,           NULL,                     156,    158,        1000154);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000151', '1988-04-23',  'M',    NULL,           NULL,                     157,    159,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('FRANCO',    'S',        'CALVO',      '100000152', '1989-04-23',  'M',    NULL,           NULL,                     158,    160,        1000158),
('ALVA',      NULL,       'SERAFINI',   '100000153', '1989-05-23',  'F',    NULL,           NULL,                     159,    161,        1000158),
('LUKAS',     NULL,       'CALVO',      '100000154', '1985-08-28',  'M',    NULL,           NULL,                     160,    162,        1000158);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000155', '1988-04-23',  'M',    NULL,           NULL,                     161,    163,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'S',        'JEANS',      '100000156', '1989-04-23',  'M',    NULL,           NULL,                     162,    164,        1000162),
('HARRY',     NULL,       'NOSE',       '100000157', '1989-05-23',  'M',    NULL,           NULL,                     163,    165,        1000162),
('BARNEY',    NULL,       'BILLS',      '100000158', '1985-08-28',  'M',    NULL,           NULL,                     164,    166,        1000162);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'J',        'JEANS',      '100000159', '1989-04-23',  'M',    NULL,           NULL,                     165,    167,        1000063),
('HARRY',     NULL,       'NOSEN',      '100000160', '1989-05-23',  'M',    NULL,           NULL,                     166,    168,        1000063),
('BARNEY',    NULL,       'BILLS',      '100000161', '1985-08-28',  'M',    NULL,           NULL,                     167,    169,        1000074),
('JIMMY',     'P',        'JEANS',      '100000162', '1989-04-23',  'M',    NULL,           NULL,                     168,    170,        1000074),
('BARRY',     NULL,       'NOSE',       '100000163', '1989-05-23',  'M',    NULL,           NULL,                     169,    171,        1000085),
('BARNEY',    NULL,       'BILLS',      '100000164', '1985-08-28',  'M',    NULL,           NULL,                     170,    172,        1000085),
('JIMMOTHY',  'S',        'JENSON',     '100000165', '1989-04-23',  'M',    NULL,           NULL,                     171,    173,        1000096),
('LARRY',     NULL,       'NOSE',       '100000166', '1989-05-23',  'M',    NULL,           NULL,                     172,    174,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANNE',      'S',        'PERROT',     '100000167', '1975-04-23',  'F',    NULL,           NULL,                     173,    175,        NULL),
('SAWDA',     NULL,       'PAPOUTSIS',  '100000168', '1975-05-23',  'F',    NULL,           NULL,                     174,    176,        NULL),
('BARNEY',    NULL,       'DINO',       '100000169', '1974-08-28',  'M',    NULL,           NULL,                     175,    177,        NULL),
('JACOBA',    'A',        'PENA',       '100000170', '1974-04-23',  'M',    NULL,           NULL,                     176,    178,        NULL),
('SEONG',     NULL,       'KOOLS',      '100000171', '1974-05-23',  'F',    NULL,           NULL,                     177,    179,        NULL),
('IKENNA',    NULL,       'ROMILLY',    '100000172', '1974-08-28',  'F',    NULL,           NULL,                     178,    180,        NULL),
('FERNANDO',  'V',        'BRICE',      '100000173', '1974-04-23',  'M',    NULL,           NULL,                     179,    181,        NULL),
('HORACIO',   NULL,       'KURZ',       '100000174', '1974-05-23',  'M',    NULL,           NULL,                     180,    182,        NULL);


UPDATE employee
SET manager_id = 1000179
WHERE employee_id IN (1000176, 1000177, 1000181);


UPDATE employee
SET manager_id = 1000180
WHERE employee_id IN (1000174, 1000175, 1000178, 1000179);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'WILDGRUBE',  '100000175', '1975-04-23',  'F',    NULL,           NULL,                     181,    183,        NULL),
('STARR',     NULL,       'GARNETT',    '100000176', '1975-05-23',  'F',    NULL,           NULL,                     182,    184,        NULL),
('PING',      NULL,       'DINO',       '100000177', '1974-08-28',  'M',    NULL,           NULL,                     183,    185,        NULL),
('JEF',       'C',        'COMO',       '100000178', '1974-04-23',  'M',    NULL,           NULL,                     184,    186,        NULL),
('SEVERINE',  NULL,       'BJARNESEN',  '100000179', '1974-05-23',  'F',    NULL,           NULL,                     185,    187,        NULL),
('HUAN',      NULL,       'LEIFSSON',   '100000180', '1974-08-28',  'M',    NULL,           NULL,                     186,    188,        NULL),
('LINWOOD',   'O',        'COOKE',      '100000181', '1974-04-23',  'M',    NULL,           NULL,                     187,    189,        NULL),
('PEPE',      NULL,       'GARDINER',   '100000182', '1974-05-23',  'M',    NULL,           NULL,                     188,    190,        NULL);


UPDATE employee
SET manager_id = 1000187
WHERE employee_id IN (1000184, 1000185, 1000189);


UPDATE employee
SET manager_id = 1000188
WHERE employee_id IN (1000182, 1000183, 1000186, 1000187);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAISIA',    'S',        'ROSE',       '100000183', '1975-04-23',  'F',    NULL,           NULL,                     189,    191,        NULL),
('OLGA',      NULL,       'SCHULTHEISS','100000184', '1975-05-23',  'F',    NULL,           NULL,                     190,    192,        NULL),
('KYOU',      NULL,       'SUZUKI',     '100000185', '1970-08-28',  'F',    NULL,           NULL,                     191,    193,        NULL),
('ROLLO',     'D',        'SHORT',      '100000186', '1970-04-23',  'M',    NULL,           NULL,                     192,    194,        NULL),
('LEONARDO',  NULL,       'BJARNESEN',  '100000187', '1970-05-23',  'M',    NULL,           NULL,                     193,    195,        NULL),
('HUAN',      NULL,       'ROSE',       '100000188', '1970-08-28',  'M',    NULL,           NULL,                     194,    196,        NULL),
('FLAVIA',    'O',        'MOROZOV',    '100000189', '1970-04-23',  'M',    NULL,           NULL,                     195,    197,        NULL),
('CORINNA',   NULL,       'WERNHER',    '100000190', '1970-05-23',  'M',    NULL,           NULL,                     196,    198,        NULL);


UPDATE employee
SET manager_id = 1000195
WHERE employee_id IN (1000192, 1000193, 1000197);


UPDATE employee
SET manager_id = 1000196
WHERE employee_id IN (1000190, 1000191, 1000194, 1000195);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MAXINE',    'A',        'THAIDHG',    '100000191', '1975-04-23',  'F',    NULL,           NULL,                     197,    199,        NULL),
('MARCEAU',   NULL,       'OTTEN',      '100000192', '2000-05-23',  'M',    NULL,           NULL,                     198,    200,        NULL),
('HARLOW',    NULL,       'ARENDOK',    '100000193', '1970-08-28',  'M',    NULL,           NULL,                     199,    201,        NULL);


UPDATE employee
SET manager_id = 1000198
WHERE employee_id = 1000199;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANDRE',     'K',        'GILBERT',    '100000194', '1975-05-23',  'M',    NULL,           NULL,                     200,    202,        NULL),
('EMIL',      NULL,       'TRAVERSO',   '100000195', '2000-08-23',  'M',    NULL,           NULL,                     201,    203,        NULL),
('SEPHORA',   NULL,       'VILLENEUVE', '100000196', '1971-08-28',  'F',    NULL,           NULL,                     202,    204,        NULL);


UPDATE employee
SET manager_id = 1000201
WHERE employee_id = 1000202;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AFAF',      'S',        'LOWE',       '100000197', '1975-04-23',  'M',    NULL,           NULL,                     203,    205,        NULL),
('MAXIME',    NULL,       'LAMBERT',    '100000198', '2001-08-23',  'M',    NULL,           NULL,                     204,    206,        NULL),
('TERZO',     NULL,       'HERZOG',     '100000199', '1970-08-28',  'F',    NULL,           NULL,                     205,    207,        NULL);


UPDATE employee
SET manager_id = 1000204
WHERE employee_id = 1000205;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'LOWE',       '100000200', '1975-04-23',  'F',    NULL,           NULL,                     206,    208,        NULL),
('STARR',     NULL,       'LAMBERT',    '100000201', '2001-08-23',  'F',    NULL,           NULL,                     207,    209,        NULL),
('PING',      NULL,       'HERZOG',     '100000202', '1970-08-28',  'M',    NULL,           NULL,                     208,    210,        NULL),
('JEF',       'H',        'LOWE',       '100000203', '1975-04-23',  'M',    NULL,           NULL,                     209,    211,        NULL),
('SEVERINE',  NULL,       'LAMBERT',    '100000204', '2001-08-23',  'F',    NULL,           NULL,                     210,    212,        NULL),
('HUAN',      NULL,       'HERZOG',     '100000205', '1970-08-28',  'F',    NULL,           NULL,                     211,    213,        NULL);


UPDATE employee
SET manager_id = 1000210
WHERE employee_id = 1000209;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'P',        'LOWE',       '100000206', '1978-12-01',  'M',    NULL,           NULL,                     212,    214,        NULL),
('RICO',      NULL,       'LAMBERT',    '100000207', '1999-04-02',  'M',    NULL,           NULL,                     213,    215,        NULL),
('DEVARAJ',   NULL,       'HERZOG',     '100000208', '1978-03-03',  'M',    NULL,           NULL,                     214,    216,        NULL),
('BENVENUTO', 'L',        'LOWE',       '100000209', '1978-02-04',  'M',    NULL,           NULL,                     215,    217,        NULL),
('SARA',      NULL,       'LAMBERT',    '100000210', '1999-01-05',  'F',    NULL,           NULL,                     216,    218,        NULL),
('LALE',      NULL,       'HERZOG',     '100000211', '1978-05-06',  'M',    NULL,           NULL,                     217,    219,        NULL);


UPDATE employee
SET manager_id = 1000216
WHERE employee_id = 1000215;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('RAJ',       'D',        'OSBOURNE',   '100000212', '1978-12-01',  'M',    NULL,           NULL,                     218,    220,        NULL),
('SIMONE',    NULL,       'ASIS',       '100000213', '1999-04-02',  'F',    NULL,           NULL,                     219,    221,        NULL),
('JOLINE',    NULL,       'LEEUWENHOEK','100000214', '1978-03-03',  'F',    NULL,           NULL,                     220,    222,        NULL),
('YULIA',     'L',        'THAIDHG',    '100000215', '1978-02-04',  'F',    NULL,           NULL,                     221,    223,        NULL),
('CY',        NULL,       'NEAL',       '100000216', '1999-01-05',  'M',    NULL,           NULL,                     222,    224,        NULL),
('ANDREA',    NULL,       'MCCREERY',   '100000217', '1978-05-06',  'F',    NULL,           NULL,                     223,    225,        NULL);


UPDATE employee
SET manager_id = 1000222
WHERE employee_id = 1000221;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('SIMONE',    NULL,       'MCCREERY',   '100000218', '1999-04-02',  'F',    NULL,           NULL,                     224,    226,        NULL),
('JOLINE',    NULL,       'NEAL',       '100000219', '1978-03-03',  'F',    NULL,           NULL,                     225,    227,        NULL),
('YULIA',     'L',        'SMITH',      '100000220', '1978-02-04',  'F',    NULL,           NULL,                     226,    228,        NULL),
('CY',        NULL,       'ASIS',       '100000221', '1999-01-05',  'M',    NULL,           NULL,                     227,    229,        NULL),
('ANDREA',    NULL,       'OSBOURNE',   '100000222', '1978-05-06',  'F',    NULL,           NULL,                     228,    230,        NULL),

('SUHAIL',    NULL,       'ROSE',       '100000223', '1999-04-02',  'M',    NULL,           NULL,                     229,    231,        NULL),
('NUAN',      NULL,       'SCHULTHEISS','100000224', '1978-03-03',  'M',    NULL,           NULL,                     230,    232,        NULL),
('INNOKENTI', 'L',        'SUZUKI',     '100000225', '1978-02-04',  'M',    NULL,           NULL,                     231,    233,        NULL),
('KENTIGERN', NULL,       'SHORT',      '100000226', '1999-01-05',  'M',    NULL,           NULL,                     232,    234,        NULL),
('RIEN',      NULL,       'BJARNESEN',  '100000227', '1978-05-06',  'M',    NULL,           NULL,                     233,    235,        NULL),

('SUHAIL',    NULL,       'PORCHER',    '100000228', '1999-04-02',  'M',    NULL,           NULL,                     234,    236,        NULL),
('NUAN',      NULL,       'BAUMGARTEN', '100000229', '1978-03-03',  'M',    NULL,           NULL,                     235,    237,        NULL),
('INNOKENTI', 'L',        'MIKHAILOV',  '100000230', '1978-02-04',  'M',    NULL,           NULL,                     236,    238,        NULL),
('KENTIGERN', NULL,       'BAGGI',      '100000231', '1999-01-05',  'M',    NULL,           NULL,                     237,    239,        NULL),
('RIEN',      NULL,       'NOYER',      '100000232', '1978-05-06',  'M',    NULL,           NULL,                     238,    240,        NULL),

('SIMONE',    NULL,       'PORCHER',    '100000233', '1999-04-02',  'F',    NULL,           NULL,                     239,    241,        NULL),
('JOLINE',    NULL,       'BAUMGARTEN', '100000234', '1978-03-03',  'M',    NULL,           NULL,                     240,    242,        NULL),
('YULIA',     'L',        'MIKHAILOV',  '100000235', '1978-02-04',  'M',    NULL,           NULL,                     241,    243,        NULL),
('CY',        NULL,       'BAGGI',      '100000236', '1999-01-05',  'M',    NULL,           NULL,                     242,    244,        NULL),
('ANDREA',    NULL,       'NOYER',      '100000237', '1978-05-06',  'M',    NULL,           NULL,                     243,    245,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('LAWYER',    'D',        'SAWYER',     '100000238', '1978-12-01',  'M',    NULL,           NULL,                     244,    246,        NULL),
('SIMONE',    NULL,       'LAW',        '100000239', '1999-04-02',  'F',    NULL,           NULL,                     245,    247,        NULL),
('JOE',       NULL,       'TURNEY',     '100000240', '1978-03-03',  'M',    NULL,           NULL,                     246,    248,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'SAWYER',     '100000241', '1978-12-01',  'M',    NULL,           NULL,                     247,    249,        NULL),
('NATHAN',    NULL,       'TURNER',     '100000242', '1999-04-02',  'M',    NULL,           NULL,                     248,    250,        NULL),
('ELISE',     NULL,       'STEEL',      '100000243', '1978-03-03',  'F',    NULL,           NULL,                     249,    251,        NULL),
('MARY',      NULL,       'SUE',        '100000244', '1978-03-03',  'F',    NULL,           NULL,                     250,    252,        NULL);


UPDATE employee
SET manager_id = 1000250
WHERE employee_id > 1000247 AND NOT employee_id = 1000250;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'GOLD',       '100000245', '1965-12-01',  'M',    NULL,           'jgold@company.org',      251,    253,        NULL),
('NATHAN',    NULL,       'SILVER',     '100000246', '1966-04-02',  'M',    NULL,           'nsilver@company.org',    252,    254,        NULL),
('ELISE',     NULL,       'BRONZE',     '100000247', '1967-03-14',  'F',    NULL,           'ebronze@company.org',    253,    255,        NULL),
('MARY',      NULL,       'COPPER',     '100000248', '1968-03-04',  'F',    NULL,           'mcopper@company.org',    254,    256,        NULL),
('JOHN',      'K',        'BRASS',      '100000249', '1969-12-11',  'M',    NULL,           'jbrass@company.org',     255,    257,        NULL),
('NEIL',      NULL,       'ZINC',       '100000250', '1965-07-02',  'M',    NULL,           'nzinc@company.org',      256,    258,        NULL),
('ELLEN',     NULL,       'TIN',        '100000251', '1966-03-03',  'F',    NULL,           'etin@company.org',       257,    259,        NULL),
('MYRTLE',    NULL,       'PEWTER',     '100000252', '1967-04-03',  'F',    NULL,           'mpewter@company.org',    258,    260,        NULL),
('JERKYLL',   'G',        'LEAD',       '100000253', '1968-12-06',  'M',    NULL,           'jlead@company.org',      259,    261,        NULL),
('NERRY',     NULL,       'CHROMIUM',   '100000254', '1969-04-02',  'M',    NULL,           'nchromium@company.org',  260,    262,        NULL),
('PENELOPE',  NULL,       'IRON',       '100000255', '1970-03-03',  'F',    NULL,           'eiron@company.org',      261,    263,        NULL);


-- Create department heads
UPDATE department
SET department_head_id = 1000000
WHERE department_id = 1;


UPDATE department
SET department_head_id = 1000252
WHERE department_id = 2;


UPDATE department
SET department_head_id = 1000253
WHERE department_id = 3;


UPDATE department
SET department_head_id = 1000254
WHERE department_id = 4;


UPDATE department
SET department_head_id = 1000255
WHERE department_id = 5;


UPDATE department
SET department_head_id = 1000256
WHERE department_id = 6;


UPDATE department
SET department_head_id = 1000257
WHERE department_id = 7;


UPDATE department
SET department_head_id = 1000258
WHERE department_id = 8;


UPDATE department
SET department_head_id = 1000259
WHERE department_id = 9;


UPDATE department
SET department_head_id = 1000260
WHERE department_id = 10;


UPDATE department
SET department_head_id = 1000261
WHERE department_id = 11;


UPDATE department
SET department_head_id = 1000262
WHERE department_id = 12;


-- Salary
INSERT INTO salary (employee_id, hourly_wage, annual_bonus) VALUES
(1000000, '$375', '$700,000'),
(1000001, '$100', '$250,000'),
(1000002, '$90',  '$200,000'),
(1000003, '$50',  '$120,000'),
(1000004, '$100', '$200,000'),
(1000005, '$35',  '$100,000'),
(1000006, '$35',  '$100,000'),
(1000007, '$35',  '$100,000'),
(1000008, '$30', '$1,000'),
(1000009, '$30', '$1,000'),
(1000010, '$40', '$1,000'),
(1000011, '$30', '$1,000'),
(1000012, '$25', '$1,000'),
(1000013, '$22', '$1,000'),
(1000014, '$22', '$1,000'),
(1000015, '$18', '$1,000'),
(1000016, '$20', '$1,000'),
(1000017, '$40', '$1,000'),
(1000018, '$30', '$1,000'),
(1000019, '$30', '$1,000'),
(1000020, '$40', '$1,000'),
(1000021, '$30', '$1,000'),
(1000022, '$25', '$1,000'),
(1000023, '$22', '$1,000'),
(1000024, '$22', '$1,000'),
(1000025, '$18', '$1,000'),
(1000026, '$20', '$1,000'),
(1000027, '$40', '$1,000'),
(1000028, '$30', '$1,000'),
(1000029, '$30', '$1,000'),
(1000030, '$40', '$1,000'),
(1000031, '$30', '$1,000'),
(1000032, '$25', '$1,000'),
(1000033, '$22', '$1,000'),
(1000034, '$22', '$1,000'),
(1000035, '$18', '$1,000'),
(1000036, '$20', '$1,000'),
(1000037, '$40', '$1,000'),
(1000038, '$30', '$1,000'),
(1000039, '$30', '$1,000'),
(1000040, '$40', '$1,000'),
(1000041, '$30', '$1,000'),
(1000042, '$25', '$1,000'),
(1000043, '$22', '$1,000'),
(1000044, '$22', '$1,000'),
(1000045, '$18', '$1,000'),
(1000046, '$20', '$1,000'),
(1000047, '$40', '$1,000'),
(1000048, '$40', '$5,000'),
(1000049, '$34', '$3,000'),
(1000050, '$42', '$5,000'),
(1000051, '$34', '$3,000'),
(1000052, '$40', '$5,000'),
(1000053, '$34', '$3,000'),
(1000054, '$30', '$1,000'),
(1000055, '$30', '$1,000'),
(1000056, '$40', '$1,000'),
(1000057, '$30', '$1,000'),
(1000058, '$25', '$1,000'),
(1000059, '$22', '$1,000'),
(1000060, '$22', '$1,000'),
(1000061, '$18', '$1,000'),
(1000062, '$20', '$1,000'),
(1000063, '$35', '$1,000'),
(1000064, '$40', '$1,000'),
(1000065, '$30', '$1,000'),
(1000066, '$30', '$1,000'),
(1000067, '$40', '$1,000'),
(1000068, '$30', '$1,000'),
(1000069, '$25', '$1,000'),
(1000070, '$22', '$1,000'),
(1000071, '$22', '$1,000'),
(1000072, '$18', '$1,000'),
(1000073, '$20', '$1,000'),
(1000074, '$35', '$1,000'),
(1000075, '$40', '$1,000'),
(1000076, '$30', '$1,000'),
(1000077, '$30', '$1,000'),
(1000078, '$40', '$1,000'),
(1000079, '$30', '$1,000'),
(1000080, '$25', '$1,000'),
(1000081, '$22', '$1,000'),
(1000082, '$22', '$1,000'),
(1000083, '$18', '$1,000'),
(1000084, '$20', '$1,000'),
(1000085, '$35', '$1,000'),
(1000086, '$40', '$1,000'),
(1000087, '$30', '$1,000'),
(1000088, '$30', '$1,000'),
(1000089, '$40', '$1,000'),
(1000090, '$30', '$1,000'),
(1000091, '$25', '$1,000'),
(1000092, '$22', '$1,000'),
(1000093, '$22', '$1,000'),
(1000094, '$18', '$1,000'),
(1000095, '$20', '$1,000'),
(1000096, '$35', '$1,000'),
(1000097, '$40', '$1,000'),
(1000098, '$30', '$10,000'),
(1000099, '$30', '$10,000'),
(1000100, '$40', '$10,000'),
(1000101, '$30', '$10,000'),
(1000102, '$25', '$10,000'),
(1000103, '$22', '$10,000'),
(1000104, '$22', '$10,000'),
(1000105, '$18', '$10,000'),
(1000106, '$40', '$10,000'),
(1000107, '$40', '$10,000'),
(1000108, '$40', '$10,000'),
(1000109, '$40', '$10,000'),
(1000110, '$40', '$10,000'),
(1000111, '$40', '$10,000'),
(1000112, '$40', '$10,000'),
(1000113, '$40', '$10,000'),
(1000114, '$40', '$10,000'),
(1000115, '$40', '$10,000'),
(1000116, '$40', '$10,000'),
(1000117, '$40', '$10,000'),
(1000118, '$40', '$10,000'),
(1000119, '$40', '$10,000'),
(1000120, '$40', '$10,000'),
(1000121, '$40', '$10,000'),
(1000122, '$40', '$10,000'),
(1000123, '$40', '$10,000'),
(1000124, '$40', '$10,000'),
(1000125, '$40', '$10,000'),
(1000126, '$40', '$10,000'),
(1000127, '$40', '$10,000'),
(1000128, '$40', '$10,000'),
(1000129, '$40', '$10,000'),
(1000130, '$40', '$10,000'),
(1000131, '$40', '$10,000'),
(1000132, '$40', '$10,000'),
(1000133, '$40', '$10,000'),
(1000134, '$40', '$10,000'),
(1000135, '$40', '$10,000'),
(1000136, '$40', '$10,000'),
(1000137, '$40', '$10,000'),
(1000138, '$40', '$10,000'),
(1000139, '$40', '$10,000'),
(1000140, '$40', '$10,000'),
(1000141, '$40', '$10,000'),
(1000142, '$40', '$10,000'),
(1000143, '$40', '$10,000'),
(1000144, '$40', '$10,000'),
(1000145, '$40', '$10,000'),
(1000146, '$40', '$10,000'),
(1000147, '$40', '$10,000'),
(1000148, '$40', '$10,000'),
(1000149, '$40', '$10,000'),
(1000150, '$40', '$10,000'),
(1000151, '$40', '$10,000'),
(1000152, '$40', '$10,000'),
(1000153, '$40', '$10,000'),
(1000154, '$30', '$10,000'),
(1000155, '$30', '$10,000'),
(1000156, '$40', '$10,000'),
(1000157, '$15', '$0'),
(1000158, '$25', '$10,000'),
(1000159, '$22', '$10,000'),
(1000160, '$22', '$10,000'),
(1000161, '$15', '$0'),
(1000162, '$25', '$10,000'),
(1000163, '$22', '$10,000'),
(1000164, '$22', '$10,000'),
(1000165, '$15', '$0'),
(1000166, '$30', '$1,000'),
(1000167, '$30', '$1,000'),
(1000168, '$20', '$1,000'),
(1000169, '$30', '$1,000'),
(1000170, '$25', '$1,000'),
(1000171, '$22', '$1,000'),
(1000172, '$22', '$1,000'),
(1000173, '$18', '$1,000'),
(1000174, '$35', '$2,250'),
(1000175, '$35', '$2,500'),
(1000176, '$28', '$1,000'),
(1000177, '$24', '$1,000'),
(1000178, '$29', '$1,000'),
(1000179, '$31', '$1,000'),
(1000180, '$40', '$1,000'),
(1000181, '$20', '$0'),
(1000182, '$35', '$2,250'),
(1000183, '$35', '$2,500'),
(1000184, '$28', '$1,000'),
(1000185, '$24', '$1,000'),
(1000186, '$29', '$1,000'),
(1000187, '$31', '$1,000'),
(1000188, '$40', '$1,000'),
(1000189, '$20', '$0'),
(1000190, '$35', '$2,250'),
(1000191, '$35', '$2,500'),
(1000192, '$28', '$1,000'),
(1000193, '$24', '$1,000'),
(1000194, '$29', '$1,000'),
(1000195, '$31', '$1,000'),
(1000196, '$40', '$1,000'),
(1000197, '$20', '$0'),
(1000198, '$35', '$2,250'),
(1000199, '$16', '$0'),
(1000200, '$20', '$1,000'),
(1000201, '$28', '$1,000'),
(1000202, '$20', '$1,000'),
(1000203, '$15', '$0'),
(1000204, '$29', '$1,000'),
(1000205, '$20', '$1,000'),
(1000206, '$15.50', '$0'),
(1000207, '$20', '$2,250'),
(1000208, '$20', '$2,250'),
(1000209, '$30', '$2,250'),
(1000210, '$40', '$2,250'),
(1000211, '$20', '$2,250'),
(1000212, '$40', '$2,250'),
(1000213, '$20', '$2,250'),
(1000214, '$20', '$2,250'),
(1000215, '$30', '$2,250'),
(1000216, '$40', '$2,250'),
(1000217, '$20', '$2,250'),
(1000218, '$40', '$2,250'),
(1000219, '$20', '$2,250'),
(1000220, '$20', '$2,250'),
(1000221, '$30', '$2,250'),
(1000222, '$40', '$2,250'),
(1000223, '$20', '$2,250'),
(1000224, '$40', '$2,250'),
(1000225, '$40', '$10,000'),
(1000226, '$40', '$10,000'),
(1000227, '$40', '$10,000'),
(1000228, '$40', '$10,000'),
(1000229, '$40', '$10,000'),
(1000230, '$40', '$10,000'),
(1000231, '$40', '$10,000'),
(1000232, '$40', '$10,000'),
(1000233, '$40', '$10,000'),
(1000234, '$40', '$10,000'),
(1000235, '$40', '$10,000'),
(1000236, '$40', '$10,000'),
(1000237, '$40', '$10,000'),
(1000238, '$40', '$10,000'),
(1000239, '$40', '$10,000'),
(1000240, '$40', '$10,000'),
(1000241, '$40', '$10,000'),
(1000242, '$40', '$10,000'),
(1000243, '$40', '$10,000'),
(1000244, '$40', '$10,000'),
(1000245, '$40', '$10,000'),
(1000246, '$40', '$10,000'),
(1000247, '$40', '$10,000'),
(1000248, '$35', '$10,000'),
(1000249, '$30', '$10,000'),
(1000250, '$40', '$10,000'),
(1000251, '$16', '$0'),
(1000252, '$50', '$90,000'),
(1000253, '$50', '$90,000'),
(1000254, '$50', '$90,000'),
(1000255, '$50', '$90,000'),
(1000256, '$50', '$90,000'),
(1000257, '$50', '$90,000'),
(1000258, '$50', '$90,000'),
(1000259, '$50', '$90,000'),
(1000260, '$50', '$90,000'),
(1000261, '$50', '$90,000'),
(1000262, '$50', '$90,000');


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-01-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-02-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-03-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-04-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 5:22:20 PM */
-- Delete all tables
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
DROP TABLE IF EXISTS payroll          CASCADE;
DROP TABLE IF EXISTS benefits         CASCADE;
DROP TABLE IF EXISTS salary           CASCADE;
DROP TABLE IF EXISTS leave            CASCADE;
DROP TABLE IF EXISTS department       CASCADE;
DROP TABLE IF EXISTS job_location     CASCADE;
DROP TABLE IF EXISTS job              CASCADE;
DROP TABLE IF EXISTS employee         CASCADE;
DROP TABLE IF EXISTS employee_address CASCADE;
COMMIT;
END TRANSACTION;

/* 12/1/2021, 5:22:20 PM */
-- Recreate tables from script
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Run these commands in ElephantSQL postgres database in browser tab to recreate starting tables for local testing

CREATE TABLE benefits (
  benefits_package_id        INT          GENERATED ALWAYS AS IDENTITY, 
  amount                     MONEY        NOT NULL,
  stock_options              VARCHAR(100), 
  health_insurance_provider  VARCHAR(100) NOT NULL CHECK(health_insurance_provider ~ '^[A-Z \d]+$'),
  retirement_plan            VARCHAR(100),

  PRIMARY KEY(benefits_package_id)
);


CREATE TABLE employee_address (
  address_id      INT           GENERATED ALWAYS AS IDENTITY,
  street_address  VARCHAR(100)  NOT NULL CHECK(street_address ~ '^[A-Z \/\d#\.,-]+$'),   -- Includes appt/po box info and locality info if applicable
  city            VARCHAR(50)   NOT NULL CHECK(city ~ '^[A-Z ]+$'), -- Also serves as post town if applicable
  zip_code        VARCHAR(16)   CHECK(zip_code ~ '^[\d \-A-Z]+$'), -- Also serves as postcode if applicable
  state           VARCHAR(50)   CHECK(state ~ '^[A-Z ]+$'), -- Also serves as province if applicable
  country         VARCHAR(50)   NOT NULL CHECK(country ~ '^[A-Z ]+$'),   -- Also serves as region if applicable

  PRIMARY KEY(address_id)
);


CREATE TABLE job_location (
  location_id   INT GENERATED ALWAYS AS IDENTITY,
  airport_id    INT,
  address_id    INT NOT NULL,
  flight_id     INT,
  location_name VARCHAR(50),

  PRIMARY KEY(location_id)
);


CREATE TABLE department (
  department_id       INT          GENERATED ALWAYS AS IDENTITY,
  department_name     VARCHAR(50)  NOT NULL CHECK(department_name ~ '^[A-Z ]+$'),
  creation_date       DATE         NOT NULL, 
  department_head_id  INT,

  PRIMARY KEY(department_id)
);


CREATE TABLE job (
  job_id              INT         GENERATED ALWAYS AS IDENTITY, 
  job_title           VARCHAR(50) NOT NULL CHECK(job_title ~ '^[A-Z \-]+$'),
  department_id       INT         NOT NULL, 
  location_id         INT         NOT NULL,
  weekly_hours        INT         DEFAULT 40 CHECK(weekly_hours <= 168),
  benefits_package_id INT         DEFAULT 0 NOT NULL,

  PRIMARY KEY(job_id),
  FOREIGN KEY(department_id)
    REFERENCES department(department_id)
    ON DELETE CASCADE,

  FOREIGN KEY(location_id)
    REFERENCES job_location(location_id)
    ON DELETE CASCADE,

  FOREIGN KEY(benefits_package_id)
    REFERENCES benefits(benefits_package_id)
    ON DELETE SET DEFAULT
);


CREATE TABLE employee (
  employee_id INT           GENERATED ALWAYS AS IDENTITY (START WITH 1000000),
  first_name  VARCHAR(50)   NOT NULL CHECK(first_name ~ '^[A-Z ]+$'),
  m_initial   CHAR(1),  
  last_name   VARCHAR(50)   NOT NULL CHECK(last_name ~ '^[A-Z ]+$'),
  ssn         CHAR(9)       UNIQUE CHECK(ssn ~ '^\d{9}$'),
  dob         DATE          NOT NULL,
  gender      CHAR(1)       NOT NULL CHECK(gender ~ '^[MFO]$'),
  phone       VARCHAR(15)   CHECK(phone ~ '^\+[0-9]+$'),
  email       VARCHAR(100)  UNIQUE CHECK(email ~ '^[\w\.\+]{1,64}@(\w+\.[A-Za-z]+){1,100}$'),
  job_id      INT           DEFAULT 0 NOT NULL,
  address_id  INT           NOT NULL,
  manager_id  INT,

  PRIMARY KEY(employee_id),
  FOREIGN KEY(job_id)
    REFERENCES job(job_id)
    ON DELETE SET DEFAULT,

  FOREIGN KEY(address_id)
    REFERENCES employee_address(address_id),

  FOREIGN KEY(manager_id)
    REFERENCES employee(employee_id)
    ON DELETE SET NULL
);


CREATE TABLE salary (
  salary_id    INT    GENERATED ALWAYS AS IDENTITY,
  employee_id  INT    NOT NULL,
  hourly_wage  MONEY  NOT NULL,
  annual_bonus MONEY  DEFAULT 0 NOT NULL,

  PRIMARY KEY(salary_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE leave (
  leave_id    INT           GENERATED ALWAYS AS IDENTITY,
  employee_id INT           NOT NULL,
  date        DATE          NOT NULL,
  reason      VARCHAR(100)  NOT NULL CHECK(reason ~ '^[A-Z \.\d]+$'),
  status      VARCHAR(50)   NOT NULL CHECK(status ~ '^[A-Z \.\d]+$'),

  PRIMARY KEY(leave_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


CREATE TABLE payroll (
  payroll_id    INT       GENERATED ALWAYS AS IDENTITY,
  employee_id   INT       NOT NULL, 
  hours_worked  REAL      NOT NULL,
  pay_period    DATE      NOT NULL,
  tax_rate      REAL      NOT NULL,
  gross_income  MONEY     NOT NULL,
  taxed_income  MONEY     NOT NULL,
  net_income    MONEY     NOT NULL,
  
  UNIQUE(employee_id, pay_period),

  PRIMARY KEY(payroll_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
    ON DELETE CASCADE
);


/* DEFAULTS */
ALTER TABLE department
ADD CONSTRAINT fk_head FOREIGN KEY (department_head_id) REFERENCES employee(employee_id);


INSERT INTO benefits OVERRIDING SYSTEM VALUE VALUES(0, 0, 0, 'UNASSIGNED', 0);

INSERT INTO job_location OVERRIDING SYSTEM VALUE VALUES(0, NULL, 0, NULL);

INSERT INTO department OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', '1980-1-1');

INSERT INTO job OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', 0, 0, 0, 0);


/* Initial populated tables */

-- Departments (based on https://www.avjobs.com/history/structure-of-the-airline-industry.asp)
INSERT INTO department (department_name, creation_date) VALUES 
('BOARD OF DIRECTORS',            '1980-01-01'),
('ENGINEERING AND MAINTENANCE',   '1980-01-01'),
('GROUND OPERATIONS',             '1980-01-01'),
('FLIGHT OPERATIONS',             '1980-01-01'),
('SALES AND MARKETING',           '1980-01-01'),
('RESERVATIONS AND TICKETING',    '1980-01-01'),
('FINANCE AND PROPERTY',          '1980-01-01'),
('INFORMATION SERVICES',          '1990-11-08'),
('PERSONNEL',                     '1980-01-01'),
('EMERGENCY SERVICES',            '1980-04-05'),
('LEGAL',                         '1981-03-11'),
('PUBLIC RELATIONS AND PLANNING', '1985-07-20');


-- Benefits
INSERT INTO benefits (amount, stock_options, health_insurance_provider, retirement_plan) VALUES
(1000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS A', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS A', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN A'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(6000,   NULL,             'INSURANCE PROVIDER A', 'RETIREMENT PLAN A'),
(2500,  'STOCK OPTIONS C', 'INSURANCE PROVIDER C', 'RETIREMENT PLAN B'),
(5000,  'STOCK OPTIONS B', 'INSURANCE PROVIDER A', 'RETIREMENT PLAN C'),
(10000, 'STOCK OPTIONS D', 'INSURANCE PROVIDER D', 'RETIREMENT PLAN D'),
(4500,  'STOCK OPTIONS D', 'INSURANCE PROVIDER B', 'RETIREMENT PLAN C');


-- Job locations
INSERT INTO job_location (airport_id, address_id, flight_id, location_name) VALUES
(NULL,  1,  NULL, 'OFFICES IN CITY A'),
(NULL,  2,  NULL, 'OFFICES IN CITY B'),
(NULL,  6,  NULL, 'OFFICES IN CITY C'),

(1, 3,  NULL, 'AIRPORT IN CITY A'),
(1, 3,  100,  'AIRPORT IN CITY A'),
(1, 3,  101,  'AIRPORT IN CITY A'),
(1, 3,  102,  'AIRPORT IN CITY A'),
(1, 3,  103,  'AIRPORT IN CITY A'),

(2, 4,  NULL, 'AIRPORT A IN CITY B'),
(2, 4,  200,  'AIRPORT A IN CITY B'),
(2, 4,  201,  'AIRPORT A IN CITY B'),
(2, 4,  202,  'AIRPORT A IN CITY B'),
(2, 4,  203,  'AIRPORT A IN CITY B'),

(3, 5,  NULL, 'AIRPORT B IN CITY B'),
(3, 5,  300,  'AIRPORT B IN CITY B'),
(3, 5,  301,  'AIRPORT B IN CITY B'),
(3, 5,  302,  'AIRPORT B IN CITY B'),
(3, 5,  303,  'AIRPORT B IN CITY B'),

(4, 7,  NULL, 'AIRPORT IN CITY C'),
(4, 7,  400,  'AIRPORT IN CITY C'),
(4, 7,  401,  'AIRPORT IN CITY C'),
(4, 7,  402,  'AIRPORT IN CITY C'),
(4, 7,  403,  'AIRPORT IN CITY C');


-- Jobs (based on https://www.airlinejobfinder.com/members/airline-jobs/)
INSERT INTO job (job_title, department_id, location_id, weekly_hours, benefits_package_id) VALUES
-- Board of Directors (1)
('CHIEF EXECUTIVE OFFICER', 1,  2,  50, 9),
('CHAIRMAN',                1,  2,  40, 9),
('VICE CHAIR',              1,  2,  40, 9),
('BOARD SECRETARY',         1,  2,  40, 9),
('TREASURER',               1,  2,  40, 9),
('BOARD MEMBER',            1,  2,  40, 9),

-- Maintenance and Engineering (2)
('AVIATION MAINTENANCE TECHNICIAN', 2,  4,  40, 2),
('POWERPLANT MECHANIC',             2,  4,  40, 2),
('AIRFRAME MECHANIC',               2,  4,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  4,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  4,  40, 2),
('AIRCRAFT FUELER',                 2,  4,  40, 2),
('AVIONIC TECHNICIAN',              2,  4,  40, 2),
('CABIN MAINTENANCE',               2,  4,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  4,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  4,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  9,  40, 2),
('POWERPLANT MECHANIC',             2,  9,  40, 2),
('AIRFRAME MECHANIC',               2,  9,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  9,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  9,  40, 2),
('AIRCRAFT FUELER',                 2,  9,  40, 2),
('AVIONIC TECHNICIAN',              2,  9,  40, 2),
('CABIN MAINTENANCE',               2,  9,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  9,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  9,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  14,  40, 2),
('POWERPLANT MECHANIC',             2,  14,  40, 2),
('AIRFRAME MECHANIC',               2,  14,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  14,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  14,  40, 2),
('AIRCRAFT FUELER',                 2,  14,  40, 2),
('AVIONIC TECHNICIAN',              2,  14,  40, 2),
('CABIN MAINTENANCE',               2,  14,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  14,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  14,  40, 2),

('AVIATION MAINTENANCE TECHNICIAN', 2,  19,  40, 2),
('POWERPLANT MECHANIC',             2,  19,  40, 2),
('AIRFRAME MECHANIC',               2,  19,  40, 2),
('AVIATION MAINTENACE TECHNICIAN',  2,  19,  40, 2),
('AIRCRAFT MAINTENANCE SPECIALIST', 2,  19,  40, 2),
('AIRCRAFT FUELER',                 2,  19,  40, 2),
('AVIONIC TECHNICIAN',              2,  19,  40, 2),
('CABIN MAINTENANCE',               2,  19,  40, 2),
('AIRPORT EQUIPMENT DRIVER',        2,  19,  40, 2),
('AIRPORT ENGINEER AND PLANNER',    2,  19,  40, 2),

-- Ground Operations (3)
('DIRECTOR OF AVIATION',        3, 1, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 1, 40, 3),
('DIRECTOR OF AVIATION',        3, 2, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 2, 40, 3),
('DIRECTOR OF AVIATION',        3, 3, 40, 3),
('DEPUTY DIRECTOR OF AVIATION', 3, 3, 40, 3),

('BAGGAGE HANDLER',               3,  4,  40, 5),
('SKYCAP',                        3,  4,  40, 5),
('CONCESSIONS',                   3,  4,  40, 5),
('AIRPORT GUIDE',                 3,  4,  40, 5),
('AIRPORT CUSTODIAN',             3,  4,  40, 1),
('OPERATIONS AGENT',              3,  4,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  4,  40, 3),
('PASSENGER SERVICE AGENT',       3,  4,  40, 3),
('RAMP PLANNER',                  3,  4,  40, 3),
('AIRLINE STATION AGENT',         3,  4,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  4,  40, 7),

('BAGGAGE HANDLER',               3,  9,  40, 5),
('SKYCAP',                        3,  9,  40, 5),
('CONCESSIONS',                   3,  9,  40, 5),
('AIRPORT GUIDE',                 3,  9,  40, 5),
('AIRPORT CUSTODIAN',             3,  9,  40, 1),
('OPERATIONS AGENT',              3,  9,  40, 3),
('AIRPORT STATION ATTENDANT',     3,  9,  40, 3),
('PASSENGER SERVICE AGENT',       3,  9,  40, 3),
('RAMP PLANNER',                  3,  9,  40, 3),
('AIRLINE STATION AGENT',         3,  9,  40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  9,  40, 7),

('BAGGAGE HANDLER',               3,  14, 40, 5),
('SKYCAP',                        3,  14, 40, 5),
('CONCESSIONS',                   3,  14, 40, 5),
('AIRPORT GUIDE',                 3,  14, 40, 5),
('AIRPORT CUSTODIAN',             3,  14, 40, 1),
('OPERATIONS AGENT',              3,  14, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  14, 40, 3),
('PASSENGER SERVICE AGENT',       3,  14, 40, 3),
('RAMP PLANNER',                  3,  14, 40, 3),
('AIRLINE STATION AGENT',         3,  14, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  14, 40, 7),

('BAGGAGE HANDLER',               3,  19, 40, 5),
('SKYCAP',                        3,  19, 40, 5),
('CONCESSIONS',                   3,  19, 40, 5),
('AIRPORT GUIDE',                 3,  19, 40, 5),
('AIRPORT CUSTODIAN',             3,  19, 40, 1),
('OPERATIONS AGENT',              3,  19, 40, 3),
('AIRPORT STATION ATTENDANT',     3,  19, 40, 3),
('PASSENGER SERVICE AGENT',       3,  19, 40, 3),
('RAMP PLANNER',                  3,  19, 40, 3),
('DISTRICT OPERATIONS MANAGER',   3,  19, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  19, 40, 7),

-- Flight Operations (4)
('FLIGHT DISPATCHER',       4,  4,  40, 6),
('AVIATION METEOROLOGIST',  4,  4,  40, 6),
('FLIGHT DISPATCHER',       4,  9,  40, 6),
('AVIATION METEOROLOGIST',  4,  9,  40, 6),
('FLIGHT DISPATCHER',       4,  14, 40, 6),
('AVIATION METEOROLOGIST',  4,  14, 40, 6),
('FLIGHT DISPATCHER',       4,  19, 40, 6),
('AVIATION METEOROLOGIST',  4,  19, 40, 6),

('CARGO CARRIER PILOT', 4,  5,  60, 6),
('COPORATE PILOT',      4,  5,  30, 6),
('CHARTER PILOT',       4,  5,  60, 6),

('CARGO CARRIER PILOT', 4,  6,  60, 6),
('COPORATE PILOT',      4,  6,  30, 6),
('CHARTER PILOT',       4,  6,  60, 6),

('CARGO CARRIER PILOT', 4,  7,  60, 6),
('COPORATE PILOT',      4,  7,  30, 6),
('CHARTER PILOT',       4,  7,  60, 6),

('CARGO CARRIER PILOT', 4,  8,  60, 6),
('COPORATE PILOT',      4,  8,  30, 6),
('CHARTER PILOT',       4,  8,  60, 6),

('CARGO CARRIER PILOT', 4,  10, 60, 6),
('COPORATE PILOT',      4,  10, 30, 6),
('CHARTER PILOT',       4,  10, 60, 6),

('CARGO CARRIER PILOT', 4,  11, 60, 6),
('COPORATE PILOT',      4,  11, 30, 6),
('CHARTER PILOT',       4,  11, 60, 6),

('CARGO CARRIER PILOT', 4,  12, 60, 6),
('COPORATE PILOT',      4,  12, 30, 6),
('CHARTER PILOT',       4,  12, 60, 6),

('CARGO CARRIER PILOT', 4,  13, 60, 6),
('COPORATE PILOT',      4,  13, 30, 6),
('CHARTER PILOT',       4,  13, 60, 6),

('CARGO CARRIER PILOT', 4,  15, 60, 6),
('COPORATE PILOT',      4,  15, 30, 6),
('CHARTER PILOT',       4,  15, 60, 6),

('CARGO CARRIER PILOT', 4,  16, 60, 6),
('COPORATE PILOT',      4,  16, 30, 6),
('CHARTER PILOT',       4,  16, 60, 6),

('CARGO CARRIER PILOT', 4,  17, 60, 6),
('COPORATE PILOT',      4,  17, 30, 6),
('CHARTER PILOT',       4,  17, 60, 6),

('CARGO CARRIER PILOT', 4,  18, 60, 6),
('COPORATE PILOT',      4,  18, 30, 6),
('CHARTER PILOT',       4,  18, 60, 6),

('CARGO CARRIER PILOT', 4,  20, 60, 6),
('COPORATE PILOT',      4,  20, 30, 6),
('CHARTER PILOT',       4,  20, 60, 6),

('CARGO CARRIER PILOT', 4,  21, 60, 6),
('COPORATE PILOT',      4,  21, 30, 6),
('CHARTER PILOT',       4,  21, 60, 6),

('CARGO CARRIER PILOT', 4,  22, 60, 6),
('COPORATE PILOT',      4,  22, 30, 6),
('CHARTER PILOT',       4,  22, 60, 6),

('CARGO CARRIER PILOT', 4,  23, 60, 6),
('COPORATE PILOT',      4,  23, 30, 6),
('CHARTER PILOT',       4,  23, 60, 6),

-- Sales and Marketing (5)
('REGIONAL SALES MANAGER',  5,  1,  40, 3),
('SALES REPRESENTATIVE',    5,  1,  40, 3),
('AIRLINE MARKETER',        5,  1,  40, 3),
('SALES INTERN',            5,  1,  20, 3),

('REGIONAL SALES MANAGER',  5,  2,  40, 3),
('SALES REPRESENTATIVE',    5,  2,  40, 3),
('AIRLINE MARKETER',        5,  2,  40, 3),
('SALES INTERN',            5,  2,  20, 3),

('REGIONAL SALES MANAGER',  5,  3,  40, 3),
('SALES REPRESENTATIVE',    5,  3,  40, 3),
('AIRLINE MARKETER',        5,  3,  40, 3),
('SALES INTERN',            5,  3,  20, 3),

-- Reservations and Ticketing (6)
('RESERVATION SALES AGENT', 6,  4,  40, 3),
('AIRLINE TICKET AGENT',    6,  4,  40, 3),

('RESERVATION SALES AGENT', 6,  9,  40, 3),
('AIRLINE TICKET AGENT',    6,  9,  40, 3),

('RESERVATION SALES AGENT', 6,  14, 40, 3),
('AIRLINE TICKET AGENT',    6,  14, 40, 3),

('RESERVATION SALES AGENT', 6,  19, 40, 3),
('AIRLINE TICKET AGENT',    6,  19, 40, 3),

-- Finance and Property (7)
('ACCOUNTANT',                7,  1,  40, 5),
('AUDITOR',                   7,  1,  40, 5),
('FINANCE ASSITANT',          7,  1,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  1,  40, 5),
('PAYROLL CLERK',             7,  1,  40, 5),
('FINANCIAL ANALYST',         7,  1,  40, 5),
('PAYROLL MANAGER',           7,  1,  40, 5),
('FINANCE INTERN',            7,  1,  20, 5),

('ACCOUNTANT',                7,  2,  40, 5),
('AUDITOR',                   7,  2,  40, 5),
('FINANCE ASSITANT',          7,  2,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  2,  40, 5),
('PAYROLL CLERK',             7,  2,  40, 5),
('FINANCIAL ANALYST',         7,  2,  40, 5),
('PAYROLL MANAGER',           7,  2,  40, 5),
('FINANCE INTERN',            7,  2,  20, 5),

('ACCOUNTANT',                7,  3,  40, 5),
('AUDITOR',                   7,  3,  40, 5),
('FINANCE ASSITANT',          7,  3,  40, 5),
('JUNIOR FINANCIAL ANALYST',  7,  3,  40, 5),
('PAYROLL CLERK',             7,  3,  40, 5),
('FINANCIAL ANALYST',         7,  3,  40, 5),
('PAYROLL MANAGER',           7,  3,  40, 5),
('FINANCE INTERN',            7,  3,  20, 5),

-- Information services (8)
('IT SPECIALIST',     8,  1,  40, 3),
('IT INTERN',         8,  1,  20, 3),
('HELP DESK SUPPORT', 8,  1,  40, 3),

('IT SPECIALIST',     8,  2,  40, 3),
('HELP DESK SUPPORT', 8,  2,  40, 3),
('IT INTERN',         8,  2,  20, 3),

('IT SPECIALIST',     8,  3,  40, 3),
('HELP DESK SUPPORT', 8,  3,  40, 3),
('IT INTERN',         8,  3,  20, 3),

-- Personnel (9)
('SECRETARY',                   9,  1,  40, 3),
('MAIL CLERK',                  9,  1,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  1,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  1,  40, 3),
('RECEPTIONIST',                9,  1,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  1,  40, 3),

('SECRETARY',                   9,  2,  40, 3),
('MAIL CLERK',                  9,  2,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  2,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  2,  40, 3),
('RECEPTIONIST',                9,  2,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  2,  40, 3),

('SECRETARY',                   9,  3,  40, 3),
('MAIL CLERK',                  9,  3,  40, 3),
('HUMAN RESOURCES GENERALIST',  9,  3,  40, 3),
('HUMAN RESOURCES MANAGER',     9,  3,  40, 3),
('RECEPTIONIST',                9,  3,  40, 3),
('CREW SCHEDULE COORDINATOR',   9,  3,  40, 3),

-- Emergency Services (10)
('FIREFIGHTER',           10,  4,  40, 10),
('FIREFIGHTER MEDIC',     10,  4,  40, 10),
('POLICE OFFICER',        10,  4,  40, 10),
('FIRE AND CRASH RESCUE', 10,  4,  30, 10),
('POLICE PATROL OFFICER', 10,  4,  30, 10),

('FIREFIGHTER',           10,  9,  40, 10),
('FIREFIGHTER MEDIC',     10,  9,  40, 10),
('POLICE OFFICER',        10,  9,  40, 10),
('FIRE AND CRASH RESCUE', 10,  9,  30, 10),
('POLICE PATROL OFFICER', 10,  9,  30, 10),

('FIREFIGHTER',           10,  14, 40, 10),
('FIREFIGHTER MEDIC',     10,  14, 40, 10),
('POLICE OFFICER',        10,  14, 40, 10),
('FIRE AND CRASH RESCUE', 10,  14, 30, 10),
('POLICE PATROL OFFICER', 10,  14, 30, 10),

('FIREFIGHTER',           10,  19, 40, 10),
('FIREFIGHTER MEDIC',     10,  19, 40, 10),
('POLICE OFFICER',        10,  19, 40, 10),
('FIRE AND CRASH RESCUE', 10,  19, 30, 10),
('POLICE PATROL OFFICER', 10,  19, 30, 10),

-- Legal (11)
('AVIATION ATTORNEY',  11,  1,  40, 7),
('AVIATION ATTORNEY',  11,  2,  40, 7),
('AVIATION ATTORNEY',  11,  3,  40, 7),

-- Public Relations and Planning (12)
('PUBLIC RELATIONS SPECIALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS GENERALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS MANAGER',    12,  2,  40, 3),
('PUBLIC RELATIONS INTERN',     12,  2,  20, 3),

('HEAD OF ENGINEERING',           2,  2,  40, 9),
('HEAD OF GROUND OPERATIONS',     3,  2,  40, 9),
('HEAD OF FLIGHT OPERATIONS',     4,  2,  40, 9),
('HEAD OF SALES',                 5,  2,  40, 9),
('HEAD OF RESERVATIONS',          6,  2,  40, 9),
('HEAD OF FINANCE',               7,  2,  40, 9),
('HEAD OF INFORMATION SERVICES',  8,  2,  40, 9),
('HEAD OF PERSONNEL MANAGEMENT',  9,  2,  40, 9),
('HEAD OF EMERGENCY SERVICES',    10, 2,  40, 9),
('HEAD OF LEGAL',                 11, 2,  40, 9),
('HEAD OF PUBLIC RELATIONS',      12, 2,  40, 9);


-- Employee Address
INSERT INTO employee_address (street_address, city, zip_code, state, country) VALUES
('123 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('123 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('321 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('555 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('9029 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('765 MAIN ST',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('767 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('876 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8770 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('202 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('101 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('896 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('909 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 MAIN ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('920 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('808 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8760 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8755 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('423 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('202 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('101 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('896 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('909 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 SEAWATER LN',     'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 WINTERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8260 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 CORAL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8234 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8754 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('910 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 NEIN LN',         'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8234 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8754 KORON RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 KEINE DR',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SCHLAFEN RD',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('808 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8234 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8754 KORON RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 SLEEPY HILLS',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 FISHWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MINOR ST',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 LION LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 JUMPY HILLS',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 FISHWATER ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MINOR RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 LION RD',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SLEEPY SLOPES',  'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('423 FISHWATER RD',    'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8777 MAIN ST',        'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('920 LONG LN',         'CITY C', '90987',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('910 KEINE DR',        'CITY A', '54321',  'STATE A', 'COUNTRY A'),
('809 KEINE DR',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SCHLAFEN RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SCHLAFEN RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8977 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('910 KLEINE DR',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('809 EINE DR',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 ROADY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 NEIN LN',         'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8977 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('910 KLEINE DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('809 EINE DR',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 ROADY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 ROCKY RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RAINWATER LN',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 NEIN LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8977 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('910 KLEINE DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('809 EINE DR',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8760 ROADY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 ROCKY RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 RAINWATER LN',    'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 MAIN ST',        'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('920 NEIN LN',         'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8755 BUMPY HILLS',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 POOLWATER LN',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 DIGGY LN',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 ZEBRA ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 MERRYWEATHER LN', 'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CHRONO ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('420 CLOUDY DR',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 KERRINGTON AVE', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('423 MERRYWEATHER LN', 'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 CHRONO ST',      'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('420 CLOUDY DR',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('8276 TIME ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 TIME ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 TIME ST',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('402 SIMMONS RD',      'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 RUSTY LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('402 SIMMONS RD',      'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8755 MAYCLOUD AVE',   'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 RUSTY LN',        'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('8276 CLIMBING ST',    'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('7852 SLOPE RD',       'CITY C', '98764',  'STATE C', 'COUNTRY B'),
('423 STEEL LN',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY C', '54321',  'STATE C', 'COUNTRY B'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 MAYCLOUD AVE',   'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 RUSTY LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 CLIMBING ST',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 SLOPE RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 STEEL LN',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 IRON ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 BRASS RD',       'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 PEWTER RD',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ZINC LN',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8276 BRONZE ST',      'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('7852 CHROMIUM RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A');


-- Employee
INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOHN',      'H',        'SMITH',      '123456789', '1965-01-01',  'M',    '+15553219090', 'jsmith@company.org',     1,      1,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MARY',      NULL,       'ORLEANS',    '987654321', '1970-04-09',  'F',    '+15559990001', 'morleans@company.org',   2,      2,          1000000),
('HARRIS',    NULL,       'BEAUDRY',    '111223333', '1967-04-29',  'M',    '+15559990021', 'hbeaudry@company.org',   3,      3,          NULL),
('ANABEL',    'A',        'NEALIOUS',   '112345678', '1980-01-09',  'F',    '+15559990011', 'anaulious@company.org',  4,      4,          NULL),
('DON',       'E',        'SYLVER',     '112345688', '1969-11-24',  'M',    '+15559980011', 'dsylver@company.org',    5,      5,          NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BRENDON',   NULL,       'LAMBINO',    '112346689', '1965-11-24',  'M',    '+15559680011', 'blambino@company.org',   6,      6,          1000001),
('MYRTLE',    NULL,       'TRUOG',      '122345688', '1969-12-24',  'F',    '+16559980011', 'mtruog@company.org',     6,      7,          1000001),
('LASZLO',    NULL,       'LUAIN',      '111345688', '1971-02-24',  'M',    '+15567980011', 'lluain@company.org',     6,      8,          1000001);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '117345689', '1984-06-23',  'M',    '+15567980111', NULL,                     7,      9,          NULL),
('LATIFA',    NULL,       'BELTZ',      '117245689', '1984-02-24',  'F',    '+15569980011', NULL,                     8,      10,         NULL),
('ELINA',     NULL,       'HAUTUM',     '117445689', '1983-06-24',  'F',    '+15567900811', NULL,                     9,      11,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '117545689', '1983-08-12',  'M',    '+15567980211', NULL,                     10,     12,         NULL),
('SOLOMON',   'V',        'TERZI',      '117745689', '1984-09-23',  'M',    '+15567980311', NULL,                     11,     13,         NULL),
('QUINCTUS',  NULL,       'HART',       '113345689', '1990-12-19',  'M',    '+15567980411', NULL,                     12,     14,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '118345689', '1987-06-04',  'F',    '+15567980511', NULL,                     13,     15,         NULL),
('LAURENS',   NULL,       'RUSH',       '114345689', '1989-05-03',  'M',    '+15567980611', NULL,                     14,     16,         NULL),
('SHANNA',    'M',        'PLANCK',     '111342689', '1990-04-02',  'F',    '+15567980711', NULL,                     15,     17,         NULL),
('REINALDO',  'S',        'CLARK',      '117355689', '1988-03-01',  'M',    '+15567980811', NULL,                     16,     18,         NULL);


UPDATE employee
SET manager_id = 1000017
WHERE employee_id < 1000017 AND employee_id > 1000007;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PRINCE',    'S',        'BERGFALK',   '100000001', '1984-06-23',  'M',    '+15567180111', NULL,                     17,     19,         NULL),
('RICO',      NULL,       'MILFORD',    '100000002', '1984-02-24',  'M',    '+15569180011', NULL,                     18,     20,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000003', '1983-06-24',  'M',    '+15567100811', NULL,                     19,     21,         NULL),
('BENVENUTO', 'J',        'BRYAN',      '100000004', '1983-08-12',  'M',    '+15567180211', NULL,                     20,     22,         NULL),
('SARA',      'S',        'COKES',      '100000005', '1984-09-23',  'F',    '+15567180311', NULL,                     21,     23,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000006', '1990-12-19',  'F',    '+15567180411', NULL,                     22,     24,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000007', '1987-06-04',  'F',    '+15567180511', NULL,                     23,     25,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000008', '1989-05-03',  'F',    '+15567180611', NULL,                     24,     26,         NULL),
('KYLEE',     'M',        'DARROW',     '100000009', '1990-04-02',  'F',    '+15567180711', NULL,                     25,     27,         NULL),
('SHIRO',     'G',        'DARZI',      '100000010', '1988-03-01',  'M',    '+15567180811', NULL,                     26,     28,         NULL);


UPDATE employee
SET manager_id = 1000027
WHERE employee_id < 1000027 AND employee_id > 1000017;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'B',        'ANKEREN',    '100000011', '1984-06-23',  'M',    '+15566180111', NULL,                     27,     29,         NULL),
('RICO',      NULL,       'MILFORD',    '100000012', '1984-02-24',  'M',    '+15566180011', NULL,                     28,     30,         NULL),
('DEVARAJ',   NULL,       'MARQUES',    '100000013', '1983-06-24',  'M',    '+15566100811', NULL,                     29,     31,         NULL),
('BENVENUTO', 'A',        'BRYAN',      '100000014', '1983-08-12',  'M',    '+15566180211', NULL,                     30,     32,         NULL),
('SARA',      'T',        'COKES',      '100000015', '1984-09-23',  'F',    '+15566180311', NULL,                     31,     33,         NULL),
('LALE',      NULL,       'ACCIAI',     '100000016', '1990-12-19',  'F',    '+15566180411', NULL,                     32,     34,         NULL),
('PATTIE',    NULL,       'BECKETT',    '100000017', '1987-06-04',  'F',    '+15566180511', NULL,                     33,     35,         NULL),
('ERICA',     NULL,       'KLASSEN',    '100000018', '1989-05-03',  'F',    '+15566180611', NULL,                     34,     36,         NULL),
('KYLEE',     'O',        'DARROW',     '100000019', '1990-04-02',  'F',    '+15566180711', NULL,                     35,     37,         NULL),
('SHIRO',     'K',        'DARZI',      '100000020', '1988-03-01',  'M',    '+15566180811', NULL,                     36,     38,         NULL);


UPDATE employee
SET manager_id = 1000037
WHERE employee_id < 1000037 AND employee_id > 1000027;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('IOUBAL',    'T',        'TEMITOPE',   '100000031', '1985-06-13',  'M',    '+25567980221', NULL,                     37,     39,         NULL),
('LATIFA',    NULL,       'BELTZ',      '100000032', '1985-02-14',  'F',    '+25569980221', NULL,                     38,     40,         NULL),
('ELINA',     NULL,       'HAUTUM',     '100000033', '1985-06-14',  'F',    '+25567900221', NULL,                     39,     41,         NULL),
('INGULF',    'H',        'LAAKKONEN',  '100000034', '1985-08-12',  'M',    '+25574980221', NULL,                     40,     42,         NULL),
('SOLOMON',   'V',        'TERZI',      '100000035', '1985-09-13',  'M',    '+25574880221', NULL,                     41,     43,         NULL),
('QUINCTUS',  NULL,       'HART',       '100000036', '1995-12-19',  'M',    '+25568980221', NULL,                     42,     44,         NULL),
('TITILAYO',  NULL,       'DAALEN',     '100000037', '1985-06-14',  'F',    '+25577980221', NULL,                     43,     45,         NULL),
('LAURENS',   NULL,       'RUSH',       '100000038', '1985-05-13',  'M',    '+25587980221', NULL,                     44,     46,         NULL),
('SHANNA',    'M',        'PLANCK',     '100000039', '1995-04-12',  'F',    '+25569980221', NULL,                     45,     47,         NULL),
('REINALDO',  'Q',        'HART',       '100000040', '1985-03-11',  'M',    '+25560980221', NULL,                     46,     48,         NULL);


UPDATE employee
SET manager_id = 1000047
WHERE employee_id < 1000047 AND employee_id > 1000037;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAUTVYDAS', 'C',        'LANG',       '100000041', '1986-06-13',  'M',    '+15567980221', NULL,                     47,     49,         NULL),
('JOAKIM',    NULL,       'LEON',       '100000042', '1986-02-14',  'M',    '+15569980221', NULL,                     48,     50,         NULL),
('VALENTIN',  NULL,       'FIORE',      '100000043', '1986-06-14',  'M',    '+15567900221', NULL,                     49,     51,         NULL),
('SHAHIN',    'G',        'HOBBES',     '100000044', '1986-08-12',  'M',    '+15574980221', NULL,                     50,     52,         NULL),
('EVITA',     'I',        'ACHTEROP',   '100000045', '1986-09-13',  'F',    '+15574880221', NULL,                     51,     53,         NULL),
('REINALDO',  'I',        'CLARKE',     '100000046', '1986-03-11',  'M',    '+15560980221', NULL,                     52,     54,         NULL);


UPDATE employee
SET manager_id = employee_id - 1
WHERE employee_id IN (1000049, 1000051, 1000053);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'J',        'DUPUY',      '100000047', '1984-06-23',  'M',    '+15867980221', NULL,                     53,     55,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000048', '1994-02-24',  'M',    '+15869980221', NULL,                     54,     56,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000049', '1984-06-24',  'F',    '+15867900221', NULL,                     55,     57,         NULL),
('LOLA',      'I',        'PATTERSON',  '100000050', '1984-08-22',  'F',    '+15874980221', NULL,                     56,     58,         NULL),
('DEIRDRE',   'R',        'STRANGE',    '100000051', '1984-09-23',  'F',    '+15874880221', NULL,                     57,     59,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000052', '1964-12-29',  'M',    '+15868980221', NULL,                     58,     60,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000053', '1984-06-24',  'F',    '+15877980221', NULL,                     59,     61,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000054', '1964-05-23',  'M',    '+15887980221', NULL,                     60,     62,         NULL),
('VALERIAN',  'M',        'DABNEY',     '100000055', '1994-04-22',  'F',    '+15869580221', NULL,                     61,     63,         NULL),
('LIANE',     'M',        'MARIA',      '100000056', '1994-04-22',  'F',    '+15869380221', NULL,                     62,     64,         NULL),
('TAAVI',     'B',        'HOUBEN',     '100000057', '1984-03-21',  'M',    '+15860980221', NULL,                     63,     65,         NULL);


UPDATE employee
SET manager_id = 1000063
WHERE employee_id < 1000065 AND employee_id > 1000053 AND NOT employee_id = 1000063;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AMAHLE',    'A',        'DUPUY',      '100000058', '1982-04-23',  'M',    '+15867910221', NULL,                     64,     66,         NULL),
('KATSUO',    NULL,       'PAGE',       '100000059', '1992-12-24',  'M',    '+15869910221', NULL,                     65,     67,         NULL),
('EUFEMIA',   NULL,       'REIS',       '100000060', '1982-04-24',  'F',    '+15867510221', NULL,                     66,     68,         NULL),
('LOLA',      'A',        'PATTERSON',  '100000061', '1982-06-22',  'F',    '+15874910221', NULL,                     67,     69,         NULL),
('DEIRDRE',   'A',        'STRANGE',    '100000062', '1982-07-23',  'F',    '+15874810221', NULL,                     68,     70,         NULL),
('ESER',      NULL,       'IORDANOU',   '100000063', '1962-12-29',  'M',    '+15868910221', NULL,                     69,     71,         NULL),
('AYODELE',   NULL,       'ASIYA',      '100000064', '1982-04-24',  'F',    '+15877910221', NULL,                     70,     72,         NULL),
('FREDERIK',  NULL,       'SHINKAWA',   '100000065', '1962-03-23',  'M',    '+15887910221', NULL,                     71,     73,         NULL),
('VALERIAN',  'A',        'DABNEY',     '100000066', '1992-02-22',  'F',    '+15869510221', NULL,                     72,     74,         NULL),
('BRIGITTA',  'A',        'MATHEWSON',  '100000067', '1992-02-22',  'F',    '+15869310221', NULL,                     73,     75,         NULL),
('TAAVI',     'A',        'HOUBEN',     '100000068', '1982-01-21',  'M',    '+15860910221', NULL,                     74,     76,         NULL);


UPDATE employee
SET manager_id = 1000074
WHERE employee_id < 1000076 AND employee_id > 1000064 AND NOT employee_id = 1000074;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000069', '1988-04-23',  'M',    '+15867910361', NULL,                     75,     77,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000070', '1998-12-24',  'F',    '+15869910361', NULL,                     76,     78,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000071', '1988-04-24',  'F',    '+15867510361', NULL,                     77,     79,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000072', '1988-06-22',  'F',    '+15874910361', NULL,                     78,     80,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000073', '1988-07-23',  'M',    '+15874810361', NULL,                     79,     81,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000074', '1968-12-29',  'M',    '+15868910361', NULL,                     80,     82,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000075', '1988-04-24',  'M',    '+15877910361', NULL,                     81,     83,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000076', '1968-03-23',  'M',    '+15887910361', NULL,                     82,     84,         NULL),
('SUNE',      'P',        'FOSSE',      '100000077', '1998-02-22',  'F',    '+15869510361', NULL,                     83,     85,         NULL),
('GEORGETA',  'L',        'ALLARD',     '100000078', '1998-02-22',  'F',    '+15869310361', NULL,                     84,     86,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000079', '1988-01-21',  'F',    '+15860910361', NULL,                     85,     87,         NULL);


UPDATE employee
SET manager_id = 1000085
WHERE employee_id < 1000087 AND employee_id > 1000075 AND NOT employee_id = 1000085;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000080', '1988-04-23',  'M',    '+25867910361', NULL,                     86,     88,         NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000081', '1998-12-24',  'F',    '+25869910361', NULL,                     87,     89,         NULL),
('MONIKA',    NULL,       'INGESSON',   '100000082', '1988-04-24',  'F',    '+25867510361', NULL,                     88,     90,         NULL),
('VASIA',     'K',        'MIYAZAKI',   '100000083', '1988-06-22',  'F',    '+25874910361', NULL,                     89,     91,         NULL),
('FAIRUZ',    'H',        'BYRD',       '100000084', '1988-07-23',  'M',    '+25874810361', NULL,                     90,     92,         NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000085', '1968-12-29',  'M',    '+25868910361', NULL,                     91,     93,         NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000086', '1988-04-24',  'M',    '+25877910361', NULL,                     92,     94,         NULL),
('TSHEPO',    NULL,       'BEST',       '100000087', '1968-03-23',  'M',    '+25887910361', NULL,                     93,     95,         NULL),
('SUNE',      'P',        'FOSSE',      '100000088', '1998-02-22',  'F',    '+25869510361', NULL,                     94,     96,         NULL),
('SANDRA',    'M',        'ALLARD',     '100000089', '1998-02-22',  'F',    '+25869310361', NULL,                     95,     97,         NULL),
('SANDRA',    'S',        'CASTILLA',   '100000090', '1988-01-21',  'F',    '+25860910361', NULL,                     96,     98,         NULL);


UPDATE employee
SET manager_id = 1000096
WHERE employee_id < 1000098 AND employee_id > 1000086 AND NOT employee_id = 1000096;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'G',        'CORNELL',    '100000091', '1988-04-23',  'M',    '+15067910361', NULL,                     97,     99,         1000063),
('KRISTIN',   NULL,       'SCRIVEN',    '100000092', '1998-12-24',  'F',    '+15069910361', NULL,                     98,     100,        1000063),
('MONIKA',    NULL,       'INGESSON',   '100000093', '1988-04-24',  'F',    '+15067510361', NULL,                     99,     101,        1000074),
('VASIA',     'K',        'MIYAZAKI',   '100000094', '1988-06-22',  'F',    '+15074910361', NULL,                     100,    102,        1000074),
('FAIRUZ',    'H',        'BYRD',       '100000095', '1988-07-23',  'M',    '+15074810361', NULL,                     101,    103,        1000085),
('SULEYMAN',  NULL,       'KURZMANN',   '100000096', '1968-12-29',  'M',    '+15068910361', NULL,                     102,    104,        1000085),
('FELIX',     NULL,       'LINDQVIST',  '100000097', '1988-04-24',  'M',    '+25077910361', NULL,                     103,    105,        1000096),
('TSHEPO',    NULL,       'BEST',       '100000098', '1968-03-23',  'M',    '+25087910361', NULL,                     104,    106,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('HIDEKI',    'S',        'CORNELL',    '100000099', '1988-04-23',  'M',    NULL,           NULL,                     105,    107,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000100', '1998-12-24',  'F',    NULL,           NULL,                     106,    108,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000101', '1988-04-24',  'F',    NULL,           NULL,                     107,    109,        NULL),
('VASIA',     'R',        'MIYAZAKI',   '100000102', '1988-06-22',  'F',    NULL,           NULL,                     108,    110,        NULL),
('FAIRUZ',    'Q',        'BYRD',       '100000103', '1988-07-23',  'M',    NULL,           NULL,                     109,    111,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000104', '1968-12-29',  'M',    NULL,           NULL,                     110,    112,        NULL),
('NAMEY',     NULL,       'LINDQVIST',  '100000105', '1988-04-24',  'M',    NULL,           NULL,                     111,    113,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000106', '1988-04-24',  'M',    NULL,           NULL,                     112,    114,        NULL),
('HIDEKI',    'P',        'CORNELL',    '100000107', '1988-04-23',  'M',    NULL,           NULL,                     113,    115,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000108', '1998-12-24',  'F',    NULL,           NULL,                     114,    116,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000109', '1988-04-24',  'F',    NULL,           NULL,                     115,    117,        NULL),
('VASIA',     'O',        'MIYAZAKI',   '100000110', '1988-06-22',  'F',    NULL,           NULL,                     116,    118,        NULL),
('FAIRUZ',    'N',        'BYRD',       '100000111', '1988-07-23',  'M',    NULL,           NULL,                     117,    119,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000112', '1968-12-29',  'M',    NULL,           NULL,                     118,    120,        NULL),
('AMY',       NULL,       'LINDQVIST',  '100000113', '1988-04-24',  'F',    NULL,           NULL,                     119,    121,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000114', '1988-04-24',  'M',    NULL,           NULL,                     120,    122,        NULL),
('HIDEKI',    'M',        'CORNELL',    '100000115', '1988-04-23',  'M',    NULL,           NULL,                     121,    123,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000116', '1998-12-24',  'F',    NULL,           NULL,                     122,    124,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000117', '1988-04-24',  'F',    NULL,           NULL,                     123,    125,        NULL),
('VASIA',     'L',        'MIYAZAKI',   '100000118', '1988-06-22',  'F',    NULL,           NULL,                     124,    126,        NULL),
('FAIRUZ',    'K',        'BYRD',       '100000119', '1988-07-23',  'M',    NULL,           NULL,                     125,    127,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000120', '1968-12-29',  'M',    NULL,           NULL,                     126,    128,        NULL),
('FELIX',     NULL,       'ULG',        '100000121', '1988-04-24',  'M',    NULL,           NULL,                     127,    129,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000122', '1988-04-24',  'M',    NULL,           NULL,                     128,    130,        NULL),
('HIDEKI',    'J',        'CORNELL',    '100000123', '1988-04-23',  'M',    NULL,           NULL,                     129,    131,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000124', '1998-12-24',  'F',    NULL,           NULL,                     130,    132,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000125', '1988-04-24',  'F',    NULL,           NULL,                     131,    133,        NULL),
('VASIA',     'H',        'MIYAZAKI',   '100000126', '1988-06-22',  'F',    NULL,           NULL,                     132,    134,        NULL),
('FAIRUZ',    'I',        'BYRD',       '100000127', '1988-07-23',  'M',    NULL,           NULL,                     133,    135,        NULL),
('SULEYMAN',  NULL,       'KURZMANN',   '100000128', '1968-12-29',  'M',    NULL,           NULL,                     134,    136,        NULL),
('FELIX',     NULL,       'KURZMANN',   '100000129', '1988-04-24',  'M',    NULL,           NULL,                     135,    137,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000130', '1988-04-24',  'M',    NULL,           NULL,                     136,    138,        NULL),
('HIDEKI',    'G',        'CORNELL',    '100000131', '1988-04-23',  'M',    NULL,           NULL,                     137,    139,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000132', '1998-12-24',  'F',    NULL,           NULL,                     138,    140,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000133', '1988-04-24',  'F',    NULL,           NULL,                     139,    141,        NULL),
('VASIA',     'F',        'MIYAZAKI',   '100000134', '1988-06-22',  'F',    NULL,           NULL,                     140,    142,        NULL),
('FAIRUZ',    'E',        'BYRD',       '100000135', '1988-07-23',  'M',    NULL,           NULL,                     141,    143,        NULL),
('HERSHALL',  NULL,       'KURZMANN',   '100000136', '1968-12-29',  'M',    NULL,           NULL,                     142,    144,        NULL),
('JEREMY',    NULL,       'LINDQVIST',  '100000137', '1988-04-24',  'M',    NULL,           NULL,                     143,    145,        NULL),
('FELIX',     NULL,       'LINDQVIST',  '100000138', '1988-04-24',  'M',    NULL,           NULL,                     144,    146,        NULL),
('HIDEKI',    'C',        'CORNELL',    '100000139', '1988-04-23',  'M',    NULL,           NULL,                     145,    147,        NULL),
('KRISTIN',   NULL,       'SCRIVEN',    '100000140', '1998-12-24',  'F',    NULL,           NULL,                     146,    148,        NULL),
('MONIKA',    NULL,       'INGESSON',   '100000141', '1988-04-24',  'F',    NULL,           NULL,                     147,    149,        NULL),
('VASIA',     'B',        'MIYAZAKI',   '100000142', '1988-06-22',  'F',    NULL,           NULL,                     148,    150,        NULL),
('MARK',      'A',        'BYRD',       '100000143', '1988-07-23',  'M',    NULL,           NULL,                     149,    151,        NULL),
('JOHN',      NULL,       'KURZMANN',   '100000144', '1968-12-29',  'M',    NULL,           NULL,                     150,    152,        NULL),
('KARL',      NULL,       'LINDQVIST',  '100000145', '1988-04-24',  'M',    NULL,           NULL,                     151,    153,        NULL),
('JOHN',      NULL,       'LINDQVIST',  '100000146', '1988-04-24',  'M',    NULL,           NULL,                     152,    154,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('PROPSPER',  'S',        'ALFERINK',   '100000147', '1988-04-23',  'M',    NULL,           NULL,                     153,    155,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('BEATRICE',  'S',        'ABBADELLI',  '100000148', '1988-04-23',  'F',    NULL,           NULL,                     154,    156,        1000154),
('KUROSH',    NULL,       'ABBADELLI',  '100000149', '1988-04-23',  'M',    NULL,           NULL,                     155,    157,        1000154),
('LUKAS',     NULL,       'ABBADELLI',  '100000150', '1988-04-23',  'M',    NULL,           NULL,                     156,    158,        1000154);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000151', '1988-04-23',  'M',    NULL,           NULL,                     157,    159,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('FRANCO',    'S',        'CALVO',      '100000152', '1989-04-23',  'M',    NULL,           NULL,                     158,    160,        1000158),
('ALVA',      NULL,       'SERAFINI',   '100000153', '1989-05-23',  'F',    NULL,           NULL,                     159,    161,        1000158),
('LUKAS',     NULL,       'CALVO',      '100000154', '1985-08-28',  'M',    NULL,           NULL,                     160,    162,        1000158);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ADOLPHE',   NULL,       'SCHNUR',     '100000155', '1988-04-23',  'M',    NULL,           NULL,                     161,    163,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'S',        'JEANS',      '100000156', '1989-04-23',  'M',    NULL,           NULL,                     162,    164,        1000162),
('HARRY',     NULL,       'NOSE',       '100000157', '1989-05-23',  'M',    NULL,           NULL,                     163,    165,        1000162),
('BARNEY',    NULL,       'BILLS',      '100000158', '1985-08-28',  'M',    NULL,           NULL,                     164,    166,        1000162);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JIMMY',     'J',        'JEANS',      '100000159', '1989-04-23',  'M',    NULL,           NULL,                     165,    167,        1000063),
('HARRY',     NULL,       'NOSEN',      '100000160', '1989-05-23',  'M',    NULL,           NULL,                     166,    168,        1000063),
('BARNEY',    NULL,       'BILLS',      '100000161', '1985-08-28',  'M',    NULL,           NULL,                     167,    169,        1000074),
('JIMMY',     'P',        'JEANS',      '100000162', '1989-04-23',  'M',    NULL,           NULL,                     168,    170,        1000074),
('BARRY',     NULL,       'NOSE',       '100000163', '1989-05-23',  'M',    NULL,           NULL,                     169,    171,        1000085),
('BARNEY',    NULL,       'BILLS',      '100000164', '1985-08-28',  'M',    NULL,           NULL,                     170,    172,        1000085),
('JIMMOTHY',  'S',        'JENSON',     '100000165', '1989-04-23',  'M',    NULL,           NULL,                     171,    173,        1000096),
('LARRY',     NULL,       'NOSE',       '100000166', '1989-05-23',  'M',    NULL,           NULL,                     172,    174,        1000096);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANNE',      'S',        'PERROT',     '100000167', '1975-04-23',  'F',    NULL,           NULL,                     173,    175,        NULL),
('SAWDA',     NULL,       'PAPOUTSIS',  '100000168', '1975-05-23',  'F',    NULL,           NULL,                     174,    176,        NULL),
('BARNEY',    NULL,       'DINO',       '100000169', '1974-08-28',  'M',    NULL,           NULL,                     175,    177,        NULL),
('JACOBA',    'A',        'PENA',       '100000170', '1974-04-23',  'M',    NULL,           NULL,                     176,    178,        NULL),
('SEONG',     NULL,       'KOOLS',      '100000171', '1974-05-23',  'F',    NULL,           NULL,                     177,    179,        NULL),
('IKENNA',    NULL,       'ROMILLY',    '100000172', '1974-08-28',  'F',    NULL,           NULL,                     178,    180,        NULL),
('FERNANDO',  'V',        'BRICE',      '100000173', '1974-04-23',  'M',    NULL,           NULL,                     179,    181,        NULL),
('HORACIO',   NULL,       'KURZ',       '100000174', '1974-05-23',  'M',    NULL,           NULL,                     180,    182,        NULL);


UPDATE employee
SET manager_id = 1000179
WHERE employee_id IN (1000176, 1000177, 1000181);


UPDATE employee
SET manager_id = 1000180
WHERE employee_id IN (1000174, 1000175, 1000178, 1000179);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'WILDGRUBE',  '100000175', '1975-04-23',  'F',    NULL,           NULL,                     181,    183,        NULL),
('STARR',     NULL,       'GARNETT',    '100000176', '1975-05-23',  'F',    NULL,           NULL,                     182,    184,        NULL),
('PING',      NULL,       'DINO',       '100000177', '1974-08-28',  'M',    NULL,           NULL,                     183,    185,        NULL),
('JEF',       'C',        'COMO',       '100000178', '1974-04-23',  'M',    NULL,           NULL,                     184,    186,        NULL),
('SEVERINE',  NULL,       'BJARNESEN',  '100000179', '1974-05-23',  'F',    NULL,           NULL,                     185,    187,        NULL),
('HUAN',      NULL,       'LEIFSSON',   '100000180', '1974-08-28',  'M',    NULL,           NULL,                     186,    188,        NULL),
('LINWOOD',   'O',        'COOKE',      '100000181', '1974-04-23',  'M',    NULL,           NULL,                     187,    189,        NULL),
('PEPE',      NULL,       'GARDINER',   '100000182', '1974-05-23',  'M',    NULL,           NULL,                     188,    190,        NULL);


UPDATE employee
SET manager_id = 1000187
WHERE employee_id IN (1000184, 1000185, 1000189);


UPDATE employee
SET manager_id = 1000188
WHERE employee_id IN (1000182, 1000183, 1000186, 1000187);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('TAISIA',    'S',        'ROSE',       '100000183', '1975-04-23',  'F',    NULL,           NULL,                     189,    191,        NULL),
('OLGA',      NULL,       'SCHULTHEISS','100000184', '1975-05-23',  'F',    NULL,           NULL,                     190,    192,        NULL),
('KYOU',      NULL,       'SUZUKI',     '100000185', '1970-08-28',  'F',    NULL,           NULL,                     191,    193,        NULL),
('ROLLO',     'D',        'SHORT',      '100000186', '1970-04-23',  'M',    NULL,           NULL,                     192,    194,        NULL),
('LEONARDO',  NULL,       'BJARNESEN',  '100000187', '1970-05-23',  'M',    NULL,           NULL,                     193,    195,        NULL),
('HUAN',      NULL,       'ROSE',       '100000188', '1970-08-28',  'M',    NULL,           NULL,                     194,    196,        NULL),
('FLAVIA',    'O',        'MOROZOV',    '100000189', '1970-04-23',  'M',    NULL,           NULL,                     195,    197,        NULL),
('CORINNA',   NULL,       'WERNHER',    '100000190', '1970-05-23',  'M',    NULL,           NULL,                     196,    198,        NULL);


UPDATE employee
SET manager_id = 1000195
WHERE employee_id IN (1000192, 1000193, 1000197);


UPDATE employee
SET manager_id = 1000196
WHERE employee_id IN (1000190, 1000191, 1000194, 1000195);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('MAXINE',    'A',        'THAIDHG',    '100000191', '1975-04-23',  'F',    NULL,           NULL,                     197,    199,        NULL),
('MARCEAU',   NULL,       'OTTEN',      '100000192', '2000-05-23',  'M',    NULL,           NULL,                     198,    200,        NULL),
('HARLOW',    NULL,       'ARENDOK',    '100000193', '1970-08-28',  'M',    NULL,           NULL,                     199,    201,        NULL);


UPDATE employee
SET manager_id = 1000198
WHERE employee_id = 1000199;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ANDRE',     'K',        'GILBERT',    '100000194', '1975-05-23',  'M',    NULL,           NULL,                     200,    202,        NULL),
('EMIL',      NULL,       'TRAVERSO',   '100000195', '2000-08-23',  'M',    NULL,           NULL,                     201,    203,        NULL),
('SEPHORA',   NULL,       'VILLENEUVE', '100000196', '1971-08-28',  'F',    NULL,           NULL,                     202,    204,        NULL);


UPDATE employee
SET manager_id = 1000201
WHERE employee_id = 1000202;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('AFAF',      'S',        'LOWE',       '100000197', '1975-04-23',  'M',    NULL,           NULL,                     203,    205,        NULL),
('MAXIME',    NULL,       'LAMBERT',    '100000198', '2001-08-23',  'M',    NULL,           NULL,                     204,    206,        NULL),
('TERZO',     NULL,       'HERZOG',     '100000199', '1970-08-28',  'F',    NULL,           NULL,                     205,    207,        NULL);


UPDATE employee
SET manager_id = 1000204
WHERE employee_id = 1000205;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('DEIDRA',    'A',        'LOWE',       '100000200', '1975-04-23',  'F',    NULL,           NULL,                     206,    208,        NULL),
('STARR',     NULL,       'LAMBERT',    '100000201', '2001-08-23',  'F',    NULL,           NULL,                     207,    209,        NULL),
('PING',      NULL,       'HERZOG',     '100000202', '1970-08-28',  'M',    NULL,           NULL,                     208,    210,        NULL),
('JEF',       'H',        'LOWE',       '100000203', '1975-04-23',  'M',    NULL,           NULL,                     209,    211,        NULL),
('SEVERINE',  NULL,       'LAMBERT',    '100000204', '2001-08-23',  'F',    NULL,           NULL,                     210,    212,        NULL),
('HUAN',      NULL,       'HERZOG',     '100000205', '1970-08-28',  'F',    NULL,           NULL,                     211,    213,        NULL);


UPDATE employee
SET manager_id = 1000210
WHERE employee_id = 1000209;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('ELI',       'P',        'LOWE',       '100000206', '1978-12-01',  'M',    NULL,           NULL,                     212,    214,        NULL),
('RICO',      NULL,       'LAMBERT',    '100000207', '1999-04-02',  'M',    NULL,           NULL,                     213,    215,        NULL),
('DEVARAJ',   NULL,       'HERZOG',     '100000208', '1978-03-03',  'M',    NULL,           NULL,                     214,    216,        NULL),
('BENVENUTO', 'L',        'LOWE',       '100000209', '1978-02-04',  'M',    NULL,           NULL,                     215,    217,        NULL),
('SARA',      NULL,       'LAMBERT',    '100000210', '1999-01-05',  'F',    NULL,           NULL,                     216,    218,        NULL),
('LALE',      NULL,       'HERZOG',     '100000211', '1978-05-06',  'M',    NULL,           NULL,                     217,    219,        NULL);


UPDATE employee
SET manager_id = 1000216
WHERE employee_id = 1000215;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('RAJ',       'D',        'OSBOURNE',   '100000212', '1978-12-01',  'M',    NULL,           NULL,                     218,    220,        NULL),
('SIMONE',    NULL,       'ASIS',       '100000213', '1999-04-02',  'F',    NULL,           NULL,                     219,    221,        NULL),
('JOLINE',    NULL,       'LEEUWENHOEK','100000214', '1978-03-03',  'F',    NULL,           NULL,                     220,    222,        NULL),
('YULIA',     'L',        'THAIDHG',    '100000215', '1978-02-04',  'F',    NULL,           NULL,                     221,    223,        NULL),
('CY',        NULL,       'NEAL',       '100000216', '1999-01-05',  'M',    NULL,           NULL,                     222,    224,        NULL),
('ANDREA',    NULL,       'MCCREERY',   '100000217', '1978-05-06',  'F',    NULL,           NULL,                     223,    225,        NULL);


UPDATE employee
SET manager_id = 1000222
WHERE employee_id = 1000221;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('SIMONE',    NULL,       'MCCREERY',   '100000218', '1999-04-02',  'F',    NULL,           NULL,                     224,    226,        NULL),
('JOLINE',    NULL,       'NEAL',       '100000219', '1978-03-03',  'F',    NULL,           NULL,                     225,    227,        NULL),
('YULIA',     'L',        'SMITH',      '100000220', '1978-02-04',  'F',    NULL,           NULL,                     226,    228,        NULL),
('CY',        NULL,       'ASIS',       '100000221', '1999-01-05',  'M',    NULL,           NULL,                     227,    229,        NULL),
('ANDREA',    NULL,       'OSBOURNE',   '100000222', '1978-05-06',  'F',    NULL,           NULL,                     228,    230,        NULL),

('SUHAIL',    NULL,       'ROSE',       '100000223', '1999-04-02',  'M',    NULL,           NULL,                     229,    231,        NULL),
('NUAN',      NULL,       'SCHULTHEISS','100000224', '1978-03-03',  'M',    NULL,           NULL,                     230,    232,        NULL),
('INNOKENTI', 'L',        'SUZUKI',     '100000225', '1978-02-04',  'M',    NULL,           NULL,                     231,    233,        NULL),
('KENTIGERN', NULL,       'SHORT',      '100000226', '1999-01-05',  'M',    NULL,           NULL,                     232,    234,        NULL),
('RIEN',      NULL,       'BJARNESEN',  '100000227', '1978-05-06',  'M',    NULL,           NULL,                     233,    235,        NULL),

('SUHAIL',    NULL,       'PORCHER',    '100000228', '1999-04-02',  'M',    NULL,           NULL,                     234,    236,        NULL),
('NUAN',      NULL,       'BAUMGARTEN', '100000229', '1978-03-03',  'M',    NULL,           NULL,                     235,    237,        NULL),
('INNOKENTI', 'L',        'MIKHAILOV',  '100000230', '1978-02-04',  'M',    NULL,           NULL,                     236,    238,        NULL),
('KENTIGERN', NULL,       'BAGGI',      '100000231', '1999-01-05',  'M',    NULL,           NULL,                     237,    239,        NULL),
('RIEN',      NULL,       'NOYER',      '100000232', '1978-05-06',  'M',    NULL,           NULL,                     238,    240,        NULL),

('SIMONE',    NULL,       'PORCHER',    '100000233', '1999-04-02',  'F',    NULL,           NULL,                     239,    241,        NULL),
('JOLINE',    NULL,       'BAUMGARTEN', '100000234', '1978-03-03',  'M',    NULL,           NULL,                     240,    242,        NULL),
('YULIA',     'L',        'MIKHAILOV',  '100000235', '1978-02-04',  'M',    NULL,           NULL,                     241,    243,        NULL),
('CY',        NULL,       'BAGGI',      '100000236', '1999-01-05',  'M',    NULL,           NULL,                     242,    244,        NULL),
('ANDREA',    NULL,       'NOYER',      '100000237', '1978-05-06',  'M',    NULL,           NULL,                     243,    245,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('LAWYER',    'D',        'SAWYER',     '100000238', '1978-12-01',  'M',    NULL,           NULL,                     244,    246,        NULL),
('SIMONE',    NULL,       'LAW',        '100000239', '1999-04-02',  'F',    NULL,           NULL,                     245,    247,        NULL),
('JOE',       NULL,       'TURNEY',     '100000240', '1978-03-03',  'M',    NULL,           NULL,                     246,    248,        NULL);


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'SAWYER',     '100000241', '1978-12-01',  'M',    NULL,           NULL,                     247,    249,        NULL),
('NATHAN',    NULL,       'TURNER',     '100000242', '1999-04-02',  'M',    NULL,           NULL,                     248,    250,        NULL),
('ELISE',     NULL,       'STEEL',      '100000243', '1978-03-03',  'F',    NULL,           NULL,                     249,    251,        NULL),
('MARY',      NULL,       'SUE',        '100000244', '1978-03-03',  'F',    NULL,           NULL,                     250,    252,        NULL);


UPDATE employee
SET manager_id = 1000250
WHERE employee_id > 1000247 AND NOT employee_id = 1000250;


INSERT INTO employee 
(first_name,  m_initial,  last_name,    ssn,         dob,           gender, phone,          email,                    job_id, address_id, manager_id) VALUES
('JOEL',      'D',        'GOLD',       '100000245', '1965-12-01',  'M',    NULL,           'jgold@company.org',      251,    253,        NULL),
('NATHAN',    NULL,       'SILVER',     '100000246', '1966-04-02',  'M',    NULL,           'nsilver@company.org',    252,    254,        NULL),
('ELISE',     NULL,       'BRONZE',     '100000247', '1967-03-14',  'F',    NULL,           'ebronze@company.org',    253,    255,        NULL),
('MARY',      NULL,       'COPPER',     '100000248', '1968-03-04',  'F',    NULL,           'mcopper@company.org',    254,    256,        NULL),
('JOHN',      'K',        'BRASS',      '100000249', '1969-12-11',  'M',    NULL,           'jbrass@company.org',     255,    257,        NULL),
('NEIL',      NULL,       'ZINC',       '100000250', '1965-07-02',  'M',    NULL,           'nzinc@company.org',      256,    258,        NULL),
('ELLEN',     NULL,       'TIN',        '100000251', '1966-03-03',  'F',    NULL,           'etin@company.org',       257,    259,        NULL),
('MYRTLE',    NULL,       'PEWTER',     '100000252', '1967-04-03',  'F',    NULL,           'mpewter@company.org',    258,    260,        NULL),
('JERKYLL',   'G',        'LEAD',       '100000253', '1968-12-06',  'M',    NULL,           'jlead@company.org',      259,    261,        NULL),
('NERRY',     NULL,       'CHROMIUM',   '100000254', '1969-04-02',  'M',    NULL,           'nchromium@company.org',  260,    262,        NULL),
('PENELOPE',  NULL,       'IRON',       '100000255', '1970-03-03',  'F',    NULL,           'eiron@company.org',      261,    263,        NULL);


-- Create department heads
UPDATE department
SET department_head_id = 1000000
WHERE department_id = 1;


UPDATE department
SET department_head_id = 1000252
WHERE department_id = 2;


UPDATE department
SET department_head_id = 1000253
WHERE department_id = 3;


UPDATE department
SET department_head_id = 1000254
WHERE department_id = 4;


UPDATE department
SET department_head_id = 1000255
WHERE department_id = 5;


UPDATE department
SET department_head_id = 1000256
WHERE department_id = 6;


UPDATE department
SET department_head_id = 1000257
WHERE department_id = 7;


UPDATE department
SET department_head_id = 1000258
WHERE department_id = 8;


UPDATE department
SET department_head_id = 1000259
WHERE department_id = 9;


UPDATE department
SET department_head_id = 1000260
WHERE department_id = 10;


UPDATE department
SET department_head_id = 1000261
WHERE department_id = 11;


UPDATE department
SET department_head_id = 1000262
WHERE department_id = 12;


-- Salary
INSERT INTO salary (employee_id, hourly_wage, annual_bonus) VALUES
(1000000, '$375', '$700,000'),
(1000001, '$100', '$250,000'),
(1000002, '$90',  '$200,000'),
(1000003, '$50',  '$120,000'),
(1000004, '$100', '$200,000'),
(1000005, '$35',  '$100,000'),
(1000006, '$35',  '$100,000'),
(1000007, '$35',  '$100,000'),
(1000008, '$30', '$1,000'),
(1000009, '$30', '$1,000'),
(1000010, '$40', '$1,000'),
(1000011, '$30', '$1,000'),
(1000012, '$25', '$1,000'),
(1000013, '$22', '$1,000'),
(1000014, '$22', '$1,000'),
(1000015, '$18', '$1,000'),
(1000016, '$20', '$1,000'),
(1000017, '$40', '$1,000'),
(1000018, '$30', '$1,000'),
(1000019, '$30', '$1,000'),
(1000020, '$40', '$1,000'),
(1000021, '$30', '$1,000'),
(1000022, '$25', '$1,000'),
(1000023, '$22', '$1,000'),
(1000024, '$22', '$1,000'),
(1000025, '$18', '$1,000'),
(1000026, '$20', '$1,000'),
(1000027, '$40', '$1,000'),
(1000028, '$30', '$1,000'),
(1000029, '$30', '$1,000'),
(1000030, '$40', '$1,000'),
(1000031, '$30', '$1,000'),
(1000032, '$25', '$1,000'),
(1000033, '$22', '$1,000'),
(1000034, '$22', '$1,000'),
(1000035, '$18', '$1,000'),
(1000036, '$20', '$1,000'),
(1000037, '$40', '$1,000'),
(1000038, '$30', '$1,000'),
(1000039, '$30', '$1,000'),
(1000040, '$40', '$1,000'),
(1000041, '$30', '$1,000'),
(1000042, '$25', '$1,000'),
(1000043, '$22', '$1,000'),
(1000044, '$22', '$1,000'),
(1000045, '$18', '$1,000'),
(1000046, '$20', '$1,000'),
(1000047, '$40', '$1,000'),
(1000048, '$40', '$5,000'),
(1000049, '$34', '$3,000'),
(1000050, '$42', '$5,000'),
(1000051, '$34', '$3,000'),
(1000052, '$40', '$5,000'),
(1000053, '$34', '$3,000'),
(1000054, '$30', '$1,000'),
(1000055, '$30', '$1,000'),
(1000056, '$40', '$1,000'),
(1000057, '$30', '$1,000'),
(1000058, '$25', '$1,000'),
(1000059, '$22', '$1,000'),
(1000060, '$22', '$1,000'),
(1000061, '$18', '$1,000'),
(1000062, '$20', '$1,000'),
(1000063, '$35', '$1,000'),
(1000064, '$40', '$1,000'),
(1000065, '$30', '$1,000'),
(1000066, '$30', '$1,000'),
(1000067, '$40', '$1,000'),
(1000068, '$30', '$1,000'),
(1000069, '$25', '$1,000'),
(1000070, '$22', '$1,000'),
(1000071, '$22', '$1,000'),
(1000072, '$18', '$1,000'),
(1000073, '$20', '$1,000'),
(1000074, '$35', '$1,000'),
(1000075, '$40', '$1,000'),
(1000076, '$30', '$1,000'),
(1000077, '$30', '$1,000'),
(1000078, '$40', '$1,000'),
(1000079, '$30', '$1,000'),
(1000080, '$25', '$1,000'),
(1000081, '$22', '$1,000'),
(1000082, '$22', '$1,000'),
(1000083, '$18', '$1,000'),
(1000084, '$20', '$1,000'),
(1000085, '$35', '$1,000'),
(1000086, '$40', '$1,000'),
(1000087, '$30', '$1,000'),
(1000088, '$30', '$1,000'),
(1000089, '$40', '$1,000'),
(1000090, '$30', '$1,000'),
(1000091, '$25', '$1,000'),
(1000092, '$22', '$1,000'),
(1000093, '$22', '$1,000'),
(1000094, '$18', '$1,000'),
(1000095, '$20', '$1,000'),
(1000096, '$35', '$1,000'),
(1000097, '$40', '$1,000'),
(1000098, '$30', '$10,000'),
(1000099, '$30', '$10,000'),
(1000100, '$40', '$10,000'),
(1000101, '$30', '$10,000'),
(1000102, '$25', '$10,000'),
(1000103, '$22', '$10,000'),
(1000104, '$22', '$10,000'),
(1000105, '$18', '$10,000'),
(1000106, '$40', '$10,000'),
(1000107, '$40', '$10,000'),
(1000108, '$40', '$10,000'),
(1000109, '$40', '$10,000'),
(1000110, '$40', '$10,000'),
(1000111, '$40', '$10,000'),
(1000112, '$40', '$10,000'),
(1000113, '$40', '$10,000'),
(1000114, '$40', '$10,000'),
(1000115, '$40', '$10,000'),
(1000116, '$40', '$10,000'),
(1000117, '$40', '$10,000'),
(1000118, '$40', '$10,000'),
(1000119, '$40', '$10,000'),
(1000120, '$40', '$10,000'),
(1000121, '$40', '$10,000'),
(1000122, '$40', '$10,000'),
(1000123, '$40', '$10,000'),
(1000124, '$40', '$10,000'),
(1000125, '$40', '$10,000'),
(1000126, '$40', '$10,000'),
(1000127, '$40', '$10,000'),
(1000128, '$40', '$10,000'),
(1000129, '$40', '$10,000'),
(1000130, '$40', '$10,000'),
(1000131, '$40', '$10,000'),
(1000132, '$40', '$10,000'),
(1000133, '$40', '$10,000'),
(1000134, '$40', '$10,000'),
(1000135, '$40', '$10,000'),
(1000136, '$40', '$10,000'),
(1000137, '$40', '$10,000'),
(1000138, '$40', '$10,000'),
(1000139, '$40', '$10,000'),
(1000140, '$40', '$10,000'),
(1000141, '$40', '$10,000'),
(1000142, '$40', '$10,000'),
(1000143, '$40', '$10,000'),
(1000144, '$40', '$10,000'),
(1000145, '$40', '$10,000'),
(1000146, '$40', '$10,000'),
(1000147, '$40', '$10,000'),
(1000148, '$40', '$10,000'),
(1000149, '$40', '$10,000'),
(1000150, '$40', '$10,000'),
(1000151, '$40', '$10,000'),
(1000152, '$40', '$10,000'),
(1000153, '$40', '$10,000'),
(1000154, '$30', '$10,000'),
(1000155, '$30', '$10,000'),
(1000156, '$40', '$10,000'),
(1000157, '$15', '$0'),
(1000158, '$25', '$10,000'),
(1000159, '$22', '$10,000'),
(1000160, '$22', '$10,000'),
(1000161, '$15', '$0'),
(1000162, '$25', '$10,000'),
(1000163, '$22', '$10,000'),
(1000164, '$22', '$10,000'),
(1000165, '$15', '$0'),
(1000166, '$30', '$1,000'),
(1000167, '$30', '$1,000'),
(1000168, '$20', '$1,000'),
(1000169, '$30', '$1,000'),
(1000170, '$25', '$1,000'),
(1000171, '$22', '$1,000'),
(1000172, '$22', '$1,000'),
(1000173, '$18', '$1,000'),
(1000174, '$35', '$2,250'),
(1000175, '$35', '$2,500'),
(1000176, '$28', '$1,000'),
(1000177, '$24', '$1,000'),
(1000178, '$29', '$1,000'),
(1000179, '$31', '$1,000'),
(1000180, '$40', '$1,000'),
(1000181, '$20', '$0'),
(1000182, '$35', '$2,250'),
(1000183, '$35', '$2,500'),
(1000184, '$28', '$1,000'),
(1000185, '$24', '$1,000'),
(1000186, '$29', '$1,000'),
(1000187, '$31', '$1,000'),
(1000188, '$40', '$1,000'),
(1000189, '$20', '$0'),
(1000190, '$35', '$2,250'),
(1000191, '$35', '$2,500'),
(1000192, '$28', '$1,000'),
(1000193, '$24', '$1,000'),
(1000194, '$29', '$1,000'),
(1000195, '$31', '$1,000'),
(1000196, '$40', '$1,000'),
(1000197, '$20', '$0'),
(1000198, '$35', '$2,250'),
(1000199, '$16', '$0'),
(1000200, '$20', '$1,000'),
(1000201, '$28', '$1,000'),
(1000202, '$20', '$1,000'),
(1000203, '$15', '$0'),
(1000204, '$29', '$1,000'),
(1000205, '$20', '$1,000'),
(1000206, '$15.50', '$0'),
(1000207, '$20', '$2,250'),
(1000208, '$20', '$2,250'),
(1000209, '$30', '$2,250'),
(1000210, '$40', '$2,250'),
(1000211, '$20', '$2,250'),
(1000212, '$40', '$2,250'),
(1000213, '$20', '$2,250'),
(1000214, '$20', '$2,250'),
(1000215, '$30', '$2,250'),
(1000216, '$40', '$2,250'),
(1000217, '$20', '$2,250'),
(1000218, '$40', '$2,250'),
(1000219, '$20', '$2,250'),
(1000220, '$20', '$2,250'),
(1000221, '$30', '$2,250'),
(1000222, '$40', '$2,250'),
(1000223, '$20', '$2,250'),
(1000224, '$40', '$2,250'),
(1000225, '$40', '$10,000'),
(1000226, '$40', '$10,000'),
(1000227, '$40', '$10,000'),
(1000228, '$40', '$10,000'),
(1000229, '$40', '$10,000'),
(1000230, '$40', '$10,000'),
(1000231, '$40', '$10,000'),
(1000232, '$40', '$10,000'),
(1000233, '$40', '$10,000'),
(1000234, '$40', '$10,000'),
(1000235, '$40', '$10,000'),
(1000236, '$40', '$10,000'),
(1000237, '$40', '$10,000'),
(1000238, '$40', '$10,000'),
(1000239, '$40', '$10,000'),
(1000240, '$40', '$10,000'),
(1000241, '$40', '$10,000'),
(1000242, '$40', '$10,000'),
(1000243, '$40', '$10,000'),
(1000244, '$40', '$10,000'),
(1000245, '$40', '$10,000'),
(1000246, '$40', '$10,000'),
(1000247, '$40', '$10,000'),
(1000248, '$35', '$10,000'),
(1000249, '$30', '$10,000'),
(1000250, '$40', '$10,000'),
(1000251, '$16', '$0'),
(1000252, '$50', '$90,000'),
(1000253, '$50', '$90,000'),
(1000254, '$50', '$90,000'),
(1000255, '$50', '$90,000'),
(1000256, '$50', '$90,000'),
(1000257, '$50', '$90,000'),
(1000258, '$50', '$90,000'),
(1000259, '$50', '$90,000'),
(1000260, '$50', '$90,000'),
(1000261, '$50', '$90,000'),
(1000262, '$50', '$90,000');


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-01-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-02-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-03-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;


INSERT INTO payroll(pay_period,tax_rate,gross_income,taxed_income,net_income,hours_worked,employee_id)
SELECT pay_period,tax_rate,gross_income,gross_income * tax_rate AS taxed_income,gross_income * (1 - tax_rate) AS net_income,hours_worked,employee_id
FROM (
	SELECT e.employee_id, (4.4 * weekly_hours)::real AS hours_worked, '1980-04-01'::DATE AS pay_period, '0.1'::REAL AS tax_rate, (4.4 * weekly_hours)::real * hourly_wage AS gross_income
	FROM employee e
		JOIN job j ON e.job_id = j.job_id
		JOIN salary s ON e.employee_id = s.employee_id
	WHERE NOT e.job_id = 0
) AS gross_calc;
COMMIT;
END TRANSACTION;

