-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-09-17 05:02:20.284

-- tables
-- Table: academies
CREATE TABLE academies (
    id bigint  NOT NULL,
    academy_name varchar(80)  NOT NULL,
    academy_description varchar(255)  NOT NULL,
    street varchar(100)  NOT NULL,
    district varchar(50)  NOT NULL,
    province varchar(50)  NOT NULL,
    department varchar(50)  NOT NULL,
    email varchar(255)  NOT NULL,
    country_code varchar(5)  NOT NULL,
    phone varchar(15)  NOT NULL,
    ruc char(11)  NOT NULL,
    administrator_id bigint  NOT NULL,
    CONSTRAINT academies_pk PRIMARY KEY (id)
);

-- Table: administrators
CREATE TABLE administrators (
    id bigint  NOT NULL,
    first_name varchar(50)  NOT NULL,
    last_name varchar(50)  NOT NULL,
    country_code varchar(5)  NOT NULL,
    phone varchar(15)  NOT NULL,
    dni char(8)  NOT NULL,
    academy_id bigint  NOT NULL,
    user_id bigint  NOT NULL,
    academies_id bigint  NOT NULL,
    CONSTRAINT administrators_pk PRIMARY KEY (id)
);

-- Table: teachers
CREATE TABLE teachers (
    id bigint  NOT NULL,
    first_name varchar(50)  NOT NULL,
    last_name varchar(50)  NOT NULL,
    academy_id bigint  NOT NULL,
    user_id bigint  NOT NULL,
    academies_id bigint  NOT NULL,
    CONSTRAINT id PRIMARY KEY (id)
);

-- foreign keys
-- Reference: administrators_academies (table: administrators)
ALTER TABLE administrators ADD CONSTRAINT administrators_academies FOREIGN KEY administrators_academies (academies_id)
    REFERENCES academies (id);

-- Reference: teachers_academies (table: teachers)
ALTER TABLE teachers ADD CONSTRAINT teachers_academies FOREIGN KEY teachers_academies (academies_id)
    REFERENCES academies (id);

-- End of file.
