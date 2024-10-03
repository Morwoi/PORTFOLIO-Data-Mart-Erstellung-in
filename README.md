
Here’s a more structured format with the proper closing of the code block:

- The **bash code block** starts after three backticks with `bash` and ends with another set of three backticks (` ``` `) at the end.

This way, your Markdown document will correctly format the code.



# PORTFOLIO-Data-Mart-Erstellung-in

This guide will walk you through setting up SQL with Python using `SQLite`. You can adapt this guide for other databases such as MySQL or PostgreSQL by installing the corresponding libraries.

## Prerequisites

Make sure you have the following installed:

- Python 3.x
- `sqlite3` (Comes pre-installed with Python)
- `pip` (Python package manager)

If you’re using MySQL or PostgreSQL, install the appropriate Python libraries as needed:

- For PostgreSQL: `psycopg2`
- For MySQL: `mysql-connector-python`

## Step 1: Install Required Python Libraries

To interact with SQL databases, you'll need the `sqlite3` library. This library is included with Python by default, but if you're using another SQL database, you can install the necessary libraries.

### Install the Required Library for SQLite:

```bash
# SQLite comes with Python, no need to install anything extra


# Install psycopg2 for PostgreSQL
pip install psycopg2

# Install mysql-connector-python for MySQL
pip install mysql-connector-python


# Create a virtual environment named 'venv'
python3 -m venv venv

# Activate the virtual environment
# On Windows:
venv\Scripts\activate
# On MacOS/Linux:
source venv/bin/activate



import sqlite3

# Connect to the SQLite database (or create it if it doesn't exist)
conn = sqlite3.connect('example.db')

# Create a cursor object
cur = conn.cursor()

# Example query to create a table
cur.execute('''CREATE TABLE IF NOT EXISTS users (
               id INTEGER PRIMARY KEY,
               name TEXT NOT NULL,
               email TEXT NOT NULL)''')

# Commit the changes and close the connection
conn.commit()
conn.close()


import sqlite3

# Connect to the SQLite database (or create it if it doesn't exist)
conn = sqlite3.connect('example.db')

# Create a cursor object
cur = conn.cursor()

# Example query to create a table
cur.execute('''CREATE TABLE IF NOT EXISTS users (
               id INTEGER PRIMARY KEY,
               name TEXT NOT NULL,
               email TEXT NOT NULL)''')

# Commit the changes and close the connection
conn.commit()
conn.close()
