-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-09-17 11:02:18.420

-- tables
-- Table: academic_periods
CREATE TABLE academic_periods (
    id bigint  NOT NULL,
    period_name varchar(100)  NOT NULL,
    start_date date  NOT NULL,
    end_date date  NOT NULL,
    is_active boolean  NOT NULL,
    academy_id bigint  NOT NULL,
    CONSTRAINT academic_periods_pk PRIMARY KEY (id)
);

-- Table: students
CREATE TABLE students (
    id bigint  NOT NULL,
    first_name varchar(50)  NOT NULL,
    last_name varchar(50)  NOT NULL,
    dni char(8)  NOT NULL,
    sex enum('MALE','FEMALE')  NOT NULL,
    birth_date date  NOT NULL,
    address varchar(150)  NOT NULL,
    phone_number varchar(15)  NOT NULL,
    email varchar(255)  NOT NULL,
    academy_id bigint  NOT NULL,
    UNIQUE INDEX students_dni_uk (dni),
    CONSTRAINT students_pk PRIMARY KEY (id)
);

-- Table: enrollments
CREATE TABLE enrollments (
    id bigint  NOT NULL,
    academic_period_id bigint  NOT NULL,
    student_id bigint  NOT NULL,
    schedule_id bigint  NOT NULL,
    enrollment_status enum('ACTIVE','INACTIVE')  NOT NULL,
    amount decimal(12,2)  NOT NULL,
    currency varchar(3)  NOT NULL,
    academy_id bigint  NOT NULL,
    CONSTRAINT enrollments_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: enrollments_academic_periods (table: enrollments)
ALTER TABLE enrollments ADD CONSTRAINT enrollments_academic_periods FOREIGN KEY enrollments_academic_periods (academic_period_id)
    REFERENCES academic_periods (id);

-- Reference: enrollments_students (table: enrollments)
ALTER TABLE enrollments ADD CONSTRAINT enrollments_students FOREIGN KEY enrollments_students (student_id)
    REFERENCES students (id);

-- End of file.
