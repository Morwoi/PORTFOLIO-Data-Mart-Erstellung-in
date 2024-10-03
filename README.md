# Portfolio Data Mart Creation with Python and SQL

This repository contains Python code to create a simple SQLite database. You can adapt this for other SQL databases such as MySQL or PostgreSQL by installing the relevant libraries.

## Prerequisites

Ensure that you have the following installed:

- Python 3.x
- `sqlite3` (Comes pre-installed with Python)
- `pip` (Python package manager)

If you're using MySQL or PostgreSQL, install the appropriate Python libraries:

- For PostgreSQL: `psycopg2`
- For MySQL: `mysql-connector-python`

## Setup

### 1. Clone this repository
```
git clone https://github.com/yourusername/portfolio-data-mart.git
cd portfolio-data-mart
```
### 2. Create and activate a virtual environment
#### Create a virtual environment
```
python3 -m venv venv
```
#### Activate the virtual environment (Windows)
```
venv\Scripts\activate
```
#### Activate the virtual environment (MacOS/Linux)
```
source venv/bin/activate
```
### 3. Install dependencies

#### For PostgreSQL
```
pip install psycopg2
```
#### For MySQL
```
pip install mysql-connector-python
```
### 4. Running the Python Script
#### To create the database and table, run the script:
```
python create_db.py
```
### Example Python Script: create_db.py
```
import sqlite3
```
#### Connect to the SQLite database (or create it if it doesn't exist)
```
conn = sqlite3.connect('example.db')
```
#### Create a cursor object
```
cur = conn.cursor()
```
#### Example query to create a 'users' table
```
cur.execute('''CREATE TABLE IF NOT EXISTS users (
               id INTEGER PRIMARY KEY,
               name TEXT NOT NULL,
               email TEXT NOT NULL)''')
```
#### Commit the changes and close the connection
```
conn.commit()
conn.close()

print("Database and users table created successfully.")

```

