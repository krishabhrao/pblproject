-- IT Consultancy Management System - Sample Data
-- This file contains sample/dummy data for testing and demonstration
-- Created: 2026-02-12

-- Insert sample Consultants
INSERT INTO CONSULTANTS (consultant_id, name, email, phone, specialization, hourly_rate, status)
VALUES (consultant_seq.NEXTVAL, 'Rahul Kumar', 'rahul.kumar@consultancy.com', '9876543210', 'Java Development', 1500, 'ACTIVE');

INSERT INTO CONSULTANTS (consultant_id, name, email, phone, specialization, hourly_rate, status)
VALUES (consultant_seq.NEXTVAL, 'Priya Singh', 'priya.singh@consultancy.com', '9876543211', 'Database Administration', 1800, 'ACTIVE');

INSERT INTO CONSULTANTS (consultant_id, name, email, phone, specialization, hourly_rate, status)
VALUES (consultant_seq.NEXTVAL, 'Amit Patel', 'amit.patel@consultancy.com', '9876543212', 'UI/UX Design', 1200, 'ACTIVE');

INSERT INTO CONSULTANTS (consultant_id, name, email, phone, specialization, hourly_rate, status)
VALUES (consultant_seq.NEXTVAL, 'Neha Sharma', 'neha.sharma@consultancy.com', '9876543213', 'Cloud Solutions', 2000, 'ACTIVE');

-- Insert sample Clients
INSERT INTO CLIENTS (client_id, company_name, contact_person, email, phone, address, city, country, status)
VALUES (client_seq.NEXTVAL, 'Tech Solutions Inc.', 'John Smith', 'john@techsolutions.com', '011-1234567', '123 Tech Street', 'New Delhi', 'India', 'ACTIVE');

INSERT INTO CLIENTS (client_id, company_name, contact_person, email, phone, address, city, country, status)
VALUES (client_seq.NEXTVAL, 'Digital Innovations Ltd.', 'Sarah Johnson', 'sarah@diginnovate.com', '011-2345678', '456 Innovation Avenue', 'Bangalore', 'India', 'ACTIVE');

INSERT INTO CLIENTS (client_id, company_name, contact_person, email, phone, address, city, country, status)
VALUES (client_seq.NEXTVAL, 'Enterprise Systems Corp.', 'Michael Brown', 'michael@enterprisesys.com', '011-3456789', '789 Corporate Plaza', 'Mumbai', 'India', 'ACTIVE');

-- Insert sample Projects
INSERT INTO PROJECTS (project_id, client_id, project_name, description, start_date, end_date, budget, status)
VALUES (project_seq.NEXTVAL, 1, 'E-Commerce Portal Development', 'Complete redesign and development of e-commerce platform', TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-06-30', 'YYYY-MM-DD'), 750000, 'COMPLETED');

INSERT INTO PROJECTS (project_id, client_id, project_name, description, start_date, end_date, budget, status)
VALUES (project_seq.NEXTVAL, 2, 'Cloud Migration Project', 'Migrate existing infrastructure to AWS cloud', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD'), 1200000, 'ONGOING');

INSERT INTO PROJECTS (project_id, client_id, project_name, description, start_date, budget, status)
VALUES (project_seq.NEXTVAL, 3, 'Mobile App Development', 'Native iOS and Android application development', TO_DATE('2025-01-15', 'YYYY-MM-DD'), 850000, 'ONGOING');

-- Insert sample Project Assignments
INSERT INTO PROJECT_ASSIGNMENTS (assignment_id, project_id, consultant_id, role, start_date, end_date, allocation_percentage)
VALUES (assignment_seq.NEXTVAL, 1, 1, 'Senior Java Developer', TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-06-30', 'YYYY-MM-DD'), 100);

INSERT INTO PROJECT_ASSIGNMENTS (assignment_id, project_id, consultant_id, role, start_date, end_date, allocation_percentage)
VALUES (assignment_seq.NEXTVAL, 1, 3, 'UI/UX Lead', TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-06-15', 'YYYY-MM-DD'), 80);

INSERT INTO PROJECT_ASSIGNMENTS (assignment_id, project_id, consultant_id, role, start_date, allocation_percentage)
VALUES (assignment_seq.NEXTVAL, 2, 2, 'Database Architect', TO_DATE('2024-03-01', 'YYYY-MM-DD'), 100);

INSERT INTO PROJECT_ASSIGNMENTS (assignment_id, project_id, consultant_id, role, start_date, allocation_percentage)
VALUES (assignment_seq.NEXTVAL, 2, 4, 'Cloud Solutions Architect', TO_DATE('2024-04-01', 'YYYY-MM-DD'), 90);

-- Insert sample Services
INSERT INTO SERVICES (service_id, service_name, description, category, price_per_unit, unit_type, status)
VALUES (service_seq.NEXTVAL, 'Web Development', 'Custom web application development', 'Development', 50000, 'Per Week', 'ACTIVE');

INSERT INTO SERVICES (service_id, service_name, description, category, price_per_unit, unit_type, status)
VALUES (service_seq.NEXTVAL, 'Database Design', 'Database schema design and optimization', 'Database', 40000, 'Per Week', 'ACTIVE');

INSERT INTO SERVICES (service_id, service_name, description, category, price_per_unit, unit_type, status)
VALUES (service_seq.NEXTVAL, 'UI/UX Design', 'User interface and experience design', 'Design', 30000, 'Per Week', 'ACTIVE');

INSERT INTO SERVICES (service_id, service_name, description, category, price_per_unit, unit_type, status)
VALUES (service_seq.NEXTVAL, 'Cloud Consulting', 'Cloud architecture and migration consulting', 'Consulting', 60000, 'Per Day', 'ACTIVE');

-- Insert sample Invoices
INSERT INTO INVOICES (invoice_id, client_id, project_id, invoice_date, due_date, total_amount, paid_amount, status, description)
VALUES (invoice_seq.NEXTVAL, 1, 1, TO_DATE('2024-03-15', 'YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'), 250000, 250000, 'PAID', 'Project Phase 1 - Design');

INSERT INTO INVOICES (invoice_id, client_id, project_id, invoice_date, due_date, total_amount, paid_amount, status, description)
VALUES (invoice_seq.NEXTVAL, 1, 1, TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-06-01', 'YYYY-MM-DD'), 300000, 300000, 'PAID', 'Project Phase 2 - Development');

INSERT INTO INVOICES (invoice_id, client_id, project_id, invoice_date, due_date, total_amount, status, description)
VALUES (invoice_seq.NEXTVAL, 2, 2, TO_DATE('2025-02-01', 'YYYY-MM-DD'), TO_DATE('2025-03-01', 'YYYY-MM-DD'), 200000, 0, 'PENDING', 'Cloud Migration - Month 1');

COMMIT;
