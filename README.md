# Portfolio Data Mart Creation with Python and SQL



## Prerequisites

## Setup

### 1. Clone this repository


![image](https://github.com/user-attachments/assets/b7f9ef98-77f4-4b00-87a9-cffe8f271fb0)

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

