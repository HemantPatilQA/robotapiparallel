*** Settings ***
Library    RequestsLibrary
Library    ../libraries/APILibrary.py
Library    Collections
Library    JSONLibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Verify GET API
    ${response}    ${status_code}    APILibrary.Get Request    ${BASE_URL}/posts/1
    Should Be Equal As Numbers    ${status_code}    200
    Log    ${response}

Verify POST API
    ${data}    Create Dictionary    title=foo    body=bar    userId=1
    ${response}    ${status_code}    APILibrary.Post Request    ${BASE_URL}/posts    ${data}
    Should Be Equal As Numbers    ${status_code}    201
    Log    ${response}

Verify PUT API
    ${data}    Create Dictionary    id=1    title=new    body=updated    userId=1
    ${response}    ${status_code}    APILibrary.Put Request    ${BASE_URL}/posts/1    ${data}
    Should Be Equal As Numbers    ${status_code}    200
    Log    ${response}

Verify DELETE API
    ${status_code}    APILibrary.Delete Request    ${BASE_URL}/posts/1
    Should Be Equal As Numbers    ${status_code}    200
