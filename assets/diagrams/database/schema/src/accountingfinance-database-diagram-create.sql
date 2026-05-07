-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-09-17 19:01:25.586

-- tables
-- Table: reports
CREATE TABLE reports (
    id bigint  NOT NULL,
    report_type enum('INCOME', 'EXPENSE', 'BALANCE_SHEET', 'CASH_FLOW', 'OTHER')  NOT NULL,
    start_date date  NOT NULL,
    end_date date  NOT NULL,
    generated_date date  NOT NULL,
    academy_id bigint  NOT NULL,
    CONSTRAINT reports_pk PRIMARY KEY (id)
);

-- Table: transactions
CREATE TABLE transactions (
    id bigint  NOT NULL,
    transaction_type enum('INCOME','EXPENSE')  NOT NULL,
    transaction_mategory enum('ENROLLMENT','MONTHLY_FEE','SALARY', 'SUPPLIES', 'MAINTENANCE', 'OTHER')  NOT NULL,
    transaction_method enum('CASH', 'CREDIT_CARD', 'DEBIT_CARD', 'BANK_TRANSFER', 'WALLET', 'OTHER')  NOT NULL,
    amount decimal(12,2)  NOT NULL,
    currency varchar(3)  NOT NULL,
    description varchar(255)  NOT NULL,
    transaction_date date  NOT NULL,
    academy_id bigint  NOT NULL,
    CONSTRAINT transactions_pk PRIMARY KEY (id)
);

-- End of file.
