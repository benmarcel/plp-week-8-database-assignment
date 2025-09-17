# School Library Management System 📚

This project is a relational database design for a school library(delsu), implemented using MySQL. The schema is normalized to ensure data integrity, minimize redundancy, and efficiently manage library resources and borrowings.

-----

### 1\. Database Schema Overview

The database is composed of several tables, each representing a key entity in the library system. The relationships between these tables are established using foreign keys to maintain data consistency.

  * **`Members`**: Stores information about students and staff who are library members.
  * **`Books`**: Catalogs all the unique book titles in the library.
  * **`Publishers`**: Contains details of the publishers.
  * **`Book_Copies`**: Tracks individual physical copies of a book, including their availability status.
  * **`Borrowings`**: A junction table that records every instance of a member borrowing a specific book copy.

-----

### 2\. Relationships

The design incorporates the following relationships to model the real-world interactions in a library:

  * **One-to-Many**: A `Book` can have multiple `Book_Copies`. A `Publisher` can publish many `Books`.
  * **Many-to-Many**: A `Member` can borrow many `Book_Copies`, and a single `Book_Copy` can be borrowed by multiple members over time. This relationship is resolved by the `Borrowings` table.

-----

### 3\. Constraints and Business Rules

The schema is enforced with various constraints to ensure data quality:

  * **Primary Keys**: Uniquely identify each record in a table (`member_id`, `book_id`, `copy_id`, etc.).
  * **Foreign Keys**: Link related tables, ensuring referential integrity (`book_id` in `Book_Copies` references `book_id` in `Books`).
  * **`UNIQUE`**: Guarantees that values in a column are unique (`email` for members, `isbn` for books).
  * **`NOT NULL`**: Ensures essential fields are never left empty (`title`, `author`, `borrow_date`).
  * **`ENUM`**: Restricts a column to a specific set of predefined values (`status` in `Book_Copies` can only be 'Available', 'Loaned', or 'Lost').

**Business Rule**: A `BEFORE INSERT` trigger is implemented to enforce a specific business rule: **only student members can borrow books**. If a staff member attempts to borrow a book, the transaction will be rejected with a custom error message.

-----

### 4\. Setup and Usage

To set up this database, simply execute the `delsu-library-DB.sql` script in a MySQL environment.

```bash
mysql -u your_username -p < delsu-library-DB.sql
```

The script will:

1.  Create the `libraryDB` database.
2.  Switch to the new database.
3.  Create all the necessary tables with their respective columns and constraints.
4.  Implement the `BEFORE INSERT` trigger for borrowing rules.
