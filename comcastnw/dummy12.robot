*** Settings ***
Documentation    Suite description
Library  RequestsLibrary
Library  BuiltIn
Library  Collections
Library  JSONLibrary
Library  OS

# CSv file wil be same all methods are also will be same
Suite Setup                Set Log Level    debug
Library    DataDriver    file=${CURDIR}/Data.xlsx    sheet_name=Sheet1

Test Template      Api get
*** Test Cases ***

Test case1${Base_URL}


*** Keywords ***
Api Get

    ${proxies}   create dictionary     http=https:genproxy.amdocs.com:8080    https=http:genproxy.amdocs.com:8080
    create session   mysession   ${Base_URL}      #proxies=${proxies}
    ${responce}=     get request     mysession   /rest/v2/alpha/${customer ID}
    log to console   ${responce.content}
    log  ${responce}
