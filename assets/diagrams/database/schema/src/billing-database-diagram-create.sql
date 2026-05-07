-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-09-16 02:57:32.668

-- tables
-- Table: billing_accounts
CREATE TABLE billing_accounts (
    id bigint  NOT NULL,
    studentId bigint  NOT NULL,
    account_status enum('ACTIVE','OVERDUE','SUSPENDED','CANCELLED')  NOT NULL,
    CONSTRAINT billing_accounts_pk PRIMARY KEY (id)
);

-- Table: invoices
CREATE TABLE invoices (
    id bigint  NOT NULL,
    invoice_type enum('ENROLLMENT','MONTHLY','OTHER')  NOT NULL,
    amount decimal(12,2)  NOT NULL,
    currency varchar(3)  NOT NULL,
    description varchar(255)  NOT NULL,
    issue_date date  NOT NULL,
    due_date date  NOT NULL,
    invoice_status enum('PENDING','PAID','OVERDUE','CANCELLED')  NOT NULL,
    billing_accounts_id bigint  NOT NULL,
    CONSTRAINT invoices_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: invoices_billing_accounts (table: invoices)
ALTER TABLE invoices ADD CONSTRAINT invoices_billing_accounts FOREIGN KEY invoices_billing_accounts (billing_accounts_id)
    REFERENCES billing_accounts (id);

-- End of file.
