-- IT Consultancy Management System Database Schema
-- Oracle Database DDL Scripts
-- Created by: Krishna Bhargava
-- Date: 2026-02-12

-- =============================================
-- TABLE: CONSULTANTS
-- Description: Store consultant information
-- =============================================
CREATE TABLE CONSULTANTS (
    consultant_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE,
    phone VARCHAR2(15),
    specialization VARCHAR2(100),
    hourly_rate NUMBER(10, 2),
    status VARCHAR2(20) DEFAULT 'ACTIVE',
    join_date DATE DEFAULT SYSDATE,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP
);

-- =============================================
-- TABLE: CLIENTS
-- Description: Store client/company information
-- =============================================
CREATE TABLE CLIENTS (
    client_id NUMBER PRIMARY KEY,
    company_name VARCHAR2(150) NOT NULL,
    contact_person VARCHAR2(100),
    email VARCHAR2(100),
    phone VARCHAR2(15),
    address VARCHAR2(255),
    city VARCHAR2(50),
    country VARCHAR2(50),
    status VARCHAR2(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP
);

-- =============================================
-- TABLE: PROJECTS
-- Description: Store project information
-- =============================================
CREATE TABLE PROJECTS (
    project_id NUMBER PRIMARY KEY,
    client_id NUMBER NOT NULL,
    project_name VARCHAR2(150) NOT NULL,
    description VARCHAR2(500),
    start_date DATE,
    end_date DATE,
    budget NUMBER(15, 2),
    status VARCHAR2(20) DEFAULT 'ONGOING',
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT fk_projects_clients FOREIGN KEY (client_id) REFERENCES CLIENTS(client_id)
);

-- =============================================
-- TABLE: PROJECT_ASSIGNMENTS
-- Description: Assign consultants to projects
-- =============================================
CREATE TABLE PROJECT_ASSIGNMENTS (
    assignment_id NUMBER PRIMARY KEY,
    project_id NUMBER NOT NULL,
    consultant_id NUMBER NOT NULL,
    role VARCHAR2(100),
    start_date DATE,
    end_date DATE,
    allocation_percentage NUMBER(5, 2) DEFAULT 100,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT fk_assignments_projects FOREIGN KEY (project_id) REFERENCES PROJECTS(project_id),
    CONSTRAINT fk_assignments_consultants FOREIGN KEY (consultant_id) REFERENCES CONSULTANTS(consultant_id)
);

-- =============================================
-- TABLE: SERVICES
-- Description: IT services offered
-- =============================================
CREATE TABLE SERVICES (
    service_id NUMBER PRIMARY KEY,
    service_name VARCHAR2(150) NOT NULL,
    description VARCHAR2(500),
    category VARCHAR2(100),
    price_per_unit NUMBER(15, 2),
    unit_type VARCHAR2(50),
    status VARCHAR2(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP
);

-- =============================================
-- TABLE: INVOICES
-- Description: Store invoice information
-- =============================================
CREATE TABLE INVOICES (
    invoice_id NUMBER PRIMARY KEY,
    client_id NUMBER NOT NULL,
    project_id NUMBER,
    invoice_date DATE DEFAULT SYSDATE,
    due_date DATE,
    total_amount NUMBER(15, 2),
    paid_amount NUMBER(15, 2) DEFAULT 0,
    status VARCHAR2(20) DEFAULT 'PENDING',
    description VARCHAR2(500),
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT fk_invoices_clients FOREIGN KEY (client_id) REFERENCES CLIENTS(client_id),
    CONSTRAINT fk_invoices_projects FOREIGN KEY (project_id) REFERENCES PROJECTS(project_id)
);

-- =============================================
-- TABLE: INVOICE_ITEMS
-- Description: Line items for invoices
-- =============================================
CREATE TABLE INVOICE_ITEMS (
    item_id NUMBER PRIMARY KEY,
    invoice_id NUMBER NOT NULL,
    service_id NUMBER,
    description VARCHAR2(255),
    quantity NUMBER(10, 2),
    unit_price NUMBER(15, 2),
    line_total NUMBER(15, 2),
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT fk_items_invoices FOREIGN KEY (invoice_id) REFERENCES INVOICES(invoice_id),
    CONSTRAINT fk_items_services FOREIGN KEY (service_id) REFERENCES SERVICES(service_id)
);

-- =============================================
-- TABLE: TICKETS
-- Description: Support tickets and issues
-- =============================================
CREATE TABLE TICKETS (
    ticket_id NUMBER PRIMARY KEY,
    project_id NUMBER,
    client_id NUMBER NOT NULL,
    title VARCHAR2(200) NOT NULL,
    description VARCHAR2(1000),
    priority VARCHAR2(20) DEFAULT 'MEDIUM',
    status VARCHAR2(20) DEFAULT 'OPEN',
    assigned_to NUMBER,
    created_date DATE DEFAULT SYSDATE,
    resolved_date DATE,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT fk_tickets_projects FOREIGN KEY (project_id) REFERENCES PROJECTS(project_id),
    CONSTRAINT fk_tickets_clients FOREIGN KEY (client_id) REFERENCES CLIENTS(client_id),
    CONSTRAINT fk_tickets_consultants FOREIGN KEY (assigned_to) REFERENCES CONSULTANTS(consultant_id)
);

-- Create Sequences for Primary Keys
CREATE SEQUENCE consultant_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE client_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE project_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE assignment_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE service_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE invoice_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE item_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ticket_seq START WITH 1 INCREMENT BY 1;

-- Create Indexes for better query performance
CREATE INDEX idx_projects_client ON PROJECTS(client_id);
CREATE INDEX idx_assignments_project ON PROJECT_ASSIGNMENTS(project_id);
CREATE INDEX idx_assignments_consultant ON PROJECT_ASSIGNMENTS(consultant_id);
CREATE INDEX idx_invoices_client ON INVOICES(client_id);
CREATE INDEX idx_invoices_project ON INVOICES(project_id);
CREATE INDEX idx_invoice_items_invoice ON INVOICE_ITEMS(invoice_id);
CREATE INDEX idx_tickets_project ON TICKETS(project_id);
CREATE INDEX idx_tickets_client ON TICKETS(client_id);
