import requests
import json

# GET REQUEST
def fetch_clients():
    url = 'http://127.0.0.1:5000/clients'
    response = requests.get(url)

    # Check if the request was successful (status code 200)
    if response.status_code == 200:
        # Parse the JSON response
        clients_data = response.json()
        print("Here is the detailed list of our clients and their transactions:\n")
        print(json.dumps(clients_data, indent=4))  # Pretty print the JSON data
    else:
        print(f"Failed to fetch data: {response.status_code} - {response.text}")

# PUT REQUEST
def update_client(client_id):
    updated_client = {
        "Name": "Ryan Waters Updated",
        "Country": "France",
        "Age": 56
    }

    headers = {'content-type': 'application/json'}
    result = requests.put(
        f'http://127.0.0.1:5000/clients/{client_id}', headers=headers, data=json.dumps(updated_client)
    )
    print(result.json())

# DELETE REQUEST
def delete_clients_by_country(country_name):
    headers = {'content-type': 'application/json'}
    result = requests.delete(
        f'http://127.0.0.1:5000/clients/country/{country_name}', headers=headers
    )
    print(result.json())

# Main execution flow
if __name__ == '__main__':
    #fetch_clients()  # Fetch and display clients
    #update_client('0022')  # Update a specific client
    delete_clients_by_country('Japan')  # Delete clients from a specific country
