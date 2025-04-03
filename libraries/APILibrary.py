import requests
import json

class APILibrary:
    def get_request(self, url, headers=None):
        response = requests.get(url, headers=headers)
        return response.json(), response.status_code

    def post_request(self, url, data, headers=None):
        response = requests.post(url, json=data, headers=headers)
        return response.json(), response.status_code

    def put_request(self, url, data, headers=None):
        response = requests.put(url, json=data, headers=headers)
        return response.json(), response.status_code

    def delete_request(self, url, headers=None):
        response = requests.delete(url, headers=headers)
        return response.status_code

# Required for Robot Framework to detect the library
if __name__ == "__main__":
    print("APILibrary loaded successfully")
