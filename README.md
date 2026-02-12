# IT Consultancy Management System (pblproject)

A comprehensive Oracle APEX and SQL-based management system for IT consultancy businesses. This project provides a complete solution for managing consultants, clients, projects, services, invoices, and support tickets.

## Overview

The IT Consultancy Management System is designed to streamline operations for IT consultancy firms. It enables efficient management of:
- **Consultant Management**: Track consultant profiles, specializations, hourly rates, and project assignments
- **Client Management**: Maintain client information, contact details, and service history
- **Project Management**: Create and manage projects with budgets, timelines, and consultant allocations
- **Service Catalog**: Define IT services offered with pricing and categorization
- **Invoicing**: Generate and track invoices with payment status
- **Support Tickets**: Manage client support requests and issues

## Features

### Core Modules
1. **Consultants Module**
   - Manage consultant profiles and specializations
   - Track hourly rates and availability
   - View project assignments and utilization

2. **Clients Module**
   - Maintain comprehensive client database
   - Store contact information and addresses
   - Track client status and service history

3. **Projects Module**
   - Create and manage client projects
   - Assign consultants to projects with role definitions
   - Track project budgets, timelines, and status
   - Monitor consultant allocation percentages

4. **Services Module**
   - Define IT services with pricing
   - Categorize services (Development, Design, Consulting, etc.)
   - Manage service availability and pricing updates

5. **Invoicing Module**
   - Generate invoices with itemized details
   - Track invoice status (Pending, Paid, etc.)
   - Link invoices to projects and clients
   - Calculate totals and payment tracking

6. **Ticket Management**
   - Create and track support tickets
   - Assign tickets to consultants
   - Track priority and resolution status
   - Link to projects and clients

## Technology Stack

- **Database**: Oracle Database
- **Frontend**: Oracle APEX (Application Express)
- **Backend**: Oracle PL/SQL
- **Language**: SQL, PL/SQL
- **Architecture**: Client-Server

## Project Structure

```
pblproject/
├── Database/
│   ├── schema.sql          # Complete database schema (DDL)
│   └── sample_data.sql     # Sample data for testing
├── Documentation/
│   ├── ARCHITECTURE.md     # System architecture and design
│   ├── DATABASE_SCHEMA.md  # Detailed database documentation
│   └── USER_GUIDE.md       # User guide and features
├── APEX/
│   └── application_export.sql  # APEX application export
├── README.md               # This file
├── LICENSE                 # Project license
└── .gitignore              # Git ignore rules
```

## Database Schema

The system uses 8 main tables:

1. **CONSULTANTS**: Stores consultant information
2. **CLIENTS**: Client/company information
3. **PROJECTS**: Project details and budgets
4. **PROJECT_ASSIGNMENTS**: Consultant-to-project mappings
5. **SERVICES**: Available IT services catalog
6. **INVOICES**: Invoice headers
7. **INVOICE_ITEMS**: Invoice line items
8. **TICKETS**: Support/service tickets

All tables include proper relationships, constraints, indexes, and audit fields (created_at timestamps).

## Getting Started

### Prerequisites
- Oracle Database 19c or higher
- Oracle APEX 22.0 or higher
- SQL*Plus or similar database client
- Git (for cloning the repository)

### Installation Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/krishabhrao/pblproject.git
   cd pblproject
   ```

2. **Set Up Database Schema**
   ```bash
   sqlplus username/password@database @Database/schema.sql
   ```

3. **Load Sample Data** (Optional)
   ```bash
   sqlplus username/password@database @Database/sample_data.sql
   ```

4. **Import APEX Application**
   - Log into Oracle APEX as an administrator
   - Go to SQL Workshop > Utilities > Import
   - Select the application export file
   - Follow the import wizard

5. **Configure Application**
   - Update connection strings if needed
   - Configure user roles and permissions
   - Customize business logic as required

## Usage

### For Administrators
- Configure consultants, clients, and services
- Set up project templates and rate cards
- Monitor system usage and generate reports
- Manage user access and permissions

### For Project Managers
- Create and manage projects
- Assign consultants to projects
- Track project progress and budget
- Generate status reports

### For Finance Team
- Create and manage invoices
- Track invoice payments
- Generate financial reports
- Monitor project budgets

### For Consultants
- View assigned projects
- Track time and deliverables
- Update project status
- Submit support tickets

## Database Relationships

```
CLIENTS ──┬─→ PROJECTS ──┬─→ PROJECT_ASSIGNMENTS ──→ CONSULTANTS
          │              │
          │              └─→ INVOICES ──→ INVOICE_ITEMS ──→ SERVICES
          │
          └─→ TICKETS ──→ CONSULTANTS
```

## Key Features

### Constraints & Integrity
- Foreign key constraints ensure referential integrity
- Unique constraints on client emails
- Default values for status fields
- Timestamp tracking for audit trail

### Indexes
- Created on foreign keys for better query performance
- Support fast lookups and joins
- Optimize common query patterns

### Sequences
- Automatic primary key generation using Oracle sequences
- Eight sequences for different entities
- Ensures unique and sequential IDs

## Development

### Adding New Features
1. Update schema if needed (Database/schema.sql)
2. Create APEX pages or modify existing ones
3. Implement business logic in PL/SQL
4. Test thoroughly with sample data
5. Document changes and update APEX export

### Code Standards
- Use meaningful names for tables, columns, and procedures
- Comment complex business logic
- Follow Oracle naming conventions
- Include proper error handling

## Testing

### Test Data
Sample data is provided in `Database/sample_data.sql`:
- 4 sample consultants with different specializations
- 3 sample clients
- 3 sample projects at different stages
- Sample project assignments
- Sample services and invoices

### Running Tests
1. Load schema and sample data
2. Import APEX application
3. Run test scenarios from user guide
4. Verify data integrity and relationships

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Author

**Krishna Bhargava**
- B.Tech Computer Science Student
- Oracle Academy Training Program

## Support

For support, email: krishabhrao@example.com or open an issue on GitHub.

## Acknowledgments

- Oracle Academy for training and resources
- Oracle APEX development community
- Contributors and testers

## Version History

### Version 1.0.0 (Current)
- Initial project release
- Complete database schema
- APEX application with all core modules
- Sample data and documentation

### Planned Features
- Mobile-responsive design improvements
- Advanced reporting capabilities
- Project timeline visualization (Gantt charts)
- Resource utilization analytics
- Automated invoicing and payment tracking
- Email notifications for ticket updates

---

**Last Updated**: February 12, 2026
**Status**: Active Development
**Repository**: https://github.com/krishabhrao/pblproject
