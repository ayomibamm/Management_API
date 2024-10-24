from flask import Flask, request, jsonify
from db_utils import execute_query, fetch_query

app = Flask(__name__)

# Welcome message for initial testing or message
# http://127.0.0.1:5000/
@app.route('/', methods=['GET'])
def welcome():
    return "Welcome team, hope everybody is ready for this meeting!"

# GET: Retrieve all clients and their transactions
# http://127.0.0.1:5000/clients
@app.route('/clients', methods=['GET'])
def get_clients():
    query = """
    SELECT C.ClientID, C.Name, C.Country, C.Age, T.TransactionType, T.ProductType, 
           T.Quantity, T.TotalTransactionValue 
    FROM Transactions T 
    JOIN Clients C ON T.ClientID = C.ClientID;
    """
    clients = fetch_query(query)

    result = []
    for record in clients:
        print(record)
        client_dict = {
            'ClientID': record[0],
            'Name': record[1],
            'Country': record[2],
            'Age': record[3],
            'TransactionType': record[4],
            'ProductType': record[5],
            'Quantity': record[6],
            'TotalTransactionValue': float(record[7])
        }
        result.append(client_dict)

    return jsonify(result)

# PUT: Update client information (age) by ClientID
@app.route('/clients/<client_id>', methods=['PUT'])
def update_client(client_id):
    # New data for the client
    updated_client = {
        "Name": "Ryan Waters Updated",
        "Country": "France",
        "Age": 56
    }

    query = f"""
    UPDATE Clients
    SET Name = '{updated_client["Name"]}',
        Country = '{updated_client["Country"]}',
        Age = {updated_client["Age"]}
    WHERE ClientID = '{client_id}';
    """

    execute_query(query)

    return jsonify({"message": "Client detail updated successfully!!"})

# DELETE: Remove all clients and their transactions from a specific country
@app.route('/clients/country/<country_name>', methods=['DELETE'])
def delete_clients_by_country(country_name):
    delete_transactions_query = f"""
    DELETE FROM Transactions
    WHERE ClientID IN (
        SELECT ClientID FROM Clients WHERE Country = '{country_name}'
    );
    """
    execute_query(delete_transactions_query)

    delete_clients_query = f"""
    DELETE FROM Clients
    WHERE Country = '{country_name}';
    """
    execute_query(delete_clients_query)

    return jsonify({"message": f"All clients from {country_name} and their transactions deleted successfully!"})


if __name__ == '__main__':
    app.run(debug=True)
