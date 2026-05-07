-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-09-16 16:25:54.803

-- tables
-- Table: attendance_records
CREATE TABLE attendance_records (
    id bigint  NOT NULL,
    studentId bigint  NOT NULL,
    status enum('PRESENT','ABSENT','EXCLUDED')  NOT NULL,
    class_attendances_id bigint  NOT NULL,
    CONSTRAINT attendance_records_pk PRIMARY KEY  (id)
);

-- Table: class_attendances
CREATE TABLE class_attendances (
    id bigint  NOT NULL,
    classSessionId bigint  NOT NULL,
    date date  NOT NULL,
    academyId bigint  NOT NULL,
    CONSTRAINT id PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: attendance_records_class_attendances (table: attendance_records)
ALTER TABLE attendance_records ADD CONSTRAINT attendance_records_class_attendances
    FOREIGN KEY (class_attendances_id)
    REFERENCES class_attendances (id);

-- End of file.
