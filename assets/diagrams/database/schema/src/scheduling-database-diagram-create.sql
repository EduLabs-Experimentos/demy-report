-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-09-16 06:52:43.201

-- tables
-- Table: class_sessions
CREATE TABLE class_sessions (
    id bigint  NOT NULL,
    day_of_week enum('MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY','SATURDAY','SUNDAY')  NOT NULL,
    start_time time  NOT NULL,
    end_time time  NOT NULL,
    teacher_id bigint  NOT NULL,
    classroom_id bigint  NOT NULL,
    course_id bigint  NOT NULL,
    schedule_id bigint  NOT NULL,
    CONSTRAINT class_sessions_pk PRIMARY KEY (id)
);

-- Table: classrooms
CREATE TABLE classrooms (
    id bigint  NOT NULL,
    classroom_code varchar(50)  NOT NULL,
    capacity int  NOT NULL,
    campus varchar(100)  NOT NULL,
    academy_id bigint  NOT NULL,
    UNIQUE INDEX AK_1 (classroom_code),
    CONSTRAINT classrooms_pk PRIMARY KEY (id)
);

-- Table: courses
CREATE TABLE courses (
    id bigint  NOT NULL,
    name varchar(100)  NOT NULL,
    course_code varchar(50)  NOT NULL,
    description varchar(255)  NOT NULL,
    academy_id bigint  NOT NULL,
    UNIQUE INDEX AK_0 (course_code),
    CONSTRAINT courses_pk PRIMARY KEY (id)
);

-- Table: schedules
CREATE TABLE schedules (
    id bigint  NOT NULL,
    name varchar(100)  NOT NULL,
    academy_id bigint  NOT NULL,
    CONSTRAINT schedules_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: fk_class_sessions_classroom (table: class_sessions)
ALTER TABLE class_sessions ADD CONSTRAINT fk_class_sessions_classroom FOREIGN KEY fk_class_sessions_classroom (classroom_id)
    REFERENCES classrooms (id);

-- Reference: fk_class_sessions_course (table: class_sessions)
ALTER TABLE class_sessions ADD CONSTRAINT fk_class_sessions_course FOREIGN KEY fk_class_sessions_course (course_id)
    REFERENCES courses (id);

-- Reference: fk_class_sessions_schedule (table: class_sessions)
ALTER TABLE class_sessions ADD CONSTRAINT fk_class_sessions_schedule FOREIGN KEY fk_class_sessions_schedule (schedule_id)
    REFERENCES schedules (id);

-- End of file.
