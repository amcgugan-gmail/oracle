# Oracle 23c Feature Showcase

This repository contains a curated SQL and PL/SQL script demonstrating **new features introduced in Oracle Database 23ai (23c)** that are not available in 19c. These additions enhance developer productivity, simplify syntax, and add support for modern use cases like JSON and AI vector search.

---

## 🗂️ Contents

| Section | Feature | Description |
|--------|---------|-------------|
| 1 | `BOOLEAN` in SQL | Native support for `BOOLEAN` data type in SQL tables and queries |
| 2 | `IF [NOT] EXISTS` | Simplified DDL with `CREATE/DROP TABLE IF EXISTS` |
| 3 | `SELECT` without `FROM` | Clean scalar expression evaluation |
| 4 | `GROUP BY` Alias | Allows grouping using `SELECT` aliases |
| 5 | `TABLE(subquery)` | Use subqueries with `TABLE()` directly |
| 6 | `VECTOR` datatype | Native support for vector embeddings and similarity search |
| 7 | Qualified Object Expressions | Cleaner object type initialization (e.g., `SDO_GEOMETRY`) |
| 8 | SQL Macros | Define reusable SQL fragments in PL/SQL |
| 9 | OUT Parameters in SQL | Use PL/SQL procedures directly in SQL expressions |

---

## 💡 Usage

To run the examples:

1. Connect to an Oracle 23c (23ai) database using SQL*Plus, SQLcl, or SQL Developer.
2. Execute the script file:
   ```bash
   sqlplus user/password@db @oracle_23c_feature_examples.sql

