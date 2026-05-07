-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-09-17 09:18:35.351

-- tables
-- Table: roles
CREATE TABLE roles (
    id bigint  NOT NULL,
    name ENUM('ROLE_USER','ROLE_ADMINISTRATOR','ROLE_TEACHER')  NOT NULL,
    CONSTRAINT roles_pk PRIMARY KEY (id)
);

-- Table: user_roles
CREATE TABLE user_roles (
    user_id int  NOT NULL,
    role_id int  NOT NULL
);

-- Table: users
CREATE TABLE users (
    id bigint  NOT NULL,
    email_adress varchar(255)  NOT NULL,
    password varchar(120)  NOT NULL,
    verification_code varchar(20)  NOT NULL,
    verification_expires datetime  NOT NULL,
    tenant_id bigint  NOT NULL,
    verification_status ENUM('NOT_VERIFIED', 'VERIFIED')  NOT NULL,
    account_status ENUM('PENDING','ACTIVE', 'BLOCKED', 'DELETED')  NOT NULL,
    CONSTRAINT users_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: user_roles_roles (table: user_roles)
ALTER TABLE user_roles ADD CONSTRAINT user_roles_roles FOREIGN KEY user_roles_roles (role_id)
    REFERENCES roles (id);

-- Reference: user_roles_users (table: user_roles)
ALTER TABLE user_roles ADD CONSTRAINT user_roles_users FOREIGN KEY user_roles_users (user_id)
    REFERENCES users (id);

-- End of file.
