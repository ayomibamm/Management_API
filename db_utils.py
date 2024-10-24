import mysql.connector
from mysql.connector import Error
from config import database_config

# Establish a connection to the MySQL database using credentials from the database_config file.
def create_connection():
    try:
        connection = mysql.connector.connect(
            host = database_config['host'],
            user = database_config['user'],
            password = database_config['password'],
            database = database_config['database']
        )
        if connection.is_connected():
            return connection
    except Error as e:
        print(f"Error: '{e}' occurred")
    return None

# Executes SQL query (UPDATE, DELETE) and commits the changes to the database.
def execute_query(query):
    connection = create_connection()
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()
    except Error as e:
        print(f"Error: '{e}' occurred")
    finally:
        cursor.close()
        connection.close()
        print('Execution successfully completed')

# Executes SQL query (fSELECT) and returns the fetched results from the database.
def fetch_query(query):
    connection = create_connection()
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        return result
    except Error as e:
        print(f"Error: '{e}' occurred")
    finally:
        cursor.close()
        connection.close()
        print('Execution successfully completed')
