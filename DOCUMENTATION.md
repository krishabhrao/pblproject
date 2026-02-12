# Project Documentation - IT Consultancy Management System

## Table of Contents
1. [Project Overview](#project-overview)
2. [System Architecture](#system-architecture)
3. [Technical Stack](#technical-stack)
4. [Database Design](#database-design)
5. [APEX Application Structure](#apex-application-structure)
6. [Module Descriptions](#module-descriptions)

## Project Overview

**Project Name**: IT Consultancy Management System  
**Version**: 1.0.0  
**Author**: Krishna Bhargava  
**Date Created**: February 12, 2026  
**Status**: Active Development

This is a comprehensive management system designed for IT consultancy firms. It handles all aspects of business operations including consultant management, client relationships, project tracking, service billing, and support ticket management.

### Key Objectives
- Streamline consultancy operations
- Improve resource utilization
- Enable better project and invoice tracking
- Provide management insights through reports
- Ensure data integrity and audit trails

## System Architecture

### Layered Architecture

```
┌─────────────────────────────────┐
│   Presentation Layer (APEX)     │
│  - User Interfaces              │
│  - Forms and Reports            │
│  - Navigation and Menus         │
└──────────────────┬──────────────┘
                   │
┌──────────────────▼──────────────┐
│   Application Layer (PL/SQL)    │
│  - Business Logic               │
│  - Data Validation              │
│  - Process Logic                │
└──────────────────┬──────────────┘
                   │
┌──────────────────▼──────────────┐
│    Database Layer (Oracle)      │
│  - Data Storage                 │
│  - Constraints & Triggers       │
│  - Sequences & Indexes          │
└─────────────────────────────────┘
```

## Technical Stack

| Component | Technology | Version |
|-----------|-----------|---------|
| Database | Oracle Database | 19c+ |
| Front-end | Oracle APEX | 22.0+ |
| Server Language | PL/SQL | 2021+ |
| Version Control | Git | Latest |

## Database Design

### Tables Overview

#### 1. CONSULTANTS
- **Purpose**: Store consultant profiles
- **Key Fields**: ID, Name, Email, Phone, Specialization, Hourly Rate, Status
- **Relationships**: Referenced by PROJECT_ASSIGNMENTS and TICKETS
- **Indexes**: Email (UNIQUE)

#### 2. CLIENTS
- **Purpose**: Maintain client/company information
- **Key Fields**: ID, Company Name, Contact Person, Email, Phone, Address, City, Country, Status
- **Relationships**: Linked to PROJECTS and INVOICES
- **Constraints**: Unique email constraint

#### 3. PROJECTS
- **Purpose**: Track client projects
- **Key Fields**: ID, Client ID (FK), Project Name, Description, Start Date, End Date, Budget, Status
- **Relationships**: Links to CLIENTS, PROJECT_ASSIGNMENTS, INVOICES, TICKETS
- **Status Values**: ONGOING, COMPLETED, ON_HOLD, CANCELLED

#### 4. PROJECT_ASSIGNMENTS
- **Purpose**: Map consultants to projects
- **Key Fields**: ID, Project ID (FK), Consultant ID (FK), Role, Start Date, End Date, Allocation %
- **Purpose**: Track who works on which project and at what capacity
- **Constraints**: Foreign keys to PROJECTS and CONSULTANTS

#### 5. SERVICES
- **Purpose**: Define available IT services
- **Key Fields**: ID, Service Name, Description, Category, Price per Unit, Unit Type, Status
- **Categories**: Development, Database, Design, Consulting, Support
- **Usage**: Referenced in INVOICE_ITEMS

#### 6. INVOICES
- **Purpose**: Track billing information
- **Key Fields**: ID, Client ID (FK), Project ID (FK), Invoice Date, Due Date, Total Amount, Paid Amount, Status
- **Status Values**: PENDING, PAID, OVERDUE, CANCELLED
- **Relationships**: Linked to CLIENTS, PROJECTS, and INVOICE_ITEMS

#### 7. INVOICE_ITEMS
- **Purpose**: Line items for invoices
- **Key Fields**: ID, Invoice ID (FK), Service ID (FK), Description, Quantity, Unit Price, Line Total
- **Calculation**: Line Total = Quantity × Unit Price

#### 8. TICKETS
- **Purpose**: Support and issue tracking
- **Key Fields**: ID, Project ID (FK), Client ID (FK), Title, Description, Priority, Status, Assigned To (FK), Created Date, Resolved Date
- **Priority Levels**: LOW, MEDIUM, HIGH, CRITICAL
- **Status Values**: OPEN, IN_PROGRESS, RESOLVED, CLOSED, ON_HOLD

### Key Database Features

#### Relationships
```
CLIENTS
  ├── PROJECTS
  │   ├── PROJECT_ASSIGNMENTS → CONSULTANTS
  │   ├── INVOICES → INVOICE_ITEMS → SERVICES
  │   └── TICKETS → CONSULTANTS
  └── TICKETS → CONSULTANTS
```

#### Constraints
- Primary Keys: All tables have primary key constraints
- Foreign Keys: Maintain referential integrity
- Unique Constraints: Email fields in CONSULTANTS and CLIENTS
- Not Null: Critical fields like names, IDs

#### Audit Fields
- created_at: TIMESTAMP DEFAULT SYSTIMESTAMP
- Tracks when each record was created

#### Sequences
- Eight sequences for automatic ID generation
- Pattern: `[entity]_seq` (e.g., consultant_seq)

## APEX Application Structure

### Pages
1. **Home Page (1)**: Dashboard and navigation hub
2. **Consultants Page (100-199)**: Consultant CRUD operations
3. **Clients Page (200-299)**: Client management
4. **Projects Page (300-399)**: Project tracking
5. **Assignments Page (400-499)**: Consultant-project assignments
6. **Services Page (500-599)**: Service catalog
7. **Invoices Page (600-699)**: Billing and invoicing
8. **Tickets Page (700-799)**: Support ticket management

### Page Components
- Interactive Reports (for listing data)
- Editable Forms (for data entry)
- Calculated Items (for totals and summaries)
- Buttons (for actions like Create, Edit, Delete)
- Validations (for data integrity)

### Navigation
- Top navigation menu for main modules
- Breadcrumbs for page context
- Quick links on dashboard

## Module Descriptions

### Consultant Management Module
- Create/View/Edit/Delete consultant records
- Track specializations and hourly rates
- View project assignments
- Monitor consultant availability
- Export consultant list

### Client Management Module
- Maintain comprehensive client database
- Track contact information
- Link to projects and invoices
- View client service history
- Manage client status

### Project Management Module
- Create and track projects
- Assign budgets and timelines
- Link to consultants via assignments
- Generate project reports
- Track project status

### Service Catalog Module
- Define available services
- Set pricing per unit
- Categorize services
- Manage service availability

### Invoicing Module
- Create invoices from projects
- Add multiple line items
- Calculate totals automatically
- Track payment status
- Generate invoice reports

### Support Ticket Module
- Create support tickets from clients
- Assign to consultants
- Track resolution status
- Manage priorities
- Close resolved tickets

## Development Notes

### Coding Standards
- Use meaningful names for objects
- Comment complex logic
- Follow Oracle naming conventions
- Implement proper error handling
- Use consistent formatting

### Testing Approach
- Unit test each module
- Integration test relationships
- Test data integrity constraints
- Validate calculations
- Test error scenarios

### Future Enhancements
- Advanced reporting (Gantt charts, resource utilization)
- Mobile app support
- Email notifications
- Automated billing
- REST APIs
- Analytics dashboard
- Timesheet integration

## Support and Maintenance

For issues or questions:
- Create an issue on GitHub
- Contact: krishabhrao@example.com
- Check documentation first

## License

MIT License - See LICENSE file for details
