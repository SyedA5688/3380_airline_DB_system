-- Run these commands in ElephantSQL postgres database in browser tab to recreate starting tables for local testing

DROP TABLE IF EXISTS payroll          CASCADE;
DROP TABLE IF EXISTS benefits         CASCADE;
DROP TABLE IF EXISTS salary           CASCADE;
DROP TABLE IF EXISTS leave            CASCADE;
DROP TABLE IF EXISTS department       CASCADE;
DROP TABLE IF EXISTS job_location     CASCADE;
DROP TABLE IF EXISTS job              CASCADE;
DROP TABLE IF EXISTS employee         CASCADE;
DROP TABLE IF EXISTS employee_address CASCADE;


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
('CHAIRMAN',                1,  2,  10, 9),
('VICE CHAIR',              1,  2,  10, 9),
('BOARD SECRETARY',         1,  2,  10, 9),
('TREASURER',               1,  2,  10, 9),
('BOARD MEMBER',            1,  2,  5,  9),

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
('AIRLINE STATION AGENT',         3,  19, 40, 3),
('TRANSPORTATION SECURITY AGENT', 3,  19, 40, 7),

-- Flight Operations (4)
('FLIGHT DISPATCHER',       3,  4,  40, 6),
('AVIATION METEOROLOGIST',  3,  4,  40, 6),
('FLIGHT DISPATCHER',       3,  9,  40, 6),
('AVIATION METEOROLOGIST',  3,  9,  40, 6),
('FLIGHT DISPATCHER',       3,  14, 40, 6),
('AVIATION METEOROLOGIST',  3,  14, 40, 6),
('FLIGHT DISPATCHER',       3,  19, 40, 6),
('AVIATION METEOROLOGIST',  3,  19, 40, 6),

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
('PUBLIC RELATIONS SPECIALIST', 12,  1,  40, 3),
('PUBLIC RELATIONS GENERALIST', 12,  1,  40, 3),
('PUBLIC RELATIONS MANAGER',    12,  1,  40, 3),
('PUBLIC RELATIONS INTERN',     12,  1,  20, 3),

('PUBLIC RELATIONS SPECIALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS GENERALIST', 12,  2,  40, 3),
('PUBLIC RELATIONS MANAGER',    12,  2,  40, 3),
('PUBLIC RELATIONS INTERN',     12,  2,  20, 3),

('PUBLIC RELATIONS SPECIALIST', 12,  3,  40, 3),
('PUBLIC RELATIONS GENERALIST', 12,  3,  40, 3),
('PUBLIC RELATIONS MANAGER',    12,  3,  40, 3),
('PUBLIC RELATIONS INTERN',     12,  3,  20, 3);

