# Banking Client - ManagementAPI

This project is a simple API for managing clients and their transactions in an investment banking application. It allows for retrieving, updating, and deleting client information as well as handling their transactions through a Flask-based API.
The API will aid decision-making during a business meetings between the company's partners. 


## Project Structure
├── config.py: contains database configuration details.                 
├── db_utils.py: utility functions for interacting with the MySQL database.             
├── client_side.py: client-side script for sending API requests.                 
├── assignment4_database.sql: database that contains client and transaction tables.                 
└── main.py: main flask application with API routes.                                   

## Prerequisites

Before running this project, make sure you have the following installed:

- **Python 3.x**: You can download it from [python.org](https://www.python.org/downloads/).
- **pip**: Python's package installer, usually comes with Python.
- **MySQL Server**: You need a MySQL instance running on your machine or a cloud-based database service.
- **Postman or cURL (Optional)**: For testing API requests.
  
## Installation

### Step 1: Clone the repository

To get started, clone the repository using the following command:

```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo
```

### Step 2: Set Up MySQL Database

You will need to set up a MySQL database for the API to interact with by creating the `InvestmentBankingDB` Database and adding the two tables: `Clients` and `Transactions`. This code can be found in the assignment4_database.sql which also includes the necessary data. 

### Step 3: Configure the Project

Open the `config.py` file and update the MySQL database credentials with your MySQL setup.

### Step 4: Install Dependencies

Install the required Python packages as provided in the `requirements.txt` file using pip.

### Step 5: Run the Flask App

The Flask server will start running at `http://127.0.0.1:5000/` by default.

## API Endpoints

- GET /clients: To retrieve all clients and their transactions and return a JSON array.
- PUT /clients/<client_id>: Update the details of a specific client based on their client_id and return a success message indicating the client details have been updated.
- DELETE /clients/country/<country_name>: Delete all clients and their associated transactions from a specific country and return a success message indicating that the request was completed.

## Running Client-Side Script
You can also use the `client_side.py` script to interact with the API endpoints. Uncomment the relevant function to send GET, PUT, or DELETE requests.

## Contact
Please feel free to contact me for any questions regarding the API.

