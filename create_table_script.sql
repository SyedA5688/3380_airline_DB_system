-- Run these commands in ElephantSQL postgres database in browser tab to recreate starting tables for local testing

-- DROP TABLE IF EXISTS payroll          CASCADE;
-- DROP TABLE IF EXISTS benefits         CASCADE;
-- DROP TABLE IF EXISTS salary           CASCADE;
-- DROP TABLE IF EXISTS leave            CASCADE;
-- DROP TABLE IF EXISTS department       CASCADE;
-- DROP TABLE IF EXISTS job_location     CASCADE;
-- DROP TABLE IF EXISTS job              CASCADE;
-- DROP TABLE IF EXISTS employee         CASCADE;
-- DROP TABLE IF EXISTS employee_address CASCADE;


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

-- Employee Address
INSERT INTO employee_address (street_address, city, zip_code, state, country) VALUES
('123 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('123 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('321 ROCKY RD',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('555 STONE ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('9029 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A');

INSERT INTO employee_address (street_address, city, zip_code, state, country) VALUES
('765 MAIN ST',         'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('767 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('876 MINOR ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A');

INSERT INTO employee_address (street_address, city, zip_code, state, country) VALUES
('8760 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 SKY ST',          'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY A', '98764',  'STATE A', 'COUNTRY A');

INSERT INTO employee_address (street_address, city, zip_code, state, country) VALUES
('8760 MAIN ST',        'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('920 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('808 SKY ST',          'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8760 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('8755 SUMMERSIDE LN',  'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('423 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('202 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('101 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('896 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A'),
('909 ROCKDRIVE RD',    'CITY B', '12345',  'STATE B', 'COUNTRY A');

INSERT INTO employee_address (street_address, city, zip_code, state, country) VALUES
('8770 MAIN ST',        'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('920 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('808 SKY RD',          'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8760 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('8755 AUTUMNLAND LN',  'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('423 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('202 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('101 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('896 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A'),
('909 STONEROCK RD',    'CITY B', '54321',  'STATE B', 'COUNTRY A');

INSERT INTO employee_address (street_address, city, zip_code, state, country) VALUES
('8760 MAIN ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('920 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('808 FLOOR ST',        'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8760 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('8755 SUMMERSIDE DR',  'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('423 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('202 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('101 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('896 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B'),
('909 OCEANWATER LN',   'CITY C', '56565',  'STATE C', 'COUNTRY B');

INSERT INTO employee_address (street_address, city, zip_code, state, country) VALUES
('8960 MAIN ST',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('920 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('808 DOORE DR',        'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8760 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('8755 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A'),
('423 SEAWATER LN',     'CITY A', '98764',  'STATE A', 'COUNTRY A');

INSERT INTO employee_address (street_address, city, zip_code, state, country) VALUES
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
('8754 SUMMERTOP RD',   'CITY A', '98764',  'STATE A', 'COUNTRY A');

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

-- Salary
INSERT INTO salary (employee_id, hourly_wage, annual_bonus) VALUES
(1000000, '$375', '$700,000'),

(1000001, '$100', '$250,000'),
(1000002, '$90',  '$200,000'),
(1000003, '$50',  '$120,000'),
(1000004, '$100', '$200,000'),

(1000005, '$35',  '$100,000'),
(1000006, '$35',  '$100,000'),
(1000007, '$35',  '$100,000');

INSERT INTO salary (employee_id, hourly_wage, annual_bonus) VALUES
(1000008, '$30', '$1,000'),
(1000009, '$30', '$1,000'),
(1000010, '$40', '$1,000'),
(1000011, '$30', '$1,000'),
(1000012, '$25', '$1,000'),
(1000013, '$22', '$1,000'),
(1000014, '$22', '$1,000'),
(1000015, '$18', '$1,000'),
(1000016, '$20', '$1,000'),
(1000017, '$40', '$1,000');

INSERT INTO salary (employee_id, hourly_wage, annual_bonus) VALUES
(1000018, '$30', '$1,000'),
(1000019, '$30', '$1,000'),
(1000020, '$40', '$1,000'),
(1000021, '$30', '$1,000'),
(1000022, '$25', '$1,000'),
(1000023, '$22', '$1,000'),
(1000024, '$22', '$1,000'),
(1000025, '$18', '$1,000'),
(1000026, '$20', '$1,000'),
(1000027, '$40', '$1,000');

INSERT INTO salary (employee_id, hourly_wage, annual_bonus) VALUES
(1000028, '$30', '$1,000'),
(1000029, '$30', '$1,000'),
(1000030, '$40', '$1,000'),
(1000031, '$30', '$1,000'),
(1000032, '$25', '$1,000'),
(1000033, '$22', '$1,000'),
(1000034, '$22', '$1,000'),
(1000035, '$18', '$1,000'),
(1000036, '$20', '$1,000'),
(1000037, '$40', '$1,000');

INSERT INTO salary (employee_id, hourly_wage, annual_bonus) VALUES
(1000038, '$30', '$1,000'),
(1000039, '$30', '$1,000'),
(1000040, '$40', '$1,000'),
(1000041, '$30', '$1,000'),
(1000042, '$25', '$1,000'),
(1000043, '$22', '$1,000'),
(1000044, '$22', '$1,000'),
(1000045, '$18', '$1,000'),
(1000046, '$20', '$1,000'),
(1000047, '$40', '$1,000');

INSERT INTO salary (employee_id, hourly_wage, annual_bonus) VALUES
(1000048, '$40', '$5,000'),
(1000049, '$34', '$3,000'),
(1000050, '$42', '$5,000'),
(1000051, '$34', '$3,000'),
(1000052, '$40', '$5,000'),
(1000053, '$34', '$3,000');

INSERT INTO salary (employee_id, hourly_wage, annual_bonus) VALUES
(1000054, '$30', '$1,000'),
(1000055, '$30', '$1,000'),
(1000056, '$40', '$1,000'),
(1000057, '$30', '$1,000'),
(1000058, '$25', '$1,000'),
(1000059, '$22', '$1,000'),
(1000060, '$22', '$1,000'),
(1000061, '$18', '$1,000'),
(1000062, '$20', '$1,000'),
(1000063, '$20', '$1,000'),
(1000064, '$40', '$1,000');
