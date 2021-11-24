-- Run these commands in ElephantSQL postgres database in browser tab to recreate starting tables for local testing

DROP TABLE IF EXISTS benefits;
CREATE TABLE benefits (
  benefits_package_id        INT          GENERATED ALWAYS AS IDENTITY, 
  amount                     INT          NOT NULL,
  stock_options              INT          NOT NULL, 
  health_insurance_provider  VARCHAR(100) NOT NULL CHECK(health_insurance_provider ~ '^[A-Z \d]+$'),
  retirement_plan            INT          NOT NULL,

  PRIMARY KEY(benefits_package_id)
);

INSERT INTO benefits OVERRIDING SYSTEM VALUE VALUES(0, 0, 0, 'UNASSIGNED', 0);
INSERT INTO benefits (amount, stock_options, health_insurance_provider, retirement_plan) 
VALUES  (2000, 5000, 'AETNA', 3),
        (3000, 3000, 'ALL STATE', 1),
        (2500, 4000, 'ALL STATE', 2);

DROP TABLE IF EXISTS employee_address;
CREATE TABLE employee_address (
  address_id      INT           GENERATED ALWAYS AS IDENTITY,
  street_address  VARCHAR(100)  NOT NULL CHECK(street_address ~ '^[A-Z \/\d#\.,-]+$'),   -- Includes appt/po box info and locality info if applicable
  city            VARCHAR(50)   NOT NULL CHECK(city ~ '^[A-Z ]+$'), -- Also serves as post town if applicable
  zip_code        VARCHAR(16)   CHECK(zip_code ~ '^[\d \-A-Z]+$'), -- Also serves as postcode if applicable
  state           VARCHAR(50)   CHECK(state ~ '^[A-Z ]+$'), -- Also serves as province if applicable
  country         VARCHAR(50)   NOT NULL CHECK(country ~ '^[A-Z ]+$'),   -- Also serves as region if applicable

  PRIMARY KEY(address_id)
);

INSERT INTO employee_address (street_address, city, zip_code, state, country) 
VALUES  ('12345 ROCK BRIDGE LN', 'HOUSTON', '12345', 'TX', 'UNITED STATES'),
        ('54321 OTHER ROCK DRIVE', 'NEW YORK CITY', '98765', 'NY', 'UNITED STATES'),
        ('1 CHAPEL HILL HESWALL', 'BOURNEMOUTH', 'A11 B12', NULL, 'UNITED KINGDOM'),
        ('10-123 1/2 MAIN STREET NW', 'MONTREAL', 'H3Z 2Y7', 'QC', 'CANADA');

DROP TABLE IF EXISTS job_location;
CREATE TABLE job_location (
  location_id INT GENERATED ALWAYS AS IDENTITY,
  airport_id  INT,
  address_id  INT NOT NULL,
  flight_id   INT,

  PRIMARY KEY(location_id)
);

INSERT INTO job_location OVERRIDING SYSTEM VALUE VALUES(0, NULL, 0, NULL);
INSERT INTO job_location (airport_id, address_id, flight_id)
VALUES  (123, 123, NULL),
        (NULL, 987, NULL),
        (123, 123, 5678);

DROP TABLE IF EXISTS department;
CREATE TABLE department (
  department_id       INT          GENERATED ALWAYS AS IDENTITY,
  department_name     VARCHAR(50)  NOT NULL CHECK(department_name ~ '^[A-Z ]+$'),
  creation_date       DATE         NOT NULL, 
  department_head_id  INT,

  PRIMARY KEY(department_id)
);

INSERT INTO department OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', '1980-1-1');
INSERT INTO department (department_name, creation_date) 
VALUES  ('LINE PERSONNEL', '1980-8-14'),
        ('CARGO', '1979-2-28'),
        ('BOARD OF DIRECTORS', '1970-6-26'),
        ('OPERATIONS', '1981-10-01');

DROP TABLE IF EXISTS job;
CREATE TABLE job (
  job_id              INT         GENERATED ALWAYS AS IDENTITY, 
  job_title           VARCHAR(30) NOT NULL CHECK(job_title ~ '^[A-Z \-]+$'),
  department_id       INT         NOT NULL, 
  location_id         INT         NOT NULL,
  weekly_hours        INT         CHECK(weekly_hours <= 168),
  benefits_package_id INT         NOT NULL,

  PRIMARY KEY(job_id),
  FOREIGN KEY(department_id)
    REFERENCES department(department_id),
  FOREIGN KEY(location_id)
    REFERENCES job_location(location_id),
  FOREIGN KEY(benefits_package_id)
    REFERENCES benefits(benefits_package_id)
);

INSERT INTO job OVERRIDING SYSTEM VALUE VALUES(0, 'UNASSIGNED', 0, 0, 0, 0);
INSERT INTO job (job_title, department_id, location_id, weekly_hours, benefits_package_id) 
VALUES  ('PILOT', 1, 3, 40, 3),
        ('FLIGHT ATTENDANT', 1, 3, 40, 2),
        ('CHIEF EXECUTIVE OFFICER', 3, 2, 40, 2),
        ('CARGO HOLDER', 2, 1, 40, 1),
        ('CO-PILOT', 1, 3, 40, 3);

DROP TABLE IF EXISTS employee;
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
  manager_id  INT           REFERENCES employee(employee_id),

  PRIMARY KEY(employee_id),
  FOREIGN KEY(job_id)
    REFERENCES job(job_id)
    ON DELETE SET DEFAULT,
  FOREIGN KEY(address_id)
    REFERENCES employee_address(address_id)
);

INSERT INTO employee (first_name, m_initial, last_name, ssn, dob, gender, phone, email , job_id, address_id, manager_id) 
VALUES  ('JOHN', 'P', 'DOE', 123456789, '2001-11-21', 'M', '+18323459253', 'john.p.doe@gmail.com', 3, 2, NULL),
        ('JANE', 'M', 'AUSTERE', 195836284, '1985-01-30', 'F', '+18329272847', 'jane.m.austere@company.org', 1, 3, NULL),
        ('KEVIN', 'T', 'HOANG', 171662836, '2000-7-15', 'M', '+18322778264', 'kevin.t.hoang@example.com', 5, 4, 1000001);

DROP TABLE IF EXISTS salary;
CREATE TABLE salary (
  salary_id    INT    GENERATED ALWAYS AS IDENTITY,
  employee_id  INT    NOT NULL,
  hourly_wage  MONEY  NOT NULL,
  annual_bonus INT    NOT NULL,

  PRIMARY KEY(salary_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
);

DROP TABLE IF EXISTS leave;
CREATE TABLE leave (
  leave_id    INT           GENERATED ALWAYS AS IDENTITY,
  employee_id INT           NOT NULL,
  date        DATE          NOT NULL,
  reason      VARCHAR(100)  NOT NULL CHECK(reason ~ '^[A-Z ]+$'),
  status      VARCHAR(50)   NOT NULL CHECK(status ~ '^[A-Z ]+$'),

  PRIMARY KEY(leave_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
);

DROP TABLE IF EXISTS payroll;
CREATE TABLE payroll (
  payroll_id    INT       GENERATED ALWAYS AS IDENTITY,
  employee_id   INT       NOT NULL, 
  job_id        INT       NOT NULL,
  salary_id     INT       NOT NULL,
  leave_id      INT       NOT NULL,
  hours_worked  INTERVAL  NOT NULL,
  pay_period    DATE      NOT NULL,
  tax_rate      REAL      NOT NULL,

  PRIMARY KEY(payroll_id),
  FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id),
  FOREIGN KEY(job_id)
    REFERENCES job(job_id),
  FOREIGN KEY(leave_id)
    REFERENCES leave(leave_id)
);